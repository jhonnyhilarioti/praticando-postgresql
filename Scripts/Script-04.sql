START TRANSACTION;

INSERT INTO public.produtos (id_produto, nome_produto, preco, qtd_estoque)
	VALUES (6, 'Margarina', 8.90, 150),
	       (7, 'Café', 11.00, 280);
	  
COMMIT;

----------------------------------------------------------------

SELECT * FROM public.produtos;

SELECT nome_produto FROM public.produtos ORDER BY nome_produto;

SELECT * FROM public.produtos ORDER BY nome_produto DESC;

/*NULLS FIRST | LAST*/

SELECT * FROM public.produtos ORDER BY descricao_produto NULLS FIRST;

SELECT * FROM public.produtos ORDER BY descricao_produto NULLS LAST;

--------------------------------------------------------------------

SELECT * FROM public.produtos ORDER BY preco;

SELECT * FROM public.produtos ORDER BY preco LIMIT 4;

SELECT * FROM public.produtos ORDER BY id_produto OFFSET 2;

--------------------------------------------------------------------

/* AND OR*/

SELECT * FROM public.produtos WHERE qtd_estoque > 200 AND qtd_estoque < 500;

SELECT * FROM public.produtos WHERE preco > 2.50 AND qtd_estoque <= 350;

ROLLBACK;

--------------------------------------------------------------------

SELECT * FROM public.produtos;

SELECT * FROM public.produtos WHERE qtd_estoque BETWEEN 250 AND 350;

SELECT * FROM public.produtos WHERE preco BETWEEN 2.50 AND 9.00  
								 OR	preco BETWEEN 2.50 AND 15.00;
								
SELECT * FROM public.produtos WHERE preco NOT BETWEEN 1.50 AND 3.75;
							

