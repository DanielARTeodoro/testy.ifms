-- -------------- Nivel 7 ---------------
-- -----------------
-- ---------- Prática -----------
-- -----------------
CREATE DATABASE escola_New;
-- -----------------
USE escola_New;
-- -----------------
CREATE TABLE area_atuacao (
  id INTEGER NOT NULL AUTO_INCREMENT,
  nome_area VARCHAR(50) NOT NULL,
  bonus_salarial DOUBLE NOT NULL,
  PRIMARY KEY(id)
);
-- -----------------
CREATE TABLE instrutores (
  id INTEGER NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  fkarea_atuacao_id INTEGER, 
  valor_hora DOUBLE NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(fkarea_atuacao_id) REFERENCES area_atuacao(id)
);
 -- -----------------
CREATE TABLE cursos (
  id INTEGER NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  requisito VARCHAR(255) NOT NULL,
  carga_horaria INTEGER NOT NULL,
  preco DOUBLE NOT NULL,
  PRIMARY KEY(id)
);
 -- -----------------
CREATE TABLE alunos (
  id INTEGER NOT NULL AUTO_INCREMENT,
  cpf VARCHAR(14) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  telefone VARCHAR(14) NOT NULL,
  data_nascimento DATE NOT NULL,
  PRIMARY KEY(id)
);
 -- -----------------
CREATE TABLE turmas (
  id INTEGER  NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50), 
  fkinstrutores_id INTEGER NOT NULL,
  fkcursos_id INTEGER  NOT NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  carga_horaria INTEGER NOT NULL,
  limite_alunos INTEGER NOT NULL, 
  PRIMARY KEY(id),
  FOREIGN KEY(fkcursos_id) REFERENCES cursos(id),
  FOREIGN KEY(fkinstrutores_id) REFERENCES instrutores(id)
);
 -- -----------------
CREATE TABLE matriculas (	
  id INTEGER NOT NULL AUTO_INCREMENT,
  fkturmas_id INTEGER NOT NULL,
  fkalunos_id INT NOT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(fkalunos_id) REFERENCES alunos(id),
  FOREIGN KEY(fkturmas_id) REFERENCES turmas(id)
);
-- -----------------
INSERT INTO alunos (cpf, nome, email, telefone, data_nascimento) VALUES
('07534545109', 'ALAN RODRIGUES VINCLES  MATTOSO', 'alan@gmail.com', '67988445533', '2001-12-13'),
('04445151131', 'EMANUELE OSCAR MARIAN', 'emanuele@gmail.com', '67994362436', '1998-01-24'),
('98745362721', 'ABRAAO  MARTINEZ FREITAS',  'abraao@gmail.com', '67998485841', '1978-10-29'),
('28374837382', 'BRUNA BENITES DE LIMA ',  'bruna@hotmail.com', '67998213234', '1997-03-18'),
('54344534534', 'ADRIELLY CABREIRA DOS SANTOS',  'adrielly@hotmail.com','67999139688', '1995-12-06'),
('23429342342', 'TABITA AGUAYO ROOSEVELT ', 'tabita@gmail.com', '67992743345', '1997-06-21'),
('84573945834', 'VINICIUS FERROMARTINEZ TAVARES',  'vinicuis@hotmail.com',  '679988776655', '2001-09-21'),
('98798328379', 'THAINARA RODRIGUES DE ALENCAR',  'thainara0@gmail.com', '67984371236', '2003-10-14'),
('43247454123', 'ESTEFANI ARCE DA SILVA ',  'estefani@gmail.come',  '67992123491', '2000-03-20'),
('84923842465', 'MILENA MITTANCK PEREIRA ', 'milena@gmail.com', '67999876554', '1997-04-18');
-- -----------------
INSERT INTO cursos (nome, requisito, carga_horaria, preco) VALUES
('TADS', 'Vestibular', 2560, 10000),
('TSI', 'Vestibular', 2450, 9500);
-- -----------------
INSERT INTO area_atuacao (nome_area, bonus_salarial) VALUES
('Redes', 1000),
('Desenvolvimento Web', 1500),
('Banco de dados', 1000),
('Desenvolvimento mobile', 1500);
-- -----------------
INSERT INTO instrutores (nome, email, fkarea_atuacao_id, valor_hora) VALUES
('EDUARDO DE LIMA SOUZA', 'eduardo@gmail.com', 2, 95),
('CARLA DE OLIVEIRA MENDONÇA', 'carla@gmail.com', 4, 95),
('ANGELICA DA SILVA FERREIRA', 'angelica@gmail.com', 1, 90),
('LEONARDO BRITO FERNANDES', 'leonardo@gmail.com', 3, 95),
('MIGUEL FERRARI CASTRO', 'miguel@gmail.com', 2, 90);
-- -----------------
INSERT INTO turmas (nome, fkinstrutores_id, fkcursos_id, data_inicio, data_final, carga_horaria, limite_alunos) VALUES
('ADM BANCO', 1, 1, '2020-01-15', '2020-02-05', 80, 20),
('EMPREENDEDORISMO', 2, 2, '2020-01-15', '2020-02-05', 60, 20),
('ORIENTAÇÃO A OBJETOS', 3, 1, '2020-01-15', '2020-02-05', 80, 20),
('REDES I', 1, 1, '2020-01-15', '2020-02-05', 60, 20),
('PROGAMAÇÃO DE COMPUTADORES', 2, 1, '2020-01-15', '2020-02-05', 140, 20),
('SISTEMAS OPERACIONAIS', 3, 1, '2020-01-15', '2020-02-05', 80, 20),
('FRAMEWORK WEB', 1, 2, '2020-01-15', '2020-02-05', 80, 20);
-- -----------------
INSERT INTO matriculas (fkturmas_id, fkalunos_id, data_matricula) VALUES
(1, 1, '2020-01-14'),
(2, 1, '2020-01-14'),
(3, 1, '2020-01-14'),
(1, 2, '2020-01-14'),
(1, 3, '2020-01-14'),
(1, 4, '2020-01-14'),
(2, 4, '2020-01-14'),
(3, 4, '2020-01-14'),
(2, 3, '2020-01-14');
-- -----------------
-- 1) Mostre o nome e o cpf de todos as alunos que nasceram posteriormente ao ano 2000. 
-- -----------------
select cpf, nome from alunos where year(data_nascimento) > 2000;
-- ou (Prova Real)
select cpf, nome, year(data_nascimento), data_nascimento 
from alunos where year(data_nascimento) > 2000;
-- -----------------
-- 2) Mostre as informações de todas as turmas do instrutor 1. 
-- -----------------
select t.* from turmas t left join instrutores i on t.fkinstrutores_id = i.id
where i.nome like "EDUARDO DE LIMA SOUZA";
-- ou (Prova Real)
select i.nome as "Nome_instrutor", t.* from turmas t 
left join instrutores i on t.fkinstrutores_id = i.id
where i.nome like "EDUARDO DE LIMA SOUZA";
-- -----------------
-- 3) Mostre o id da turma e a contagem de alunos por turma. 
-- -----------------
select t.id, t.nome, count(m.fkturmas_id) from turmas t 
inner join matriculas m on m.fkturmas_id = t.id
group by t.nome
having count(m.fkturmas_id)>0;
-- -----------------
-- 4) Mostre todas as informações dos instrutores 
-- e suas respectivas áreas de atuação. 
-- -----------------
select i.*, aat.nome_area from instrutores i left join area_atuacao aat 
on i.fkarea_atuacao_id = aat.id;
-- -----------------
-- 5) Mostre o nome de TODOS os instrutores e suas turmas.  
-- -----------------
select i.nome as "Nome_instrutor", t.nome as "Nome_turma" from turmas t 
left join instrutores i on t.fkinstrutores_id = i.id;
-- -----------------
-- 6) Faça uma consulta para mostrar o nome do instrutor 
-- e sua área de atuação, da turma do aluno 3.
-- -----------------
select i.nome as "Nome_instrutor", t.nome as "Nome_turma" from turmas t 
inner join instrutores i on t.fkinstrutores_id = i.id
inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome like "ABRAAO  MARTINEZ FREITAS";
-- ou (Prova Real)
select i.nome as "Nome_instrutor", t.nome as "Nome_turma", a.nome as "Nome_aluno" 
from turmas t inner join instrutores i on t.fkinstrutores_id = i.id
inner join matriculas m on m.fkturmas_id = t.id inner join alunos a on m.fkalunos_id = a.id
where a.nome like "ABRAAO  MARTINEZ FREITAS";
 -- -----------------
-- 7) Crie um procedimento para reajustar o valor do curso. 
-- O procedimento receberá o id do curso e a porcentagem do reajuste. 
 -- -----------------
UPDATE cursos set preco = preco + (preco * (10/100))
where id = 1;
 -- -----------------
 select * from cursos;
 -- -----------------
 DELIMITER $$
CREATE PROCEDURE procedure_curso_preco (id_curso INTEGER, preco_curso integer)
BEGIN
UPDATE cursos set preco = preco + (preco * (preco_curso/100))
where id = id_curso;
END $$
DELIMITER ;
-- ---------
DROP PROCEDURE procedure_curso_preco;
-- ---------
call procedure_curso_preco(1, 10);
-- ---------
-- 8) Faça um procedimento que mostre o nome do aluno, 
-- o nome de sua turma, do seu instrutor e do seu curso a partir do seu id. 
-- -----------------
select a.nome as "Nome_aluno", t.nome as "Nome_turma", i.nome 
as "Nome_instrutor", c.nome as "Nome_curso"  
from turmas t inner join instrutores i on t.fkinstrutores_id = i.id
inner join cursos c on t.fkcursos_id = c.id
inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.id = 1;
-- --------- 
 DELIMITER $$
CREATE PROCEDURE procedure_nome_aluno (id_aluno INTEGER)
BEGIN
select a.nome as "Nome_aluno", t.nome as "Nome_turma", i.nome 
as "Nome_instrutor", c.nome as "Nome_curso"  
from turmas t inner join instrutores i on t.fkinstrutores_id = i.id
inner join cursos c on t.fkcursos_id = c.id
inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.id = id_aluno;
END $$
DELIMITER ;
-- ---------
DROP PROCEDURE procedure_nome_aluno;
-- ---------
call procedure_nome_aluno(1);
-- ---------
-- 9) Faça um função para retornar o cpf com os . e o -. 
-- -----------------
DELIMITER $$
CREATE FUNCTION function_mostrar_cpf(CPF_aluno VARCHAR(14))
RETURNS VARCHAR(14)
BEGIN
RETURN( CONCAT(SUBSTR(CPF_aluno, 1,3), '.', 
SUBSTR(CPF_aluno, 4,3), '.', 
SUBSTR(CPF_aluno, 7,3), '-', 
SUBSTR(CPF_aluno, 10,2)));  
END $$ 
DELIMITER ;
-- ---------
drop function function_mostrar_cpf;
-- ---------
SELECT nome, function_mostrar_cpf(cpf) as cpf from alunos;
-- ---------
-- 10) Faça uma função que receba a data de nascimento 
-- do aluno e retorne a idade. OBS: considere apenas o ano. 
-- -----------------
select nome, 2020-year(data_nascimento) from alunos;
-- ---------
DELIMITER $$
CREATE FUNCTION function_idade(idade_alunos date)
RETURNS integer
BEGIN
RETURN(2020-year(idade_alunos));
END $$
DELIMITER ;
-- ---------
DROP FUNCTION function_idade;
-- ---------
SELECT function_idade(data_nascimento) as "Idade" from alunos;
-- ou (Prova Real)
SELECT nome, function_idade(data_nascimento) as "Idade" from alunos;
-- ---------
-- 11) Realize um SELECT com o nome, cpf e idade de todos os alunos, 
-- utilizando as funções criadas acima. 
-- -----------------
SELECT nome as "Nome_Aluno", function_mostrar_cpf(cpf) as "CPF", 
function_idade(data_nascimento) as "Idade" from alunos;
 -- -----------------
-- 12) Crie uma view com as informações das turmas e dos alunos que estão 
-- em qualquer uma das turmas que ‘Alan’ também esteja matriculado. 
-- (Os alunos podem ter mais de uma turma). 
 -- -----------------
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "ALAN RODRIGUES VINCLES  MATTOSO");
-- -----------------
create view viuew_talunoa as
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "ALAN RODRIGUES VINCLES  MATTOSO");
-- -----------------
select * from viuew_talunoa;
-- ou 
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "ALAN%");
 -- -----------------
create view viuew_talunoa_plus as
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "ALAN%");
-- -----------------
select * from viuew_talunoa_plus;
 -- -----------------
-- 13) Crie uma view com as informações das turmas e dos alunos que estão em todas 
-- as turmas que ‘Bruna’ também esteja matriculado. 
-- (Os alunos podem ter mais de uma turma). 
-- -----------------
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "BRUNA BENITES DE LIMA");
-- -----------------
create view viuew_talunob as
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "BRUNA BENITES DE LIMA");
-- -----------------
select * from viuew_talunob;
-- ou 
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "BRUNA%");
-- -----------------
create view viuew_talunob_plus as
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "BRUNA%");
-- -----------------
select * from viuew_talunob_plus;