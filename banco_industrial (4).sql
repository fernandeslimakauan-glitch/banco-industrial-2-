-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 11/11/2026 às 14:24
-- Versão do servidor: 8.0.44-0ubuntu0.24.04.1
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_industrial`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `COMPONENTES_MAQ`
--

CREATE TABLE `COMPONENTES_MAQ` (
  `id_componente` int NOT NULL,
  `id_maquina` int NOT NULL,
  `nome_componente` varchar(100) NOT NULL,
  `horas_uso_acumulado` int NOT NULL,
  `limite_horas_alerta` int NOT NULL
) ;

--
-- Despejando dados para a tabela `COMPONENTES_MAQ`
--

INSERT INTO `COMPONENTES_MAQ` (`id_componente`, `id_maquina`, `nome_componente`, `horas_uso_acumulado`, `limite_horas_alerta`) VALUES
(1, 1, 'Rolamento do Eixo', 200, 1000),
(2, 2, 'Correia de Transmissao', 450, 500),
(3, 3, 'Placa Eletronica Principal', 800, 2000),
(4, 4, 'Sensor de Presenca Optico', 100, 800),
(5, 5, 'Filtro de Ar Industrial', 1300, 1200),
(6, 6, 'Rosca Plastificadora', 1500, 2000),
(7, 7, 'Servo Motor do Eixo J1', 2800, 3000),
(8, 8, 'Filtro de Combustível Principal', 550, 600),
(9, 9, 'Disjuntor de Caixa Moldada', 100, 4000),
(10, 10, 'Selo Mecânico de Vedação', 950, 900);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ESTOQUE_PECAS`
--

CREATE TABLE `ESTOQUE_PECAS` (
  `id_peca` int NOT NULL,
  `codigo_part_number` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `qtd_estoque` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `ESTOQUE_PECAS`
--

INSERT INTO `ESTOQUE_PECAS` (`id_peca`, `codigo_part_number`, `descricao`, `qtd_estoque`, `preco_unitario`) VALUES
(1, 'PART-991', 'Parafuso Sextavado de Aco', 100, 2.50),
(2, 'PART-992', 'O-Ring de Vedacao', 50, 5.80),
(3, 'PART-993', 'Fusivel de Protecao 10A', 200, 1.20),
(4, 'PART-994', 'Filtro de Oleo Hidraulico', 10, 85.00),
(5, 'PART-995', 'Graxa de Alta Temperatura', 15, 45.90),
(6, 'PART-701', 'Resistência de Aquecimento Banda', 25, 120.50),
(7, 'PART-702', 'Cabo De Controle Blindado 4x1.5', 80, 18.90),
(8, 'PART-703', 'Contator Tripo 24VDC', 40, 145.00),
(9, 'PART-704', 'Válvula Solenóide Direcional', 12, 320.00),
(10, 'PART-705', 'Rolamento de Agulhas', 35, 75.20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `HISTORICO_SENSORES`
--

CREATE TABLE `HISTORICO_SENSORES` (
  `id_leitura` int NOT NULL,
  `id_ordem` int NOT NULL,
  `temperatura_medida` decimal(5,2) NOT NULL,
  `vibracao_mm_s` decimal(5,2) NOT NULL,
  `data_hora_leitura` datetime NOT NULL,
  `prompt_geracao_ia` varchar(100) DEFAULT 'GERADO_POR_LLM'
) ;

--
-- Despejando dados para a tabela `HISTORICO_SENSORES`
--

INSERT INTO `HISTORICO_SENSORES` (`id_leitura`, `id_ordem`, `temperatura_medida`, `vibracao_mm_s`, `data_hora_leitura`, `prompt_geracao_ia`) VALUES
(1, 1, 45.50, 1.20, '2026-11-01 10:00:00', 'Primeira leitura do dia'),
(2, 2, 60.20, 3.50, '2026-11-03 14:30:00', 'Temperatura um pouco alta'),
(3, 3, 38.00, 0.80, '2026-11-05 09:15:00', 'Funcionamento normal'),
(4, 4, 42.10, 1.10, '2026-11-06 11:00:00', 'Dados dentro do esperado'),
(5, 5, 75.00, 5.90, '2026-11-07 16:45:00', 'Teste interrompido'),
(6, 6, 210.00, 0.50, '2026-11-08 08:30:00', 'Monitoramento da zona de aquecimento'),
(7, 7, 55.40, 8.20, '2026-11-09 13:15:00', 'Vibração excessiva detectada no braço'),
(8, 8, 88.10, 2.10, '2026-11-10 09:00:00', 'Análise preditiva de rotina');

-- --------------------------------------------------------

--
-- Estrutura para tabela `linhas_producao`
--

CREATE TABLE `linhas_producao` (
  `id_linha` int NOT NULL,
  `id_unidade` int NOT NULL,
  `nome_linhas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `linhas_producao`
--

INSERT INTO `linhas_producao` (`id_linha`, `id_unidade`, `nome_linhas`) VALUES
(1, 1, 'Linha de Montagem 01'),
(2, 1, 'Linha de Embalagem 02'),
(3, 2, 'Linha de Soldagem'),
(4, 3, 'Linha de Pintura'),
(5, 4, 'Linha de Injeção Plástica'),
(6, 6, 'Linha de Envase Automático'),
(7, 7, 'Linha de Usinagem Pesada'),
(8, 8, 'Linha de Fundição de Alumínio'),
(9, 9, 'Linha de Montagem de Painéis'),
(10, 10, 'Linha de Processamento Químico');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinas_senai`
--

CREATE TABLE `maquinas_senai` (
  `id_maquina` int NOT NULL,
  `id_linha` int NOT NULL,
  `id_tipo` int NOT NULL,
  `tag_patrimonio` varchar(30) NOT NULL,
  `data_aquisicao` date NOT NULL,
  `status_operacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `maquinas_senai`
--

INSERT INTO `maquinas_senai` (`id_maquina`, `id_linha`, `id_tipo`, `tag_patrimonio`, `data_aquisicao`, `status_operacao`) VALUES
(1, 1, 1, 'PAT-2024-001', '2024-01-10', 'ATIVA'),
(2, 2, 2, 'PAT-2024-002', '2024-03-15', 'MANUTENCAO'),
(3, 3, 3, 'PAT-2024-003', '2023-06-20', 'ATIVA'),
(4, 4, 4, 'PAT-2025-001', '2025-01-12', 'ATIVA'),
(5, 5, 5, 'PAT-2025-002', '2025-02-18', 'DESATIVADA'),
(6, 6, 6, 'PAT-2026-003', '2026-01-20', 'ATIVA'),
(7, 7, 7, 'PAT-2026-004', '2026-02-10', 'MANUTENCAO'),
(8, 8, 8, 'PAT-2026-005', '2026-04-05', 'ATIVA'),
(9, 9, 9, 'PAT-2026-006', '2026-06-14', 'ATIVA'),
(10, 10, 10, 'PAT-2026-007', '2026-08-01', 'DESATIVADA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ORDENS_SERVICO`
--

CREATE TABLE `ORDENS_SERVICO` (
  `id_ordem` int NOT NULL,
  `id_maquina` int NOT NULL,
  `id_tecnico` int NOT NULL,
  `data_abertura` date NOT NULL,
  `tipo_manutencao` varchar(20) NOT NULL,
  `status_os` varchar(20) NOT NULL
) ;

--
-- Despejando dados para a tabela `ORDENS_SERVICO`
--

INSERT INTO `ORDENS_SERVICO` (`id_ordem`, `id_maquina`, `id_tecnico`, `data_abertura`, `tipo_manutencao`, `status_os`) VALUES
(1, 1, 1, '2026-11-01', 'PREVENTIVA', 'CONCLUIDA'),
(2, 2, 2, '2026-11-03', 'CORRETIVA', 'EM_ANDAMENTO'),
(3, 3, 3, '2026-11-05', 'PREDITIVA', 'ABERTA'),
(4, 4, 4, '2026-11-06', 'PREVENTIVA', 'ABERTA'),
(5, 5, 5, '2026-11-07', 'CORRETIVA', 'CANCELADA'),
(6, 6, 6, '2026-11-08', 'PREVENTIVA', 'ABERTA'),
(7, 7, 7, '2026-11-09', 'CORRETIVA', 'EM_ANDAMENTO'),
(8, 8, 8, '2026-11-10', 'PREDITIVA', 'ABERTA'),
(9, 9, 9, '2026-11-10', 'PREVENTIVA', 'CONCLUIDA'),
(10, 10, 10, '2026-11-10', 'CORRETIVA', 'ABERTA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `PECAS_OS`
--

CREATE TABLE `PECAS_OS` (
  `id_ordem` int NOT NULL,
  `id_peca` int NOT NULL,
  `qtd_utilizada` int NOT NULL,
  `preco_aplicado` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `PECAS_OS`
--

INSERT INTO `PECAS_OS` (`id_ordem`, `id_peca`, `qtd_utilizada`, `preco_aplicado`) VALUES
(1, 1, 10, 2.50),
(1, 2, 2, 5.80),
(2, 4, 1, 85.00),
(3, 3, 5, 1.20),
(4, 5, 2, 45.90),
(6, 6, 2, 120.50),
(7, 7, 5, 18.90),
(8, 9, 1, 320.00),
(9, 8, 2, 145.00),
(10, 10, 4, 75.20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TECNICOS`
--

CREATE TABLE `TECNICOS` (
  `id_tecnico` int NOT NULL,
  `nome_tecnico` varchar(100) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  `nivel_certificacao` varchar(30) NOT NULL
) ;

--
-- Despejando dados para a tabela `TECNICOS`
--

INSERT INTO `TECNICOS` (`id_tecnico`, `nome_tecnico`, `especialidade`, `nivel_certificacao`) VALUES
(1, 'Lucas Silva', 'Mecanica', 'JUNIOR'),
(2, 'Mariana Santos', 'Eletrica', 'PLENO'),
(3, 'Roberto Oliveira', 'Automacao', 'SENIOR'),
(4, 'Carlos Souza', 'Mecanica', 'SPECIALIST'),
(5, 'Ana Costa', 'Automacao', 'PLENO'),
(6, 'Bruno Lima', 'Elétrica', 'JUNIOR'),
(7, 'Camila Rocha', 'Automação', 'SPECIALIST'),
(8, 'Diego Almeida', 'Mecânica', 'SENIOR'),
(9, 'Fernanda Mendes', 'Instrumentação', 'PLENO'),
(10, 'Gabriel Ribeiro', 'Mecatrônica', 'SPECIALIST');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_maquins`
--

CREATE TABLE `tipos_maquins` (
  `id_tipo` int NOT NULL,
  `nome_tipo` varchar(100) NOT NULL,
  `horas_revisao_padrao` int DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tipos_maquins`
--

INSERT INTO `tipos_maquins` (`id_tipo`, `nome_tipo`, `horas_revisao_padrao`) VALUES
(1, 'Prensa Hidraulica', 1000),
(2, 'Esteira Transportadora', 500),
(3, 'Torno CNC', 1500),
(4, 'Motor Eletrico Industrial', 800),
(5, 'Compressor de Ar', 1200),
(6, 'Injetora de Plástico', 2000),
(7, 'Robô Articulado de Solda', 3000),
(8, 'Gerador a Diesel', 600),
(9, 'Bomba Centrífuga', 900),
(10, 'Painel Elétrico de Distribuição', 4000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades_senai`
--

CREATE TABLE `unidades_senai` (
  `id_unidade` int NOT NULL,
  `nome_unidade` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `unidades_senai`
--

INSERT INTO `unidades_senai` (`id_unidade`, `nome_unidade`, `cidade`) VALUES
(1, 'SENAI Umuarama', 'Umuarama'),
(2, 'SENAI CIC', 'Curitiba'),
(3, 'SENAI Ipiranga', 'Sao Paulo'),
(4, 'SENAI Fatec', 'Porto Alegre'),
(5, 'SENAI Cimatec', 'Salvador'),
(6, 'SENAI Umuarama', 'Umuarama'),
(7, 'SENAI CIC', 'Curitiba'),
(8, 'SENAI Ipiranga', 'São Paulo'),
(9, 'SENAI Fatec', 'Porto Alegre'),
(10, 'SENAI Cimatec', 'Salvador'),
(11, 'SENAI Londrina', 'Londrina'),
(12, 'SENAI Maringá', 'Maringá'),
(13, 'SENAI Joinville', 'Joinville'),
(14, 'SENAI Belo Horizonte', 'Belo Horizonte'),
(15, 'SENAI Benfica', 'Rio de Janeiro');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `COMPONENTES_MAQ`
--
ALTER TABLE `COMPONENTES_MAQ`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `FK_componentes_maq_maquina` (`id_maquina`);

--
-- Índices de tabela `ESTOQUE_PECAS`
--
ALTER TABLE `ESTOQUE_PECAS`
  ADD PRIMARY KEY (`id_peca`),
  ADD UNIQUE KEY `UK_codigo_part_number` (`codigo_part_number`);

--
-- Índices de tabela `HISTORICO_SENSORES`
--
ALTER TABLE `HISTORICO_SENSORES`
  ADD PRIMARY KEY (`id_leitura`),
  ADD KEY `FK_historico_sensores_ordem` (`id_ordem`);

--
-- Índices de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `FK_linhas_producao_unidade` (`id_unidade`);

--
-- Índices de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `tag_patrimonio` (`tag_patrimonio`),
  ADD KEY `id_linha` (`id_linha`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Índices de tabela `ORDENS_SERVICO`
--
ALTER TABLE `ORDENS_SERVICO`
  ADD PRIMARY KEY (`id_ordem`),
  ADD KEY `FK_ordens_servico_maquina` (`id_maquina`),
  ADD KEY `FK_ordens_servico_tecnico` (`id_tecnico`);

--
-- Índices de tabela `PECAS_OS`
--
ALTER TABLE `PECAS_OS`
  ADD PRIMARY KEY (`id_ordem`,`id_peca`),
  ADD KEY `FK_pecas_os_peca` (`id_peca`);

--
-- Índices de tabela `TECNICOS`
--
ALTER TABLE `TECNICOS`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Índices de tabela `tipos_maquins`
--
ALTER TABLE `tipos_maquins`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `COMPONENTES_MAQ`
--
ALTER TABLE `COMPONENTES_MAQ`
  MODIFY `id_componente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ESTOQUE_PECAS`
--
ALTER TABLE `ESTOQUE_PECAS`
  MODIFY `id_peca` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `HISTORICO_SENSORES`
--
ALTER TABLE `HISTORICO_SENSORES`
  MODIFY `id_leitura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  MODIFY `id_linha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  MODIFY `id_maquina` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `ORDENS_SERVICO`
--
ALTER TABLE `ORDENS_SERVICO`
  MODIFY `id_ordem` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TECNICOS`
--
ALTER TABLE `TECNICOS`
  MODIFY `id_tecnico` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_maquins`
--
ALTER TABLE `tipos_maquins`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  MODIFY `id_unidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `COMPONENTES_MAQ`
--
ALTER TABLE `COMPONENTES_MAQ`
  ADD CONSTRAINT `FK_componentes_maq_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`);

--
-- Restrições para tabelas `HISTORICO_SENSORES`
--
ALTER TABLE `HISTORICO_SENSORES`
  ADD CONSTRAINT `FK_historico_sensores_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ORDENS_SERVICO` (`id_ordem`);

--
-- Restrições para tabelas `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD CONSTRAINT `FK_linhas_producao_unidade` FOREIGN KEY (`id_unidade`) REFERENCES `unidades_senai` (`id_unidade`);

--
-- Restrições para tabelas `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD CONSTRAINT `maquinas_senai_ibfk_1` FOREIGN KEY (`id_linha`) REFERENCES `linhas_producao` (`id_linha`),
  ADD CONSTRAINT `maquinas_senai_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_maquins` (`id_tipo`);

--
-- Restrições para tabelas `ORDENS_SERVICO`
--
ALTER TABLE `ORDENS_SERVICO`
  ADD CONSTRAINT `FK_ordens_servico_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`),
  ADD CONSTRAINT `FK_ordens_servico_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `TECNICOS` (`id_tecnico`);

--
-- Restrições para tabelas `PECAS_OS`
--
ALTER TABLE `PECAS_OS`
  ADD CONSTRAINT `FK_pecas_os_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ORDENS_SERVICO` (`id_ordem`),
  ADD CONSTRAINT `FK_pecas_os_peca` FOREIGN KEY (`id_peca`) REFERENCES `ESTOQUE_PECAS` (`id_peca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
