const simuladoModel = require('../models/simuladoModel');

function calculateScores(userAnswers, correctAnswersMap, questionsMap) {
    let pontuacaoTotal = 0;
    const pontuacoesPorTipo = {};

    for (const questionId in userAnswers) {
        const userAnswer = userAnswers[questionId];
        const correctAnswer = correctAnswersMap[questionId] ? correctAnswersMap[questionId][0] : null;
        const question = questionsMap[questionId];
        const questionType = question?.tipo;

        if (questionType) {
            if (!pontuacoesPorTipo[questionType]) {
                pontuacoesPorTipo[questionType] = { corretas: 0, total: 0 };
            }
            pontuacoesPorTipo[questionType].total++;

            if (userAnswer === correctAnswer) {
                pontuacaoTotal++;
                pontuacoesPorTipo[questionType].corretas++;
            }
        }
    }

    const formattedPontuacoesPorTipo = Object.keys(pontuacoesPorTipo).map(tipo => ({
        tipo,
        corretas: pontuacoesPorTipo[tipo].corretas,
        total: pontuacoesPorTipo[tipo].total,
        porcentagem: (pontuacoesPorTipo[tipo].corretas / pontuacoesPorTipo[tipo].total) * 100 || 0
    }));

    return { pontuacaoTotal, formattedPontuacoesPorTipo };
}

function formatResultsForSave(userAnswers) {
    return Object.entries(userAnswers).map(([questionId, userAnswer]) => ({
        question_id: parseInt(questionId),
        opcao_escolhida_id: userAnswer
    }));
}

const submitSimulado = async (req, res) => {
    try {
        const aluno_id = req.user.id;
        const { userAnswers, questions } = req.body;

        if (!userAnswers || Object.keys(userAnswers).length === 0 || !questions || questions.length === 0) {
            return res.status(400).json({ message: 'Dados do simulado incompletos.' });
        }

        const questionsMap = questions.reduce((map, q) => {
            map[q.id] = q;
            return map;
        }, {});

        const questionIds = questions.map(q => q.id);
        const correctOptions = await simuladoModel.getCorrectOptionsForQuestions(questionIds);

        const correctAnswersMap = correctOptions.reduce((map, item) => {
            if (!map[item.questao_id]) {
                map[item.questao_id] = [];
            }
            map[item.questao_id].push(item.opcao_id_correta);
            return map;
        }, {});

        const { pontuacaoTotal, formattedPontuacoesPorTipo } = calculateScores(userAnswers, correctAnswersMap, questionsMap);
        const respostasParaSalvar = formatResultsForSave(userAnswers);

        const result = await simuladoModel.saveSimuladoResult(
            aluno_id,
            pontuacaoTotal,
            formattedPontuacoesPorTipo,
            respostasParaSalvar
        );

        res.status(200).json({
            message: 'Simulado finalizado e resultados salvos!',
            pontuacaoTotal,
            totalQuestoes: questions.length,
            pontuacoesPorTipo: formattedPontuacoesPorTipo,
            simulado_id: result.simulado_id
        });
    } catch (error) {
        res.status(500).json({ message: 'Erro ao finalizar simulado. Tente novamente.' });
    }
};

const getSimuladosHistory = async (req, res) => {
    try {
        const { tipo_acesso, id } = req.user;
        let history;

        if (tipo_acesso === 'owner' || tipo_acesso === 'admin') {
            history = await simuladoModel.getSimuladosHistory();
        } else {
            history = await simuladoModel.getSimuladosHistory(id);
        }

        res.status(200).json(history);
    } catch (error) {
        res.status(500).json({ message: 'Erro ao buscar histórico de simulados.' });
    }
};

module.exports = {
    submitSimulado,
    getSimuladosHistory,
};