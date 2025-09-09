<template>
  <div class="login-container">
    <div class="login-card">
      <h2>Entrar</h2>
      <form @submit.prevent="handleLogin">
        <div class="form-group">
          <label for="email">E-mail:</label>
          <input type="email" id="email" v-model="form.email" required />
        </div>
        <div class="form-group">
          <label for="password">Senha:</label>
          <input type="password" id="password" v-model="form.password" required />
        </div>
        <button type="submit" class="btn btn-primary">Logar</button>
      </form>
      <p v-if="message" :class="message.type">{{ message.text }}</p>
      <router-link to="/register" class="link-secondary">Não tem uma conta? Faça cadastro.</router-link>
    </div>
  </div>
</template>

<script setup>

import {ref} from 'vue'
import { useRouter } from 'vue-router';
import axios from 'axios';
import api from '@/services/api'

const form = ref({
    email:'',
    password:'',
})

const message = ref(null)
const router = useRouter()

const handleLogin = async ()=>{
    try{
        const response = await api.post('/auth/login',{
            email:form.value.email,
            senha:form.value.password,
        })
        

        localStorage.setItem('token', response.data.token)

        message.value = {text: response.data.message, type: 'sucess'}
        
        setTimeout(() => {
            router.push('/main')
        }, 1000);
    } catch (error){
        console.error('Erro no cadastro: ',error)
        const errorMessage = error.response?.data?.message || 'Erro ao entrar. Tente novamente.'
        message.value = {text: errorMessage, type:'error'}
    }
}

</script>


<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f2f5;
  font-family: Arial, sans-serif;
}

.login-card {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
  text-align: center;
}

.login-card h2 {
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
