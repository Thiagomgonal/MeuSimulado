const express = require('express')
const dotenv = require('dotenv')
const pool = require('./src/config/database')
const authRoutes = require('./src/routes/authRoutes')
const questionRoutes = require('./src/routes/questionRoutes')
const cors = require('cors'); // Importe o pacote cors
const simuladoRoutes = require('./src/routes/simuladoRoutes')

dotenv.config()

const app = express()
const PORT = process.env.VITE_API_PORT || 3000

app.use(cors())
app.use(express.json())

app.get('/', (req, res)=>{
    res.send('API do Simulado esta no ar.')
})

app.use('/api/auth', authRoutes)
app.use('/api/admin',questionRoutes)
app.use('/api/simulado',simuladoRoutes)


app.listen(PORT, ()=>{
    console.log(`Servidor rodando na porta ${PORT}`)
})