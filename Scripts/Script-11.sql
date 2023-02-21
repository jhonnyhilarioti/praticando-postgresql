/**
 * AGE: Retorna o número de dias decorridos entre uma data específica e uma data limite específica,
 * ou a data atual do sistema operacional ou o número de dias decorridos entre quaisquer duas datas.
 * 
 * CURRENT_DATE: Retorna a data atual.
 * 
 * Função EXTRACT: Permite extrair uma parte de uma data ou timestamp;
 * Palavras reservadas do EXTRACT: CENTURY, DAY, DECADE, DOW, HOUR, MINUTE, MONTH, SECOND, YEAR.
 */


SELECT * FROM public.pedidos;

SELECT age(data_compra) FROM public.pedidos WHERE id_pedido = 1;

SELECT current_date;

SELECT age(current_date, '1994-09-16');

SELECT EXTRACT(dow FROM data_compra) AS "dia da semana" FROM public.pedidos;