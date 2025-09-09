<template>
  <div class="main-container">
    <div class="main-content">
      <div class="main-header">
        <h1>Menu Principal</h1>
      </div>
      <div class="main-buttons">
        <router-link to="/simulado" class="btn btn-primary">
          Começar um novo simulado
        </router-link>
        <router-link to="/simulado/history" class="btn btn-secondary">
          Ver histórico
        </router-link>
        
        <router-link v-if="isAdmin" to="/admin/questoes" class="btn btn-admin">
          Cadastrar novas perguntas
        </router-link>
      </div>
      <a href="#" @click.prevent="handleLogout" class="logout-link">Sair</a>
    </div>
  </div>
</template>


<script setup>
import {ref, onMounted} from 'vue'
import { useRoute, useRouter } from 'vue-router';
import {jwtDecode} from 'jwt-decode'

const isAdmin = ref(false)
const router = useRouter()

const checkAdminStatus = ()=>{
    const token = localStorage.getItem('token')
    if(token){
        try{
            const decoded = jwtDecode(token)
            if(decoded.tipo_acesso==='admin'){
                isAdmin.value = true
            }
        } catch(error){
            console.error('Falha ao decodificar o token: ',error)
            localStorage.removeItem('token')
            router.push('/login')
        }
    } else {
        router.push('/login')
    }
}

const handleLogout = ()=>{
    localStorage.removeItem('token')
    router.push('/login')
}

onMounted(()=>{
    checkAdminStatus()
})

</script>

<style scoped>
.main-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f2f5;
  font-family: Arial, sans-serif;
}

.main-content {
  display: flex;
  flex-direction: column; /* Alinha os itens em uma coluna */
  align-items: center; /* Centraliza horizontalmente */
  background: white;
  padding: 3rem;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  gap: 1.5rem;
}

.main-header {
  margin-bottom: 0; 
  text-align: center;
}

.main-content h1 {
  margin: 0;
  color: #333;
}

.main-buttons {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.btn {
  width: 250px;
  padding: 15px;
  border: none;
  border-radius: 8px;
  font-size: 18px;
  font-weight: bold;
  text-decoration: none;
  color: white;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn-primary {
  background-color: #007bff;
}

.btn-primary:hover {
  background-color: #0056b3;
}

.btn-secondary {
  background-color: #6c757d;
}

.btn-secondary:hover {
  background-color: #5a6268;
}

.btn-admin {
  background-color: #28a745;
}

.btn-admin:hover {
  background-color: #218838;
}
.logout-link {
  margin-top: 1rem;
  color: #6c757d;
  text-decoration: none;
  font-size: 14px;
  transition: color 0.3s ease;
}

.logout-link:hover {
  color: #000;
  text-decoration: underline;
}
</style>