SELECT * FROM public.clientes;
SELECT * FROM public.produtos;
SELECT * FROM public.pedidos;
SELECT * FROM public.mercado;

START TRANSACTION;

CREATE TABLE IF NOT EXISTS public.mercado(
	id_mercado int UNIQUE NOT NULL PRIMARY KEY,
	nome_mercado varchar(150) NOT NULL,
	consumidor int NULL REFERENCES clientes(id_cliente));

COMMIT;

--------------------------------------------------------

START TRANSACTION;

INSERT INTO 
	public.mercado(
	id_mercado,
	nome_mercado,
	consumidor)
VALUES (1, 'Nunes',   2),
	   (2, 'Machado', null),
	   (3, 'Masa',    3);

COMMIT;

---------------------------------------------------------

SELECT m.nome_mercado,
	   m.consumidor
	FROM public.clientes c RIGHT JOIN public.mercado m 
	ON c.id_cliente = m.consumidor;

ROLLBACK;
