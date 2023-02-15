START TRANSACTION;

CREATE TABLE IF NOT EXISTS public.clientes(
	id_cliente int UNIQUE NOT NULL PRIMARY KEY,
	nome_cliente varchar(100) NOT NULL);

COMMIT;

SELECT * FROM public.clientes;

DROP TABLE public.clientes;

------------------------------------------------

START TRANSACTION;

CREATE TABLE IF NOT EXISTS public.produtos(
	id_produto int UNIQUE NOT NULL PRIMARY KEY,
	nome_produto varchar(50) NOT NULL,
	descricao_produto TEXT NULL,
	preco real NOT NULL,
	qtd_estoque int DEFAULT 0);

COMMIT;

SELECT * FROM public.produtos;

DROP TABLE public.produtos;

----------------------------------------------

START TRANSACTION;

CREATE TABLE IF NOT EXISTS public.pedidos(
	id_pedido int UNIQUE NOT NULL PRIMARY KEY,
	id_cliente int NOT NULL REFERENCES clientes(id_cliente),
	id_produto int NOT NULL REFERENCES pedidos(id_pedido),
	qtd_vendida int NOT NULL);

COMMIT;

SELECT * FROM public.pedidos;

DROP TABLE public.pedidos;





