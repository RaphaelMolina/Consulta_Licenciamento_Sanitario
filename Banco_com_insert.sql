-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Nov-2021 às 18:02
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
(1, '01', 'Industria de Alimentos'),
(2, '02', 'Industria de agua mineral'),
(3, '03', 'Industria de Aditivos para Alimentos'),
(4, '04', 'Industria de Embalagens de Alimentos'),
(5, '05', 'Industria de Produtos para Saude'),
(6, '06', 'Industria de cosmeticos ou produtos de higiene ou perfumes'),
(7, '07', 'Industria de saneantes domissanitarios'),
(8, '08', 'Industria de Medicamentos'),
(9, '09', 'Industria de Farmoquimicos'),
(10, '10', 'Comercio atacadista de diversas classes de produtos'),
(11, '11', 'Comercio atacadista de Alimentos'),
(12, '15', 'Comercio atacadista de Produtos para Saude'),
(13, '16', 'Comercio atacadista de cosméticos ou produtos de higiene e perfumes'),
(14, '17', 'Comercio atacadista de saneantes domissanitarios'),
(15, '18', 'Comercio atacadista de medicamentos'),
(16, '21', 'Comercio varejista de alimentos'),
(17, '26', 'Comercio varejista de cosmeticos'),
(18, '28', 'Comercio varejista de medicamentos'),
(19, '40', 'Deposito de produtos relacionados a saude'),
(20, '50', 'transporte de produtos relacionados a saude'),
(21, '60', 'controle de pragas urbanas e servicos de esterilizacao'),
(22, '70', 'Prestacao de servicos a saude'),
(23, '81', 'Prestacao de servicos coletivos e sociais'),
(24, '82', 'Prestacao de servicos veterinarios'),
(25, '83', 'Outras atividades relacionadas a saude'),
(26, '91', 'Produtos relacionados a saude');

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
(1, '2093-2/00', 'Fabricacao de aditivos de uso industrial', 3),
(2, '1731-1/00', 'Fabricacao de embalagens de papel', 4),
(3, '1099-6/99', 'Fabricacao de outros produtos alimenticios nao especificados anteriormente', 1),
(4, '1121-6/00', 'Fabricacao de Aguas envasadas', 2),
(5, '2219-6/00', 'Fabricacao de artefatos de borracha nao especificados anteriormente', 5),
(6, '1742-7/01', 'Fabricacao de fraldas descartaveis', 6),
(7, '2052-5/00', 'Fabricacao de desinfetantes domissanitarios', 7),
(8, '2014-2/00', 'Fabricacao de Gases Industriais', 8),
(9, '2110-6/00', 'Fabricacao de produtos farmoquimicos', 9),
(10, '4691-5/00', 'Comercio Atacadista Mercadorias em geral com predominancia em produtos alimenticios', 10),
(11, '4621-4/00', 'Comercio atacadista de cafe em graos', 11),
(12, '4645-1/01', 'Comércio Atacadista de Instrumentos de uso Cirurgico', 12),
(13, '4646-0/01', 'Comercio atacadista de Cosmeticos e Produtos de Perfumaria', 13),
(14, '4649-4/08', 'Comercio Atacadista de Produtos de Higiene e Limpeza e conservação domiciliar', 14),
(15, '4644-3/01', 'Comercio Atacadista de Medicamentos e Drogas de Uso Humano', 15),
(16, '4711-3/01', 'Comercio varejista de mercadorias em geral, com predominancia em produtos alimenticios hipermercados', 16),
(17, '4772-5/00', 'Comercio Varejista de Cosméticos, produtos de perfumaria e de higiene pessoal', 17),
(18, '4771-7/01', 'Comercio varejista de Produtos Farmaceuticos sem manipulacao de formulas', 18),
(19, '5211-7/01', 'Armazens Gerais', 16),
(20, '4930-2/01', 'Transporte rodoviario de cargas, exceto produtos perigosos e mudancas', 17),
(21, '8122-2/00', 'Controle de Pragas Urbanas', 18),
(22, '8610-1/01', 'Atividade de atendimento hospitalar exceto pronto socorro e unidades de atendimento de urgencias', 19),
(23, '3600-6/01', 'Captacao tratamento e distribuicao de agua', 20),
(24, '7500-1/00', 'Atividades Veterninarias', 21),
(25, '3250-7/03', 'Fabricacao de aparelhos e utensilios para correcao de defeitos fisicos e aparelhos ortopedicos em geral', 22),
(26, '8412-4/00', 'Regulacao das atividades de saude e educacao e servicos culturais e outros servicos sociais', 23);

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
(1, 1, 2, 23),
(2, 1, 3, 29),
(3, 1, 4, 31),
(4, 1, 5, 32),
(5, 1, 6, 33),
(6, 1, 9, 36),
(7, 1, 48, 38),
(8, 1, NULL, 39),
(9, 1, NULL, 40),
(10, 1, NULL, 43),
(11, 1, NULL, 45),
(12, 1, NULL, 46),
(13, 1, NULL, 52),
(14, 2, 2, 23),
(15, 2, 3, 29),
(16, 2, 4, 31),
(17, 2, 5, 32),
(18, 2, 6, 33),
(19, 2, 9, 36),
(20, 2, 48, 38),
(21, 2, NULL, 39),
(22, 2, NULL, 40),
(23, 2, NULL, 43),
(24, 2, NULL, 45),
(25, 2, NULL, 46),
(26, 2, NULL, 52),
(27, 3, 2, 23),
(28, 3, 3, 29),
(29, 3, 4, 31),
(30, 3, 5, 32),
(31, 3, 6, 33),
(32, 3, 9, 36),
(33, 3, 48, 38),
(34, 3, NULL, 39),
(35, 3, NULL, 40),
(36, 3, NULL, 43),
(37, 3, NULL, 45),
(38, 3, NULL, 46),
(39, 3, NULL, 52),
(40, 4, 2, 23),
(41, 4, 3, 29),
(42, 4, 4, 38),
(43, 4, 5, 39),
(44, 4, 6, 40),
(45, 4, 9, 43),
(46, 4, 48, 52),
(47, 4, NULL, 58),
(48, 5, 2, 23),
(49, 5, 3, 29),
(50, 5, 4, 31),
(51, 5, 5, 32),
(52, 5, 6, 33),
(53, 5, 9, 36),
(54, 5, NULL, 38),
(55, 5, NULL, 39),
(56, 5, NULL, 40),
(57, 5, NULL, 43),
(58, 5, NULL, 45),
(59, 5, NULL, 46),
(60, 5, NULL, 52),
(61, 6, 2, 23),
(62, 6, 3, 29),
(63, 6, 4, 31),
(64, 6, 5, 32),
(65, 6, 6, 33),
(66, 6, 9, 36),
(67, 6, NULL, 38),
(68, 6, NULL, 39),
(69, 6, NULL, 40),
(70, 6, NULL, 43),
(71, 6, NULL, 45),
(72, 6, NULL, 46),
(73, 6, NULL, 52),
(74, 7, 2, 23),
(75, 7, 3, 29),
(76, 7, 4, 31),
(77, 7, 5, 32),
(78, 7, 6, 33),
(79, 7, 9, 36),
(80, 7, NULL, 38),
(81, 7, NULL, 39),
(82, 7, NULL, 40),
(83, 7, NULL, 43),
(84, 7, NULL, 45),
(85, 7, NULL, 46),
(86, 7, NULL, 52),
(87, 8, 2, 23),
(88, 8, 3, 29),
(89, 8, 4, 31),
(90, 8, 5, 32),
(91, 8, 6, 33),
(92, 8, 9, 36),
(93, 8, NULL, 38),
(94, 8, NULL, 39),
(95, 8, NULL, 40),
(96, 8, NULL, 43),
(97, 8, NULL, 45),
(98, 8, NULL, 46),
(99, 8, NULL, 52),
(100, 9, 2, 23),
(101, 9, 3, 29),
(102, 9, 4, 31),
(103, 9, 5, 32),
(104, 9, 6, 33),
(105, 9, 9, 36),
(106, 9, NULL, 38),
(107, 9, NULL, 39),
(108, 9, NULL, 40),
(109, 9, NULL, 43),
(110, 9, NULL, 45),
(111, 9, NULL, 46),
(112, 9, NULL, 52),
(113, 10, 49, 23),
(114, 10, NULL, 29),
(115, 10, NULL, 38),
(116, 10, NULL, 39),
(117, 10, NULL, 40),
(118, 10, NULL, 43),
(119, 11, 49, 23),
(120, 11, NULL, 29),
(121, 11, NULL, 38),
(122, 11, NULL, 39),
(123, 11, NULL, 40),
(124, 11, NULL, 43),
(125, 11, NULL, 46),
(126, 12, 2, 23),
(127, 12, 3, 29),
(128, 12, 4, 31),
(129, 12, 5, 32),
(130, 12, 6, 33),
(131, 12, 9, 38),
(132, 12, 50, 39),
(133, 12, NULL, 40),
(134, 12, NULL, 43),
(135, 12, NULL, 45),
(136, 12, NULL, 52),
(137, 13, 2, 23),
(138, 13, 3, 29),
(139, 13, 4, 31),
(140, 13, 5, 32),
(141, 13, 6, 33),
(142, 13, 9, 38),
(143, 13, 50, 39),
(144, 13, NULL, 40),
(145, 13, NULL, 43),
(146, 13, NULL, 45),
(147, 13, NULL, 52),
(148, 14, 2, 23),
(149, 14, 3, 29),
(150, 14, 4, 31),
(151, 14, 5, 32),
(152, 14, 6, 33),
(153, 14, 9, 38),
(154, 14, 50, 39),
(155, 14, NULL, 40),
(156, 14, NULL, 43),
(157, 14, NULL, 45),
(158, 14, NULL, 52),
(159, 15, 2, 23),
(160, 15, 3, 29),
(161, 15, 4, 31),
(162, 15, 5, 32),
(163, 15, 6, 33),
(164, 15, 9, 38),
(165, 15, NULL, 39),
(166, 15, NULL, 40),
(167, 15, NULL, 43),
(168, 15, NULL, 45),
(169, 15, NULL, 52),
(170, 16, 49, 23),
(171, 16, NULL, 29),
(172, 16, NULL, 31),
(173, 16, NULL, 32),
(174, 16, NULL, 33),
(175, 16, NULL, 38),
(176, 16, NULL, 39),
(177, 16, NULL, 40),
(178, 16, NULL, 43),
(179, 17, 2, 23),
(180, 17, 3, 29),
(181, 17, 4, 38),
(182, 17, 5, 39),
(183, 17, 6, 40),
(184, 17, 9, 52),
(185, 17, NULL, 55),
(186, 18, 49, 23),
(187, 18, NULL, 29),
(188, 18, NULL, 31),
(189, 18, NULL, 32),
(190, 18, NULL, 33),
(191, 18, NULL, 38),
(192, 18, NULL, 39),
(193, 18, NULL, 40),
(194, 18, NULL, 43),
(195, 18, NULL, 45),
(196, 19, 2, 23),
(197, 19, 3, 29),
(198, 19, 4, 31),
(199, 19, 5, 32),
(200, 19, 6, 33),
(201, 19, 9, 36),
(202, 19, NULL, 38),
(203, 19, NULL, 39),
(204, 19, NULL, 40),
(205, 19, NULL, 43),
(206, 19, NULL, 45),
(207, 19, NULL, 46),
(208, 19, NULL, 52),
(209, 20, 2, 23),
(210, 20, 3, 29),
(211, 20, 4, 31),
(212, 20, 5, 32),
(213, 20, 6, 33),
(214, 20, 9, 36),
(215, 20, 51, 38),
(216, 20, NULL, 39),
(217, 20, NULL, 40),
(218, 20, NULL, 43),
(219, 20, NULL, 45),
(220, 20, NULL, 46),
(221, 20, NULL, 52),
(222, 21, 2, 23),
(223, 21, 3, 29),
(224, 21, 4, 31),
(225, 21, 5, 32),
(226, 21, 6, 33),
(227, 21, 9, 36),
(228, 21, NULL, 38),
(229, 21, NULL, 39),
(230, 21, NULL, 40),
(231, 21, NULL, 43),
(232, 21, NULL, 45),
(233, 21, NULL, 52),
(234, 22, 2, 23),
(235, 22, 3, 27),
(236, 22, 4, 29),
(237, 22, 5, 31),
(238, 22, 6, 32),
(239, 22, 9, 33),
(240, 22, NULL, 36),
(241, 22, NULL, 38),
(242, 22, NULL, 39),
(243, 22, NULL, 40),
(244, 22, NULL, 41),
(245, 22, NULL, 42),
(246, 22, NULL, 46),
(247, 22, NULL, 49),
(248, 22, NULL, 52),
(249, 23, 49, 23),
(250, 23, NULL, 29),
(251, 23, NULL, 31),
(252, 23, NULL, 32),
(253, 23, NULL, 33),
(254, 23, NULL, 38),
(255, 23, NULL, 39),
(256, 23, NULL, 40),
(257, 23, NULL, 53),
(258, 23, NULL, 54),
(259, 24, 2, 23),
(260, 24, 3, 25),
(261, 24, 4, 28),
(262, 24, 5, 29),
(263, 24, 6, 30),
(264, 24, 9, 31),
(265, 24, 52, 32),
(266, 24, NULL, 33),
(267, 24, NULL, 36),
(268, 24, NULL, 37),
(269, 24, NULL, 38),
(270, 24, NULL, 39),
(271, 24, NULL, 40),
(272, 24, NULL, 42),
(273, 24, NULL, 45),
(274, 24, NULL, 46),
(275, 24, NULL, 47),
(276, 24, NULL, 48),
(277, 24, NULL, 49),
(278, 24, NULL, 52),
(279, 25, 2, 21),
(280, 25, 3, 23),
(281, 25, 4, 27),
(282, 25, 5, 29),
(283, 25, 6, 33),
(284, 25, 9, 38),
(285, 25, NULL, 39),
(286, 25, NULL, 40),
(287, 25, NULL, 44),
(288, 26, 49, 23),
(289, 26, 49, 40),
(290, 26, 49, 51);

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
(1, 1, 3),
(2, 2, 3),
(3, 3, 3),
(4, 4, 3),
(5, 5, 3),
(6, 6, 3),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 2),
(11, 11, 2),
(12, 12, 3),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(16, 16, 2),
(17, 17, 3),
(18, 18, 3),
(19, 19, 3),
(20, 20, 3),
(21, 21, 3),
(22, 22, 3),
(23, 23, 3),
(24, 24, 3),
(25, 25, 3),
(26, 26, 3);

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
(1, '01', 'Copia da autorizacao de construcao emitida pelo CONEN'),
(2, '02', 'Comprovante de pagamento da DARE da taxa de laudo tecnico de avaliacao de projeto de edificacao'),
(3, '03', 'Comprovante de anotacao de responsabilidade tecnica ART'),
(4, '04', 'Memorial descritivo de fluxos e atividades'),
(5, '05', 'Memorial descritivo do projeto arquitetonico'),
(6, '06', 'Projeto arquitetonico da edificacao'),
(7, '07', 'Projeto do tratamento e destinacao final de efluentes'),
(8, '08', 'projeto de tratamento dos residuos'),
(9, '09', 'formulario do LTA'),
(10, '20', 'autorizacao para preparo e uso de fontes radioativas nao seladas'),
(11, '21', 'CPF'),
(12, '22', 'Destituicao de Responsabilidade legal'),
(13, '23', 'CNPJ'),
(14, '25', 'Autorizacao para Conen'),
(15, '26', 'Comprovante de endereco'),
(16, '27', 'comprovante de identidade do Responsavel Legal'),
(17, '28', 'comprovante da taxa de recolhimento da taxa de equipamentos de saude'),
(18, '29', 'comprovante de recolhimento da taxa de inspecao sanitaria'),
(19, '30', 'comprovante de recolhimento da taxa de rubrica de livros'),
(20, '31', 'Comprovante de recolhimento da taxa de termo de RT'),
(21, '32', 'Comprovante de Responsabilidade Tecnica'),
(22, '33', 'Comprovante de vínculo empregatício'),
(23, '34', 'Concessão de lavra para água mineral emitido pelo DNPM'),
(24, '35', 'Contrato de aluguel'),
(25, '36', 'Contrato de atividade terceirizada'),
(26, '37', 'Contrato de Dosimetria'),
(27, '38', 'Contrato Social registrado em cartório'),
(28, '39', 'Contrato social registrado na Jucesp'),
(29, '40', 'Formulario de solicitacao de atos de vigilancia sanitaria'),
(30, '41', 'Formulario de atividade relacionada a prestacao de servicos de interessa a saude'),
(31, '42', 'formulario de equipamento de interesse a saude'),
(32, '43', 'Formulario de atividade relacionada aos produtos de interesse a saude'),
(33, '44', 'Parecer da ABOTEC que enquadra o responsável tecnico como protetista ortesista'),
(34, '45', 'habilitacao profissional emitida pelo conselho de classe competente'),
(35, '46', 'Licenca sanitaria das atividades contratadas'),
(36, '47', 'Plano de Radioprotecao'),
(37, '48', 'Programa de Garantia da Qualidade'),
(38, '49', 'Registro de especializacao correspondente a atividade exercida'),
(39, '51', 'Formulario para credenciamento de unidades publicas dispensadoras'),
(40, '52', 'LTA'),
(41, '53', 'Licenca da CETESB'),
(42, '54', 'Outorga DAEE'),
(43, '55', 'Contrato firmado entre a empresa e fabricante e empresa fracionadora'),
(44, '56', 'Laudo laboratorial de turbidez, potabilidade para substancias quimicas, radioatividade e organoletico de potabilidade da agua para consumo humano'),
(45, '57', 'Destituição de Responsabilidade Tecnica'),
(46, '58', 'Certificado de Capacitacao em BPF'),
(47, '99', 'Definidos em legislacao municipal'),
(48, 'S/C.0', 'Para função depósito dispensado documentação prévia'),
(49, 'S/C.1', 'Dispensado'),
(50, 'S/C.2', 'Para função atacadista que contrada local de armazenamento dispensado documentação prévia'),
(51, 'S/C.3', 'Para função serviços de transporte sem área de armazenamento dispensado documentação prévia'),
(52, 'S/C.4', 'Para função equipamento móvel e dispensario de medicação humana dispensado documentação prévia');

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
(1, 'I', 'Baixo'),
(2, 'II', 'Medio'),
(3, 'III', 'Alto');

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
  MODIFY `agrupamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `cnae`
--
ALTER TABLE `cnae`
  MODIFY `cnae_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `cnae_e_documentacao`
--
ALTER TABLE `cnae_e_documentacao`
  MODIFY `cnae_e_documentacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT de tabela `cnae_e_grau_de_risco`
--
ALTER TABLE `cnae_e_grau_de_risco`
  MODIFY `cnae_e_grau_de_risco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `documentacao`
--
ALTER TABLE `documentacao`
  MODIFY `documentacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  ADD CONSTRAINT `fk_cnae_e_documentacao_cnae1` FOREIGN KEY (`fk_cnae_id`) REFERENCES `cnae` (`cnae_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ADD CONSTRAINT `fk_cnae_e_documentacao_documentacao1` FOREIGN KEY (`previa_fk_documentacao_id`) REFERENCES `documentacao` (`documentacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
-- ADD CONSTRAINT `fk_cnae_e_documentacao_documentacao2` FOREIGN KEY (`inicial_fk_documentacao_id`) REFERENCES `documentacao` (`documentacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
