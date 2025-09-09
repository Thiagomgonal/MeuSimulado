<template>
  <div class="history-container">
    <div class="history-card">
      <h1>Histórico de Simulados:</h1>
      <p v-if="loading">Carregando histórico...</p>
      <p v-else-if="simulados.length === 0">Nenhum simulado finalizado ainda.</p>
      <p v-if="message">{{ message }}</p>
      <ul v-else class="simulado-list">
        <li v-for="simulado in simulados" :key="simulado.id" class="simulado-item">
          <div class="simulado-header" @click="toggleDetails(simulado.id)">
            <div class="simulado-summary">
              <span class="simulado-name">{{ simulado.nome }}</span>
              <span class="simulado-date">{{ simulado.data_formatada }}</span>
              <span class="simulado-score">
                Nota: {{ parseInt(simulado.pontuacao) }} / {{ simulado.respostas.length }}
                - {{ Math.round((simulado.pontuacao / simulado.respostas.length) * 100) }}%
              </span>
            </div>
            <span class="arrow-icon" :class="{ 'expanded': expandedItems[simulado.id] }">▶</span>
          </div>
          <div v-if="expandedItems[simulado.id]" class="simulado-details">
            <div class="details-section">
              <h3>Resultados por Tipo:</h3>
              <ul class="type-scores">
                <li v-for="tipo in simulado.pontuacoes_por_tipo" :key="tipo.tipo">
                  <span>{{ tipo.tipo }}:</span>
                  <span>{{ tipo.corretas }} / {{ tipo.total }} ({{ parseFloat(tipo.porcentagem).toFixed(0) }}%)</span>
                </li>
              </ul>
            </div>
            <div class="details-section">
              <h3>Detalhes das respostas:</h3>
              <div v-for="(resposta, index) in simulado.respostas" :key="resposta.id" class="question-details">
                <div class="question-header">
                  <span class="question-number">{{ index + 1 }}:</span>
                  <p class="question-enunciado">{{ resposta.enunciado }}</p>
                  <span class="question-status" :class="{ 'correct': resposta.acertou, 'incorrect': !resposta.acertou }">
                    {{ resposta.acertou ? '✓ Acertou' : '✗ Errou' }}
                  </span>
                </div>
                <div v-if="resposta.imagem_url && resposta.imagem_url.length > 0" class="question-image-container">
                  <img v-for="(image, imgIndex) in resposta.imagem_url" :key="imgIndex" :src="image" alt="Imagem da Questão" class="question-image" />
                </div>
                <ul class="options-list">
                  <li v-for="opcao in resposta.opcoes" :key="opcao.id" class="option-item">
                    <span :class="{
                      'chosen': resposta.opcao_escolhida_id === opcao.id,
                      'correct': opcao.correta,
                      'incorrect': resposta.opcao_escolhida_id === opcao.id && !opcao.correta
                    }">
                      {{ opcao.texto_opcao }}
                    </span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </li>
      </ul>
      <a href="#" @click.prevent="$router.push('/main')" class="back-link">Voltar</a>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import api from '@/services/api.js';

const simulados = ref([]);
const loading = ref(true);
const expandedItems = ref({});
const router = useRouter();
const message = ref(null);

const fetchSimuladosHistory = async () => {
  try {
    const token = localStorage.getItem('token');
    if (!token) {
      router.push('/login');
      return;
    }

    const config = {
      headers: {
        Authorization: `Bearer ${token}`,
      }
    };

    const response = await api.get('/simulado/history', config);
    simulados.value = response.data;
  } catch (error) {
    console.error('Erro ao buscar histórico: ', error);
    message.value = 'Erro ao buscar histórico de simulados.';
  } finally {
    loading.value = false;
  }
};

const toggleDetails = (simuladoId) => {
  expandedItems.value[simuladoId] = !expandedItems.value[simuladoId];
};

onMounted(() => {
  fetchSimuladosHistory();
});
</script>

<style scoped>
.history-container {
  display: flex;
  justify-content: center;
  padding: 2rem;
  background-color: #f0f2f5;
  font-family: Arial, sans-serif;
  min-height: 100vh;
}

.history-card {
  width: 100%;
  max-width: 800px;
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.history-card h1 {
  text-align: center;
  margin-bottom: 2rem;
  color: #333;
}

.simulado-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.simulado-item {
  border: 1px solid #ddd;
  border-radius: 8px;
  margin-bottom: 1rem;
  overflow: hidden;
  transition: box-shadow 0.3s ease;
}

.simulado-item:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.simulado-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  cursor: pointer;
  background-color: #f7f7f7;
  transition: background-color 0.3s ease;
}

.simulado-header:hover {
  background-color: #eee;
}

.simulado-summary {
  display: flex;
  gap: 2rem;
}

.simulado-name {
    font-weight: bold;
    color: #34495e;
}

.simulado-date {
  font-weight: bold;
  color: #555;
}

.simulado-score {
  font-weight: bold;
  color: #007bff;
}

.arrow-icon {
  transition: transform 0.3s ease;
}

.arrow-icon.expanded {
  transform: rotate(90deg);
}

.simulado-details {
  padding: 1rem;
  background-color: #fff;
}

.details-section {
  margin-bottom: 1.5rem;
}

.details-section h3 {
  border-bottom: 1px solid #eee;
  padding-bottom: 0.5rem;
  margin-bottom: 1rem;
  color: #555;
}

.type-scores,
.options-list {
  list-style: none;
  padding: 0;
}

.type-scores li {
  display: flex;
  justify-content: space-between;
  padding: 5px 0;
}

.question-details {
  border: 1px solid #e0e0e0;
  border-radius: 6px;
  padding: 1rem;
  margin-bottom: 1rem;
}

.question-header {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  margin-bottom: 0.5rem;
}

.question-number {
  font-weight: bold;
}

.question-enunciado {
  flex-grow: 1;
  margin: 0;
}

.question-status {
  font-weight: bold;
}

.question-status.correct {
  color: #28a745;
}

.question-status.incorrect {
  color: #dc3545;
}

.question-image-container {
  text-align: center;
  margin: 1rem 0;
}

.question-image {
  max-width: 100%;
  height: auto;
  border-radius: 4px;
}

.options-list {
  margin-top: 1rem;
}

.option-item {
  padding: 5px;
  border-radius: 4px;
}

.option-item span.chosen {
  font-weight: bold;
  background-color: #e9ecef;
  padding: 3px 6px;
  border-radius: 4px;
}

.option-item span.correct {
  color: #28a745;
  font-weight: bold;
}

.option-item span.incorrect {
  color: #dc3545;
  font-weight: bold;
}

.back-link {
  display: block;
  text-align: center;
  margin-top: 2rem;
  color: #007bff;
  text-decoration: none;
}
</style>