<template>
  <div class="register-container">
    <div class="register-card">
      <h2>Cadastre-se</h2>
      <form @submit.prevent="handleRegister">
        <div class="form-group">
          <label for="name">Nome:</label>
          <input type="text" id="name" v-model="form.name" required />
        </div>
        <div class="form-group">
          <label for="email">E-mail:</label>
          <input type="email" id="email" v-model="form.email" required />
        </div>
        <div class="form-group">
          <label for="password">Senha:</label>
          <input type="password" id="password" v-model="form.password" required />
        </div>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
      </form>
      <p v-if="message" :class="message.type">{{ message.text }}</p>
      <router-link to="/login" class="link-secondary">Já tem uma conta? Faça login.</router-link>
    </div>
  </div>
</template>

<script setup>

import {ref} from 'vue'
import { useRouter } from 'vue-router';
// A linha abaixo foi removida, pois você já está usando a instância "api"
// import axios from 'axios';
import api from '@/services/api';

const form = ref({
    name:'',
    email:'',
    password:'',
})

const message = ref(null)
const router = useRouter()

const handleRegister = async ()=>{
    try{
        // Esta requisição já está usando a sua instância configurada do Axios
        const response = await api.post('/auth/register',{
            nome:form.value.name,
            email:form.value.email,
            senha:form.value.password,
        })

        message.value = {text: response.data.message, type: 'sucess'}
        
        setTimeout(() => {
            router.push('/login')
        }, 2000);
    } catch (error){
        console.error('Erro no cadastro: ',error)
        const errorMessage = error.response?.data?.message || 'Erro ao cadastrar. Tente novamente.'
        message.value = {text: errorMessage, type:'error'}
    }
}

</script>


<style scoped>
.register-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f2f5;
  font-family: Arial, sans-serif;
}

.register-card {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
  text-align: center;
}

.register-card h2 {
  margin-bottom: 1.5rem;
  color: #333;
}

.form-group {
  margin-bottom: 1rem;
  text-align: left;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

.form-group input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.btn {
  width: 100%;
  padding: 10px;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  color: white;
  background-color: #007bff;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn:hover {
  background-color: #0056b3;
}

.success {
  color: green;
  margin-top: 1rem;
}

.error {
  color: red;
  margin-top: 1rem;
}

.link-secondary {
  display: block;
  margin-top: 1rem;
  color: #6c757d;
  text-decoration: none;
}
</style>