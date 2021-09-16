-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Set-2021 às 04:18
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_cnae`
--
CREATE DATABASE IF NOT EXISTS `banco_cnae` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `banco_cnae`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabela_cnae`
--

CREATE TABLE `tabela_cnae` (
  `id_cnae` int(11) NOT NULL,
  `cnae_codigo` varchar(11) NOT NULL,
  `cnae_nome` varchar(100) NOT NULL,
  `cnae_descricao` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tabela_cnae`
--

INSERT INTO `tabela_cnae` (`id_cnae`, `cnae_codigo`, `cnae_nome`, `cnae_descricao`) VALUES
(1, '85.31-7', 'Educação superior - graduação', 'Esta classe compreende:\r\n- as instituições de educação superior que oferecem exclusivamente cursos de graduação abertos a candidatos que tenham concluído o ensino médio ou equivalente e tenham sido classificados em processo seletivo, podendo ou não oferecer cursos de extensão universitária\r\n\r\n\r\nEsta classe não compreende:\r\n- as atividades de pesquisa e desenvolvimento (divisão 72)\r\n\r\n- as instituições de educação superior que oferecem cursos de graduação e pós-graduação?(85.32-5)'),
(2, '85.32-5', 'Educação superior - graduação e pós-graduação', 'Esta classe compreende:\r\n- as instituições de educação superior que oferecem cursos de graduação e programas de mestrado, doutorado e pós-doutorado, podendo ainda oferecer cursos de especialização, aperfeiçoamento, dentre outros, abertos a candidatos diplomados em cursos de graduação e que atendam às exigências das instituições de educação superior\r\n\r\n\r\nEsta classe não compreende:\r\n- as atividades de pesquisa e desenvolvimento (divisão 72)\r\n\r\n- as atividades de pesquisa e desenvolvimento (divisão 72)\r\n\r\n- as instituições de educação superior que oferecem exclusivamente cursos de graduação (85.31-7)\r\n\r\n- as instituições de educação superior que oferecem exclusivamente cursos de pós-graduação e/ou cursos de extensão (85.33-3)'),
(3, '85.33-3', 'Educação superior - pós-graduação e extensão', 'Esta classe compreende:\r\n- as instituições de educação superior que oferecem exclusivamente cursos de pós-graduação e/ou cursos de extensão abertos a candidatos que atendam aos requisitos estabelecidos em cada caso pelas instituições de ensino\r\n\r\n\r\nEsta classe compreende também:\r\n- as instituições de educação superior que oferecem cursos seqüenciais, cursos por campo de saber (áreas de conhecimento) de diferentes níveis de abrangência, abertos a candidatos que atendam aos requisitos estabelecidos pelas instituições de ensino\r\n\r\n\r\nEsta classe não compreende:\r\n- as instituições de educação superior que oferecem exclusivamente cursos de graduação (85.31-7)\r\n\r\n- as instituições de educação superior que oferecem cursos de graduação e pós-graduação (85.32-5)');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tabela_cnae`
--
ALTER TABLE `tabela_cnae`
  ADD PRIMARY KEY (`id_cnae`),
  ADD UNIQUE KEY `cnae_codigo_UNIQUE` (`cnae_codigo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tabela_cnae`
--
ALTER TABLE `tabela_cnae`
  MODIFY `id_cnae` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
