-- Active: 1788268334439@@127.0.0.1@3306@smartcoffee_dml_lidia
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: LIDIA ELIANA RODRIGUES FERREIRA
-- Turma: DEVIE/CASTELLO Data:06/10/2026
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dql;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
-- 3. Liste os nomes das cidades sem repetir valores.
-- 4. Liste todos os produtos em ordem crescente de preço.
-- 5. Mostre apenas os 5 produtos mais caros.

select * from cliente;

select nome, cidade, email from cliente;

select distinct cidade from cliente;

select * from produto order by preco asc;

select * from produto order by preco desc limit 5;


-- PARTE B - FILTROS
-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
-- 7. Liste os clientes das cidades Limeira ou Americana.
-- 8. Localize os produtos cujo nome contém a palavra “Café”.
-- 9. Liste os clientes que não informaram telefone.
-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.

select * from produto where preco between 8 and 15;

select * from cliente where cidade in ('LIMEIRA', 'AMERICANA');

select * from produto where nome_produto like '%chocolate%';

select * from cliente where telefone is null;

select * from pedido where status_pedido = 'PENDENTE' and valor_total > 20 order by valor_total desc;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS
-- 11. Informe quantos produtos estão cadastrados.
-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
-- 13. Informe quantos clientes existem em cada cidade.
-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

select count(*) from produto;

select min(preco) as menor_preco, 
max(preco) as maior_preco, 
avg(preco) as preco_medio
 from produto;

select cidade, count(*) as total_clientes 
from cliente 
group by cidade;

select cidade, count(*) as total_clientes
 from cliente
  group by cidade having count(*) >= 2;

select sum(valor_total) as faturamento_total from pedido where status_pedido = 'FINALIZADO';


-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%D %m %Y %H:%i') AS DATA, C.NOME AS CLIENTE, PR.NOME_PRODUTO AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P 
INNER JOIN CLIENTE AS C 
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR 
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME_PRODUTO;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT PR.NOME_PRODUTO ASPRODUTO, CA.NOME_CATEGORIA AS CATEGORIA, PR.PRECO
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.NOME_CATEGORIA, PR.NOME_PRODUTO;


--18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT P.ID_PEDIDO, PR.NOME_PRODUTO AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO;


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE 
ORDER BY C.NOME;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS_PEDIDO = 'FINALIZADOS'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%D %m %Y %H:%i') AS DATA, C.NOME AS CLIENTE, PR.NOME_PRODUTO AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P 
INNER JOIN CLIENTE AS C 
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR 
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME_PRODUTO;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT nome_produto, preco
FROM produto
ORDER BY preco ASC;

SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC;


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
SELECT NOME_PRODUTO, PRECO,
CASE
WHEN PRECO < 8.00 THEN 'Econômico'
WHEN PRECO <= 15.00 THEN 'Intermediário'
ELSE 'Premium'
END AS CLASSIFICAÇÃO
FROM PRODUTO
ORDER BY PRECO;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:Quais clientes possuem pedidos pendentes?

--
-- Por que essa informação é útil? Essa informação ajuda a empresa a identificar os pedidos que ainda precisam ser concluídos e acompanhar os clientes que estão aguardando seus produtos.
--
-- Consulta:
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS_PEDIDO = 'PENDENTE'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;
