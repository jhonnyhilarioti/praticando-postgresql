START TRANSACTION;

CREATE OR REPLACE VIEW relatorio_compras AS 
SELECT c.nome_cliente "Nome do cliente",
	   pr.nome_produto "Produto adquirido",
	   f.nome_filial "Nome da filial em que foi feita a compra",
	   p.qtd_vendida "Qtd adquirida",
	   sum(pr.preco * p.qtd_vendida) "Total gasto em mercadoria",
	   dia_semana(p.data_compra) "Dia da semana em que foi feita a compra",
	   age(current_date, p.data_compra) "A quanto tempo foi feita a ultima compra"
	FROM public.clientes c JOIN public.pedidos p ON c.id_cliente = p.id_cliente 
						   JOIN public.produtos pr ON pr.id_produto = p.id_produto 
						   JOIN public.filiais f ON f.id_filial = p.id_filial 
						   GROUP BY c.nome_cliente,
						   			pr.nome_produto,
						   			f.nome_filial,
						   			p.qtd_vendida,
						   			p.data_compra;
						   
COMMIT;
	  
SELECT * FROM relatorio_compras;
