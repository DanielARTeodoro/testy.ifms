-- Criando banco de dados
create database escola;
use escola;
-- Criando tabela aluno
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
 cargaHoraria varchar(4) not null,
 constraint pk_disciplina primary key(codigo)
);
-- Criando tabela professor
CREATE TABLE professor (
    codigo INT NOT NULL auto_increment,
    codigoEspecialidade INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    salario DOUBLE NOT NULL,
    DataFormacao DATE NOT NULL,
    CONSTRAINT pk_professor PRIMARY KEY (codigo),
    CONSTRAINT fk_Especialidade FOREIGN KEY (codigoEspecialidade)
        REFERENCES epecialidade (codigo)
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
      ( 120 , "Cristina Sanches", '1990-02-20');
      
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
      ( 30 ,117 , 12 , 6);
      
-- Selecionando tabelas
select * from  disciplina;
select * from turma;
select * from aluno;
select * from especialidade;
select * from professor;

-- Selecionando maio e menor salário
select max(salario) from professor;
select min(salario) from professor;





select avg(salario)from professor;
select max(salario) from professor;
select min(salario) from professor;