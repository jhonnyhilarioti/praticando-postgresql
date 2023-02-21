SELECT * FROM public.pedidos;

--------------------------------------------------------------

START TRANSACTION;

CREATE OR REPLACE FUNCTION dias_semana(data_compra timestamp)
RETURNS TEXT AS 
$$
DECLARE 
	dias float8;
BEGIN 
	SELECT EXTRACT(dow FROM data_compra) INTO dias; 

	IF dias = 0 THEN 
		RETURN 'Domingo';
	ELSIF dias = 1 THEN 
		RETURN 'Segunda';
	ELSIF dias = 2 THEN 
		RETURN 'Terça';
	ELSIF dias = 3 THEN 
		RETURN 'Quarta';
	ELSIF dias = 4 THEN 
		RETURN 'Quinta';
	ELSIF dias = 5 THEN 
		RETURN 'Sexta';
	ELSE 
		RETURN 'Sábado';
	END IF;
	
	RETURN dias;
	
END;
$$ LANGUAGE plpgsql;

COMMIT;

SELECT dias_semana(data_compra) FROM public.pedidos;

---------------------------------------------------------------

START TRANSACTION;

CREATE OR REPLACE FUNCTION dia_semana(data_compra timestamp)
RETURNS TEXT AS 
$$
DECLARE 
	dias float8;
	resul TEXT;
BEGIN 
	
	SELECT EXTRACT(dow FROM data_compra) INTO dias;

	CASE dias 
		WHEN 0 THEN resul:= 'Domingo';
		WHEN 1 THEN resul:= 'Segunda';
	    WHEN 2 THEN resul:= 'Terça';
	    WHEN 3 THEN resul:= 'Quarta';
	    WHEN 4 THEN resul:= 'Quinta';
	    WHEN 5 THEN resul:= 'Sexta';
	ELSE 
		resul := 'Sábado';
	END CASE;

	RETURN resul;
	
END;
$$ LANGUAGE plpgsql;

COMMIT;

DROP FUNCTION dia_semana(data_compra timestamp);

SELECT dia_semana(data_compra) FROM public.pedidos;

         
