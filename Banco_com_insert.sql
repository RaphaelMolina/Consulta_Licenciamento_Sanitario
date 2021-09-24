-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Set-2021 às 05:18
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
CREATE DATABASE IF NOT EXISTS `banco_cnae` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `banco_cnae`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agrupamento`
--

CREATE TABLE `agrupamento` (
  `agrupamento_id` int(11) NOT NULL,
  `agrupamento_codigo` varchar(20) NOT NULL,
  `agrupamento_descricao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `agrupamento`
--

INSERT INTO `agrupamento` (`agrupamento_id`, `agrupamento_codigo`, `agrupamento_descricao`) VALUES
(1, '04', 'Indústria de Embalagem de Alimentos'),
(2, '05', 'Indústria de Produtos para Saúde'),
(3, '06', 'Indústria de Cosméticos, Produtos de Higiene e Perfumes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cnae`
--

CREATE TABLE `cnae` (
  `cnae_id` int(11) NOT NULL,
  `cnae_codigo` varchar(20) NOT NULL,
  `cnae_descricao` varchar(200) NOT NULL,
  `fk_agrupamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cnae`
--

INSERT INTO `cnae` (`cnae_id`, `cnae_codigo`, `cnae_descricao`, `fk_agrupamento_id`) VALUES
(1, '0892-4/03', 'Refino e Outros Tratamentos do Sal', 1),
(2, '1031-7/00', 'Fabricação de Conservas de Frutas', 2),
(3, '1032-5/01', 'Fabricação de Conservas de Palmito', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cnae_e_documentacao`
--

CREATE TABLE `cnae_e_documentacao` (
  `cnae_e_documentacao_id` int(11) NOT NULL,
  `fk_cnae_id` int(11) NOT NULL,
  `previa_fk_documentacao_id` int(11) DEFAULT NULL,
  `inicial_fk_documentacao_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cnae_e_documentacao`
--

INSERT INTO `cnae_e_documentacao` (`cnae_e_documentacao_id`, `fk_cnae_id`, `previa_fk_documentacao_id`, `inicial_fk_documentacao_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 2, NULL),
(3, 3, NULL, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cnae_e_grau_de_risco`
--

CREATE TABLE `cnae_e_grau_de_risco` (
  `cnae_e_grau_de_risco_id` int(11) NOT NULL,
  `fk_cnae_id` int(11) NOT NULL,
  `fk_grau_de_risco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cnae_e_grau_de_risco`
--

INSERT INTO `cnae_e_grau_de_risco` (`cnae_e_grau_de_risco_id`, `fk_cnae_id`, `fk_grau_de_risco_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentacao`
--

CREATE TABLE `documentacao` (
  `documentacao_id` int(11) NOT NULL,
  `documentacao_codigo` varchar(20) NOT NULL,
  `documentacao_descricao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `documentacao`
--

INSERT INTO `documentacao` (`documentacao_id`, `documentacao_codigo`, `documentacao_descricao`) VALUES
(1, '04', 'Memorial Descritivo de Fluxos e de Atividades-cópia'),
(2, '05', 'Memorial Descritivo do Projeto arquitetônico da Edificação-cópia'),
(3, '21', 'Cadastro de Pessoa Física (cpf) -cópia, Com Apresentação do Original');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grau_de_risco`
--

CREATE TABLE `grau_de_risco` (
  `grau_de_risco_id` int(11) NOT NULL,
  `grau_de_risco_codigo` varchar(20) NOT NULL,
  `grau_de_risco_descricao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `grau_de_risco`
--

INSERT INTO `grau_de_risco` (`grau_de_risco_id`, `grau_de_risco_codigo`, `grau_de_risco_descricao`) VALUES
(1, '01', 'Dispensado do Licenciamento'),
(2, '03', 'Alto: Licença obrigatória - Inspeção prévia obrigatória'),
(3, '02', 'Médio: Licença obrigatória - Dispensado inspeção prévia');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agrupamento`
--
ALTER TABLE `agrupamento`
  ADD PRIMARY KEY (`agrupamento_id`),
  ADD UNIQUE KEY `agrupamento_id_UNIQUE` (`agrupamento_id`),
  ADD UNIQUE KEY `agrupamento_codigo_UNIQUE` (`agrupamento_codigo`);

--
-- Índices para tabela `cnae`
--
ALTER TABLE `cnae`
  ADD PRIMARY KEY (`cnae_id`),
  ADD UNIQUE KEY `cnae_id_UNIQUE` (`cnae_id`),
  ADD UNIQUE KEY `cnae_codigo_UNIQUE` (`cnae_codigo`),
  ADD KEY `fk_cnae_agrupamento_idx` (`fk_agrupamento_id`);

--
-- Índices para tabela `cnae_e_documentacao`
--
ALTER TABLE `cnae_e_documentacao`
  ADD PRIMARY KEY (`cnae_e_documentacao_id`),
  ADD UNIQUE KEY `cnae_e_documentacao_id_UNIQUE` (`cnae_e_documentacao_id`),
  ADD KEY `fk_cnae_e_documentacao_cnae1_idx` (`fk_cnae_id`),
  ADD KEY `fk_cnae_e_documentacao_documentacao1_idx` (`previa_fk_documentacao_id`),
  ADD KEY `fk_cnae_e_documentacao_documentacao2_idx` (`inicial_fk_documentacao_id`);

--
-- Índices para tabela `cnae_e_grau_de_risco`
--
ALTER TABLE `cnae_e_grau_de_risco`
  ADD PRIMARY KEY (`cnae_e_grau_de_risco_id`),
  ADD UNIQUE KEY `cnae_e_grau_de_risco_id_UNIQUE` (`cnae_e_grau_de_risco_id`),
  ADD KEY `fk_cnae_e_grau_de_risco_cnae1_idx` (`fk_cnae_id`),
  ADD KEY `fk_cnae_e_grau_de_risco_grau_de_risco1_idx` (`fk_grau_de_risco_id`);

--
-- Índices para tabela `documentacao`
--
ALTER TABLE `documentacao`
  ADD PRIMARY KEY (`documentacao_id`),
  ADD UNIQUE KEY `documentacao_id_UNIQUE` (`documentacao_id`),
  ADD UNIQUE KEY `documentacao_codigo_UNIQUE` (`documentacao_codigo`);

--
-- Índices para tabela `grau_de_risco`
--
ALTER TABLE `grau_de_risco`
  ADD PRIMARY KEY (`grau_de_risco_id`),
  ADD UNIQUE KEY `grau_de_risco_codigo_UNIQUE` (`grau_de_risco_codigo`),
  ADD UNIQUE KEY `grau_de_risco_id_UNIQUE` (`grau_de_risco_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agrupamento`
--
ALTER TABLE `agrupamento`
  MODIFY `agrupamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cnae`
--
ALTER TABLE `cnae`
  MODIFY `cnae_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cnae_e_documentacao`
--
ALTER TABLE `cnae_e_documentacao`
  MODIFY `cnae_e_documentacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cnae_e_grau_de_risco`
--
ALTER TABLE `cnae_e_grau_de_risco`
  MODIFY `cnae_e_grau_de_risco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `documentacao`
--
ALTER TABLE `documentacao`
  MODIFY `documentacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `grau_de_risco`
--
ALTER TABLE `grau_de_risco`
  MODIFY `grau_de_risco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cnae`
--
ALTER TABLE `cnae`
  ADD CONSTRAINT `fk_cnae_agrupamento` FOREIGN KEY (`fk_agrupamento_id`) REFERENCES `agrupamento` (`agrupamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cnae_e_documentacao`
--
ALTER TABLE `cnae_e_documentacao`
  ADD CONSTRAINT `fk_cnae_e_documentacao_cnae1` FOREIGN KEY (`fk_cnae_id`) REFERENCES `cnae` (`cnae_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cnae_e_documentacao_documentacao1` FOREIGN KEY (`previa_fk_documentacao_id`) REFERENCES `documentacao` (`documentacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cnae_e_documentacao_documentacao2` FOREIGN KEY (`inicial_fk_documentacao_id`) REFERENCES `documentacao` (`documentacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cnae_e_grau_de_risco`
--
ALTER TABLE `cnae_e_grau_de_risco`
  ADD CONSTRAINT `fk_cnae_e_grau_de_risco_cnae1` FOREIGN KEY (`fk_cnae_id`) REFERENCES `cnae` (`cnae_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cnae_e_grau_de_risco_grau_de_risco1` FOREIGN KEY (`fk_grau_de_risco_id`) REFERENCES `grau_de_risco` (`grau_de_risco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
