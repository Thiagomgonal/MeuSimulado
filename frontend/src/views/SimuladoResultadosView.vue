

<template>

<div class="simulado-results-container">
    <div class="simulado-results-card" v-if="simuladoStore.results">
        <h1>Resultados do Simulado</h1>

        <div class="score-summary">
            <p class="final-score">Pontuação Final: {{ simuladoStore.results.pontuacaoTotal }} / {{ simuladoStore.results.totalQuestoes }}</p>
        </div>

        <div class="score-by-type" v-if="simuladoStore.results.pontuacoesPorTipo">
            <h2>Pontuação por Tipo</h2>
            <ul>
                <li v-for="pontuacao in simuladoStore.results.pontuacoesPorTipo" :key="pontuacao.tipo">
                    <span class="type-name">{{ pontuacao.tipo }}:</span>
                    <span class="type-score">{{ pontuacao.corretas }} / {{ pontuacao.total }} ({{ pontuacao.porcentagem.toFixed(0) }}%)</span>
                </li>
            </ul>
        </div>
        <div v-else class="simulado-results-card">
            <p>Nenhum resultado de simulado disponível. Por favor, complete um simulado primeiro.</p>
        </div>
        <a href="#" @click.prevent="goBack" class="back-link">Voltar</a>
    </div>
</div>
</template>


<script setup>

import { useRouter } from 'vue-router'
import { useSimuladoStore } from '@/store/simuladoStore.js'

const router = useRouter()
const simuladoStore = useSimuladoStore()

const goBack = ()=>{
    simuladoStore.setResults(null)
    router.push('/main')
}


</script>

<style scoped>
.simulado-results-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f0f2f5;
  font-family: Arial, sans-serif;
  padding: 2rem;
}

.simulado-results-card {
  background: white;
  padding: 2.5rem;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 600px;
  text-align: center;
}

.simulado-results-card h1 {
  color: #333;
  margin-bottom: 1rem;
}

.score-summary {
  margin-bottom: 2rem;
}

.final-score {
  font-size: 2rem;
  font-weight: bold;
  color: #007bff;
}

.score-by-type {
  text-align: left;
}

.score-by-type h2 {
  color: #555;
  margin-bottom: 1rem;
  border-bottom: 1px solid #eee;
  padding-bottom: 0.5rem;
}

.score-by-type ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.score-by-type li {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px dashed #eee;
}

.score-by-type li:last-child {
  border-bottom: none;
}

.type-name {
  font-weight: bold;
}

.type-score {
  color: #28a745;
}

.back-link {
  display: inline-block;
  margin-top: 2rem;
  padding: 10px 20px;
  background-color: #6c757d;
  color: white;
  border-radius: 4px;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.back-link:hover {
  background-color: #5a6268;
}
</style>