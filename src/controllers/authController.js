const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const userModel = require('../models/userModel')

const register = async (req, res)=>{
    try{
        const {nome, email, senha} =  req.body

        if(!nome || !email || !senha) {
            return res.status(400).json({message: 'Todos os campos são obrigatórios.'})
        }

        const hashedPassword = await bcrypt.hash(senha, 10)

        await userModel.createUser(nome, email, hashedPassword)
        res.status(201).json({message: 'Usuário cadastrado com sucesso.'})
    } catch (error) {
        res.status(500).json({message:'Erro ao cadastrar o usuário. O e-mail pode já estar em uso.'})
    }
}

const login = async(req, res)=>{
    try{
        const {email, senha}=req.body
        if(!email || !senha){
            return res.status(400).json({message:'Email e senha são obrigatórios'})
        }
        const user = await userModel.findUserByEmail(email)
        if(!user){
            return res.status(401).json({message:errorMessage()})
        }

        const isPasswordValid = await bcrypt.compare(senha, user.senha);
        if (!isPasswordValid) {
            return res.status(401).json({ message: errorMessage() });
        }

        const token = jwt.sign(
            {id: user.id, tipo_acesso: user.tipo_acesso},
            process.env.JWT_SECRET,
            {expiresIn: '10h'}
        )
        res.status(200).json({
            message:'Login bem-sucedido',
            token,
            user: {
                id:user.id,
                nome:user.nome,
                email:user.email,
                tipo_acesso:user.tipo_acesso,
            }
        })
    } catch (error){
        res.status(500).json({message:errorMessage()})
    }
}


function errorMessage(){
    return 'Login invalido'
}

module.exports = {
    register,
    login
}