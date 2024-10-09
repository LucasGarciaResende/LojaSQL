CREATE SEQUENCE seq_pessoa_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE pessoa(
	idpessoa INT PRIMARY KEY DEFAULT (NEXT VALUE FOR dbo.seq_pessoa_id),
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

CREATE TABLE movimento (
    idmovimento INT PRIMARY KEY,
	usuario INT NOT NULL,
    idproduto INT NOT NULL,
    quantidade INT NOT NULL,
	tipo CHAR(1),
	CONSTRAINT fk_movimento_produto FOREIGN KEY (idproduto) REFERENCES produto(idproduto),
	CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario(idusuario)
);

CREATE TABLE movimento_compra (
    idmovimento INT PRIMARY KEY,
    id_pessoa_fisica INT NOT NULL,
    id_pessoa_juridica INT NOT NULL,
    CONSTRAINT fk_movimento_compra FOREIGN KEY (idmovimento) REFERENCES movimento(idmovimento),
    CONSTRAINT fk_movimento_compra_pessoa_fisica FOREIGN KEY (id_pessoa_fisica) REFERENCES pessoa_fisica(idpessoa),
    CONSTRAINT fk_movimento_compra_pessoa_juridica FOREIGN KEY (id_pessoa_juridica) REFERENCES pessoa_juridica(idpessoa)
);

CREATE TABLE movimento_venda (
    idmovimento INT PRIMARY KEY,
    id_pessoa_fisica INT NOT NULL,
    id_pessoa_juridica INT NOT NULL,
    CONSTRAINT fk_movimento_venda FOREIGN KEY (idmovimento) REFERENCES movimento(idmovimento),
    CONSTRAINT fk_movimento_venda_pessoa_fisica FOREIGN KEY (id_pessoa_fisica) REFERENCES pessoa_fisica(idpessoa),
    CONSTRAINT fk_movimento_venda_pessoa_juridica FOREIGN KEY (id_pessoa_juridica) REFERENCES pessoa_juridica(idpessoa)
);

