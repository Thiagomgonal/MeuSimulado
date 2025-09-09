const express = require('express')
const router = express.Router()
const questionController = require('../controllers/questionController')
const simuladoController = require('../controllers/simuladoController')
const {authenticateToken} = require('../middlewares/authMiddleware')

router.get('/tipos',authenticateToken,questionController.getTypes)
router.post('/questoes',authenticateToken,questionController.getSimuladoQuestions)
router.post('/submit',authenticateToken,simuladoController.submitSimulado)
router.get('/history', authenticateToken, simuladoController.getSimuladosHistory) 


module.exports = router