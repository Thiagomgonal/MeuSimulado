<template>
    <div class="question-create-container">
        <div class="question-create-card">
            <h2>Cadastro de Questões</h2>
            <form @submit.prevent="handleQuestionCreate">
                <div class="form-group">
                    <label for="enunciado">Enunciado (com as opções):</label>
                    <textarea id="enunciado" v-model="form.enunciado" required></textarea>
                </div>

                <div class="form-group">
                    <label>Resposta Correta:</label>
                    <div class="radio-group">
                        <label v-for="letra in ['A', 'B', 'C', 'D']" :key="letra" class="radio-label">
                            <input
                                type="radio"
                                :id="'radio-' + letra"
                                :value="letra.toLowerCase()"
                                v-model="form.respostaCorreta"
                                required
                            />
                            {{ letra }}
                        </label>
                    </div>
                </div>
                
                <div class="form-group image-upload-section">
                    <label>Imagens (opcional):</label>
                    <div v-for="(image, index) in imageFiles" :key="index" class="image-upload-group">
                        <input type="file" @change="handleImageUpload($event, index)" accept="image/*" />
                        <button type="button" @click="removeImage(index)" class="btn-remove">-</button>
                    </div>
                    <button type="button" @click="addImageField" class="btn-add">Adicionar imagem</button>
                </div>

                <div class="form-group">
                    <label for="tipo">Tipo:</label>
                    <input type="text" id="tipo" v-model="form.tipo" placeholder="ex: Debug, Orchestrator" required />
                </div>

                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
            <p v-if="message" :class="message.type"> {{ message.text }}</p>
            <a href="#" @click.prevent="goBack" class="back-link">Voltar</a>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import api from '@/services/api';

const router = useRouter();

const form = ref({
    enunciado: '',
    respostaCorreta: '', // Agora armazenará a letra selecionada (ex: 'a')
    tipo: '',
    imagem_url: '' 
});

const message = ref(null);
const imageFiles = ref([]);
const IMGBB_API_KEY = "d915a5e939e936768f7bc91c4f3b6b91";

const addImageField = () => {
    imageFiles.value.push(null);
};

const removeImage = (index) => {
    imageFiles.value.splice(index, 1);
};

const handleImageUpload = (event, index) => {
    const file = event.target.files[0];
    if (file) {
        imageFiles.value[index] = file;
    }
};

const handleQuestionCreate = async () => {
    try {
        message.value = { text: 'Carregando...', type: 'success' };
        const token = localStorage.getItem('token');
        if (!token) {
            router.push('/login');
            return;
        }

        const config = {
            headers: {
                Authorization: `Bearer ${token}`
            }
        };

        // Lógica para transformar o enunciado e a resposta em um objeto formatado
        const enunciadotexto = form.value.enunciado;
        const linhas = enunciadotexto.split('\n');
        
        let enunciadoCompleto = '';
        let opcoes = [];
        let estado = 'enunciado';
        let opcaoAtual = '';
        
        for (const linha of linhas) {
            const linhaFormatada = linha.trim();
            const eOpcao = /^[A-Z]\.\s/.test(linhaFormatada);
            
            if (estado === 'enunciado' && !eOpcao) {
                // A linha faz parte do enunciado
                if (enunciadoCompleto) {
                    enunciadoCompleto += '\n';
                }
                enunciadoCompleto += linhaFormatada;
            } else if (eOpcao) {
                // Início de uma nova opção
                if (opcaoAtual) {
                    opcoes.push(opcaoAtual);
                }
                opcaoAtual = linhaFormatada;
                estado = 'opcoes';
            } else if (estado === 'opcoes') {
                // Linha de continuação de uma opção
                opcaoAtual += ' ' + linhaFormatada;
            }
        }
        
        if (opcaoAtual) {
            opcoes.push(opcaoAtual);
        }
        
        // Formata as opções para o payload final
        const opcoesFormatadas = opcoes.map((opcaoTexto, index) => {
            const texto_opcao = opcaoTexto.replace(/^[A-Z]\.\s+/, '');
            const letraOpcao = String.fromCharCode(65 + index).toLowerCase(); // Transforma o índice em letra minúscula (a, b, c, d)
            const correta = letraOpcao === form.value.respostaCorreta; // Compara com a letra selecionada
            return {
                texto_opcao,
                correta
            };
        });

        // --- PASSO 1: Validação dos dados textuais no backend ---
        const payloadForValidation = {
            enunciado: enunciadoCompleto.trim(),
            tipo: form.value.tipo,
            opcoes: opcoesFormatadas
        };

        try {
            await api.post('/admin/questions/validate', payloadForValidation, config);
        } catch (validationError) {
            const errorMessage = validationError.response?.data?.message || 'Erro na validação dos dados da questão.';
            message.value = { text: errorMessage, type: 'error' };
            return; // Para a execução se a validação falhar
        }

        // --- PASSO 2: Upload das imagens (somente se a validação textual passou) ---
        const imageUrls = [];
        for (const file of imageFiles.value) {
            if (file) {
                const formData = new FormData();
                formData.append('image', file);
                const imgbbResponse = await api.post(
                    `https://api.imgbb.com/1/upload?key=${IMGBB_API_KEY}`,
                    formData
                );
                imageUrls.push(imgbbResponse.data.data.url);
                console.log('Uploaded image URL:', imgbbResponse.data.data.url);
            }
        }

        form.value.imagem_url = imageUrls.join('||');

        // --- PASSO 3: Criação final da questão no backend ---
        const finalPayload = {
            enunciado: enunciadoCompleto.trim(),
            tipo: form.value.tipo,
            imagem_url: form.value.imagem_url,
            opcoes: opcoesFormatadas
        };
        
        await api.post('/admin/questions', finalPayload, config);

        message.value = { text: 'Questão cadastrada com sucesso!', type: 'success' };

        form.value.enunciado = '';
        form.value.respostaCorreta = '';
        form.value.tipo = '';
        form.value.imagem_url = '';
        imageFiles.value = [];
        
    } catch (error) {
        console.error('Erro ao cadastrar questão: ', error);
        const errorMessage = error.response?.data?.message || 'Erro ao cadastrar questão. Tente novamente.';
        message.value = { text: errorMessage, type: 'error' };
    }
};


const goBack = () => {
    router.push('/main');
};

onMounted(() => {
    addImageField();
});
</script>

<style scoped>
/* Estilos novos ou alterados para os radio buttons */
.radio-group {
    display: flex;
    justify-content: space-around;
    margin-top: 10px;
    margin-bottom: 20px;
}

.radio-label {
    display: flex;
    align-items: center;
    cursor: pointer;
    font-size: 1rem;
}

.radio-label input[type="radio"] {
    margin-right: 5px;
    cursor: pointer;
}

/* Estilos não alterados */
.question-create-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f2f5;
    font-family: Arial, sans-serif;
}

.question-create-card {
    background: white;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 600px;
    text-align: center;
}

.question-create-card h2 {
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

.form-group textarea,
.form-group input[type="text"],
.form-group input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.options-container {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    margin-bottom: 1.5rem;
}

.option-group {
    display: flex;
    align-items: center;
    gap: 10px;
}

.option-group input[type="text"] {
    flex-grow: 1;
}

.btn-primary {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    color: white;
    background-color: #28a745;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #218838;
}

.success {
    color: green;
    margin-top: 1rem;
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

.back-link:hover {
    text-decoration: underline;
}

.image-upload-group {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 10px;
}

.image-upload-group input[type="file"] {
    flex-grow: 1;
}

.btn-add, .btn-remove {
    background: none;
    border: 1px solid #ccc;
    color: #555;
    font-size: 1rem;
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
    width: auto;
}

.btn-add:hover {
    background-color: #e9ecef;
    border-color: #adb5bd;
}

.btn-remove:hover {
    background-color: #f8d7da;
    border-color: #dc3545;
    color: #dc3545;
}

.btn-add {
    font-weight: bold;
    color: #007bff;
    border-color: #007bff;
    padding: 8px 12px;
}

.btn-add:hover {
    background-color: #e7f5ff;
}
</style>