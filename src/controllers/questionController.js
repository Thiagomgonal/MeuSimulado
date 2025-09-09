const questionModel = require('../models/questionModel');

const validate = async (req, res) => {
    try {
        const { enunciado, opcoes, tipo } = req.body;

        if (!enunciado || !opcoes || !Array.isArray(opcoes) || opcoes.length !== 4 || !tipo) {
            return res.status(400).json({ message: 'Todos os campos (enunciado, tipo e 4 opções) são obrigatórios.' });
        }

        const correctAnswersCount = opcoes.filter(o => o.correta === true).length;
        if (correctAnswersCount !== 1) {
            return res.status(400).json({ message: 'Deve haver exatamente uma opção correta.' });
        }

        for (const opcao of opcoes) {
            if (typeof opcao.texto_opcao !== 'string' || opcao.texto_opcao.trim() === '' || typeof opcao.correta !== 'boolean') {
                return res.status(400).json({ message: 'Cada opção deve ter um texto_opcao (string não vazia) e uma propriedade correta (booleano).' });
            }
        }

        res.status(200).json({ message: 'Validação bem-sucedida.' });
    } catch (error) {
        res.status(500).json({ message: 'Erro ao validar a questão.' });
    }
};

const create = async (req, res) => {
    try {
        
        const { enunciado, opcoes, tipo, imagem_url } = req.body;
        const autor_id = req.user.id;

        if (!enunciado || !opcoes || !Array.isArray(opcoes) || opcoes.length !== 4 || !tipo) {
            return res.status(400).json({ message: 'Todos os campos (enunciado, tipo e 4 opções) são obrigatórios.' });
        }

        const correctAnswersCount = opcoes.filter(o => o.correta === true).length;
        if (correctAnswersCount !== 1) {
            return res.status(400).json({ message: 'Deve haver exatamente uma opção correta.' });
        }

        for (const opcao of opcoes) {
            if (typeof opcao.texto_opcao !== 'string' || opcao.texto_opcao.trim() === '' || typeof opcao.correta !== 'boolean') {
                return res.status(400).json({ message: 'Cada opção deve ter um texto_opcao (string não vazia) e uma propriedade correta (booleano).' });
            }
        }

        const result = await questionModel.createQuestion(enunciado, opcoes, autor_id, tipo, imagem_url);
        
        res.status(201).json(result);
    } catch (error) {
        res.status(500).json({ message: 'Erro ao cadastrar questão. Tente novamente.' });
    }
};

const getTypes = async (req, res) =>{
    try{
        const tipos = await questionModel.getUniqueTypes()
        res.status(200).json(tipos)
    }catch(error){
        res.status(500).json({message:'Erro ao buscar tipos de questões.'})
    }
}


const getSimuladoQuestions = async (req, res) =>{
    try{
        const {tipos} = req.body
        if(!tipos || !Array.isArray(tipos) || tipos.length === 0 || !tipos.every(t => typeof t === 'string')){
            return res.status(400).json({message:'Selecione pelo menos um tipo de questão válido.'})
        }
        const questions = await questionModel.getSimuladoQuestions(tipos)
        res.status(200).json(questions)
    }catch(error){
        res.status(500).json({message:'Erro ao buscar questões do simulado.'})
    }
}


module.exports = {
    create,
    getTypes,
    getSimuladoQuestions,
    validate
};