CREATE TABLE unidades_senai (
    id_unidade INT AUTO_INCREMENT,
    nome_unidade VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    CONSTRAINT PK_unidades_senai PRIMARY KEY (id_unidade)
);

CREATE TABLE tipos_maquins (
    id_tipo INT AUTO_INCREMENT,
    nome_tipo VARCHAR(50) NOT NULL,
    horas_revisao_padrao INT NOT NULL,
    CONSTRAINT PK_tipos_maquina PRIMARY KEY (id_tipo),
    CONSTRAINT CK_horas_revisao_padrao CHECK (horas_revisao_padrao > 0)
);

CREATE TABLE TECNICOS (
    id_tecnico INT AUTO_INCREMENT,
    nome_tecnico VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    nivel_certificacao VARCHAR(30) NOT NULL,
    CONSTRAINT PK_tecnicos PRIMARY KEY (id_tecnico),
    CONSTRAINT CK_nivel_certificacao CHECK (nivel_certificacao IN ('JUNIOR', 'PLENO', 'SENIOR', 'SPECIALIST'))
);

CREATE TABLE ESTOQUE_PECAS (
    id_peca INT AUTO_INCREMENT,
    codigo_part_number VARCHAR(50) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    qtd_estoque INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_estoque_pecas PRIMARY KEY (id_peca),
    CONSTRAINT UK_codigo_part_number UNIQUE (codigo_part_number),
    CONSTRAINT CK_qtd_estoque CHECK (qtd_estoque >= 0),
    CONSTRAINT CK_preco_unitario CHECK (preco_unitario > 0.00)
);

CREATE TABLE linhas_producao (
    id_linha INT AUTO_INCREMENT,
    id_unidade INT NOT NULL,
    nome_linha VARCHAR(100) NOT NULL,
    CONSTRAINT PK_linhas_producao PRIMARY KEY (id_linha),
    CONSTRAINT FK_linhas_producao_unidade FOREIGN KEY (id_unidade) REFERENCES unidades_senai(id_unidade)
);

CREATE TABLE maquinas_senai (
    id_maquina INT AUTO_INCREMENT,
    id_linha INT NOT NULL,
    id_tipo INT NOT NULL,
    tag_patrimonio VARCHAR(30) NOT NULL,
    data_aquisicao DATE NOT NULL,
    status_operacao VARCHAR(20) NOT NULL,
    CONSTRAINT PK_maquinas_senai PRIMARY KEY (id_maquina),
    CONSTRAINT UK_tag_patrimonio UNIQUE (tag_patrimonio),
    CONSTRAINT FK_maquinas_senai_linha FOREIGN KEY (id_linha) REFERENCES linhas_producao(id_linha),
    CONSTRAINT FK_maquinas_senai_tipo FOREIGN KEY (id_tipo) REFERENCES tipos_maquins(id_tipo),
    CONSTRAINT CK_status_operacao CHECK (status_operacao IN ('ATIVA', 'MANUTENCAO', 'DESATIVADA'))
);

CREATE TABLE COMPONENTES_MAQ (
    id_componente INT AUTO_INCREMENT,
    id_maquina INT NOT NULL,
    nome_componente VARCHAR(100) NOT NULL,
    horas_uso_acumulado INT NOT NULL,
    limite_horas_alerta INT NOT NULL,
    CONSTRAINT PK_componentes_maq PRIMARY KEY (id_componente),
    CONSTRAINT FK_componentes_maq_maquina FOREIGN KEY (id_maquina) REFERENCES maquinas_senai(id_maquina),
    CONSTRAINT CK_horas_uso_acumulado CHECK (horas_uso_acumulado >= 0)
);

CREATE TABLE ORDENS_SERVICO (
    id_ordem INT AUTO_INCREMENT,
    id_maquina INT NOT NULL,
    id_tecnico INT NOT NULL,
    data_abertura DATE NOT NULL,
    tipo_manutencao VARCHAR(20) NOT NULL,
    status_os VARCHAR(20) NOT NULL,
    CONSTRAINT PK_ordens_servico PRIMARY KEY (id_ordem),
    CONSTRAINT FK_ordens_servico_maquina FOREIGN KEY (id_maquina) REFERENCES maquinas_senai(id_maquina),
    CONSTRAINT FK_ordens_servico_tecnico FOREIGN KEY (id_tecnico) REFERENCES TECNICOS(id_tecnico),
    CONSTRAINT CK_tipo_manutencao CHECK (tipo_manutencao IN ('PREVENTIVA', 'CORRETIVA', 'PREDITIVA')),
    CONSTRAINT CK_status_os CHECK (status_os IN ('ABERTA', 'EM_ANDAMENTO', 'CONCLUIDA', 'CANCELADA'))
);

CREATE TABLE PECAS_OS (
    id_ordem INT NOT NULL,
    id_peca INT NOT NULL,
    qtd_utilizada INT NOT NULL,
    preco_aplicado DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_pecas_os PRIMARY KEY (id_ordem, id_peca),
    CONSTRAINT FK_pecas_os_ordem FOREIGN KEY (id_ordem) REFERENCES ORDENS_SERVICO(id_ordem),
    CONSTRAINT FK_pecas_os_peca FOREIGN KEY (id_peca) REFERENCES ESTOQUE_PECAS(id_peca),
    CONSTRAINT CK_qtd_utilizada CHECK (qtd_utilizada > 0)
);

CREATE TABLE HISTORICO_SENSORES (
    id_leitura INT AUTO_INCREMENT,
    id_ordem INT NOT NULL,
    temperatura_medida DECIMAL(5,2) NOT NULL,
    vibracao_mm_s DECIMAL(5,2) NOT NULL,
    data_hora_leitura DATETIME NOT NULL,
    prompt_geracao_ia VARCHAR(100) DEFAULT 'GERADO_POR_LLM',
    CONSTRAINT PK_historico_sensores PRIMARY KEY (id_leitura),
    CONSTRAINT FK_historico_sensores_ordem FOREIGN KEY (id_ordem) REFERENCES ORDENS_SERVICO(id_ordem),
    CONSTRAINT CK_temperatura_medida CHECK (temperatura_medida BETWEEN -50.00 AND 300.00)
);
