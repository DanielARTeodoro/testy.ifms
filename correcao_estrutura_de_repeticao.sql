-- 1

use estacionamento_tl;

DELIMITER $$
CREATE PROCEDURE somar_idade ()
BEGIN
	DECLARE contador INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE somar_idade INT DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM cliente);
    
    while_idade: WHILE contador<=quantidade DO
		SET somar_idade = somar_idade + (SELECT 2020-year(data_nasc) FROM cliente WHERE id = contador);
		SET contador = contador + 1;
	END WHILE while_idade;

	SELECT somar_idade AS 'Soma das idades';
END $$
DELIMITER ;

CALL somar_idade();


-- 2 

DELIMITER $$
CREATE PROCEDURE maior_menor_idade ()
BEGIN
	DECLARE contador INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE idade INT DEFAULT 0;
    DECLARE maior INT DEFAULT 0;
    DECLARE menor INT DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM cliente);
    
    SET maior = (SELECT 2020-year(data_nasc) FROM cliente WHERE id = 1);
    SET menor = (SELECT 2020-year(data_nasc) FROM cliente WHERE id = 1);
    
    while_idade: WHILE contador<=quantidade DO
		SET idade = (SELECT 2020-year(data_nasc) FROM cliente WHERE id = contador);
    
		IF idade>maior THEN SET maior = idade;
		END IF;
        
		IF idade<menor THEN SET menor = idade;
		END IF;
    
		SET contador = contador + 1;
	END WHILE while_idade;

	SELECT menor AS 'Menor idade', maior AS 'Maior idade';
END $$
DELIMITER ;

CALL maior_menor_idade();


-- 3

use estacionamento_tl;
DELIMITER $$
CREATE PROCEDURE media_capacidade ()
BEGIN
	DECLARE contador INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE somar_capacidade INT DEFAULT 0;
    DECLARE media DOUBLE DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM patio);
    
    while_idade: WHILE contador<=quantidade DO
		SET somar_capacidade = somar_capacidade + (SELECT capacidade FROM patio WHERE id = contador);
		SET contador = contador + 1;
	END WHILE while_idade;

	SET media = somar_capacidade/quantidade;
	SELECT media AS 'Média dos pátios';
END $$
DELIMITER ;

CALL media_capacidade();
