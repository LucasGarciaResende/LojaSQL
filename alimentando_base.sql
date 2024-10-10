INSERT INTO usuario (idusuario, email, senha)
VALUES 
	(1, 'op1', 'op1'),
	(2, 'op2', 'op2');


INSERT INTO produto (idproduto, nome, quantidade, preco_venda)
VALUES
	(1, 'Maçã', 100, 6.99),
	(2, 'Banana', 270, 4.99),
	(3, 'Uva', 150, 5.99);

INSERT INTO pessoa (nome, logradouro, cidade, estado, telefone, email)
Values
	('Maria Joana', 'Rua das Acácias 588 Aparecida', 'São Paulo', 'SP', '11986774030', 'mariajoana0199@gmail.com');

DECLARE @new_idpessoa_fisica1 INT = SCOPE_IDENTITY();

INSERT INTO pessoa_fisica (idpessoa, cpf)
VALUES 
	(@new_idpessoa_fisica1, '32212366689');
	
INSERT INTO pessoa (nome, logradouro, cidade, estado, telefone, email)
Values
	('Jonathan Augusto', 'Avenida Xibas, 52 A, Apto 203, São Jorge', 'Mesquita', 'RJ', '21999910367', 'jonjun@gmail.com');

DECLARE @new_idpessoa_fisica2 INT = SCOPE_IDENTITY();

INSERT INTO pessoa_fisica (idpessoa, cpf)
VALUES 
	(@new_idpessoa_fisica2, '49862634441');

INSERT INTO pessoa (nome, logradouro, cidade, estado, telefone, email)
Values
	('Gabriel Arcann', 'Rua Jorge Schmit, 1024, Centro', 'Belo Horizonte', 'MG', '31966538886', 'stellarboy11@gmail.com');

DECLARE @new_idpessoa_fisica3 INT = SCOPE_IDENTITY();

INSERT INTO pessoa_fisica (idpessoa, cpf)
VALUES 
	(@new_idpessoa_fisica3, '90011782903');

INSERT INTO pessoa (nome, logradouro, cidade, estado, telefone, email)
Values
	('Pizza da Juju', 'Rua das Flores, 233, Flora', 'São Paulo', 'SP', '11988867110', 'jujubusiness@gmail.com');

DECLARE @new_idpessoa_juridica1 INT = SCOPE_IDENTITY();

INSERT INTO pessoa_juridica(idpessoa, cnpj)
VALUES 
	(@new_idpessoa_juridica1, '20618325000140');
	
INSERT INTO pessoa (nome, logradouro, cidade, estado, telefone, email)
Values
	('Alkalin Soluções', 'Avenida Almeida Pereira, 122, Botafogo', 'Rio de Janeiro', 'RJ', '21989113030', 'alkalinsolutions@gmail.com');

DECLARE @new_idpessoa_juridica2 INT = SCOPE_IDENTITY();

INSERT INTO pessoa_juridica(idpessoa, cnpj)
VALUES 
	(@new_idpessoa_juridica2, '58133597000122');

INSERT INTO pessoa (nome, logradouro, cidade, estado, telefone, email)
Values
	('Gaia Roupas & Acessórios', 'Rua Abarama, 23, Centro', 'Belo Horizonte', 'MG', '31986639080', 'gaiar&abusiness@gmail.com');

DECLARE @new_idpessoa_juridica3 INT = SCOPE_IDENTITY();

INSERT INTO pessoa_juridica(idpessoa, cnpj)
VALUES 
	(@new_idpessoa_juridica3, '26848055000140');


INSERT INTO movimento(idmovimento, idusuario, idpessoa, idproduto, quantidade, tipo, valor_unitario)
VALUES
	(1, 1, 4, 1, 20, 'S', 6.99),
	(2, 2, 5, 2, 35, 'E', 4.99),
	(3, 3, 6, 3, 30, 'S', 5.99);