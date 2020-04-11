create database DB_Escola_Prova;

Use DB_Escola_Prova;

create table estado(
codigo integer,
sigla varchar (2) not null,
nome varchar (40) not null,
constraint PK_Estado primary key (codigo));

create table cidade (
codigo integer,
nome varchar (60) not null,
cep integer,
habitantes integer,
codEstado integer,
constraint PK_Cidade primary key (codigo),
constraint FK_Cidade_Estado foreign key (codEstado) references estado (codigo));

create table endereco(
codigo integer,
rua varchar(60),
num integer,
bairro varchar(45),
codCidade integer not null,
constraint PK_Endereco primary key (codigo),
constraint FK_Endereco_Cidade foreign key (codCidade) references cidade(codigo));

create table aluno(
codigo integer,
nome varchar(60),
codEndereco integer,
constraint PK_Aluno primary key (codigo),
constraint FK_Aluno_Endereco foreign key (codEndereco) references endereco(codigo)); 

create table professor(
codigo integer,
nome varchar(60),
salario float, 
codEndereco integer,
constraint PK_Professor primary key (codigo),
constraint FK_Professor_Endereco foreign key (codEndereco) references endereco(codigo)); 

create table disciplina(
codigo integer,
nome varchar (70) not null,
cargahoraria integer,
constraint PK_Disciplina primary key (codigo));

create table turma(
codigo integer,
nome varchar (50) not null,
Ano integer not null,
semestre int,
constraint PK_Turma primary key (codigo));


create table turma_Aluno(
codigo integer,
codTurma integer not null,
codAluno integer not null,
constraint PK_Turma_Aluno primary key (codigo),
constraint FK_Turma_Aluno_Turma foreign key (codTurma) references turma (codigo),
constraint FK_Turma_Aluno_Aluno foreign key (codAluno) references Aluno (codigo));


create table Turma_professor_Disciplina(
codigo integer,
codTurma integer not null,
codProfessor integer not null,
codDisciplina integer not null,
constraint PK_Turma_Professor_Disciplina primary key (codigo),
constraint FK_Turma_Professor_Disciplina_Turma foreign key (codTurma) references turma (codigo),
constraint FK_Turma_Professor_Disciplina_Professor foreign key (codProfessor) references Professor (codigo),
constraint FK_Turma_Professor_Disciplina_Disciplina foreign key (codDisciplina) references Disciplina (codigo));

insert into estado (codigo, sigla, nome) values (1,'MS','Mato Grosso do Sul'),
												(2,'PR','Paraná'),
                                                (3,'SP','São Paulo'),
                                                (4,'MG','Minas Gerais'),
                                                (5,'RJ','Rio de Janeiro'),
                                                (6,'MT','Mato Grosso');

insert into cidade (codigo, nome, cep, codestado, habitantes) values (1,'Niterói',56765000,5,300),
														             (2,'Andirá',86350000,2, 25),
                                                                     (3,'Lavínia',75490000,3, 5),
														             (4,'Andradina',76400000,3,45),
																	 (5,'Presidente Prudente',70850000,3, 25),
                                                                     (6,'Três Lagoas',79550300,1,115),
                                                                     (7,'Brasilândia',77500000,1, 30),
                                                                     (8,'Úberaba', 35600060,4,30),
                                                                     (9,'Varginha',35650000,4,100),
                                                                     (10,'Água Clara',78900000,1, 3);
 

 
Insert into endereco(codigo, rua, num, bairro, codCidade) values (1,'Edelina Marechal Santos',234, 'São Paulo',2),
																 (2,'Margaridas',34, 'Jardim Primaveril',6),
                                                                 (3,'João Aragão',2234, 'Vila Nova',6),
                                                                 (4,'Carlos Simerato',777, 'Vila Nova',6),
                                                                 (5,'Edelina Marechal Santos',989, 'São Paulo',2),
                                                                 (6,'Maria Tanaka', 120, 'Jardim Eldorado', 6),
                                                                 (7,'Marcelina Meireles',110, 'Novo Horizonte',9),
                                                                 (8,'IV',340, 'Jardim Santo Amaro',7),
                                                                 (9,'4100',30, 'Centro',5),
                                                                 (10,'4150',44, 'Centro',5),
                                                                 (11,'1900',20, 'Centro',5),
                                                                 (12,'Clarinda Primeira',600, 'Jardim Cangalha',6),
                                                                 (13,'Raimunda Abudi',1206, 'Vila Cassilda',10),
                                                                 (14,'Hugo Pereira Neto',500, 'Vila Cassilda',10),
                                                                 (15,'Angelina Albuquerque',777, 'Lordani',2),
                                                                 (16,'Sebastião Pedroso Filho',345, 'Vila Rubi',6),
                                                                 (17,'Sebastião Juventino Saraiva',889, 'Vila Esmeralda',7),
                                                                 (18,'Kalil Domingues',445, 'Lordani',7),
                                                                 (19,'Amil Riballo',987, 'Vila Ipacarai',6),
                                                                 (20,'Jurandir Afonso Filho',231, 'Jardim Florido',6),
                                                                 (21,'Juarez  Silvestrini',585, 'Jardim Eldorado',6),
                                                                 (22,'João Bosco',333, 'Vila Congro',6),
                                                                 (23,'Ricardina Silva',668, 'Jardim Violeta',6),
															(24,'Pedrina Araújo',787, 'Jardim Jasmim',6),
                                                                 (25,'Antônia Mendes',222, 'Jardim Nova Subida',6),
                                                                 (26,'Quinze',977, 'Lordani',2),
                                                                 (27,'Treze',777, 'Jardim Jasmim',6),
                                                                 (28,'Aparecido Vilela',991, 'Jardim Jasmim',6),
                                                                 (29,'Jurandir Afonso Filho',450, 'Jardim Florido',6),
                                                                 (30,'Jurandir Afonso Filho',665, 'Jardim Florido',6),
                                                                 (31,'Aparecido Vilela',119, 'Jardim Jasmim',6),
                                                                 (32,'Treze',177, 'Jardim Jasmim',6),
                                                                 (33,'Valentina Tiberes',1023, 'Jardim Florido',6),
                                                                 (34,'Treze',109, 'Jardim Florido',6),
                                                                 (35,'Thomé',1223, 'Jardim Florido',6),
                                                                 (36,'Amil Riballo',234, 'Vila Ipacaraí',6);
                                                                 
                                                                 
Insert into aluno (codigo, nome, codEndereco) values (10,'Carla Maiara Rodrigues',8),  (11,'Benício Lúcio Gonçalves',17),
													 (12,'Vinícius Costa Lima',1),     (13,'João Vitor Ferracin',18),
                                                     (14,'Maiara Judite Santos',2),    (15,'Rodrigo da Silva Soares',19),
                                                     (16,'Carlos Henrique Nogueira',3),(17,'Marcos Alexandre Vicente',20),
                                                     (18,'Márcia Maria Silveira',5),   (19,'Cauan Henrique Soares',21),
                                                     (20,'Helena Maria Santiago',6),   (21,'Katiane Pelissari',22),
                                                     (22,'Henrique Tuffano',7),        (23,'Mariza Aparecida Dorta',23),
                                                     (24,'Vanessa Sukishira Santos',2),(25,'Claudinéia Oliveira',24),
                                                     (26,'Valeria Sukishira Santos',2),(27,'Viviane Lazarini',25),
                                                     (28,'Augusto Vieira',8),          (29,'Fabiana Quintino',26),
                                                     (30,'Edson Carlos Vieira',9),     (31,'Eduardo dos Passos',4),
                                                     (32,'Júnior Xavier',10),          (33,'Ricardo do Passos',4),
                                                     (34,'Gabrielli Locateli',12),     (35,'Thiago Henrique oliveira',27),
                                                     (36,'Tiago Henrique Locateli',12),(37,'Alex Turcato',28),
                                                     (38,'Jean Carlo Lucateli',12),    (39,'Silvio José Guerreiro',29),
                                                     (40,'Clarissa Lage Ferreira',13), (41,'Humberto dos Santos',30),
                                                     (42,'Juliana Pires Soares',14),   (43,'Ana Marta da Silva',31),
                                                     (44,'Maria Eduarda Junqueira',15),(45,'Tatiane Lorão',32);
                                             
Insert into professor(codigo, nome, codendereco, salario) values (1,'Maria Eduarda Pereira',11, 6000),  
														(2,'Adriana Bellomo',33, 8000),
                                                        (3,'Amanda Gabriela Correia',16, 1000),
                                                        (4,'Max Carlos dos Santos',34, 3000),
                                                        (5,'Maria José Aragão dos Passos',4, 4100),
                                                        (6,'Daniel dos Passos',4, 2200),
                                                        (7,'Anderson Locateli',12, 3300),
                                                        (8,'Marília Locateli',12, 6500),
                                                        (9,'Jussara Maria Santos',2, 5500),
                                                        (10,'Joào Paulo Santos',2, 5000),
                                                        (11,'Carlinhos Sanches', 36, 4500);

 
Insert into disciplina (codigo, nome, cargahoraria) values (1, 'Banco de dados 1', 100),
                                                    (2, 'Banco de dados 2', 80),
                                                    (3, 'Linguagem de Programação 1', 120),
                                                    (4, 'Linguagem de Programação 2', 100),
                                                    (5, 'Linguagem de Programação 3', 80),
                                                    (6, 'Estrutura de dados', 100),
                                                    (7, 'Engenharia de Software 1', 80),
                                                    (8, 'Engenharia de Software 2', 60),
                                                    (9, 'Desenvolvimento de Páginas Web 1', 120),
                                                    (10, 'Desenvolvimento de Páginas Web 2', 100);
                                                    
Insert into turma (codigo, nome, ano, semestre) values (1,'TSI 1',2017,1),
													   (2,'TSI 2',2017,1),
                                                       (3,'TSI 3',2017,1),
                                                       (4,'TSI 4',2017,1),
                                                       (5,'TSI 5',2017,1),
                                                       (6,'TADS 1',2017,1),
                                                       (7,'TADS 2',2017,1),
                                                       (8,'TADS 3',2017,1),
                                                       (9,'TADS 4',2017,1);
                                                        
Insert into turma_professor_disciplina(codigo, codTurma, coddisciplina, codprofessor) 
values 
(1, 6, 3, 1), 
(2, 6, 7, 6), 
(3, 6, 9, 3), 
(4, 1, 3, 1), 
(5, 1, 7, 4), 
(6, 1, 9, 9),
(7, 7, 8, 2), 
(8, 7, 4, 7), 
(9, 7, 1, 1), 
(10, 2, 8, 8), 
(11, 2, 4, 5), 
(12, 2, 1, 9),
(13, 8, 2, 3), 
(14, 8, 10, 9), 
(15, 8, 5, 2), 
(16, 3, 2, 7), 
(17, 3, 8, 7), 
(18, 3, 5, 9),
(19, 9, 10, 5), 
(20, 4, 10, 5);
                                                                     
Insert into turma_Aluno (codigo, codturma, codaluno) values 
(1,1, 45),
(2,1, 44),
(3,1, 43),
(4,1, 42),
(5,1, 41),
(6,1, 40),
(7,1, 39),
(8,1, 38),
(9,6, 37),
(10,6, 36),
(11,6, 35),
(12,6, 34),
(13,6, 33),
(14,2, 32),
(15,2, 31),
(16,2, 36),
(17,7, 30),
(18,7, 29),
(19,4, 28),
(20,4, 27),
(21,4, 26),
(22,4, 25),
(23,4, 26),
(24,4, 25),
(25,4, 24),
(26,4, 23),
(27,8, 22),
(28,8, 21),
(29,8, 20),
(30,8, 19),
(31,8, 18),
(32,8, 17),
(33,9, 16),
(34,9, 15),
(35,9, 14),
(36,9, 13),
(37,9, 12),
(38,5, 11),
(39,5, 10);



-- 1.	Mostre o nome de todos os alunos que não estão ligados a nenhuma disciplina. (1.5)

select nome from aluno
where codigo not in(
select distinct(a.codigo)
from aluno a, turma_aluno ta,
turma_professor_disciplina tpd
where  a.codigo=ta.codAluno
and ta.codTurma=tpd.codTurma);


select aluno.nome, disciplina.nome from disciplina, turma_professor_disciplina, turma, turma_aluno, aluno
where disciplina.codigo = turma_professor_disciplina.codDisciplina and turma.codigo = turma_aluno.codTurma 
and turma_aluno.codAluno = aluno.codigo and aluno.codigo not like disciplina.nome order by aluno.nome asc;

select aluno.nome from disciplina, turma_professor_disciplina, turma, turma_aluno, aluno
where disciplina.codigo = turma_professor_disciplina.codDisciplina and turma.codigo = turma_aluno.codTurma 
and turma_aluno.codAluno = aluno.codigo and aluno.codigo not in (select disciplina.nome from disciplina);

-- 2.	Mostre a quantidade de alunos que moram no estado do PR. (1.5)

select count(*) from aluno, endereco, cidade, estado
where aluno.codEndereco = endereco.codigo and endereco.codCidade = cidade.codigo
and cidade.codEstado = estado.codigo and estado.sigla like 'PR';

select distinct(sigla) from estado;

-- 7.	Altere o nome do Estudante de código 32 para Júnior Pereira Xavier. (1.5)
UPDATE `db_escola_prova`.`aluno` SET `nome` = 'Júnior Pereira Xavier' WHERE (`codigo` = '32');
select codigo, nome from aluno;


-- 3.	Mostre, ordenado pelo nome do aluno de forma crescente, o nome dos alunos e seu respectivo endereço (completo). (1.0)
select aluno.nome, cidade.nome, cidade.cep, estado.nome, estado.sigla, endereco.bairro, endereco.num from aluno, endereco, cidade, estado
where aluno.codEndereco = endereco.codigo and endereco.codCidade = cidade.codigo
and cidade.codEstado = estado.codigo order by aluno.nome asc;


-- 5.	Mostre o nome de todos os professores que moram em Três Lagoas ordenados de Z a A. (1.5)

select professor.nome, cidade.nome, cidade.cep, estado.nome, estado.sigla, endereco.bairro from professor, endereco, cidade, estado
where professor.codEndereco = endereco.codigo and endereco.codCidade = cidade.codigo
and cidade.codEstado = estado.codigo and cidade.nome like 'Três Lagoas' order by professor.nome desc;


-- 6.	Mostre o nome de todos os estudantes que estão ligados a disciplina de Banco de Dados 1, em ordem alfabética. (1.0)

select aluno.nome, disciplina.nome from disciplina, turma_professor_disciplina, turma, turma_aluno, aluno
where disciplina.codigo = turma_professor_disciplina.codDisciplina and turma.codigo = turma_aluno.codTurma 
and turma_aluno.codAluno = aluno.codigo and disciplina.nome like 'Banco de Dados 1' order by aluno.nome ASC;

-- 4. 
