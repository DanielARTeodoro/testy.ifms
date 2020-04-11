
create database locadora;


create database Escola;

use Escola;

create table aluno(
RA int not null auto_increment,
Nome varchar(30) not null,
DataNasc date not null,
constraint pk_aluno primary key(RA)
);


-- Criando tabela disciplina
create table disciplina(
 codigo int not null auto_increment,
 nome varchar(30) not null,
 cargaHoraria int(4) not null,
 constraint pk_disciplina primary key(codigo)
);
-- Criando tabela professor
create table professor(
    codigo INT NOT NULL auto_increment,
    codigoEspecialidade INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    salario DOUBLE NOT NULL,
    DataFormacao DATE NOT NULL,
    CONSTRAINT pk_professor PRIMARY KEY (codigo),
    CONSTRAINT fk_Especialidade FOREIGN KEY (codigoEspecialidade)
        REFERENCES especialidade (codigo)
);

-- Criando tabela especialidade
create table especialidade(
codigo int not null auto_increment,
nome varchar(30) not null,
humanas varchar(20),
constraint pk_especialidade primary key(codigo)
);

-- Criando tabela turma
create table Turma(
Codigo int not null,
CodAluno int not null,
CodDisciplina int not null,
CodProfessor int not null,
constraint pk_Turma primary key(Codigo),
CONSTRAINT fk_Professor FOREIGN KEY (CodProfessor) REFERENCES Professor(Codigo),
CONSTRAINT fk_Disciplina FOREIGN KEY (CodDisciplina) REFERENCES Disciplina(Codigo),
CONSTRAINT fk_Aluno FOREIGN KEY (CodAluno) REFERENCES Aluno(RA)
);

-- Criando tabela Inf
create table Inf(
id_inf int not null auto_increment,
constraint pk_id_inf primary key(id_inf)
);

-- Criando tabela Intem
create table Intem(
id_intem int not null auto_increment,
constraint pk_id_intem primary key(id_intem)
);

-- Criando tabela Produto
create table Produto(
cod_produto int not null auto_increment,
id_inf int not null,
id_intem int not null,
valor_unt float not null,
quantidade int not null,
desconto decimal not null,
constraint pk_cod_produto primary key(cod_produto),
CONSTRAINT fk_inf FOREIGN KEY (id_inf)
REFERENCES Inf (id_inf),
CONSTRAINT fk_id_intem FOREIGN KEY (id_intem)
REFERENCES Intem (id_intem)
);




-- Inserindo dados na tabela aluno
INSERT INTO aluno(RA, Nome, DataNasc)
VALUES( 110 , "Ana Carla Sella", '1990-01-31'),
	  ( 111 , "Carla Rodrigues", '1990-12-31'),
      ( 112 , "Pietro Henrique Sá" , '1991-10-10'),
      ( 113 , "Janete Souza Neta" , '1990-07-08'),
      ( 114 , "Júlio César Xavier", '1991-09-17'),
      ( 115 , "Fabrícia Lordane", '1990-03-11'),
      ( 116 , "Patrício Junqueira", '1991-08-11'),
      ( 117 , "Brian Pereira Silva", '1991-07-17'),
      ( 118 , "Cássia Martins", '1991-06-18'),
      ( 119 , "Cláudio Martins", '1991-06-18'),
      ( 120 , "Cristina Sanches", '1990-02-20'),
      ( 121 , "Angela Carreira", '1980-03-30');
      
-- Inserindo dados na tabela disciplina
insert into disciplina(codigo, nome, cargaHoraria)
values( 1 , "Matemática 1", 100),
	  ( 2 , "Português 1", 120),
      ( 3 , "Inglês 1" , 60),
      ( 4 , "Física 1" , 60),
      ( 5 , "Biologia 1", 60),
      ( 6 , "Geografia 1", 60),
      ( 7 , "Quimíca 1" , 40),
      ( 8 , "Espanhol 1", 60),
      ( 9 , "História 1", 40),
      ( 10, "Matemática 2", 100),
      ( 11, "Português 2" , 100),
      ( 12, "Inglês 2" , 40);
      
-- Inserindo dados tabela de especialidade
insert into especialidade(codigo, nome, humanas)
values( 1 , "Matemática ", 0),
	  ( 2 , "Português ", 1),
      ( 3 , "História Nacional" , 1),
      ( 4 , "História Internacional" , 1),
      ( 5 , "Inglês instrumental", 1),
      ( 6 , "Inglês Avançado", 1),
      ( 7 , "Física" , 0),
      ( 8 , "Biologia Animal", 0),
      ( 9 , "Biologia Vegetal", 0),
      ( 10, "Espanhol", 1),
      ( 11, "Quimica" , 0),
      ( 12, "Geografia" , 1);
      
-- Iserindo dados na tabela Professor
insert into professor(codigo, nome ,codigoEspecialidade, DataFormacao, salario)
values( 1 , "Gilmar Santiago", 12 , '2005-08-07', 1000),
	  ( 2 , "Kleber Fonseca" , 3, '2005-10-12', 2000),
      ( 3 , "Jerusa Maria Pereira", 9, '2006-08-07', 3000),
      ( 4 , "Thiago Santos Padilha", 11, '2008-08-15', 1000),
      ( 5 , "Michella Cristina Berner", 2, '2004-08-10', 1000),
      ( 6 , "Érica Junqueira Pereira", 5, '2010-07-05', 2000),
      ( 7 , "Angela Carreira", 3, '2003-08-05', 2000),
      ( 8 , "Elaine Clarisse Correia", 1, '2003-08-05', 2000);
      
      
 --  Inserindo dados na tabela turma   
insert into turma(codigo, codAluno, CodDisciplina, CodProfessor)
values( 1 , 120 , 1 , 8),
	  ( 2 , 120 , 3 , 6),
	  ( 3 , 120 , 10 , 8),
	  ( 4 , 120 , 11 , 5),
	  ( 5 , 120 , 12 , 6),
	  ( 6 , 110 , 10 , 4),
	  ( 7 , 110 , 11 , 5),
	  ( 8 , 110 , 12 , 6),
	  ( 9 , 111 , 9 , 1),
	  ( 10 ,112 , 9 , 1),
	  ( 11 ,113 , 9 , 1),
	  ( 12 ,113 , 4 , 7),
	  ( 13 ,118 , 5 , 3),
      ( 14 ,118 , 1 , 8),
	  ( 15 ,118 , 2 , 5),
	  ( 16 ,118 , 4 , 7),
	  ( 17 ,119 , 5 , 4),
	  ( 18 ,119 , 1 , 8),
      ( 19 ,119 , 2 , 5),
	  ( 20 ,119 , 4 , 7),
      ( 21 ,117 , 1 , 8),
	  ( 22 ,117 , 2 , 5),
	  ( 23 ,117 , 3 , 6),
	  ( 24 ,117 , 4 , 7),
      ( 25 ,117 , 5 , 4),
	  ( 26 ,117 , 6 , 2),
	  ( 27 ,117 , 7 , 4),
	  ( 28 ,117 , 10 , 8),
	  ( 29 ,117 , 11 , 5),
      ( 30 ,117 , 12 , 6),
	  ( 31 ,121 , 1 , 8);
      
--  Inserindo dados na tabela Inf
--  Inserindo dados na tabela Item
--  Inserindo dados na tabela Produto  
      
-- Selecionando tabelas
select * from  disciplina;
select * from turma;
select * from aluno;
select * from especialidade;
select * from professor;

-- Selecionando maio e menor salário
select max(salario) from professor;
select min(salario) from professor;

-- Reunir os dados do aluno e relacionar com o professor e colocar em ordem anti alfabetica

select max(cargaHoraria) from disciplina;
select min(cargaHoraria) from disciplina;

select * from aluno order by nome;

select * from disciplina
where cargahoraria = 60;

select * from disciplina
where cargahoraria > 60;

select * from disciplina
where cargahoraria < 60;

Select distinct(p.nome)
from professor p, turma t, disciplina d
where p.cod_professor = t.Cod_Professor
and t.Cod_Disciplina = d.Cod_disciplina
and d.nome = 'Historia1';

Select nome
from especialidade
order by nome desc;

select d.nome
from disciplina d, turma t, aluno a;

(select e.codEspecialidade
from especialidade e, professor p
where e.codEspecialidade = p.CodEspecialidade);

Select disting(p.nome)
from professor p, turma t
where p.codProfessor = t.CodProfessor;

select avg(salario) from professor;

select max(salario) from professor;

select min(salario) from professor;

select e.humanas, avg(p.salario)
from professor p, especialidade e
where p.codigoespecialidade = e.codigo
group by e.humanas;

select count(codigo) from especialidade;

select sum(salario) from professor;

Select distinct(p.nome)
from professor p, turma t, disciplina d
where p.codProfessor = t.CodProfessor
and t.CodDisciplina = d.Coddisciplina
and d.nome = '%História 1%';

select p.nome, e.nome, p.salario 
from professor p, especialidade e
where p.codigoEspecialidade = e.codigo 
and e.nome like '%Matemática%';

-- select p.nome, d.nome, t.codigo
-- from professor p, turma t, disciplina d,
-- where p.codigoDisciplina = d.codigo 
-- and d.nome like '%Historia 1%';

select p.nome, a.nome, d.disciplina 
from professor p, especialidade e
where p.codigoEspecialidade = e.codigo 
and e.nome like '%Matemática%';

select p.nome, p.salario from professor p
join especialidade e on e.cod_especialidade=
p.cod_especialidade
where e.nome = 'Matematica'
order by p.nome;

select p.nome, e.nome, p.salario 
from professor p, especialidade e
where p.codigoEspecialidade = e.codigo 
and e.nome like '%Matemática%';



select aluno.nome, disciplina.nome from aluno, turma, disciplina 
where disciplina.nome = "Inglês 1";

CREATE VIEW vw_prof AS SELECT professor.nome, professor.salario FROM professor;
CREATE VIEW vw_al AS SELECT distinct(aluno.Nome), aluno.DataNasc 
from aluno order by aluno.Nome ASC;
SHOW TABLES;
select * from vw_prof, vw_al;
DROP VIEW vw_prof, vw_al;

select nome from professor;

-- ---------------------

-- CREATE VIEW view_aluni_ingles AS 
SELECT aluno.nome, disciplina.nome from aluno, turma, disciplina 
where disciplina.nome = "Inglês 1"  and (select aluno.nome, disciplina.nome 
from aluno, turma, disciplina 
where disciplina.nome = "Inglês 2");

select aluno.nome, disciplina.nome from aluno, turma, disciplina 
where disciplina.nome = "Inglês 1" and disciplina.nome = "Inglês 2";

-- select cont(DataNasc) 
-- from aluno 
-- where aluno.DataNasc = "80";

select nome from aluno
where nome in(select nome from professor);

-- 21
Create or replace view AlunoIngles AS
select a.ra, a.nome from aluno a, turma t, disciplina d
where a.ra = t.codaluno
and t.CodDisciplina = d.codigo
and d.nome = 'Ingles 2'
and a.ra in(select aluno.ra from aluno, turma, disciplina
	where aluno.ra=turma.codaluno
    and turma.CodDisciplina = disciplina.codigo
    and disciplina.nome = 'Ingles 1');


select * from AlunoIngles;

SELECT `alunoingles`.`ra`,
    `alunoingles`.`nome`
FROM `escola`.`alunoingles`;


Delimiter $$
Create procedure RetornaProfGeografia1 (IN Nome Varchar(50))
Begin
select p.nome, e.nome from professor p
join especialidade e on e.codigo =  p.codigoEspecialidade
where e.nome = Nome;
end $$
delimiter ;

select p.nome, e.nome from professor p
join especialidade e on e.codigo =  p.codigoEspecialidade
where e.nome = Nome;

CREATE PROCEDURE pro_exp ()
BEGIN
select * from aluno
END;

/*
Delimiter $$ 
Create or Replace Procedure RetornaCalculoCH(IN NomeProfessor Varchar(50))
Begin
Select sum(cargaHoraria) from disciplina d 
join turma t on t.codDisciplina = d.codigo
join professor p on p.codigo = t.codProfessor
where p.nome = NomeProfessor; 
-- grup by t.codProfessor; 
end $$
delimiter ;
*/
Delimiter $$ 
Create Procedure RetornaCalculoCH(IN NomeProfessor Varchar(50))
Begin
Select sum(cargaHoraria) from disciplina d 
join turma t on t.codDisciplina = d.codigo
join professor p on p.codigo = t.codProfessor
where p.nome = NomeProfessor; 
-- grup by t.codProfessor; 
end $$
delimiter ;

Delimiter $$ 
Create Procedure RetornaCalculoCHP(IN NomeProfessor Varchar(50))
Begin
Select sum(cargaHoraria), p.nome from disciplina d 
join turma t on t.codDisciplina = d.codigo
join professor p on p.codigo = t.codProfessor
where p.nome = NomeProfessor; 
end $$
delimiter ;
select nome from professor;
select salario + (salario * 0.2) from professor where nome = NomeProfessor;

Delimiter $$ 
Create Procedure RetornaCalculoCHPS(IN NomeProfessorPS Varchar(50))
Begin
select salario * 1.2 as 'Salario'  from professor p 
where nome = NomeProfessorPS;
end $$
delimiter ;

call RetornaCalculoCH;

CALL RetornaCalculoCHPS ('Kleber Fonseca');

Select sum(cargaHoraria) from disciplina d 
join turma t on t.codDisciplina = d.codigo
join professor p on p.codigo = t.codProfessor
where p.nome = "Gilmar Santiago";

select d.cargaHoraria from disciplina d; 

 select aluno.Nome as Nome, floor(datediff(now(), aluno.DataNasc) /365) as Idade 
 from aluno where RA = "116";
 
 select Ra, Nome from aluno;
 /*
 Delimiter $$ 
 CREATE FUNCTION `function_idade` (idades integer)
RETURNS INTEGER
BEGIN
 select aluno.Nome as Nome, 
 floor(datediff(now(), aluno.DataNasc) /365) as Idade 
 from aluno where idades = RA;
RETURN idades;
END
Delimiter $$;

Delimiter //;
CREATE FUNCTION `function_idade` (idades integer)
RETURNS INTEGER
BEGIN
select floor(datediff(now(), aluno.DataNasc) /365) as Idade 
 from aluno where idades = RA;
RETURN idades;
END
Delimiter //;
*/

select DATE_FORMAT(aluno.DataNasc, '%d/%m/%Y') AS Nascimento, 
TRUNCATE(DATEDIFF(NOW(), aluno.DataNasc)/365.25, 0) AS Idade 
from aluno where aluno.RA = "111";

SELECT TIMESTAMPDIFF(YEAR, aluno.DataNasc, CURRENT_DATE) as idade 
FROM aluno;


drop Function function_idade;
DELIMITER $$
CREATE FUNCTION function_idade(id integer)
RETURNS INTEGER
BEGIN
declare idade integer;
set idade = (
select floor(datediff(curdate() , DataNasc)/365.25) from aluno 
where RA = id);
RETURN idade;
END;
$$ DELIMITER ;
select function_idade(111);



