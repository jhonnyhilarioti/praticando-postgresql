/**
 * Funções de Agrgação
 * COUNT: Retorna a quantidade de ítens de uma entidade
 * MAX: Retorna o maior valor de uma entidade
 * MIN: Retorna o menor valor de uma entidade
 * AVG: Calcula a média dos valores de uma entidade
 * SUM: Retorna a soma dos valores de uma entidade
 * DISTINCT: Arredonda os valores 
 */

SELECT * FROM public.clientes;
SELECT * FROM public.produtos;
SELECT * FROM public.pedidos;

SELECT count(id_produto) AS "Qtd de produtos" FROM public.produtos;

SELECT count(DISTINCT id_produto) AS "Qtd de produtos" from public.produtos; 

SELECT count (preco) AS "Produtos com mais de R$5" FROM public.produtos WHERE preco > 5.00;

SELECT max(preco) AS "Maior preco" FROM public.produtos;

SELECT min(preco) AS "Menor preco" FROM public.produtos;

/*
 * Na função abaixo utiliza-se um cast para fazer a conversão dos valors para decimal,
 * assim possibilitando o arredondamento destes valores
 */
SELECT round(sum(preco::decimal),2) AS "Soma de valores dos produtos" FROM public.produtos;

SELECT round(avg(preco::decimal),2) AS "Média de valores dos produtos" FROM public.produtos;

ROLLBACK;

--------------------------------------------------------------------

/**
 * Para utilizar as Funções de agregação em consultas de campos específicos,
 * precisamos agrupar os campos que não possuem função alguma como no exemplo abaixo
 */
SELECT c.nome_cliente "Nome do cliente", 
       p.qtd_vendida "Qtd de produtos adquiridos",
	   pr.nome_produto "Nome do produto",
	   pr.preco "Preço",
	   sum(pr.preco * p.qtd_vendida) "Valor gasto em produtos",
	   sum(pr.qtd_estoque - p.qtd_vendida) "Quantidade em estoque após a compra"
	FROM public.clientes c JOIN public.pedidos p ON c.id_cliente = p.id_cliente
						   JOIN public.produtos pr ON pr.id_produto = p.id_produto
						   GROUP BY c.nome_cliente,
						 		   pr.nome_produto,
						 		   pr.preco,
						 		   p.qtd_vendida;
			