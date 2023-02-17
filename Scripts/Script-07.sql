START TRANSACTION;

CREATE OR REPLACE VIEW vendas AS 
	SELECT c.nome_cliente "Cliente",
		   pr.nome_produto "Produto",
		   p.qtd_vendida "Produtos adquiridos",
		   sum(p.qtd_vendida * pr.preco) "Valor gasto em produtos",
		   sum(pr.qtd_estoque - p.qtd_vendida) "Qtd restante em estoque"
       FROM public.clientes c JOIN public.pedidos p ON c.id_cliente = p.id_cliente 
       						  JOIN public.produtos pr ON pr.id_produto = p.id_produto 
       						  GROUP BY c.nome_cliente,
       						  		   pr.nome_produto,
       						  		   p.qtd_vendida;

COMMIT;       		

SELECT * FROM vendas;

DROP VIEW vendas;
       						  				 
ROLLBACK;