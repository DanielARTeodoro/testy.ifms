use avaliacao;

SELECT a.nome, count(*) FROM atividades a
INNER JOIN participantes_atividades pa ON pa.fkatividade_id = a.id
GROUP BY (pa.fkatividade_id); 

-- 2

SELECT p.nome, a.numero_participantes FROM participantes p
INNER JOIN participantes_atividades pa ON pa.fkparticipante_id = p.id
INNER JOIN atividades a ON pa.fkatividade_id = a.id
WHERE a.numero_participantes > (SELECT AVG(numero_participantes) FROM atividades);


-- 3 
SELECT a.nome, s.local FROM atividades a
RIGHT JOIN salas s ON a.fksala_id = s.id;

-- 4

SELECT s.* FROM salas s
INNER JOIN atividades a ON a.fksala_id = s.id
INNER JOIN participantes_atividades pa ON pa.fkatividade_id = a.id
WHERE pa.fkparticipante_id = 3;

-- 4
DELIMITER $$
CREATE FUNCTION cpf_novo(cpf VARCHAR(14))
RETURNS VARCHAR(11)
BEGIN
	RETURN CONCAT(SUBSTR(cpf, 1, 3),SUBSTR(cpf, 5,3), SUBSTR(cpf,9,3), SUBSTR(cpf,13,2));
END $$
DELIMITER ;

SELECT nome, cpf, cpf_novo(cpf) FROM participantes;

-- 6

DELIMITER $$
CREATE PROCEDURE alterar_duracao()
BEGIN 
	UPDATE atividades SET duracao = hora_final - hora_inicio;
END $$
DELIMITER ;


CALL alterar_duracao();

SELECT * FROM atividades;

-- 7
CREATE VIEW dados_info AS
SELECT p.nome FROM participantes p
INNER JOIN participantes_atividades pa ON pa.fkparticipante_id = p.id
INNER JOIN atividades a ON pa.fkatividade_id = a.id
WHERE p.fkturma_id = (SELECT t.id FROM turmas t WHERE t.turma LIKE '%TICA - 1%') AND
a.duracao = '04:00:00';

-- 8
CREATE VIEW dados_info AS
SELECT a.nome, p.nome AS pessoa FROM participantes p
INNER JOIN participantes_atividades pa ON pa.fkparticipante_id = p.id
INNER JOIN atividades a ON pa.fkatividade_id = a.id
WHERE p.fkturma_id IN(SELECT t.id FROM turmas t 
INNER JOIN participantes pt ON pt.fkturma_id = t.id WHERE pt.nome LIKE '%JAMILE%') AND p.nome NOT LIKE '%JAMILE%';


