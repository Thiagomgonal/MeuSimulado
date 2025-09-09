const pool = require('../config/database');

const createUser = async (nome, email, hashedPassword) => {
    // Adicione o nome do schema e use RETURNING id
    const sql = 'INSERT INTO app_simulado.usuarios (nome, email, senha, tipo_acesso) VALUES ($1, $2, $3, \'aluno\') RETURNING id';
    const values = [nome, email, hashedPassword];
    
    // Acessa o resultado da query corretamente
    const result = await pool.query(sql, values);
    return result.rows[0].id;
}

const findUserByEmail = async (email) => {
    // Adicione o nome do schema
    const sql = 'SELECT * FROM app_simulado.usuarios WHERE email = $1';
    const result = await pool.query(sql, [email]);
    return result.rows[0];
}

module.exports = {
    createUser,
    findUserByEmail
}