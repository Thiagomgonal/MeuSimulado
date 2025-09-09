const { Pool } = require('pg');
const dotenv = require('dotenv');

dotenv.config();

const pool = new Pool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT,
    // Adicione o search_path para o seu schema
    options: `-c search_path=${process.env.DB_SCHEMA || 'public'}`
});



// É ESSENCIAL que esta linha esteja aqui para exportar o objeto 'pool'
module.exports = pool;