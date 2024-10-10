SELECT
	pessoa.*,
	pessoa_fisica.cpf

FROM dbo.pessoa_fisica
INNER JOIN dbo.pessoa ON pessoa_fisica.idpessoa = pessoa.idpessoa;

SELECT
	pessoa.*,
	pessoa_juridica.cnpj

FROM dbo.pessoa_juridica
INNER JOIN dbo.pessoa ON pessoa_juridica.idpessoa = pessoa.idpessoa;

SELECT
	movimento.idproduto,
	movimento.idpessoa,
	movimento.quantidade,
	movimento.valor_unitario,
	(valor_unitario * quantidade) AS valor_total
FROM
	movimento
WHERE 
	tipo = 'E';

SELECT
	movimento.idproduto,
	movimento.idpessoa,
	movimento.quantidade,
	movimento.valor_unitario,
	(valor_unitario * quantidade) AS valor_total
FROM
	movimento
WHERE 
	tipo = 'S';

SELECT
	movimento.idproduto,
	(valor_unitario * quantidade) AS valor_total
FROM
	movimento
WHERE 
	tipo = 'E';

SELECT
	movimento.idproduto,
	(valor_unitario * quantidade) AS valor_total
FROM
	movimento
WHERE 
	tipo = 'S'

SELECT DISTINCT m.idpessoa
FROM movimento m
WHERE m.idpessoa NOT IN (
    SELECT idpessoa
    FROM movimento
    WHERE tipo = 'E'
);

SELECT
    idpessoa,
    SUM(valor_unitario * quantidade) AS valor_total_entrada
FROM
    movimento
WHERE
    tipo = 'E'
GROUP BY
    idpessoa;

SELECT
    idpessoa,
    SUM(valor_unitario * quantidade) AS valor_total_saida
FROM
    movimento
WHERE
    tipo = 'S'
GROUP BY
    idpessoa;

SELECT
    idproduto,
    SUM(valor_unitario * quantidade) / SUM(quantidade) AS media_ponderada_venda
FROM
    movimento
WHERE
    tipo = 'S'
GROUP BY
    idproduto;