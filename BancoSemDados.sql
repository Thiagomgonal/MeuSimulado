-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           PostgreSQL 16.10 on x86_64-pc-linux-musl, compiled by gcc (Alpine 14.2.0) 14.2.0, 64-bit
-- OS do Servidor:               
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS app_simulado;
SET search_path TO app_simulado;

-- Copiando estrutura para tabela app_simulado.usuarios
CREATE TABLE IF NOT EXISTS "usuarios" (
	"id" INTEGER NOT NULL,
	"nome" VARCHAR(100) NOT NULL,
	"email" VARCHAR(100) NOT NULL UNIQUE,
	"senha" VARCHAR(255) NOT NULL,
	"tipo_acesso" VARCHAR(20) NOT NULL DEFAULT 'aluno',
	"data_criacao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id")
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.questoes
CREATE TABLE IF NOT EXISTS "questoes" (
	"id" INTEGER NOT NULL,
	"autor_id" INTEGER NOT NULL,
	"enunciado" TEXT NOT NULL,
	"data_criacao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	"tipo" VARCHAR(50) NOT NULL,
	"imagem_url" VARCHAR(250) DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "questoes_ibfk_1" FOREIGN KEY ("autor_id") REFERENCES "usuarios" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.opcoes
CREATE TABLE IF NOT EXISTS "opcoes" (
	"id" INTEGER NOT NULL,
	"questao_id" INTEGER NOT NULL,
	"texto_opcao" TEXT NOT NULL,
	"correta" BOOLEAN NOT NULL DEFAULT false,
	PRIMARY KEY ("id"),
	CONSTRAINT "opcoes_ibfk_1" FOREIGN KEY ("questao_id") REFERENCES "questoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.simulados
CREATE TABLE IF NOT EXISTS "simulados" (
	"id" INTEGER NOT NULL,
	"aluno_id" INTEGER NOT NULL,
	"data_inicio" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	"data_fim" TIMESTAMP DEFAULT NULL,
	"pontuacao" NUMERIC(5,2) DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "simulados_ibfk_1" FOREIGN KEY ("aluno_id") REFERENCES "usuarios" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.pontuacoes_por_tipo
CREATE TABLE IF NOT EXISTS "pontuacoes_por_tipo" (
	"id" INTEGER NOT NULL,
	"simulado_id" INTEGER NOT NULL,
	"tipo" VARCHAR(255) NOT NULL,
	"corretas" INTEGER NOT NULL,
	"total" INTEGER NOT NULL,
	"porcentagem" NUMERIC(5,2) NOT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "pontuacoes_por_tipo_ibfk_1" FOREIGN KEY ("simulado_id") REFERENCES "simulados" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.respostas_usuario
CREATE TABLE IF NOT EXISTS "respostas_usuario" (
	"id" INTEGER NOT NULL,
	"simulado_id" INTEGER NOT NULL,
	"questao_id" INTEGER NOT NULL,
	"opcao_escolhida_id" INTEGER NOT NULL,
	"data_resposta" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	CONSTRAINT "respostas_usuario_ibfk_1" FOREIGN KEY ("simulado_id") REFERENCES "simulados" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "respostas_usuario_ibfk_2" FOREIGN KEY ("questao_id") REFERENCES "questoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "respostas_usuario_ibfk_3" FOREIGN KEY ("opcao_escolhida_id") REFERENCES "opcoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Inserir usuário admin padrão (senha: admin123)
-- Descomente as linhas abaixo se desejar criar um usuário administrador automaticamente
-- INSERT INTO "usuarios" ("id", "nome", "email", "senha", "tipo_acesso") 
-- VALUES (1, 'Admin', 'admin@meusimulado.com', '$2a$10$N9qo8uLOickgx2ZMRZoMye.REE1IYhYi.d7lKgTI7oO8kYVbXmBZ6', 'admin')
-- ON CONFLICT ("email") DO NOTHING;