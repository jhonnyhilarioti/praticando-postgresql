SELECT * FROM public.produtos;

START TRANSACTION;

UPDATE public.produtos SET descricao_produto = 'Pode de margarina de 400g' WHERE id_produto = 6;

COMMIT;

START TRANSACTION;

UPDATE public.produtos SET descricao_produto = 'Pacote de cefé de 500g' WHERE id_produto = 7;

COMMIT;

ROLLBACK;

---------------------------------------------
SELECT * FROM pedidos;

/*DELETE FROM public.produtos WHERE id_produto  = 7;*/

/*TRUNCATE TABLE public.pedidos;*/

/*DELETE FROM public.produtos WHERE id_produto  = 3;*/






