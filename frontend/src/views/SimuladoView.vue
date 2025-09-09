<template>
    <div class="simulado-run-container">
        <div v-if="simuladoStore.questions.length > 0" class="simulado-run-content">
            <h1>Simulado</h1>
            <div v-for="(question, index) in simuladoStore.questions" :key="question.id" class="question-card">
                <h3>{{ index + 1 }}. {{ question.enunciado }}</h3>
                <div v-if="question.imagem_url && question.imagem_url.length > 0" class="question-images-container">
                    <div v-for="(image, imgIndex) in question.imagem_url" :key="imgIndex" class="question-image-item">
                        <img :src="image" alt="Imagem da questão" class="question-image" />
                    </div>
                </div>
                <div class="options-group">
                    <div v-for="opcao in question.opcoes " :key="opcao.id" class="option">
                        <template v-if="question.correct_count > 1">
                            <input type="checkbox" :id="'q' + question.id + 'o' + opcao.id" :name="'question-' + question.id"
                                :value="opcao.id" @change="simuladoStore.setUserAnswer(question.id, opcao.id, $event.target.checked)"
                                :checked="simuladoStore.userAnswers[question.id] && simuladoStore.userAnswers[question.id].includes(opcao.id)" />
                            <label :for="'q' + question.id + 'o' + opcao.id">{{ opcao.texto_opcao }}</label>
                        </template>
                        <template v-else>
                            <input type="radio" :id="'q' + question.id + 'o' + opcao.id" :name="'question-' + question.id"
                                :value="opcao.id" @change="simuladoStore.setUserAnswer(question.id, opcao.id)"
                                :checked="simuladoStore.userAnswers[question.id] === opcao.id" />
                            <label :for="'q' + question.id + 'o' + opcao.id">{{ opcao.texto_opcao }}</label>
                        </template>
                    </div>
                </div>
            </div>
            <button @click="submitSimulado" class="btn btn-primary">Enviar</button>
        </div>
        <div v-else class="simulado-run-content">
            <p>Nenhuma questão disponível.</p>
            <a href="#" @click.prevent="$router.push('/simulado')" class="back-link">Voltar</a>
        </div>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { useSimuladoStore } from '@/store/simuladoStore.js'
// Removendo o import do axios, pois usaremos a nossa instância
// import axios from 'axios'
import api from '@/services/api.js' // Importando a instância da API

const router = useRouter()
const simuladoStore = useSimuladoStore()

const submitSimulado = async () => {
    const isConfirmed = window.confirm('Tem certeza que deseja enviar suas respostas?')
    if (!isConfirmed) {
        return
    }

    try {
        const token = localStorage.getItem('token')
        if (!token) {
            router.push('/login')
            return
        }

        const config = {
            headers: {
                Authorization: `Bearer ${token}`
            }
        }

        const payload = {
            userAnswers: simuladoStore.userAnswers,
            questions: simuladoStore.questions
        }

        // Usando a instância "api" com o endpoint relativo
        const response = await api.post('/simulado/submit', payload, config)
        console.log('Resposta do simulado: ', response.data)

        simuladoStore.setResults(response.data)

        router.push('/simulado/resultados')
    } catch (error) {
        console.error('Erro ao submeter simulado: ', error)
        alert('Erro ao finalizar simulado. Tente novamente.')
    }
}
</script>

<style scoped>
/* Os estilos não foram alterados */
.simulado-run-container {
    padding: 2rem;
    font-family: Arial, sans-serif;
}

.simulado-run-content {
    max-width: 800px;
    margin: 0 auto;
}

h1 {
    text-align: center;
    margin-bottom: 2rem;
    color: #333;
}

.question-card {
    background: white;
    padding: 1.5rem;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 1.5rem;
}

.question-card h3 {
    margin-top: 0;
    margin-bottom: 1rem;
}

.options-group {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.option {
    display: flex;
    align-items: center;
}

.option input[type="radio"],
.option input[type="checkbox"] {
    margin-right: 10px;
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
    margin-top: 2rem;
}

.btn:hover {
    background-color: #0056b3;
}

.back-link {
    display: block;
    text-align: center;
    margin-top: 1rem;
    color: #6c757d;
    text-decoration: none;
}

.question-images-container {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    justify-content: center;
    margin-bottom: 1.5rem;
}

.question-image-item {
    flex: 1 1 300px;
    max-width: 100%;
    text-align: center;
}

.question-image {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>