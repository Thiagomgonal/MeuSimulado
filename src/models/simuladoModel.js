const pool = require('../config/database');

const getCorrectOptionsForQuestions = async (questionIds) => {
    const result = await pool.query(
        'SELECT questao_id, id AS opcao_id_correta FROM app_simulado.opcoes WHERE questao_id = ANY($1) AND correta = TRUE',
        [questionIds]
    );
    return result.rows;
};

const saveSimuladoResult = async (aluno_id, pontuacaoTotal, pontuacoesPorTipo, respostasParaSalvar) => {
    const client = await pool.connect();
    try {
        await client.query('BEGIN');

        const resultSimulado = await client.query(
            'INSERT INTO app_simulado.simulados (aluno_id, pontuacao, data_inicio) VALUES ($1, $2, CURRENT_TIMESTAMP) RETURNING id',
            [aluno_id, pontuacaoTotal]
        );
        const simulado_id = resultSimulado.rows[0].id;

        if (respostasParaSalvar.length > 0) {
            const values = respostasParaSalvar.map(r => `(${simulado_id}, ${r.question_id}, ${r.opcao_escolhida_id})`).join(',');
            const sql = `INSERT INTO app_simulado.respostas_usuario (simulado_id, questao_id, opcao_escolhida_id) VALUES ${values}`;
            await client.query(sql);
        }

        if (pontuacoesPorTipo.length > 0) {
            const values = pontuacoesPorTipo.map(p => `(${simulado_id}, '${p.tipo}', ${p.corretas}, ${p.total}, ${p.porcentagem})`).join(',');
            const sql = `INSERT INTO app_simulado.pontuacoes_por_tipo (simulado_id, tipo, corretas, total, porcentagem) VALUES ${values}`;
            await client.query(sql);
        }

        await client.query('COMMIT');
        return { simulado_id };
    } catch (error) {
        await client.query('ROLLBACK');
        throw error;
    } finally {
        client.release();
    }
};


const getSimuladosHistory = async (aluno_id = null) => {
    let query = `
        SELECT 
            s.id, 
            s.pontuacao, 
            u.nome, 
            TO_CHAR(s.data_inicio, 'DD/MM/YYYY HH24:MI') as data_formatada,
            COALESCE(pt.pontuacoes, '[]'::json) as pontuacoes_por_tipo,
            COALESCE(respostas.respostas, '[]'::json) as respostas
        FROM app_simulado.simulados s
        JOIN app_simulado.usuarios u ON s.aluno_id = u.id
        LEFT JOIN (
            SELECT 
                simulado_id,
                json_agg(
                    json_build_object(
                        'tipo', tipo,
                        'corretas', corretas,
                        'total', total,
                        'porcentagem', porcentagem
                    )
                ) as pontuacoes
            FROM app_simulado.pontuacoes_por_tipo
            GROUP BY simulado_id
        ) pt ON s.id = pt.simulado_id
        LEFT JOIN (
            SELECT 
                ru.simulado_id,
                json_agg(
                    json_build_object(
                        'id', q.id,
                        'enunciado', q.enunciado,
                        'imagem_url', q.imagem_url,
                        'opcoes', o.opcoes,
                        'acertou', CASE WHEN (SELECT COUNT(*) FROM app_simulado.opcoes WHERE questao_id = q.id AND correta = TRUE) = (SELECT COUNT(*) FROM app_simulado.respostas_usuario WHERE simulado_id = ru.simulado_id AND questao_id = q.id AND opcao_escolhida_id IN (SELECT id FROM app_simulado.opcoes WHERE questao_id = q.id AND correta = TRUE)) THEN TRUE ELSE FALSE END,
                        'opcao_escolhida_id', ru.opcao_escolhida_id
                    )
                ) as respostas
            FROM app_simulado.respostas_usuario ru
            JOIN app_simulado.questoes q ON ru.questao_id = q.id
            LEFT JOIN (
                SELECT 
                    questao_id,
                    json_agg(
                        json_build_object(
                            'id', id,
                            'texto_opcao', texto_opcao,
                            'correta', correta
                        )
                    ) as opcoes
                FROM app_simulado.opcoes
                GROUP BY questao_id
            ) o ON q.id = o.questao_id
            GROUP BY ru.simulado_id
        ) respostas ON s.id = respostas.simulado_id
    `;

    const params = [];
    if (aluno_id) {
        query += ' WHERE s.aluno_id = $1';
        params.push(aluno_id);
    }

    query += ' ORDER BY s.data_inicio DESC';

    const result = await pool.query(query, params);

    // Process the results to correctly format imagem_url
    const simulados = result.rows.map(simulado => {
        if (simulado.respostas) {
            simulado.respostas.forEach(resposta => {
                if (resposta.imagem_url && typeof resposta.imagem_url === 'string') {
                    resposta.imagem_url = resposta.imagem_url.includes('||') ? resposta.imagem_url.split('||') : [resposta.imagem_url];
                } else {
                    resposta.imagem_url = [];
                }
            });
        }
        return simulado;
    });

    return simulados;
};

module.exports = {
    getCorrectOptionsForQuestions,
    saveSimuladoResult,
    getSimuladosHistory,
};