<template>
    <div class="home-container">
        <header class="home-header">
            <img src="@/assets/Logo.png" alt="Logo do Simulado" class="home-logo"/>
            <h1>Bem-vindo ao Simulado!</h1>
        </header>
        <div class="home-buttons">
            <router-link to="/login" class="btn btn-primary">
                Entrar
            </router-link>
            <router-link to="/register" class="btn btn-secondary">
                Cadastrar
            </router-link>
        </div>
    </div>
</template>

<script setup>
</script>

<style scoped>

.home-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    text-align: center;
    background-color: #f0f2f52a;
    font-family: Arial, Helvetica, sans-serif;
}

.home-header{
    margin-bottom: 2rem;
}

.home-logo{
    width: 250px;
    height: 250px;
    margin-bottom: 1rem;
}

.home-buttons{
    display: flex;
    gap:1rem;
}

.btn{
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.btn-primary{
    background-color: #007bff;
    color: white;
}

.btn-primary:hover{
    background-color: #0056b3;
}

.btn-secondary{
    background-color: #6c757d;
    color: white;
}

.btn-secondary:hover{
    background-color: #5a6268;
}

h1{
    color: black;
    padding: 0 20px;
}

</style>