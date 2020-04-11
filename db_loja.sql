create database db_loja;
use db_loja;

create table venda(
cod int not null auto_increment,
id_inf integer not null,
id_item integer not null,
cod_prod integer not null,
valor_unit float not null,
quantidade integer not null,
desconto integer,
constraint pk_venda primary key (cod));

insert into venda(cod, id_inf, id_item, cod_prod, valor_unit, quantidade, desconto) 
values (default, 1, 1, 1, 25.0, 10, 5),
	   (default, 1, 2, 2, 13.5, 3, null),
	   (default, 1, 3, 3, 15.0, 2, null),
	   (default, 1, 4, 4, 10.0, 1, null),
	   (default, 1, 5, 5, 30.0, 1, null),
	   (default, 2, 1, 3, 15.0, 4, null),
	   (default, 2, 2, 4, 10.0, 5, null),
	   (default, 2, 3, 5, 30.0, 7, null),
	   (default, 3, 1, 1, 25.0, 5, null),
	   (default, 3, 2, 4, 10.0, 4, null),
	   (default, 3, 3, 5, 30.0, 5, null),
	   (default, 3, 4, 2, 13.5, 7, null),
	   (default, 4, 1, 5, 30.0, 10, 15),
	   (default, 4, 2, 4, 10.0, 12, 5),
	   (default, 4, 3, 1, 25.0, 13, 5),
	   (default, 4, 4, 2, 13.5, 15, 5),
	   (default, 5, 1, 3, 15.0, 3, null),
	   (default, 5, 2, 5, 30.0, 6, null),
	   (default, 6, 1, 1, 25.0, 22, 15),
	   (default, 6, 2, 3, 15.0, 25, 20),
	   (default, 7, 1, 1, 25.0, 10, 3),
	   (default, 7, 2, 2, 13.5, 10, 4),
	   (default, 7, 3, 3, 15.0, 10, 4),
	   (default, 7, 4, 5, 30.0, 10, 1);
       
      SELECT desconto FROM venda 
      where desconto = 0 || desconto = null;
      
-- altere o valor do desconto 
-- (para 0) e todos os registros 
-- onde este campo é nulo.  

select desconto AS 'Desconto (%)' FROM venda 
where desconto > 0 || desconto = null;
select * from venda;

UPDATE db_loja.venda 
SET desconto = 0 
WHERE desconto > 0 || desconto = null;
/*(cod = '13'),
(cod = '14');
(cod = '15');
(cod = '16');
(cod = '19');
(cod = '20');
(cod = '21');
(cod = '22');
(cod = '23');
(cod = '24');
*/

select desconto from venda;

-- a) Pesquise os itens que foram vendidos sem desconto. 
-- As colunas presentes no
-- resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.

select v.id_inf AS 'NFS', v.id_item AS 'ITEMS', v.cod_prod AS 'CODIGOS DOS PRODUTOS', 
v.valor_unit AS 'UNITARIO' from venda v
where v.desconto = 0;

-- b) Pesquise os itens que foram vendidos com desconto. 
-- As colunas presentes no
-- resultado da consulta são: 
-- ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR
-- VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -
-- (VALOR_UNIT*(DESCONTO/100)).

select v.id_inf AS 'NFS', v.id_item AS 'ITEMS', v.cod_prod AS 'CODIGOS DOS PRODUTOS', 
v.valor_unit AS 'UNITARIO', v.valor_unit AS 'VALOR VENDIDO' from venda v
where (v.valor_unit*(v.desconto/100));

-- c) Altere o valor do 
-- desconto (para zero) de todos os registros onde 
-- este campo é nulo.

UPDATE db_loja.venda
SET
desconto = 0
WHERE desconto is null || desconto > 0;

UPDATE db_loja.venda
SET
desconto = 0
WHERE desconto is null;

-- destrava limit update.
set sql_safe_updates = 0;

-- Trava limit update.
set sql_safe_updates = 1;


-- d) Pesquise os itens que foram vendidos. 
-- As colunas presentes no resultado da consulta
-- são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO,
-- VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE *
-- VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -
-- (VALOR_UNIT*(DESCONTO/100)).

select v.id_inf AS 'NFS', v.id_item AS 'ITEMS', v.cod_prod AS 'CODIGOS DOS PRODUTOS', 
v.valor_unit AS 'UNITARIOS', v.quantidade AS 'VALOR TOTALS', 
v.desconto AS 'DESCONTOS (%)', v.valor_unit AS 'VALOR VENDIDOS' 
from venda v
where (v.quantidade * v.valor_unit) 
and v.valor_unit-(v.valor_unit*(v.desconto/100));

-- e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. 
-- As colunas presentes no resultado da consulta são: 
-- ID_NF, VALOR_TOTAL. OBS: O 
-- VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o
-- resultado da consulta por ID_NF.

select v.id_inf AS 'NFS', v.quantidade AS 'VALOR TOTALS' 
from venda v
where (v.quantidade * v.valor_unit) 
group by v.id_inf desc;

-- f) Pesquise o valor vendido das NF e ordene o resultado do maior 
-- valor para o menor. As
-- colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O
-- VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O
-- VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe
-- o resultado da consulta por ID_NF.

select v.id_inf AS 'NFS', v.valor_unit AS 'VALOR VENDIDOS' 
-- , v.quantidade AS 'VALOR TOTALS'
from venda v
where (v.quantidade * v.valor_unit) 
and v.valor_unit-(v.valor_unit*(v.desconto/100)) 
group by v.id_inf desc;

-- g) Consulte o produto que mais vendeu no geral. 
-- As colunas presentes no resultado da
-- consulta são: COD_PROD, QUANTIDADE. 
-- Agrupe o resultado da consulta por COD_PROD.

select max(v.cod_prod) AS 'CODIGOS DOS PRODUTOS', v.quantidade AS 'VALOR TOTALS' 
from venda v
where (v.quantidade * v.valor_unit) 
group by v.cod_prod desc;

-- h) Consulte as NF que foram vendidas mais de 10 unidades de 
-- pelo menos um produto.
-- As colunas presentes no resultado da consulta são: 
-- ID_NF, COD_PROD, QUANTIDADE.
-- Agrupe o resultado da consulta por ID_NF, COD_PROD.

select v.id_inf AS 'NFS', v.cod_prod AS 'CODIGOS DOS PRODUTOS' 
, v.quantidade AS 'QUANTIDADES'
from venda v
where v.quantidade > 10
group by v.id_inf, v.cod_prod desc;

-- i) Pesquise o valor total das NF, 
-- onde esse valor seja maior que 500, e ordene o
-- resultado do maior valor para o menor. 
-- As colunas presentes no resultado da consulta
-- são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido 
-- pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado 
-- da consulta por ID_NF.

select v.id_inf AS 'NFS', sum(v.quantidade * v.valor_unit) AS 'VALORTOTALS' 
from venda v
group by v.id_inf desc
-- group by NFS desc
having VALORTOTALS > 500;


-- j) Qual o valor médio dos descontos dados por produto. 
-- As colunas presentes no
-- resultado da consulta são: COD_PROD, MEDIA. 
-- Agrupe o resultado da consulta por COD_PROD.

select max(v.cod_prod) AS 'CODIGOS DOS PRODUTOS', avg(v.desconto) AS 'MEDIAS' 
from venda v
group by v.cod_prod;

-- k) Qual o menor, maior e o valor médio dos descontos 
-- dados por produto. As colunas
-- presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe
-- o resultado da consulta por COD_PROD.

select max(v.cod_prod) AS 'CODIGOS DOS PRODUTOS', min(v.desconto) AS 'MENORS' , 
max(v.desconto) AS 'MAIORS' , avg(v.desconto) AS 'MEDIAS' 
from venda v
group by v.cod_prod;

-- l) Quais as NF que possuem mais de 3 itens vendidos. 
-- As colunas presentes no resultado
-- da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE
-- VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o
-- resultado da consulta por ID_NF.

-- select v.id_inf AS 'NFS', v.quantidade AS 'QUANTIDADES DE ITENS'
-- from venda v
-- where v.quantidade > 3 group by v.id_inf;

select v.id_inf AS 'NFS', count(v.id_inf) AS 'QUANTIDADES DE ITENS'
from venda v
group by v.id_inf
having v.id_inf > 3;



-- --------------------
Delimiter $$
CREATE FUNCTION ValorEmprestimo (pid integer)
RETURNS INTEGER
BEGIN
declare x1 float;
declare x2 float;
declare valor float;
set x1 = (select ValorDiario from emprestimo where id = pid);
set x2 = (select qtdedias from emprestimo where id = pid);
set valor = x1 * x2;
Return valor;
RETURN 1;
END
Delimiter $$;
