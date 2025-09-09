const pool = require('../config/database');

const createQuestion = async (enunciado, opcoes, autor_id, tipo, imagem_url) => {
    const client = await pool.connect();

    try {
        await client.query('BEGIN');

        // Cria uma única query para a questão, independente da imagem
        const sqlQuestao = imagem_url
            ? 'INSERT INTO app_simulado.questoes (enunciado, autor_id, tipo, imagem_url) VALUES ($1, $2, $3, $4) RETURNING id'
            : 'INSERT INTO app_simulado.questoes (enunciado, autor_id, tipo) VALUES ($1, $2, $3) RETURNING id';
        
        const valuesQuestao = imagem_url
            ? [enunciado, autor_id, tipo, imagem_url]
            : [enunciado, autor_id, tipo];

        const resultQuestao = await client.query(sqlQuestao, valuesQuestao);
        const questao_id = resultQuestao.rows[0].id;
        
        // Formato correto para bulk insert no PostgreSQL
        if (opcoes.length > 0) {
            // CORREÇÃO: Gerando os placeholders corretamente para 3 colunas (questao_id, texto_opcao, correta)
            const sqlOpcoesValues = opcoes.map((_, i) => {
                const start = i * 3 + 1;
                return `($${start}, $${start + 1}, $${start + 2})`;
            }).join(', ');

            const sqlOpcoes = `INSERT INTO app_simulado.opcoes (questao_id, texto_opcao, correta) VALUES ${sqlOpcoesValues}`;
            const valuesOpcoes = opcoes.flatMap(opcao => [
                questao_id,
                opcao.texto_opcao,
                opcao.correta
            ]);
            await client.query(sqlOpcoes, valuesOpcoes);
        }

        await client.query('COMMIT');
        
        return { questao_id, message: 'Questão e opções cadastradas com sucesso.' };
    } catch (error) {
        await client.query('ROLLBACK');
        throw error;
    } finally {
        client.release();
    }
}

const getUniqueTypes = async()=>{
    const result = await pool.query('SELECT DISTINCT tipo FROM app_simulado.questoes ORDER BY tipo');
    return result.rows.map(row => row.tipo);
}

const getSimuladoQuestions = async (tipos) => {
    const client = await pool.connect();
    try {
        const numQuestoes = 60;

        // 1. Fetch all questions for the given types
        const result = await client.query(
            'SELECT id, enunciado, autor_id, tipo, imagem_url FROM app_simulado.questoes WHERE tipo = ANY($1) ORDER BY RANDOM() LIMIT $2',
            [tipos, numQuestoes]
        );
        const questions = result.rows;
        const questionIds = questions.map(q => q.id);

        if (questionIds.length === 0) {
            return [];
        }

        // 2. Fetch all options for the selected questions
        const opcoesResult = await client.query(
            'SELECT questao_id, id, texto_opcao, correta FROM app_simulado.opcoes WHERE questao_id = ANY($1) ORDER BY RANDOM()',
            [questionIds]
        );
        const opcoesByQuestionId = opcoesResult.rows.reduce((acc, opcao) => {
            if (!acc[opcao.questao_id]) {
                acc[opcao.questao_id] = [];
            }
            acc[opcao.questao_id].push(opcao);
            return acc;
        }, {});

        // 3. Fetch all correct answer counts for the selected questions
        const correctCountResult = await client.query(
            'SELECT questao_id, COUNT(*) as count FROM app_simulado.opcoes WHERE questao_id = ANY($1) AND correta = TRUE GROUP BY questao_id',
            [questionIds]
        );
        const correctCountByQuestionId = correctCountResult.rows.reduce((acc, row) => {
            acc[row.questao_id] = parseInt(row.count);
            return acc;
        }, {});

        // 4. Combine the results
        for (const question of questions) {
            if (question.imagem_url && typeof question.imagem_url === 'string') {
                question.imagem_url = question.imagem_url.includes('||') ? question.imagem_url.split('||') : [question.imagem_url];
            } else {
                question.imagem_url = [];
            }
            question.opcoes = opcoesByQuestionId[question.id] || [];
            question.correct_count = correctCountByQuestionId[question.id] || 0;
        }

        return questions;
    } finally {
        client.release();
    }
}


module.exports = {
    createQuestion,
    getUniqueTypes,
    getSimuladoQuestions,
}