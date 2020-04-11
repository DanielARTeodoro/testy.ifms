-- 1 
use escola;

DELIMITER $$
CREATE TRIGGER inserir_matricula BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
	DECLARE quantidade_alunos INT; 
	DECLARE limite INT; 
	
    SET quantidade_alunos = (SELECT COUNT(*) FROM matriculas WHERE fkturmas_id = NEW.fkturmas_id);
    SET limite = (SELECT limite_alunos FROM turmas WHERE id = NEW.fkturmas_id);
    
    IF(quantidade_alunos>=limite) THEN SIGNAL SQLSTATE '45000' set message_text = 'TURMA ESGOTADA';
    END IF;
END $$
DELIMITER ;


-- Para realizar o teste você deve inserir a quantidade de matriculas que faltam para esgotar a turma (Compila o INSERT 5 vezes para ver o erro); 
INSERT INTO matriculas (fkturmas_id, fkalunos_id, data_matricula) VALUES
(1, 10, '2020-01-14'),
(1, 7, '2020-01-14'),
(1, 8, '2020-01-14'),
(1, 5, '2020-01-14');



-- 2 

DELIMITER $$
CREATE TRIGGER alterar_matricula BEFORE UPDATE ON matriculas
FOR EACH ROW
BEGIN
	DECLARE quantidade_alunos INT; 
	DECLARE limite INT; 
	
    SET quantidade_alunos = (SELECT COUNT(*) FROM matriculas WHERE fkturmas_id = NEW.fkturmas_id);
    SET limite = (SELECT limite_alunos FROM turmas WHERE id = NEW.fkturmas_id);
    
    IF(quantidade_alunos>=limite) THEN SIGNAL SQLSTATE '45000' set message_text = 'TURMA ESGOTADA';
    END IF;
END $$
DELIMITER ;

UPDATE matriculas SET fkturmas_id = 1 WHERE id = 2;


-- 3
DELIMITER $$
CREATE TRIGGER excluir_aluno BEFORE DELETE ON alunos
FOR EACH ROW
BEGIN

    IF EXISTS(SELECT * FROM matriculas WHERE fkalunos_id = OLD.id) THEN SIGNAL SQLSTATE '45000' set message_text = 'ALUNO ESTÁ CADASTRADO EM UMA TURMA. NÃO PODE SER EXCLUÍDO';
    END IF;

END $$
DELIMITER ;

DELETE FROM alunos WHERE id = 1;


-- 4


DELIMITER $$
CREATE PROCEDURE reajustar_curso ()
BEGIN 	
	DECLARE contador INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE valor_curso DOUBLE DEFAULT 0;
    DECLARE novo_valor DOUBLE DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM cursos);
    while_curso: WHILE contador<=quantidade DO
		SET valor_curso = (SELECT preco FROM cursos WHERE id = contador);
		
		IF valor_curso<=5000.00 THEN SET novo_valor = valor_curso * 1.10;
		ELSEIF valor_curso>5000.00 AND valor_curso<= 10000.00 THEN SET novo_valor = valor_curso * 1.15;
		ELSEIF valor_curso>=10000.00 THEN SET novo_valor = valor_curso * 1.20;
        END IF;

		
        UPDATE cursos SET preco = novo_valor WHERE id = contador;
        SET contador = contador + 1;
		
    END WHILE while_curso;
END $$
DELIMITER ;


DROP PROCEDURE reajustar_curso;
TRUNCATE cursos;
CALL reajustar_curso();


DESC cursos;

select * from cursos;

-- 5

DELIMITER $$
CREATE PROCEDURE somar_idade ()
BEGIN
	DECLARE contador INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE somar_idade INT DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM alunos);
    
    while_idade: WHILE contador<=quantidade DO
		SET somar_idade = somar_idade + (SELECT idade FROM alunos WHERE id = contador);
		SET contador = contador + 1;
	END WHILE while_idade;

	SELECT somar_idade AS 'Soma das idades';
END $$
DELIMITER ;

CALL somar_idade();


-- 6

DELIMITER $$
CREATE PROCEDURE reajuste_area (id_a int)
BEGIN 	
	DECLARE novo_valor DOUBLE DEFAULT 0;
    CASE id_a     
			WHEN 1 THEN SET novo_valor = 1200;	
			WHEN 2 THEN SET novo_valor = 1600;
			WHEN 3 THEN SET novo_valor = 1200;
			WHEN 4 THEN SET novo_valor = 1600; 
	ELSE SELECT 'Não foi encontrado esse id' AS 'ERRO';
	END CASE;
	UPDATE area_atuacao SET bonus_salarial = novo_valor WHERE id = id_a;
END $$
DELIMITER ;

CALL reajuste_area(1);

SELECT * FROM area_atuacao;


-- 7

DELIMITER $$
CREATE PROCEDURE contar_ano ()
BEGIN
	DECLARE incremento INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE contador INT DEFAULT 0;
    DECLARE ano_matricula INT DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM matriculas);
    
    while_ano: WHILE incremento<=quantidade DO
		SET ano_matricula =  (SELECT year(data_matricula) FROM matriculas WHERE id = incremento);
		IF(ano_matricula=2020) THEN SET contador = contador + 1;
        END IF;
		SET incremento = incremento + 1;
        
	END WHILE while_ano;

	SELECT contador AS 'Quantidade de mariculas em 2020';
END $$
DELIMITER ;

CALL contar_ano();

-- 8 

DELIMITER $$
CREATE PROCEDURE contar_aluno ()
BEGIN
	DECLARE incremento INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE contador INT DEFAULT 0;
    DECLARE idade_aluno INT DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM alunos);
    
    while_idade: WHILE incremento<=quantidade DO
		SET idade_aluno =  (SELECT idade FROM alunos WHERE id = incremento);
		IF(idade_aluno>30) THEN SET contador = contador + 1;
        END IF;
		SET incremento = incremento + 1;
        
	END WHILE while_idade;

	SELECT contador AS 'Quantidade de alunos com idade superior a 30';
END $$
DELIMITER ;


CALL contar_aluno();

-- 9
DELIMITER $$
CREATE PROCEDURE contar_turma()
BEGIN
	DECLARE incremento INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE contador_60 INT DEFAULT 0;
    DECLARE contador_80 INT DEFAULT 0;
    DECLARE contador_140 INT DEFAULT 0;
    DECLARE carga_horaria_turma INT DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM turmas);
    
    while_turma: WHILE incremento<=quantidade DO
		SET carga_horaria_turma =  (SELECT carga_horaria FROM turmas WHERE id = incremento);
		IF(carga_horaria_turma=60) THEN SET contador_60 = contador_60 + 1;
        ELSEIF(carga_horaria_turma=80) THEN SET contador_80 = contador_80 + 1;
        ELSEIF(carga_horaria_turma=140) THEN SET contador_140 = contador_140 + 1;
        END IF;
		SET incremento = incremento + 1;
        
	END WHILE while_turma;

	SELECT contador_60 AS 'QTDE CARGA HORARIA = 60', contador_80 AS 'QTDE CARGA HORARIA = 80',contador_140 AS 'QTDE CARGA HORARIA = 140' ;
END $$
DELIMITER ;

CALL contar_turma();

-- 10
DELIMITER $$
CREATE PROCEDURE contar_alunos_turma()
BEGIN
	DECLARE incremento INT DEFAULT 1;
    DECLARE quantidade INT DEFAULT 0;
    DECLARE id_maior INT DEFAULT 0;
    DECLARE maior INT DEFAULT 0;
    DECLARE qtde_alunos INT DEFAULT 0;
    SET quantidade = (SELECT count(*) FROM turmas);
    SET maior =  (SELECT count(*) FROM matriculas WHERE fkturmas_id = 1);
    SET id_maior = 1;
    
    while_aluno_turma: WHILE incremento<=quantidade DO
		SET qtde_alunos =  (SELECT count(*) FROM matriculas WHERE fkturmas_id = incremento);
		IF(qtde_alunos>maior) THEN 
			SET maior = qtde_alunos;
			SET id_maior = incremento;
        END IF;
		SET incremento = incremento + 1;
        
	END WHILE while_aluno_turma;
	SELECT * FROM turmas WHERE id = id_maior;
END $$
DELIMITER ;

CALL contar_alunos_turma();