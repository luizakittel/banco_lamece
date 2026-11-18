PRAGMA foreign_keys = ON;

CREATE TABLE cidade_ilha (
    id_cidade_ilha TEXT PRIMARY KEY NOT NULL,
    tipo TEXT NOT NULL CHECK (tipo IN ('cidade', 'ilha')),
    estado TEXT,
    pais TEXT NOT NULL,
    descricao TEXT
);

CREATE TABLE local (
    id_local TEXT PRIMARY KEY NOT NULL,
    id_cidade_ilha TEXT NOT NULL REFERENCES cidade_ilha(id_cidade_ilha) ON UPDATE CASCADE ON DELETE RESTRICT,
    latitude REAL NOT NULL CHECK (latitude BETWEEN -90 AND 90),
    longitude REAL NOT NULL CHECK (longitude BETWEEN -180 AND 180),
    descricao TEXT
);

CREATE TABLE expedicao (
    id_expedicao INTEGER PRIMARY KEY,
    id_cidade_ilha TEXT NOT NULL REFERENCES cidade_ilha(id_cidade_ilha) ON UPDATE CASCADE ON DELETE RESTRICT,
    nome TEXT NOT NULL,
    data_inicio TEXT NOT NULL,
    data_fim TEXT,
    descricao TEXT,
    CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);

CREATE TABLE integrante (
    id_integrante TEXT PRIMARY KEY NOT NULL,
    email TEXT,
    instituicao TEXT
);

CREATE TABLE expedicao_integrante (
    id_expedicao INTEGER NOT NULL REFERENCES expedicao(id_expedicao) ON DELETE CASCADE,
    id_integrante TEXT NOT NULL REFERENCES integrante(id_integrante) ON UPDATE CASCADE ON DELETE RESTRICT,
    chefe INTEGER NOT NULL CHECK (chefe IN (0, 1)),
    PRIMARY KEY (id_expedicao, id_integrante)
);

CREATE TABLE familia (
    id_familia TEXT PRIMARY KEY NOT NULL
);

CREATE TABLE genero (
    id_genero TEXT PRIMARY KEY NOT NULL,
    id_familia TEXT NOT NULL REFERENCES familia(id_familia) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE especie (
    id_especie TEXT PRIMARY KEY NOT NULL,
    id_genero TEXT NOT NULL REFERENCES genero(id_genero) ON UPDATE CASCADE ON DELETE RESTRICT,
    autoridade_taxonomica TEXT,
    UNIQUE (id_especie, id_genero)
);

CREATE TABLE usuario (
    id_usuario INTEGER PRIMARY KEY,
    id_integrante TEXT UNIQUE REFERENCES integrante(id_integrante) ON UPDATE CASCADE ON DELETE SET NULL,
    login TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    senha_hash TEXT NOT NULL,
    ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1)),
    criado_em TEXT NOT NULL
);

CREATE TABLE permissao (
    id_permissao TEXT PRIMARY KEY NOT NULL,
    codigo TEXT NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE usuario_permissao (
    id_usuario INTEGER NOT NULL REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    id_permissao TEXT NOT NULL REFERENCES permissao(id_permissao) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_usuario, id_permissao)
);

CREATE TABLE lote_midia (
    id_lote INTEGER PRIMARY KEY AUTOINCREMENT
);

CREATE TABLE registro_campo (
    id_registro INTEGER PRIMARY KEY AUTOINCREMENT,
    id_expedicao INTEGER REFERENCES expedicao(id_expedicao) ON DELETE RESTRICT,
    id_local TEXT NOT NULL REFERENCES local(id_local) ON UPDATE CASCADE ON DELETE RESTRICT,
    id_integrante_autor TEXT NOT NULL REFERENCES integrante(id_integrante) ON UPDATE CASCADE ON DELETE RESTRICT,
    id_genero TEXT NOT NULL REFERENCES genero(id_genero) ON UPDATE CASCADE ON DELETE RESTRICT,
    id_especie TEXT,
    data_avistamento TEXT NOT NULL,
    hora_avistamento TEXT,
    tipo_amostragem TEXT CHECK (tipo_amostragem IN ('autonomo', 'livre', 'poca_mare')),
    visibilidade_m INTEGER CHECK (visibilidade_m BETWEEN 0 AND 99),
    profundidade_m REAL CHECK (profundidade_m BETWEEN 0 AND 100),
    temperatura_agua_c REAL CHECK (temperatura_agua_c BETWEEN 10 AND 35),
    dentro_toca INTEGER NOT NULL CHECK (dentro_toca IN (0, 1)),
    sexo TEXT CHECK (sexo IN ('fem', 'masc')),
    distancia_entre_olhos_mm REAL CHECK (distancia_entre_olhos_mm BETWEEN 1 AND 50),
    substrato TEXT CHECK (substrato IN ('rocha', 'areia', 'coral', 'cascalho')),
    observacoes TEXT,
    id_usuario_cadastro INTEGER NOT NULL REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    cadastrado_em TEXT NOT NULL,
    excluido_em TEXT,
    id_usuario_exclusao INTEGER REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    FOREIGN KEY (id_especie, id_genero) REFERENCES especie(id_especie, id_genero) ON UPDATE CASCADE ON DELETE RESTRICT,
    UNIQUE (id_registro, id_local),
    CHECK ((excluido_em IS NULL AND id_usuario_exclusao IS NULL) OR (excluido_em IS NOT NULL AND id_usuario_exclusao IS NOT NULL))
);

CREATE TABLE registro_midia (
    id_midia INTEGER PRIMARY KEY AUTOINCREMENT,
    id_lote INTEGER REFERENCES lote_midia(id_lote) ON DELETE SET NULL,
    id_registro INTEGER,
    id_local TEXT NOT NULL REFERENCES local(id_local) ON UPDATE CASCADE ON DELETE RESTRICT,
    id_integrante_autor TEXT REFERENCES integrante(id_integrante) ON UPDATE CASCADE ON DELETE RESTRICT,
    id_genero TEXT REFERENCES genero(id_genero) ON UPDATE CASCADE ON DELETE RESTRICT,
    id_especie TEXT,
    nome_original TEXT NOT NULL,
    caminho_arquivo TEXT NOT NULL,
    data_captura TEXT,
    hora_captura TEXT,
    tipo_amostragem TEXT CHECK (tipo_amostragem IN ('autonomo', 'livre', 'poca_mare')),
    visibilidade_m INTEGER CHECK (visibilidade_m BETWEEN 0 AND 99),
    profundidade_m REAL CHECK (profundidade_m BETWEEN 0 AND 100),
    temperatura_agua_c REAL CHECK (temperatura_agua_c BETWEEN 10 AND 35),
    sexo TEXT CHECK (sexo IN ('fem', 'masc')),
    distancia_entre_olhos_mm REAL CHECK (distancia_entre_olhos_mm BETWEEN 1 AND 50),
    substrato TEXT CHECK (substrato IN ('rocha', 'areia', 'coral', 'cascalho')),
    observacoes TEXT,
    id_usuario_cadastro INTEGER NOT NULL REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    cadastrado_em TEXT NOT NULL,
    excluido_em TEXT,
    id_usuario_exclusao INTEGER REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    FOREIGN KEY (id_registro, id_local) REFERENCES registro_campo(id_registro, id_local) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_especie, id_genero) REFERENCES especie(id_especie, id_genero) ON UPDATE CASCADE ON DELETE RESTRICT,
    CHECK (id_especie IS NULL OR id_genero IS NOT NULL),
    CHECK ((excluido_em IS NULL AND id_usuario_exclusao IS NULL) OR (excluido_em IS NOT NULL AND id_usuario_exclusao IS NOT NULL))
);

CREATE TABLE tag (
    id_tag TEXT PRIMARY KEY NOT NULL,
    ativa INTEGER NOT NULL DEFAULT 1 CHECK (ativa IN (0, 1))
);

CREATE TABLE midia_tag (
    id_midia INTEGER NOT NULL REFERENCES registro_midia(id_midia) ON DELETE RESTRICT,
    id_tag TEXT NOT NULL REFERENCES tag(id_tag) ON UPDATE CASCADE ON DELETE RESTRICT,
    id_usuario_atribuicao INTEGER NOT NULL REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    atribuida_em TEXT NOT NULL,
    PRIMARY KEY (id_midia, id_tag)
);

CREATE TABLE comentario_midia (
    id_comentario INTEGER PRIMARY KEY,
    id_midia INTEGER NOT NULL REFERENCES registro_midia(id_midia) ON DELETE RESTRICT,
    id_usuario INTEGER NOT NULL REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    texto TEXT NOT NULL,
    criado_em TEXT NOT NULL,
    excluido_em TEXT
);

CREATE TABLE relatorio (
    id_relatorio INTEGER PRIMARY KEY,
    id_expedicao INTEGER NOT NULL REFERENCES expedicao(id_expedicao) ON DELETE RESTRICT,
    titulo TEXT NOT NULL,
    caminho_arquivo TEXT,
    data_relatorio TEXT,
    id_usuario_cadastro INTEGER NOT NULL REFERENCES usuario(id_usuario) ON DELETE RESTRICT
);

CREATE TABLE relatorio_autor (
    id_relatorio INTEGER NOT NULL REFERENCES relatorio(id_relatorio) ON DELETE CASCADE,
    id_integrante TEXT NOT NULL REFERENCES integrante(id_integrante) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (id_relatorio, id_integrante)
);

CREATE TABLE historico_alteracao (
    id_alteracao INTEGER PRIMARY KEY,
    nome_tabela TEXT NOT NULL,
    chave_registro TEXT NOT NULL,
    operacao TEXT NOT NULL CHECK (operacao IN ('INSERT','UPDATE','DELETE','EXCLUSAO_LOGICA','ATRIBUICAO_TAG','REMOCAO_TAG','COMENTARIO')),
    dados_anteriores TEXT,
    dados_novos TEXT,
    id_usuario INTEGER NOT NULL REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    alterado_em TEXT NOT NULL,
    justificativa TEXT
);

