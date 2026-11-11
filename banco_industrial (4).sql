-- unidades_senai
INSERT INTO unidades_senai (nome_unidade, cidade) VALUES 
('SENAI Umuarama', 'Umuarama'),
('SENAI CIC', 'Curitiba'),
('SENAI Ipiranga', 'São Paulo'),
('SENAI Fatec', 'Porto Alegre'),
('SENAI Cimatec', 'Salvador'),
('SENAI Londrina', 'Londrina'),
('SENAI Maringá', 'Maringá'),
('SENAI Joinville', 'Joinville'),
('SENAI Belo Horizonte', 'Belo Horizonte'),
('SENAI Benfica', 'Rio de Janeiro');

-- linhas_producao
INSERT INTO linhas_producao (id_unidade, nome_linha) VALUES 
(1, 'Linha de Montagem 01'),
(1, 'Linha de Embalagem 02'),
(2, 'Linha de Soldagem'),
(3, 'Linha de Pintura'),
(4, 'Linha de Injeção Plástica'),
(6, 'Linha de Envase Automático'),
(7, 'Linha de Usinagem Pesada'),
(8, 'Linha de Fundição de Alumínio'),
(9, 'Linha de Montagem de Painéis'),
(10, 'Linha de Processamento Químico');

-- tipos_maquinas
INSERT INTO tipos_maquinas (nome_tipo, horas_revisao_padrao) VALUES 
('Prensa Hidráulica', 1000),
('Esteira Transportadora', 500),
('Torno CNC', 1500),
('Motor Elétrico Industrial', 800),
('Compressor de Ar', 1200),
('Injetora de Plástico', 2000),
('Robô Articulado de Solda', 3000),
('Gerador a Diesel', 600),
('Bomba Centrífuga', 900),
('Painel Elétrico de Distribuição', 4000);

-- maquinas_senai
INSERT INTO maquinas_senai (id_linha, id_tipo, tag_patrimonio, data_aquisicao, status_operacao) VALUES 
(1, 1, 'PAT-2024-001', '2024-01-10', 'ATIVA'),
(2, 2, 'PAT-2024-002', '2024-03-15', 'MANUTENCAO'),
(3, 3, 'PAT-2023-001', '2023-06-20', 'ATIVA'),
(4, 4, 'PAT-2025-001', '2025-01-12', 'ATIVA'),
(5, 5, 'PAT-2025-002', '2025-02-18', 'DESATIVADA'),
(6, 6, 'PAT-2026-001', '2026-01-20', 'ATIVA'),
(7, 7, 'PAT-2026-002', '2026-02-10', 'MANUTENCAO'),
(8, 8, 'PAT-2026-003', '2026-04-05', 'ATIVA'),
(9, 9, 'PAT-2026-004', '2026-06-14', 'ATIVA'),
(10, 10, 'PAT-2026-005', '2026-08-01', 'DESATIVADA');

-- COMPONENTES_MAQ
INSERT INTO COMPONENTES_MAQ (id_maquina, nome_componente, horas_uso_acumulado, limite_horas_alerta) VALUES 
(1, 'Rolamento do Eixo', 200, 1000), 
(2, 'Correia de Transmissão', 450, 500), 
(3, 'Placa Eletrônica Principal', 800, 2000), 
(4, 'Sensor de Presença Óptico', 100, 800), 
(5, 'Filtro de Ar Industrial', 1300, 1200), 
(6, 'Rosca Plastificadora', 1500, 2000), 
(7, 'Servo Motor do Eixo J1', 2800, 3000), 
(8, 'Filtro de Combustível Principal', 550, 600), 
(9, 'Disjuntor de Caixa Moldada', 100, 4000), 
(10, 'Selo Mecânico de Vedação', 950, 900);

-- TECNICOS
INSERT INTO TECNICOS (nome_tecnico, especialidade, nivel_certificacao) VALUES 
('Lucas Silva', 'Mecânica', 'JUNIOR'),
('Mariana Santos', 'Elétrica', 'PLENO'),
('Roberto Oliveira', 'Automação', 'SENIOR'),
('Carlos Souza', 'Mecânica', 'SPECIALIST'),
('Ana Costa', 'Automação', 'PLENO'),
('Bruno Lima', 'Elétrica', 'JUNIOR'),
('Camila Rocha', 'Automação', 'SPECIALIST'),
('Diego Almeida', 'Mecânica', 'SENIOR'),
('Fernanda Mendes', 'Instrumentação', 'PLENO'),
('Gabriel Ribeiro', 'Mecatrônica', 'SPECIALIST');


-- ORDENS_SERVICO
INSERT INTO ORDENS_SERVICO (id_maquina, id_tecnico, data_abertura, tipo_manutencao, status_os) VALUES 
(1, 1, '2026-11-01', 'PREVENTIVA', 'CONCLUIDA'),
(2, 2, '2026-11-03', 'CORRETIVA', 'EM_ANDAMENTO'),
(3, 3, '2026-11-05', 'PREDITIVA', 'ABERTA'),
(4, 4, '2026-11-06', 'PREVENTIVA', 'ABERTA'),
(5, 5, '2026-11-07', 'CORRETIVA', 'CANCELADA'),
(6, 6, '2026-11-08', 'PREVENTIVA', 'ABERTA'),
(7, 7, '2026-11-09', 'CORRETIVA', 'EM_ANDAMENTO'),
(8, 8, '2026-11-10', 'PREDITIVA', 'ABERTA'),
(9, 9, '2026-11-10', 'PREVENTIVA', 'CONCLUIDA'),
(10, 10, '2026-11-10', 'CORRETIVA', 'ABERTA');


-- ESTOQUE_PECAS
INSERT INTO ESTOQUE_PECAS (codigo_part_number, descricao, qtd_estoque, preco_unitario) VALUES 
('PART-991', 'Parafuso Sextavado de Aço', 100, 2.50),
('PART-992', 'O-Ring de Vedação', 50, 5.80),
('PART-993', 'Fusível de Proteção 10A', 200, 1.20),
('PART-994', 'Filtro de Óleo Hidráulico', 10, 85.00),
('PART-995', 'Graxa de Alta Temperatura', 15, 45.90),
('PART-701', 'Resistência de Aquecimento Banda', 25, 120.50),
('PART-702', 'Cabo de Controle Blindado 4x1.5', 80, 18.90),
('PART-703', 'Contator Tripolar 24VDC', 40, 145.00),
('PART-704', 'Válvula Solenoide Direcional', 12, 320.00),
('PART-705', 'Rolamento de Agulhas', 35, 75.20);


-- PECAS_OS
INSERT INTO PECAS_OS (id_ordem, id_peca, qtd_utilizada, preco_aplicado) VALUES 
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

-- HISTORICO_SENSORES
INSERT INTO HISTORICO_SENSORES (id_ordem, temperatura_medida, vibracao_mm_s, data_hora_leitura, prompt_geracao_ia) VALUES 
(1, 45.50, 1.20, '2026-11-01 10:00:00', 'Primeira leitura do dia'),
(2, 60.20, 3.50, '2026-11-03 14:30:00', 'Temperatura um pouco alta'),
(3, 38.00, 0.80, '2026-11-05 09:15:00', 'Funcionamento normal'),
(4, 42.10, 1.10, '2026-11-06 11:00:00', 'Dados dentro do esperado'),
(5, 75.00, 5.90, '2026-11-07 16:45:00', 'Teste interrompido'),
(6, 210.00, 0.50, '2026-11-08 08:30:00', 'Monitoramento da zona de aquecimento'),
(7, 55.40, 8.20, '2026-11-09 13:15:00', 'Vibração excessiva detectada no braço'),
(8, 88.10, 2.10, '2026-11-10 09:00:00', 'Análise preditiva de rotina');
