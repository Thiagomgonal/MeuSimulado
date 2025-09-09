-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           PostgreSQL 17.6 on x86_64-windows, compiled by msvc-19.44.35213, 64-bit
-- OS do Servidor:               
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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

-- Copiando estrutura para tabela app_simulado.questoes
CREATE TABLE IF NOT EXISTS "questoes" (
	"id" INTEGER NOT NULL,
	"autor_id" INTEGER NOT NULL,
	"enunciado" TEXT NOT NULL,
	"data_criacao" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	"tipo" VARCHAR(50) NOT NULL,
	"imagem_url" VARCHAR(250) NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "questoes_ibfk_1" FOREIGN KEY ("autor_id") REFERENCES "usuarios" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.respostas_usuario
CREATE TABLE IF NOT EXISTS "respostas_usuario" (
	"id" INTEGER NOT NULL,
	"simulado_id" INTEGER NOT NULL,
	"questao_id" INTEGER NOT NULL,
	"opcao_escolhida_id" INTEGER NOT NULL,
	"data_resposta" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	CONSTRAINT "respostas_usuario_ibfk_1" FOREIGN KEY ("simulado_id") REFERENCES "simulados" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "respostas_usuario_ibfk_2" FOREIGN KEY ("questao_id") REFERENCES "questoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "respostas_usuario_ibfk_3" FOREIGN KEY ("opcao_escolhida_id") REFERENCES "opcoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.simulados
CREATE TABLE IF NOT EXISTS "simulados" (
	"id" INTEGER NOT NULL,
	"aluno_id" INTEGER NOT NULL,
	"data_inicio" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	"data_fim" TIMESTAMP NULL DEFAULT NULL,
	"pontuacao" NUMERIC(5,2) NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "simulados_ibfk_1" FOREIGN KEY ("aluno_id") REFERENCES "usuarios" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela app_simulado.usuarios
CREATE TABLE IF NOT EXISTS "usuarios" (
	"id" INTEGER NOT NULL,
	"nome" VARCHAR(100) NOT NULL,
	"email" VARCHAR(100) NOT NULL,
	"senha" VARCHAR(255) NOT NULL,
	"tipo_acesso" UNKNOWN NOT NULL DEFAULT 'aluno',
	"data_criacao" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	UNIQUE INDEX "usuarios_email_key" ("email")
);

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
