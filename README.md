# 🧠 Simulado Online - Plataforma de Testes e Avaliações

[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/Naereen/StrapDown.js/blob/master/LICENSE)
[![Vue.js](https://img.shields.io/badge/Vue.js-4FC08D?style=for-the-badge&logo=vue.js&logoColor=white)](https://vuejs.org/)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white)](https://nodejs.org/)
[![Express.js](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=json-web-tokens)](https://jwt.io/)
[![Vite](https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
[![ImgBB](https://img.shields.io/badge/ImgBB-FF6600?style=for-the-badge&logo=imgbb&logoColor=white)](https://imgbb.com/)

---

## ✨ Visão Geral

Este projeto é uma **Plataforma de Simulado Online** robusta e interativa, desenvolvida para auxiliar estudantes e profissionais na prática de conhecimentos através de testes personalizados. Com uma arquitetura moderna e escalável, a aplicação oferece uma experiência completa, desde o cadastro de usuários e questões até a realização de simulados e o acompanhamento detalhado do histórico de desempenho.

---

## 🚀 Funcionalidades Principais

*   **Autenticação Segura:** Cadastro e login de usuários com senhas criptografadas (`bcryptjs`) e autenticação baseada em `JWT` (JSON Web Tokens).
*   **Gestão de Questões (Admin):**
    *   **Criação de Questões:** Administradores podem cadastrar novas questões com enunciado, tipo, opções de resposta (com uma única correta) e, opcionalmente, imagens.
    *   **Validação Inteligente:** O upload de imagens para o serviço externo (`ImgBB`) ocorre *apenas* após a validação bem-sucedida dos dados textuais da questão, otimizando o uso de recursos (tokens).
*   **Simulados Personalizados:** Usuários podem iniciar simulados escolhendo os tipos de questões desejados. O sistema gera um simulado de 60 questões aleatórias com base nas seleções.
*   **Histórico Detalhado:**
    *   Visualização do histórico de simulados realizados, incluindo pontuação total e desempenho por tipo de questão.
    *   Detalhes das respostas dadas em cada questão, com indicação de acerto/erro e visualização das imagens associadas.
*   **Controle de Acesso:** Rotas protegidas por autenticação e autorização (`admin` vs. `aluno`), garantindo que apenas usuários com permissões adequadas acessem funcionalidades restritas.
*   **Otimização de Performance:** Consultas ao banco de dados otimizadas para evitar o problema de N+1 queries, garantindo um carregamento rápido do histórico de simulados.
*   **Modularização:** Código bem organizado em controladores, modelos, middlewares e rotas, facilitando a manutenção e a escalabilidade.

---

## 🛠️ Tecnologias Utilizadas

### Backend (API RESTful)

*   **Node.js:** Ambiente de execução JavaScript.
*   **Express.js:** Framework web para construção da API.
*   **PostgreSQL:** Banco de dados relacional robusto e escalável.
*   **`pg`:** Driver Node.js para PostgreSQL.
*   **`dotenv`:** Gerenciamento de variáveis de ambiente.
*   **`bcryptjs`:** Criptografia de senhas.
*   **`jsonwebtoken`:** Geração e verificação de JWTs para autenticação.
*   **`cors`:** Middleware para habilitar requisições Cross-Origin.

### Frontend (SPA - Single Page Application)

*   **Vue.js 3:** Framework progressivo para construção da interface de usuário.
*   **Vite:** Ferramenta de build rápida para desenvolvimento frontend.
*   **Vue Router:** Gerenciamento de rotas na aplicação SPA.
*   **Pinia:** Gerenciamento de estado reativo para Vue.js.
*   **Axios:** Cliente HTTP para comunicação com a API.
*   **`jwt-decode`:** Decodificação de JWTs no lado do cliente.

### Hospedagem de Imagens

*   **ImgBB:** Serviço externo para upload e hospedagem de imagens.

---

## ⚙️ Configuração e Execução

### Pré-requisitos

*   Node.js (versão 20.x ou superior)
*   npm (gerenciador de pacotes do Node.js)
*   PostgreSQL (servidor de banco de dados)
*   Uma conta no ImgBB para obter uma API Key.

### 1. Configuração do Banco de Dados

Crie um banco de dados PostgreSQL e execute os scripts SQL fornecidos na pasta `Banco*.sql` para configurar o esquema e popular com dados de exemplo.

### 2. Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto (na mesma pasta de `package.json` principal) com as seguintes variáveis:

```
DB_HOST=your_database_host
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_NAME=your_database_name
DB_PORT=5432 # Ou a porta do seu PostgreSQL
DB_SCHEMA=app_simulado # Ou o schema que você usou
VITE_API_PORT=3000 # Porta para a API do backend
JWT_SECRET=sua_chave_secreta_para_jwt # Uma string longa e aleatória
```

### 3. Instalação das Dependências

No diretório raiz do projeto:

```bash
npm install
```

No diretório `frontend`:

```bash
cd frontend
npm install
cd ..
```

### 4. Execução da Aplicação

Para iniciar o backend (API):

```bash
npm run dev
```

Para iniciar o frontend (aplicação Vue.js):

```bash
cd frontend
npm run dev
```

A aplicação frontend estará disponível em `http://localhost:5173` (ou outra porta, conforme configurado pelo Vite) e a API backend em `http://localhost:3000`.

---

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues para bugs ou sugestões de melhoria, ou enviar pull requests.

---

## 📄 Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

**Desenvolvido com ❤️ por [Seu Nome/Sua Organização]**
