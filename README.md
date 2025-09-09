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

## 💡 Inspiração e Motivação

Este projeto nasceu de uma necessidade real no ambiente de trabalho. Durante a preparação para a prova **UiPath Certified Automation Developer Professional**, foi-nos fornecido um material de estudo em formato PDF. Percebendo que já teríamos acesso ao gabarito, surgiu a ideia de ir além: por que não transformar esse material estático em uma ferramenta interativa de aprendizado?

Minha motivação inicial era criar uma plataforma web para me testar e, ao mesmo tempo, auxiliar meus colegas. Comecei a cadastrar as questões do PDF na aplicação, e rapidamente a ideia evoluiu. A funcionalidade de cadastro de questões foi adaptada para atender a uma demanda ainda mais valiosa: a capacidade de **visualizar o desempenho em tópicos específicos do edital da prova**. Isso nos permitiria identificar onde estávamos indo melhor e onde precisávamos de mais atenção, possibilitando a geração de simulados filtrados por tema para focar nos pontos fracos e otimizar nossos estudos.

Assim, o Simulado Online se tornou uma ferramenta prática e personalizada, impulsionada pela busca por um aprendizado mais eficiente e direcionado.

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

### Containerização e Orquestração

*   **Docker:** Containerização da aplicação para desenvolvimento e produção.
*   **Docker Compose:** Orquestração de múltiplos serviços (API e banco de dados).
*   **PostgreSQL Alpine:** Imagem leve do PostgreSQL para o container do banco de dados.
*   **Node.js Alpine:** Imagem leve do Node.js para o container da API.

---

## ⚙️ Configuração e Execução

A aplicação pode ser executada de **duas maneiras**: manualmente (instalando as dependências localmente) ou utilizando **Docker e Docker Compose** (recomendado para desenvolvimento).

### 🐳 Opção 1: Execução com Docker (Recomendado)

#### Pré-requisitos
*   **Docker** e **Docker Compose** instalados no sistema
*   Uma conta no ImgBB para obter uma API Key

#### 1. Configuração das Variáveis de Ambiente

Copie o arquivo `example.env` para `.env` e configure as variáveis:

```bash
cp example.env .env
```

Edite o arquivo `.env` com suas configurações:

```
# Database Configuration (para Docker)
DB_HOST=db
DB_USER=simulado_user
DB_PASSWORD=simulado_password
DB_NAME=simulado_db
DB_PORT=5432
DB_SCHEMA=app_simulado

# API Configuration
VITE_API_PORT=3000

# External Services
VITE_IMGBB_API_KEY=sua_api_key_do_imgbb

# Security
JWT_SECRET=sua_chave_secreta_muito_longa_e_aleatoria
```

#### 2. Execução com Docker Compose

```bash
# Inicia todos os serviços (API + Banco de dados)
docker-compose up -d

# Visualiza os logs em tempo real
docker-compose logs -f

# Para parar os serviços
docker-compose down

# Para parar e remover volumes (limpa o banco de dados)
docker-compose down -v
```

A API estará disponível em `http://localhost:3000` e o banco de dados será inicializado automaticamente com o schema em `BancoSemDados.sql`.

> **💡 Dica:** As configurações do banco de dados são carregadas automaticamente através do arquivo `.env` e do `docker-compose.yml`. O arquivo `BancoSemDados.sql` é executado automaticamente na primeira inicialização do container PostgreSQL através do volume mapeado para `/docker-entrypoint-initdb.d/init.sql`, criando todas as tabelas e dados iniciais necessários.

> **Nota:** O frontend precisa ser executado separadamente. No diretório `frontend`, execute `npm install` e depois `npm run dev`.

### 💻 Opção 2: Execução Manual

#### Pré-requisitos
*   Node.js (versão 20.x ou superior)
*   npm (gerenciador de pacotes do Node.js)
*   PostgreSQL (servidor de banco de dados)
*   Uma conta no ImgBB para obter uma API Key

#### 1. Configuração do Banco de Dados

Crie um banco de dados PostgreSQL e execute os scripts SQL fornecidos no arquivo `BancoSemDados.sql` para configurar o esquema e popular com dados de exemplo.

#### 2. Variáveis de Ambiente

Copie o arquivo `example.env` para `.env` na raiz do projeto:

```bash
cp example.env .env
```

Configure as variáveis no arquivo `.env`:

```
DB_HOST=localhost  # ou seu host PostgreSQL
DB_USER=seu_usuario_postgresql
DB_PASSWORD=sua_senha_postgresql
DB_NAME=seu_banco_de_dados
DB_PORT=5432
DB_SCHEMA=app_simulado
VITE_IMGBB_API_KEY=sua_api_key_do_imgbb
VITE_API_PORT=3000
JWT_SECRET=sua_chave_secreta_muito_longa_e_aleatoria
```

#### 3. Instalação das Dependências

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

#### 4. Execução da Aplicação

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



**Desenvolvido com ❤️ por Thiago Monteiro**
