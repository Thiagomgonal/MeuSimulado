import axios from 'axios';

// Acessando a variável com o prefixo VITE_
const BACKEND_PORT = import.meta.env.VITE_API_PORT || 3000;

console.log(BACKEND_PORT)

const API_URL = `http://localhost:${BACKEND_PORT}/api`;

const api = axios.create({
  baseURL: API_URL
});

export default api;