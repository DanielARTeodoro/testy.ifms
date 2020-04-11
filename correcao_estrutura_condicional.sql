-- 1 
use empresa_x;

DELIMITER $$
CREATE FUNCTION gerar_class(idade INT)
RETURNS VARCHAR(50)
BEGIN 
	DECLARE classificacao VARCHAR(50);
	IF idade>= 0 AND  idade< 10 THEN SET classificacao = 'Crianca';
    ELSEIF idade>=10 AND idade < 20 THEN SET classificacao = 'Adolescente';
    ELSEIF idade>=20 AND idade < 60 THEN SET classificacao = 'Adulto';
    ELSEIF idade>=60 THEN SET classificacao = 'Idoso';
    ELSE SET classificacao = 'IDADE INVÁLIDA';
    END IF;
    RETURN classificacao;
END $$
DELIMITER ;

SELECT nome, idade, gerar_class(idade) FROM pessoa; 

drop function gerar_class;

-- 2
use estacionamento_tl;

DELIMITER $$
CREATE PROCEDURE valor_patio (id_patio INT, OUT valor DOUBLE)
BEGIN 	
	DECLARE cap INT;
    SET cap = (SELECT capacidade FROM patio WHERE id = id_patio);
    CASE     
	WHEN cap>40 THEN SELECT 3.00 INTO valor;	
	WHEN cap>30 THEN SELECT 2.50 INTO valor;    
	WHEN cap>20 THEN SELECT 2.00 INTO valor;    
	WHEN cap>10 THEN SELECT 1.50 INTO valor; 
    WHEN cap<=10 AND cap>0 THEN SELECT 1.00 INTO valor;  
	ELSE SELECT 'Capacidade inválida' AS 'ERRO';
	END CASE;
END $$
DELIMITER ;

CALL valor_patio(1, @valor);
SELECT @valor;


-- 3 

ALTER TABLE veiculo ADD imposto DOUBLE;

DELIMITER $$
CREATE PROCEDURE calc_imposto (placa_veiculo VARCHAR(50), valor_carro DOUBLE)
BEGIN 	
	DECLARE ano_v INT;
    DECLARE imposto_v DOUBLE;
    SET ano_v = (SELECT ano FROM veiculo WHERE placa LIKE placa_veiculo);
	IF ano_v<=2000 THEN SET imposto_v = valor_carro * 0.10;
    ELSEIF ano_v>2000 AND ano_v<= 2010 THEN SET imposto_v = valor_carro * 0.15;
    ELSEIF ano_v>=2010 THEN SET imposto_v = valor_carro * 0.20;
    ELSE SELECT 'Ano inválido';
    END IF;
    UPDATE veiculo SET imposto = imposto_v WHERE placa LIKE placa_veiculo;
END $$
DELIMITER ;

SET @valor = 50000;
CALL calc_imposto('JJJ-2020', @valor);

SELECT * FROM veiculo;
