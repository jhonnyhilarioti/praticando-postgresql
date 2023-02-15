/**
 * LIKE %exemplo% Determina se uma cadeia de caracteres específica corresponde a um padrão especificado.
 */
SELECT nome_cliente FROM public.clientes WHERE nome_cliente LIKE '%João%' OR 
										nome_cliente LIKE '%Zuckerberg%' OR 
									    nome_cliente LIKE 'B%';
									   
---------------------------------------------------

SELECT c.nome_cliente AS "Nome do cliente",
	   pr.nome_produto AS "Produto comprado",
	   p.qtd_vendida AS "Quantidade de produtos adquirida"
	FROM public.clientes c JOIN public.pedidos p ON c.id_cliente = p.id_cliente
						   JOIN public.produtos pr ON p.id_produto = pr.id_produto;
						  
--------------------------------------------------

SELECT * FROM public.clientes;
SELECT * FROM public.produtos;
SELECT * FROM public.pedidos;
	   
ROLLBACK;

