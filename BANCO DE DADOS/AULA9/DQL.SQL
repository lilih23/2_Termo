-- Active: 1788268334439@@127.0.0.1@3306@smartcoffee_dml_lidia
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Monyke', 'Monykinha@EMAIL.COM', '199999985466', 'LIMEIRA', TRUE);

-- CONSULTAS COM SELECT
-- ESTRUTURAS DE CONSTRUÇÃO DO SELETC
--SELECT coluna
--FROM tabela;

-- EX 1: SELECT PARA TODAS AS COLUNAS
SELECT * FROM cliente;

-- EX 2: SELECT PARA TODAS AS COLUNAS
SELECT nome, email,ativo FROM cliente

-- EX 3: ALIAS É UM APELIDO PARA O RESULTADO
SELECT nome AS  cliente,
        telefone AS contato
FROM cliente;

SELECT nome AS Cliene,
        ativo AS STATUS
FROM cliente;

SELECT nome_produto, preco, preco * 1.80 AS preco_promocao
FROM produto;

-- EX 4: EIMINANDO REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente;

SELECT cidade FROM cliente

-- SEM DISTINCT - Aparece várias vezes
-- COM DISTINCT - Aperece uma vez

-- EX 5: FILTROS EM REGISTROS
SELECT nome_produto, preco
FROM produto
WHERE preco > 10;

SELECT nome_produto, preco
FROM produto
WHERE preco <> 10;

SELECT nome_produto, preco
FROM produto
WHERE ativo = TRUE;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;

-- OUTROS OPERADORES DE COMPARAÇAÕ 
-- = IGUAL
-- <> != DIFERENTE
-- > MAIOR
-- >= MAIOR IGUAL
-- < MENOR
-- <= MENOR IGUAL

-- EX 6: AND, OR E NOT
-- EXEMPLO COM AND
SELECT nome_produto, preco
FROM produto
WHERE preco >= 8 AND preco <= 20;

-- EXEMPLO COM OR
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';

-- EXEMPLO COM NOT
SELECT nome, cidade
FROM cliente
WHERE not cidade = 'Limeira';


-- EXEMPLO COM AND E OR JUNTOS UTILIZAR ()
SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Americana');


-- EX 7: BETWEEN - PESQUISA POR INTERVALOS
SELECT nome_produto, preco
FROM produto
WHERE preco BETWEEN 8.00 and 15.00

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';


-- EX 8:IN - VÁRIAS POSSIBILIDADES
-- USAR PARA ELIMINAR A QUANTIDADE DE OR

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Americana');

-- EX 9: 
SELECT nome_produto
FROM produto
WHERE nome_produto LIKE 'cafe%';
-- COMEÇA COM A PALAVRA DESEJADA

SELECT nome_produto
FROM produto
WHERE nome_produto LIKE '%torta de limão%';
-- POSSUI A PALAVRA DESEJADA

SELECT nome_produto
FROM produto
WHERE nome_produto LIKE "%Pablo H";
-- UTILIZANDO % COMO CORINGA

SELECT nome_produto
FROM produto
WHERE nome_produto LIKE "_ablo H";

SELECT nome
FROM cliente
WHERE nome LIKE 'PA_';


-- EX 10: NULL - AUSENCIA DE VALOR
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- EX 11: ORDER BY - ORDENAR RESULTADOS
-- ASC É CRESCENTE E DESC É DECRESCENTE
SELECT nome_produto, preco
FROM produto
ORDER BY preco ASC;

SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC;

SELECT cidade, nome
FROM cliente 
ORDER BY cidade ASC, nome DESC;

-- EX 12:  LIMIT - LIMITANDO A QUANTIDADE DE RESULTADOS
SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC
LIMIT 8;

SELECT nome_produto, preco
FROM produto 
ORDER BY nome_produto
LIMIT 8 OFFSET 8;

-- EX 13: COLUNAS COM CÁLCULOS
SELECT nome_produto,preco, preco * 1.10 AS preco_com_reajuste
FROM produto;

-- CALCULO COM SUBOTAL
SELECT id_item_pedido, quantidade, preco_unitario, quantidade* preco_unitario AS subtotal
FROM item_pedido;

-- EX 14: FUNÇÕES U´TEIS EM CONSULTAS
SELECT UPPER(nome) AS nome_maiusculo,
        LOWER(email) AS email_minusculo
FROM cliente;
-- DEIXAR EM MAIUSCULO E MINUSCULO

SELECT CONCAT(nome, '-', cidade) AS cliente_cidade
FROM cliente;
-- JUMTAR INFORMAÇÕES ENTRE CAMPOS

SELECT nome_produto, preco, ROUND(preco * 0.90, 2) AS preço_desconto
FROM produto;
-- ARREDONDAR CASAS DECIMAIS

SELECT id_pedido, data_pedido, DATE(data_pedido) AS data_pedido, YEAR(data_pedido) AS ano_pedido, MONTH(data_pedido) AS mes_pedido
FROM pedido;
-- FORMAÇÃO DE RESULTADO POR DATA MES E ANO

-- SUBSTITUINDO NULL PARA TEXTO DESEJADO
SELECT nome,
COALESCE(telefone, 'não informado') AS telefone
FROM cliente;

-- FUNÇÕES DE AGREÇÕES
-- EX 15: FUNÇÕES DE CALCULOS AGREGADAS
-- COUNT() - CONTAR
-- SUM() - SOMAR
-- AVG() - MEDIA
-- MIN() -MINIMO
-- MAX() - MAXIMO
SELECT COUNT(*) AS TOTAL_CLIENTE
FROM cliente;
-- QUANTOS CLIENTES TEMOS EM NOSSA TABELA CLIENTE?
SELECT AVG(preco) AS PRECO_MEDIO
FROM produto;
-- CALCULE O PRECO MDIO DOS PRODUTOD
SELECT MIN(preco) AS MAIORES_PRECOS,
       MAX(preco) AS MAIORES_PRECOS,
       AVG(preco) AS MEDIA_PRECOS
FROM produto;
-- RESUMO DOS PRECOS

SELECT SUM(valor_total) AS FATURAMENTO
FROM pedido
WHERE status_pedido = 'FINALIZADO';
-- TOTAL PEDIDOS FINALIZADOS

-- EX 16: GROUP BY - AGRUPAR DADOS
SELECT cidade,
        COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade;
-- QUANTIDADE DE CLIENTE EM CADA CIDADE 

SELECT id_categoria,
    COUNT(*) AS quantidade_produto
FROM produto
GROUP BY id_categoria;
-- QUANTIDADE DE PRODUTOS POR CATEGORIA

-- EX 17: HAVING - FILTRAR GRUPOS
-- WHERE FILTRA LINHAS ANTES DO GRUPAMENTO
-- HAVING FILTRAR GRUPOS DEPOIS DO GROUP BY
SELECT cidade,
        COUNT(*) AS qauntidae_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;
-- CIDADES COM PELO MENOS DIS CLIENTES

-- EC 18 - RESUMO E ORDEM DE UMA CONSULTA COMPLETA 
SELECT colunas
FROM tabela
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao_agrupar
ORDER BY colunas
LIMIT quantidade;

SELECT cidade, COUNT(*) AS Quantidade_Clientes
FROM cliente
WHERE cidade = 'Limeira'
GROUP BY cidade
HAVING COUNT(*) >=3
LIMIT 5;