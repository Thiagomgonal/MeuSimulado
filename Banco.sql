-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.41 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para simulado_db
CREATE DATABASE IF NOT EXISTS `simulado_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `simulado_db`;

-- Copiando estrutura para tabela simulado_db.opcoes
CREATE TABLE IF NOT EXISTS `opcoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questao_id` int NOT NULL,
  `texto_opcao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correta` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `questao_id` (`questao_id`),
  CONSTRAINT `opcoes_ibfk_1` FOREIGN KEY (`questao_id`) REFERENCES `questoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela simulado_db.opcoes: ~24 rows (aproximadamente)
INSERT INTO `opcoes` (`id`, `questao_id`, `texto_opcao`, `correta`) VALUES
	(49, 13, 'essa é errada', 0),
	(50, 13, 'essa é errada', 0),
	(51, 13, 'essa é errada', 0),
	(52, 13, 'essa é certa', 1),
	(53, 14, 'certa', 1),
	(54, 14, 'err', 0),
	(55, 14, 'err', 0),
	(56, 14, 'err', 0),
	(57, 15, 'cer', 1),
	(58, 15, 'err', 0),
	(59, 15, 'err', 0),
	(60, 15, 'err', 0),
	(61, 16, 'cer', 1),
	(62, 16, 'err', 0),
	(63, 16, 'err', 0),
	(64, 16, 'err', 0);

-- Copiando estrutura para tabela simulado_db.pontuacoes_por_tipo
CREATE TABLE IF NOT EXISTS `pontuacoes_por_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `simulado_id` int NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corretas` int NOT NULL,
  `total` int NOT NULL,
  `porcentagem` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `simulado_id` (`simulado_id`),
  CONSTRAINT `pontuacoes_por_tipo_ibfk_1` FOREIGN KEY (`simulado_id`) REFERENCES `simulados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela simulado_db.pontuacoes_por_tipo: ~3 rows (aproximadamente)
INSERT INTO `pontuacoes_por_tipo` (`id`, `simulado_id`, `tipo`, `corretas`, `total`, `porcentagem`) VALUES
	(1, 20, 'Debug', 1, 1, 100.00),
	(2, 20, 'UiPath Studio', 1, 1, 100.00),
	(3, 20, 'Orchestrator', 1, 1, 100.00);

-- Copiando estrutura para tabela simulado_db.questoes
CREATE TABLE IF NOT EXISTS `questoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autor_id` int NOT NULL,
  `enunciado` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autor_id` (`autor_id`),
  CONSTRAINT `questoes_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela simulado_db.questoes: ~4 rows (aproximadamente)
INSERT INTO `questoes` (`id`, `autor_id`, `enunciado`, `data_criacao`, `tipo`, `imagem_url`) VALUES
	(13, 5, 'Teste de pergunta', '2025-08-11 19:05:27', 'teste', ''),
	(14, 5, 'Teste', '2025-08-11 21:20:03', 'Debug', NULL),
	(15, 5, 'Tet', '2025-08-11 21:20:13', 'UiPath Studio', NULL),
	(16, 5, 'TEst', '2025-08-11 21:20:29', 'Orchestrator', NULL);

-- Copiando estrutura para tabela simulado_db.respostas_usuario
CREATE TABLE IF NOT EXISTS `respostas_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `simulado_id` int NOT NULL,
  `questao_id` int NOT NULL,
  `opcao_escolhida_id` int NOT NULL,
  `data_resposta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `simulado_id` (`simulado_id`),
  KEY `questao_id` (`questao_id`),
  KEY `opcao_escolhida_id` (`opcao_escolhida_id`),
  CONSTRAINT `respostas_usuario_ibfk_1` FOREIGN KEY (`simulado_id`) REFERENCES `simulados` (`id`) ON DELETE CASCADE,
  CONSTRAINT `respostas_usuario_ibfk_2` FOREIGN KEY (`questao_id`) REFERENCES `questoes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `respostas_usuario_ibfk_3` FOREIGN KEY (`opcao_escolhida_id`) REFERENCES `opcoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela simulado_db.respostas_usuario: ~3 rows (aproximadamente)
INSERT INTO `respostas_usuario` (`id`, `simulado_id`, `questao_id`, `opcao_escolhida_id`, `data_resposta`) VALUES
	(37, 20, 14, 53, '2025-08-11 23:26:41'),
	(38, 20, 15, 57, '2025-08-11 23:26:41'),
	(39, 20, 16, 61, '2025-08-11 23:26:41');

-- Copiando estrutura para tabela simulado_db.simulados
CREATE TABLE IF NOT EXISTS `simulados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aluno_id` int NOT NULL,
  `data_inicio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fim` timestamp NULL DEFAULT NULL,
  `pontuacao` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_id` (`aluno_id`),
  CONSTRAINT `simulados_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela simulado_db.simulados: ~1 rows (aproximadamente)
INSERT INTO `simulados` (`id`, `aluno_id`, `data_inicio`, `data_fim`, `pontuacao`) VALUES
	(20, 5, '2025-08-11 23:26:41', '2025-08-11 23:26:41', 3.00);

-- Copiando estrutura para tabela simulado_db.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_acesso` enum('aluno','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aluno',
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela simulado_db.usuarios: ~3 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo_acesso`, `data_criacao`) VALUES
	(4, 'Fulano de Tal', 'fulano@teste.com', '$2b$10$ULuno8OBgPFltDe/N2x6M.rdtlggx2ZveEILdROiEhRaXIEJhMNKm', 'admin', '2025-08-07 16:46:02'),
	(5, 'thiago', 'thiago@test.com', '$2a$10$ELuEGPXRtrkqie6Cbm.HG.FD586R4YwTS58duqwpWPViv00AygZXG', 'admin', '2025-08-08 04:07:42'),
	(6, 'aluno', 'aluno@tst.com', '$2a$10$QPhEAZO4sYKZgdxlRt.iQuPFnHdVGUG0dgyjK0EZkGvKdQg6ZKmJi', 'aluno', '2025-08-08 05:50:08');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
