-- Gerado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   em:        2019-11-12 12:25:51 BRST
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE categoria (
    id_categoria     INTEGER NOT NULL,
    nome_categoria   VARCHAR2(20) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria,
                                                                nome_categoria );

CREATE TABLE cliente (
    id_cliente   INTEGER NOT NULL,
    email        VARCHAR2(20),
    telefone     VARCHAR2(20),
    nome         VARCHAR2(20)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE detalhes_pedido (
    id_detalhes_pedido   INTEGER NOT NULL,
    quantidade           NUMBER,
    valor                NUMBER,
    pedido_id_pedido     INTEGER NOT NULL,
    lanche_id_lanche     INTEGER NOT NULL
);

ALTER TABLE detalhes_pedido ADD CONSTRAINT detalhes_pedido_pk PRIMARY KEY ( id_detalhes_pedido );

CREATE TABLE entrega (
    id_entrega         INTEGER NOT NULL,
    saida_pedido       DATE NOT NULL,
    tempo_entrega      NUMBER,
    chegada_pedido     DATE,
    pedido_id_pedido   INTEGER NOT NULL
);

CREATE UNIQUE INDEX entrega__idx ON
    entrega (
        pedido_id_pedido
    ASC );

ALTER TABLE entrega ADD CONSTRAINT entrega_pk PRIMARY KEY ( id_entrega );

CREATE TABLE fornecedor (
    id_fornecedor     INTEGER NOT NULL,
    nome_fornecedor   VARCHAR2(50),
    cnpj              VARCHAR2(20)
);

ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_pk PRIMARY KEY ( id_fornecedor );

CREATE TABLE ingrediente (
    id_ingrediente   INTEGER NOT NULL,
    nome             VARCHAR2(50),
    quantidade       INTEGER
);

ALTER TABLE ingrediente ADD CONSTRAINT ingrediente_pk PRIMARY KEY ( id_ingrediente );

CREATE TABLE lanche (
    id_lanche                  INTEGER NOT NULL,
    nome                       VARCHAR2(50),
    quantidade                 INTEGER,
    descricao                  VARCHAR2(300),
    observacao                 VARCHAR2(100),
    preco                      NUMBER,
    categoria_id_categoria     INTEGER NOT NULL,
    categoria_nome_categoria   VARCHAR2(20) NOT NULL
);

ALTER TABLE lanche ADD CONSTRAINT lanche_pk PRIMARY KEY ( id_lanche );

CREATE TABLE pagamento (
    id_pagamento       INTEGER NOT NULL,
    dinheiro_pago      NUMBER,
    valor_final        NUMBER,
    pedido_id_pedido   INTEGER NOT NULL
);

CREATE UNIQUE INDEX pagamento__idx ON
    pagamento (
        pedido_id_pedido
    ASC );

ALTER TABLE pagamento ADD CONSTRAINT pagamento_pk PRIMARY KEY ( id_pagamento );

CREATE TABLE pedido (
    id_pedido            INTEGER NOT NULL,
    tempo_pedido         NUMBER,
    data                 DATE,
    cliente_id_cliente   INTEGER NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE possui (
    lanche_id_lanche             INTEGER NOT NULL,
    ingrediente_id_ingrediente   INTEGER NOT NULL
);

ALTER TABLE possui ADD CONSTRAINT possui_pk PRIMARY KEY ( lanche_id_lanche,
                                                          ingrediente_id_ingrediente );

CREATE TABLE vende (
    ingrediente_id_ingrediente   INTEGER NOT NULL,
    fornecedor_id_fornecedor     INTEGER NOT NULL
);

ALTER TABLE vende ADD CONSTRAINT vende_pk PRIMARY KEY ( ingrediente_id_ingrediente,
                                                        fornecedor_id_fornecedor );

ALTER TABLE detalhes_pedido
    ADD CONSTRAINT detalhes_pedido_lanche_fk FOREIGN KEY ( lanche_id_lanche )
        REFERENCES lanche ( id_lanche );

ALTER TABLE detalhes_pedido
    ADD CONSTRAINT detalhes_pedido_pedido_fk FOREIGN KEY ( pedido_id_pedido )
        REFERENCES pedido ( id_pedido );

ALTER TABLE entrega
    ADD CONSTRAINT entrega_pedido_fk FOREIGN KEY ( pedido_id_pedido )
        REFERENCES pedido ( id_pedido );

ALTER TABLE lanche
    ADD CONSTRAINT lanche_categoria_fk FOREIGN KEY ( categoria_id_categoria,
                                                     categoria_nome_categoria )
        REFERENCES categoria ( id_categoria,
                               nome_categoria );

ALTER TABLE pagamento
    ADD CONSTRAINT pagamento_pedido_fk FOREIGN KEY ( pedido_id_pedido )
        REFERENCES pedido ( id_pedido );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE possui
    ADD CONSTRAINT possui_ingrediente_fk FOREIGN KEY ( ingrediente_id_ingrediente )
        REFERENCES ingrediente ( id_ingrediente );

ALTER TABLE possui
    ADD CONSTRAINT possui_lanche_fk FOREIGN KEY ( lanche_id_lanche )
        REFERENCES lanche ( id_lanche );

ALTER TABLE vende
    ADD CONSTRAINT vende_fornecedor_fk FOREIGN KEY ( fornecedor_id_fornecedor )
        REFERENCES fornecedor ( id_fornecedor );

ALTER TABLE vende
    ADD CONSTRAINT vende_ingrediente_fk FOREIGN KEY ( ingrediente_id_ingrediente )
        REFERENCES ingrediente ( id_ingrediente );

create sequence s_cliente start with 100 nocache;

create sequence s_detalhes_pedido start with 200 nocache;
create sequence s_entrega start with 200 nocache;
create sequence s_pagamento start with 200 nocache;
create sequence s_pedido start with 200 nocache;

create sequence s_fornecedor start with 800 nocache;
create sequence s_ingrediente start with 900 nocache;
create sequence s_categoria start with 500 nocache;
create sequence s_lanche start with 500 nocache;


