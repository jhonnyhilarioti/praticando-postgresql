SELECT * FROM public.filiais;
SELECT * FROM public.clientes;
SELECT * FROM public.produtos;
SELECT * FROM public.pedidos;

ROLLBACK;
----------------------------------------------------

START TRANSACTION;

ALTER TABLE public.pedidos ADD COLUMN id_filial int NULL REFERENCES public.filiais(id_filial);

COMMIT;

------------------------------------------------------

START TRANSACTION;

ALTER TABLE public.pedidos ADD COLUMN data_compra timestamp; 

COMMIT;

-------------------------------------------------------

START TRANSACTION;

UPDATE public.pedidos SET id_filial = 1 WHERE id_pedido = 3;
UPDATE public.pedidos SET id_filial = 3 WHERE id_pedido = 1;
UPDATE public.pedidos SET id_filial = 3 WHERE id_pedido = 4;
UPDATE public.pedidos SET id_filial = 2 WHERE id_pedido = 2;

COMMIT;

------------------------------------------------------

START TRANSACTION;

UPDATE public.pedidos SET data_compra = '2023-01-15 09:45:37' WHERE id_pedido = 2;
UPDATE public.pedidos SET data_compra = '2023-02-10 14:30:08' WHERE id_pedido = 4;
UPDATE public.pedidos SET data_compra = '2022-09-08 10:05:53' WHERE id_pedido = 1;
UPDATE public.pedidos SET data_compra = '2023-01-25 17:11:00' WHERE id_pedido = 3;

COMMIT;

------------------------------------------------------

START TRANSACTION;

ALTER TABLE public.mercado RENAME TO filiais;
ALTER TABLE public.filiais RENAME COLUMN id_mercado TO id_filial;
ALTER TABLE public.filiais RENAME COLUMN nome_mercado TO nome_filial;
ALTER TABLE public.filiais RENAME COLUMN consumidor TO cliente;

COMMIT;
