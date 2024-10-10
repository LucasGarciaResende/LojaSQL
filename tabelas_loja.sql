CREATE TABLE pessoa(
	idpessoa INT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	logradouro VARCHAR(255) NOT NULL,
	cidade VARCHAR(255) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	email VARCHAR(255) UNIQUE
);

CREATE TABLE pessoa_fisica (
    idpessoa INT PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    CONSTRAINT fk_pessoa_fisica FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa)
);

CREATE TABLE pessoa_juridica (
    idpessoa INT PRIMARY KEY,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    CONSTRAINT fk_pessoa_juridica FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa)
);

CREATE TABLE produto (
	idproduto INT PRIMARY KEY,
	nome VARCHAR(255),
	quantidade INT,
	preco_venda NUMERIC(15, 2)
);

CREATE TABLE usuario (
	idusuario INT PRIMARY KEY,
	email VARCHAR(255),
	senha VARCHAR(255)
);

CREATE TABLE movimento(
	idmovimento INT PRIMARY KEY NOT NULL,
	idusuario INT NOT NULL,
	idpessoa INT NOT NULL,
	idproduto INT NOT NULL,
	quantidade INT NOT NULL,
	tipo CHAR(1) NULL,
	valor_unitario NUMERIC NOT NULL
	CONSTRAINT fk_usuario FOREIGN KEY (idusuario) REFERENCES usuario(idusuario),
	CONSTRAINT fk_pessoa FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa),
	CONSTRAINT fk_produto FOREIGN KEY (idproduto) REFERENCES produto(idproduto)
)

CREATE SEQUENCE seq_pessoa_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
