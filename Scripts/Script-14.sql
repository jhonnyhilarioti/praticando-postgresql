SELECT * FROM public.clientes;

START TRANSACTION;

--Importação de arquivo .csv
COPY public.clientes(id_cliente, nome_cliente) 
	FROM '/tmp/clientes.csv' DELIMITER ',' CSV HEADER;

COMMIT;

-------------------------------------------------------

START TRANSACTION;

--Exportação de arquivo .csv
COPY (SELECT * FROM relatorio_compras)
  TO '/tmp/relatorio_compras.csv' DELIMITER ',' CSV HEADER;
  
COMMIT;
 
ROLLBACK;
