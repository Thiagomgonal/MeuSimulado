<template>
  <div class="temp-container">
    <h1>Simulado</h1>
    <p v-if="tiposSelecionados.length > 0">Tipos de questões selecionados:</p>
    <ul>
      <li v-for="tipo in tiposSelecionados" :key="tipo">{{ tipo }}</li>
    </ul>
    <p v-if="tiposSelecionados.length === 0">Nenhum tipo de questão selecionado.</p>
    <a href="#" @click.prevent="$router.push('/simulado')" class="back-link">Voltar</a>
  </div>
</template>

<script setup>
import { computed } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute();
const tiposSelecionados = computed(() => {
  return route.query.tipos ? JSON.parse(route.query.tipos) : [];
});
</script>

<style scoped>
.temp-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: Arial, sans-serif;
  text-align: center;
}


.back-link {
  margin-top: 1rem;
  color: #6c757d;
  text-decoration: none;
}
</style>