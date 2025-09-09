<template>
    <div class="simulado-container">
        <div class="simulado-card">
            <h1>Escolha os tipos de simulado</h1>
            <div class="form-group">
                <label>Tipos:</label>
                <div class="checkbox-list">
                    <label>
                        <input type="checkbox" v-model="selecionarTodos"/>
                        Todos
                    </label>
                    <label v-for="tipo in tiposDisponiveis" :key="tipo">
                        <input type="checkbox" :value="tipo" v-model="tiposSelecionados"/>
                        {{ tipo }}
                    </label>
                </div>
            </div>
            <p v-if="message" :class="message.type">{{ message.text }}</p>
            <button @click="startSimulado" class="btn btn-primary">Começar</button>
            <a href="#" @click.prevent="$router.push('/main')" class="back-link">Voltar</a>
        </div>
    </div>
</template>

<script setup>

import { ref,onMounted, watch, computed } from 'vue';
import { useRouter } from 'vue-router';
import { useSimuladoStore } from '@/store/simuladoStore.js'
// Removendo o import do axios, pois usaremos a nossa instância
// import axios from 'axios';
import api from '@/services/api' // Importando a instância da API

const router = useRouter()
const tiposDisponiveis = ref([])
const tiposSelecionados = ref([])
const message = ref(null)
const simuladoStore = useSimuladoStore()


const fetchTipos = async () =>{
    const token = localStorage.getItem('token')
    if(!token){
        router.push('/login')
        return
    }

    const config = {
        headers:{Authorization: `Bearer ${token}`}
    }

    try{
        // Usando a instância "api" com o endpoint relativo
        const response = await api.get('/simulado/tipos', config)
        tiposDisponiveis.value = response.data
    }catch(error){
        console.error('Erro ao buscar tipos: ',error)
    }
}

const startSimulado =  async ()=>{
    if(tiposSelecionados.value.length === 0){
        const errorMessage = 'Selecione pelo menos um tipo de simulado.'
        message.value = {text: errorMessage, type:'error'}
        return
    }
    
    const token = localStorage.getItem('token')
    if(!token){
      router.push('/login')
      return
    }

    const config={
      headers:{ Authorization: `Bearer ${token}`}
    }

    try{
      // Usando a instância "api" com o endpoint relativo
      const response = await api.post('/simulado/questoes', { tipos: tiposSelecionados.value }, config)
      simuladoStore.setQuestions(response.data)
      router.push({name:'simulado-run'})
    }catch(error){
      console.error('Erro ao iniciar simulado: ',error)
      const errorMessage = 'Não foi possível iniciar o simulado. Tente novamente.'
        message.value = {text: errorMessage, type:'error'}
    }

}

onMounted(()=>{
    fetchTipos()
})

const selecionarTodos = computed({
    get(){
        return tiposSelecionados.value.length===tiposDisponiveis.value.length
    },
    set(value){
        if(value){
            tiposSelecionados.value = [...tiposDisponiveis.value]
        }else{
            tiposSelecionados.value = []
        }
    }
})


</script>


<style scoped>
.simulado-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f2f5;
  font-family: Arial, sans-serif;
  text-align: center;
}

.simulado-card {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.simulado-card h1 {
  margin-bottom: 1.5rem;
  color: #333;
}

.form-group {
  margin-bottom: 1.5rem;
  text-align: left;
}

.checkbox-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  max-height: 200px;
  overflow-y: auto;
}

.checkbox-list label {
  cursor: pointer;
}

.btn {
  width: 100%;
  padding: 12px;
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
.error {
  color: red;
  margin-top: 1rem;
}

.back-link {
  display: block;
  margin-top: 1rem;
  color: #6c757d;
  text-decoration: none;
}
</style>