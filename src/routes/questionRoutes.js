const express = require('express')
const router = express.Router()
const questionController = require('../controllers/questionController')
const {authenticateToken, checkAdmin} = require('../middlewares/authMiddleware')

router.post('/questions', authenticateToken, checkAdmin, questionController.create)
router.post('/questions/validate', authenticateToken, checkAdmin, questionController.validate)


module.exports = router