const express = require('express')
const router = express.Router()
const authController = require('../controllers/authController')
const {authenticateToken, checkAdmin} = require('../middlewares/authMiddleware')


router.post('/register', authController.register)
router.post('/login',authController.login)

router.get('/profile', authenticateToken, (req, res)=>{
    res.status(200).json({
        message:'Acesso ao perfil bem-sucedido',
        user: req.user
    })
})

router.get('/admin', authenticateToken, checkAdmin, (req, res)=>{
    res.status(200).json({
        message:'Acesso de administrador concedido!',
        user:req.user
    })
})

module.exports = router