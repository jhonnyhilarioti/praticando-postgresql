
START TRANSACTION;

INSERT INTO
	public.clientes 
	(id_cliente,
	nome_cliente)
VALUES (1, 'João Baptista'),
	   (2, 'Mark Zuckerberg'),
	   (3, 'Bispo Macedo');

COMMIT;

SELECT * FROM public.clientes;

ROLLBACK;
--------------------------------------------------

START TRANSACTION;

INSERT INTO
	public.produtos (id_produto,
	nome_produto,
	descricao_produto,
	preco,
	qtd_estoque)
VALUES (1, 'Sabonete', 'Sabonete em barra de 70g', 1.75, 300),
       (2, 'Detergente', 'Detergente liquido de 350ml', 2.25, 200),
       (3, 'Desodorante', 'Desodorante spray de 175ml', 17.00, 500),
       (4, 'Pasta de dentes', 'Pasta de dentes sabor morando de 65g', 3.75, 350),
       (5, 'Álcool em gel', 'Garrafa de álcool em gel de 1l', 15.37, 230);

COMMIT;

SELECT * FROM public.produtos;

----------------------------------------------------

START TRANSACTION;

INSERT INTO public.pedidos(id_pedido, id_cliente, id_produto, qtd_vendida)
	VALUES (1, 2, 3, 2),
		   (2, 1, 4, 1),
		   (3, 3, 1, 10),
		   (4, 2, 2, 3);
		  
COMMIT;		  
		  
SELECT * FROM public.pedidos;

ROLLBACK;














