const jwt = require('jsonwebtoken')

const authenticateToken = (req, res, next)=>{
    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(' ')[1]
if(token == null) {
    return res.status(401).json({message:'Autenticação necessaria.'})
}

jwt.verify(token, process.env.JWT_SECRET,(err,user)=>{
    if(err){
        console.error('Erro na verificação do token: ',err)
        return res.status(403).json({message:'Token invalido'})
    }
    req.user = user
    next()
})
}

const checkAdmin = (req, res, next)=>{
    if(req.user && req.user.tipo_acesso==='admin'){
        next()
    }else{
        return res.status(403).json({message:'Acesso negado. Apenas administradores podem acessar essa rota.'})
    }
}


module.exports = {
    authenticateToken,
    checkAdmin
}