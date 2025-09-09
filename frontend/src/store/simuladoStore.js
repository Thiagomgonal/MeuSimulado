import { defineStore } from 'pinia';
import { ref } from 'vue';

export const useSimuladoStore = defineStore('simulado', () => {
    const questions = ref([]);
    const userAnswers = ref({});
    const results = ref(null);

    const setQuestions = (newQuestions) => {
        questions.value = newQuestions;
        // Reinicia as respostas para um novo simulado
        userAnswers.value = {};
    };

    const setUserAnswer = (questionId, optionId, isChecked = null) => {
        const question = questions.value.find(q => q.id === questionId);
        
        // Se a questão tem mais de uma resposta correta, trata como checkbox (array)
        if (question && question.correct_count > 1) {
            // Inicializa o array se ainda não existir
            if (!userAnswers.value[questionId]) {
                userAnswers.value[questionId] = [];
            }
            
            if (isChecked) {
                // Adiciona a opção se ela não estiver no array
                if (!userAnswers.value[questionId].includes(optionId)) {
                    userAnswers.value[questionId].push(optionId);
                }
            } else {
                // Remove a opção se ela estiver no array
                const index = userAnswers.value[questionId].indexOf(optionId);
                if (index > -1) {
                    userAnswers.value[questionId].splice(index, 1);
                }
            }
        } else {
            // Se tem apenas uma resposta correta, trata como radio button (single value)
            userAnswers.value[questionId] = optionId;
        }
    };
    
    const setResults = (newResults) => {
        results.value = newResults;
    };

    return {
        questions,
        userAnswers,
        results,
        setQuestions,
        setUserAnswer,
        setResults,
    };
});