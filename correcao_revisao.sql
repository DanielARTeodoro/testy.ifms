use escola;

-- 1
SELECT nome, cpf FROM alunos WHERE year(data_nascimento) > 2000;

-- 2
SELECT * FROM turmas t
INNER JOIN instrutores i ON t.fkinstrutores_id = i.id 
WHERE i.id = 1;

-- 3
SELECT fkturmas_id, COUNT(fkturmas_id) AS 'Quantidade de alunos' FROM  matriculas m    
GROUP BY (fkturmas_id);

-- 4
SELECT * FROM instrutores i
INNER JOIN area_atuacao a ON i.fkarea_atuacao_id = a.id;

-- 5
SELECT * FROM instrutores i
LEFT JOIN turmas t ON i.id = t.fkinstrutores_id;

-- 6
SELECT i.nome AS 'Instrutor', a.nome_area AS 'Area Atuação', t.nome AS 'Turma' FROM instrutores i
INNER JOIN area_atuacao a ON i.fkarea_atuacao_id = a.id
INNER JOIN turmas t ON i.id = t.fkinstrutores_id
INNER JOIN matriculas m ON m.fkturmas_id = t.id
WHERE m.fkalunos_id = 3;


-- 7
DELIMITER $$
CREATE PROCEDURE ajustar_valor(id_curso INT, porcentagem INT)
BEGIN
UPDATE cursos SET preco = preco + (preco * (porcentagem/100)) WHERE id = id_curso;
END $$
DELIMITER ;

SELECT * FROM  cursos;
CALL ajustar_valor(1, 10);
SELECT * FROM  cursos;

-- 8
DELIMITER $$
CREATE PROCEDURE informacoes_aluno(id_aluno INT)
BEGIN
SELECT a.nome AS 'Aluno', i.nome AS 'Instrutor',  t.nome AS 'Turma', c.nome AS 'Curso' FROM instrutores i
INNER JOIN turmas t ON i.id = t.fkinstrutores_id
INNER JOIN matriculas m ON m.fkturmas_id = t.id
INNER JOIN alunos a ON m.fkalunos_id = a.id
INNER JOIN cursos c ON t.fkcursos_id = c.id
WHERE a.id = id_aluno;
END $$
DELIMITER ;

CALL informacoes_aluno(1);


-- 9 
DELIMITER $$
CREATE FUNCTION formatar_cpf(cpf VARCHAR(14))
RETURNS VARCHAR(14)
BEGIN
	RETURN CONCAT(SUBSTR(cpf, 1, 3),'.', SUBSTR(cpf, 4, 3),'.', SUBSTR(cpf, 7, 3), '-', SUBSTR(cpf, 10, 2));
END $$
DELIMITER ;

-- 10
DELIMITER $$
CREATE FUNCTION informar_idade(ano_nascimento INT)
RETURNS INT 
BEGIN 
	RETURN 2020 - ano_nascimento;
END $$
DELIMITER ;


-- 11
SELECT nome, formatar_cpf(cpf) AS CPF, informar_idade(year(data_nascimento)) AS Idade FROM alunos;


-- 12
CREATE VIEW dados_alan AS
SELECT a.nome AS Aluno, t.nome AS Turma FROM turmas t
INNER JOIN matriculas m ON m.fkturmas_id = t.id
INNER JOIN alunos a ON m.fkalunos_id = a.id
WHERE t.id IN(SELECT m.fkturmas_id FROM matriculas m 
INNER JOIN alunos a ON m.fkalunos_id = a.id WHERE a.nome LIKE 'Alan %') AND a.nome NOT LIKE 'Alan %' ;

SELECT * FROM dados_alan;


-- 13
CREATE VIEW dados_bruna AS
SELECT a.nome AS Aluno, t.nome AS Turma FROM turmas t
INNER JOIN matriculas m ON m.fkturmas_id = t.id
INNER JOIN alunos a ON m.fkalunos_id = a.id
WHERE t.id = ANY(SELECT m.fkturmas_id FROM matriculas m 
INNER JOIN alunos a ON m.fkalunos_id = a.id WHERE a.nome LIKE 'Bruna%') AND a.nome NOT LIKE 'Bruna%' ;

SELECT * FROM dados_bruna;