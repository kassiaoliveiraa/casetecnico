CREATE SCHEMA IF NOT EXISTS public_informations;

CREATE TABLE public_informations.servidores (
    id_servidor_portal BIGINT,
    cpf VARCHAR(14),
    nome VARCHAR(255),
    matricula VARCHAR(255),
    descricao_cargo VARCHAR(255),
    classe_cargo VARCHAR(255),
    referencia_cargo VARCHAR(255),
    padrao_cargo VARCHAR(255),
    nivel_cargo VARCHAR(255),
    sigla_funcao VARCHAR(10),
    nivel_funcao VARCHAR(255),
    funcao VARCHAR(255),
    codigo_atividade VARCHAR(10),
    atividade VARCHAR(255),
    opcao_parcial BOOLEAN,
    cod_uorg_lotacao VARCHAR(10),
    uorg_lotacao VARCHAR(255),
    cod_orgao_lotacao VARCHAR(10),
    orgao_lotacao VARCHAR(255),
    cod_orgsup_lotacao VARCHAR(10),
    orgsup_lotacao VARCHAR(255),
    cod_uorg_exercicio VARCHAR(10),
    uorg_exercicio VARCHAR(255),
    cod_orgao_exercicio VARCHAR(10),
    orgao_exercicio VARCHAR(255),
    cod_orgsup_exercicio VARCHAR(10),
    orgsup_exercicio VARCHAR(255),
    cod_tipo_vinculo INT,
    tipo_vinculo VARCHAR(255),
    situacao_vinculo VARCHAR(255),
    data_inicio_afastamento DATE,
    data_termino_afastamento DATE,
    regime_juridico VARCHAR(100),
    jornada_de_trabalho INT,
    data_ingresso_cargofuncao DATE,
    data_nomeacao_cargofuncao DATE,
    data_ingresso_orgao DATE,
    documento_ingresso_servicopublico VARCHAR(255),
    data_diploma_ingresso_servpublico DATE,
    diploma_ingresso_cargofuncao VARCHAR(255),
    diploma_ingresso_orgao VARCHAR(255),
    diploma_ingresso_servpublico VARCHAR(255),
    uf_exercicio VARCHAR(2),
    fonte_dados VARCHAR(100),
    created_at DATE,
    PRIMARY KEY (id_servidor_portal, created_at)
) PARTITION BY RANGE (created_at)

CREATE TABLE public_informations.aposentados (
    id_servidor_portal BIGINT,
    cpf VARCHAR(14),
    nome VARCHAR(255),
    matricula VARCHAR(255),
    cod_tipo_aposentadoria INT,
    tipo_aposentadoria VARCHAR(255),
    data_aposentadoria DATE,
    descricao_cargo VARCHAR(255),
    cod_uorg_lotacao VARCHAR(10),
    uorg_lotacao VARCHAR(255),
    cod_orgao_lotacao VARCHAR(10),
    orgao_lotacao VARCHAR(255),
    cod_orgsup_lotacao VARCHAR(10),
    orgsup_lotacao VARCHAR(255),
    cod_tipo_vinculo INT,
    tipo_vinculo VARCHAR(255),
    situacao_vinculo VARCHAR(255),
    regime_juridico VARCHAR(100),
    jornada_de_trabalho INT,
    data_ingresso_cargofuncao DATE,
    data_nomeacao_cargofuncao DATE,
    data_ingresso_orgao DATE,
    documento_ingresso_servicopublico VARCHAR(255),
    data_diploma_ingresso_servpublico DATE,
    diploma_ingresso_cargofuncao VARCHAR(255),
    diploma_ingresso_orgao VARCHAR(255),
    diploma_ingresso_servpublico VARCHAR(255),
    fonte_dados VARCHAR(100),
    created_at DATE,
    PRIMARY KEY (id_servidor_portal, created_at)
) PARTITION BY RANGE (created_at);

CREATE TABLE public_informations.pensionistas (
    id_servidor_portal BIGINT,
    cpf VARCHAR(14),
    nome VARCHAR(255),
    matricula VARCHAR(50),
    cpf_representante_legal VARCHAR(14),
    nome_representante_legal VARCHAR(255),
    cpf_instituidor_pensao VARCHAR(14),
    nome_instituidor_pensao VARCHAR(255),
    cod_tipo_pensao INT,
    tipo_pensao VARCHAR(50),
    data_inicio_pensao DATE,
    descricao_cargo_instituidor_pensao VARCHAR(255),
    cod_uorg_lotacao_instituidor_pensao VARCHAR(10),
    uorg_lotacao_instituidor_pensao VARCHAR(255),
    cod_org_lotacao_instituidor_pensao VARCHAR(10),
    org_lotacao_instituidor_pensao VARCHAR(255),
    cod_orgsup_lotacao_instituidor_pensao VARCHAR(10),
    orgsup_lotacao_instituidor_pensao VARCHAR(255),
    cod_tipo_vinculo INT,
    tipo_vinculo VARCHAR(50),
    situacao_vinculo VARCHAR(100),
    regime_juridico_instituidor_pensao VARCHAR(100),
    jornada_de_trabalho_instituidor_pensao INT,
    data_ingresso_cargofuncao_instituidor_pensao DATE,
    data_nomeacao_cargofuncao_instituidor_pensao DATE,
    data_ingresso_orgao_instituidor_pensao DATE,
    documento_ingresso_servicopublico_instituidor_pensao VARCHAR(255),
    data_diploma_ingresso_servpublico_instituidor_pensao DATE,
    diploma_ingresso_cargofuncao_instituidor_pensao VARCHAR(255),
    diploma_ingresso_orgao_instituidor_pensao VARCHAR(255),
    diploma_ingresso_servpublico_instituidor_pensao VARCHAR(255),
    fonte_dados VARCHAR(100),
    created_at DATE,
    PRIMARY KEY (id_servidor_portal, created_at)
) PARTITION BY RANGE (created_at);

CREATE TABLE public_informations.afastamento (
    ano INT,
    mes INT,
    id_servidor_portal BIGINT,
    cpf VARCHAR(14),
    nome VARCHAR(255),
    data_inicio_afastamento DATE,
    data_fim_afastamento VARCHAR(50), -- Data de fim do afastamento. Caso ainda não registrado, texto fixo "Não informada".
    created_at DATE,
    PRIMARY KEY (id_servidor_portal, created_at)
) PARTITION BY RANGE (created_at);

CREATE TABLE public_informations.observacao (
    ano INT,
    mes INT,
    id_servidor_portal BIGINT,
    nome VARCHAR(255),
    cpf VARCHAR(14),
    observacao TEXT,
    created_at DATE,
    PRIMARY KEY (id_servidor_portal, created_at)
) PARTITION BY RANGE (created_at);

CREATE TABLE public_informations.Remuneracao (
    ano INT,
    mes INT,
    id_servidor_portal VARCHAR(255),
    cpf VARCHAR(14),
    nome VARCHAR(255),
    remuneracao_basica_bruta_real DECIMAL(15, 2),
    remuneracao_basica_bruta_usd DECIMAL(15, 2),
    abate_teto_real DECIMAL(15, 2),
    abate_teto_usd DECIMAL(15, 2),
    gratificacao_natalina_real DECIMAL(15, 2),
    gratificacao_natalina_usd DECIMAL(15, 2),
    abate_teto_gratificacao_natalina_real DECIMAL(15, 2),
    abate_teto_gratificacao_natalina_usd DECIMAL(15, 2),
    ferias_real DECIMAL(15, 2),
    ferias_usd DECIMAL(15, 2),
    outras_remuneracoes_eventuais_real DECIMAL(15, 2),
    outras_remuneracoes_eventuais_usd DECIMAL(15, 2),
    irrf_real DECIMAL(15, 2),
    irrf_usd DECIMAL(15, 2),
    pss_rpgs_real DECIMAL(15, 2),
    pss_rpgs_usd DECIMAL(15, 2),
    demais_deducoes_real DECIMAL(15, 2),
    demais_deducoes_usd DECIMAL(15, 2),
    pensao_militar_real DECIMAL(15, 2),
    pensao_militar_usd DECIMAL(15, 2),
    fundo_saude_real DECIMAL(15, 2),
    fundo_saude_usd DECIMAL(15, 2),
    taxa_ocupacao_imovel_funcional_real DECIMAL(15, 2),
    taxa_ocupacao_imovel_funcional_usd DECIMAL(15, 2),
    remuneracao_apos_deducoes_obrigatorias_real DECIMAL(15, 2),
    remuneracao_apos_deducoes_obrigatorias_usd DECIMAL(15, 2),
    verbas_indenizatorias_registradas_pessoal_civil_real DECIMAL(15, 2),
    verbas_indenizatorias_registradas_pessoal_civil_usd DECIMAL(15, 2),
    verbas_indenizatorias_registradas_pessoal_militar_real DECIMAL(15, 2),
    verbas_indenizatorias_registradas_pessoal_militar_usd DECIMAL(15, 2),
    verbas_indenizatorias_programa_desligamento_voluntario_mp792_2017_real DECIMAL(15, 2),
    verbas_indenizatorias_programa_desligamento_voluntario_mp792_2017_usd DECIMAL(15, 2),
    total_verbas_indenizatorias_real DECIMAL(15, 2),
    total_verbas_indenizatorias_usd DECIMAL(15, 2),
    created_at DATE,
    PRIMARY KEY (id_servidor_portal, created_at)
) PARTITION BY RANGE (created_at);

-- SQL para algumas contagens

SELECT
    (SELECT COUNT(*) FROM public_informations.servidores) AS total_servidores,
    (SELECT COUNT(*) FROM public_informations.aposentados) AS total_aposentados,
    (SELECT COUNT(*) FROM public_informations.pensionistas) AS total_pensionistas;

SELECT
    AVG(remuneracao_basica_bruta_real) AS media_remuneracao,
    MIN(remuneracao_basica_bruta_real) AS remuneracao_minima,
    MAX(remuneracao_basica_bruta_real) AS remuneracao_maxima,
FROM public_informations.Remuneracao;

SELECT
    descricao_cargo,
    COUNT(*) AS total_servidores
FROM public_informations.servidores
GROUP BY descricao_cargo
ORDER BY total_servidores DESC;

