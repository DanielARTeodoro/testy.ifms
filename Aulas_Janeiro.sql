-- -------------- Tutorial ---------------
create database bd_meu_banco;
use bd_meu_banco;
drop database bd_meu_banco;
create table nome_tabela(
coluna1 int not null primary key auto_increment,
coluna2 varchar(20),
coluna3 varchar(20),
colunaN int (9)
);
select * from nome_tabela;
create database meu_banco;
use meu_banco;
create table dados_pessoais(
nome varchar(50),
idade integer,
altura double
);
select dp.nome as "Nome", dp.idade as "Idade", dp.altura as "Altura" 
from dados_pessoais dp;
drop table dados_pessoais;
insert into dados_pessoais (nome, idade, altura)
values ("Dani", 17, 1.69);
select * from dados_pessoais;
alter table dados_pessoais
ADD Ra int not null primary key auto_increment;
UPDATE dados_pessoais SET idade = 24 WHERE codigo = 1;
alter table dados_pessoais
ADD observacoes varchar (60);
DELETE FROM dados_pessoais WHERE codigo = 2;
insert into dados_pessoais (Ra, nome, idade, peso, altura, observacoes)
values (default,"Dani", 17, 63.795, 1.69, "Jovem Dinamico");
select dp.Ra as "RA", dp.nome as "Nome", dp.idade as "Idade", dp.peso as "Peso", dp.altura as "Altura", dp.observacoes as "Observações" 
from dados_pessoais dp;
ALTER TABLE dados_pessoais
MODIFY Ra int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
UPDATE dados_pessoais SET idade = 24 WHERE codigo = 1;
alter table dados_pessoais ADD peso double after idade;
alter table dados_pessoais modify Ra int not null auto_increment first;
alter table dados_pessoais drop Ra;
create table aluno(
nome varchar(50),
idade integer,
altura double,
ano_matricula integer default 2020
);
drop table aluno;
select * from aluno;
insert into aluno (nome, idade, altura, ano_matricula)
values ("Dani", 17, 1.69, default);
create table aluno(
Ra int not null primary key auto_increment,
nome varchar(50) unique,
idade integer,
altura double,
ano_matricula integer default 2020
);
ALTER TABLE aluno
MODIFY Ra int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
insert into aluno (Ra, nome, idade, altura, ano_matricula)
values (default, "Dani", 17, 1.69, default);
select * from aluno;
create database empresa_x;
use empresa_x;
create table area_atuacao(
id int primary key auto_increment,
area_atuacao varchar(60) not null unique,
bonus_salario integer
);
ALTER TABLE area_atuacao
MODIFY id int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
select * from area_atuacao;
drop table area_atuacao;
insert into area_atuacao (id, area_atuacao, bonus_salario)
values (default, "Ciència da computação", 30),
	   (default, "Agronomia", 10),
       (default, "Engenharia", 15),
	   (default, "Enfermagem", 29);
select aat.id as "ID", aat.area_atuacao as "Área Atuação", aat.bonus_salario as "Bonus Salario" 
from area_atuacao aat;
create table endereco (
id integer primary key auto_increment,
nome_rua varchar(60) not null,
cidade varchar(60) default 'Três Lagoas',
cep varchar(10),
numero_inical integer,
numero_final integer
);
ALTER TABLE endereco
MODIFY id int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
drop table endereco;
insert into endereco (id, nome_rua, cidade, cep, numero_inical, numero_final)
values (default, "Avenida Dos Apaixonados", default, "101390109", 11, 19),
	   (default, "Jardim do Amor Eterno", default, "787368181", 55, 59),
       (default, "Rua Paixão Ardente", default, "6473663883", 75, 95);
select * from endereco;
select e.id as "ID", e.nome_rua as "Nome Rua", e.cidade as "Cidade", e.cep as "CEP", e.numero_inical as "Número Inical", 
e.numero_final as "Número Final"
from endereco  e;
create table pessoa(
id integer not null primary key auto_increment,
cpf varchar(14) unique,
nome varchar(60),
idade integer,
renda_familiar float,
numero integer default 0,
area_Atuacao integer,
endereco integer,
constraint fk_area_Atuacao foreign key (area_Atuacao) references area_atuacao (id),
constraint fk_endereco foreign key (endereco) references endereco (id)
);
drop table pessoa;
select * from pessoa;
ALTER TABLE pessoa
MODIFY id int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
insert into pessoa (id, cpf, nome, idade, renda_familiar, numero, endereco, area_Atuacao)
values (default, "13569380912", "Dani Zagueruga", 17, 1500, default, 595, 959),
	   (default, "37384098129", "Susu Kimura", 15, 3500, default, 595, 959),
       (default, "48483876520", "Moka Akashya", 19, 5500, default, 595, 959),
	   (default, "37382659368", "Yumi Nagato", 21, 7500, default, 595, 959),
       (default, "47352849339", "Mia Zaraki", 23, 9500, default, 595, 959);
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", 
pe.renda_familiar as "Renda Familiar", pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco"
from pessoa pe;
-- ----------------
select aat.id as "ID", aat.area_atuacao as "Área Atuação", aat.bonus_salario as "Bonus Salario" 
from area_atuacao aat;
select e.id as "ID", e.nome_rua as "Nome Rua", e.cidade as "Cidade", e.cep as "CEP", e.numero_inical as "Número Inical", 
e.numero_final as "Número Final"
from endereco  e;
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", 
pe.renda_familiar as "Renda Familiar", pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco"
from pessoa pe;
-- -------------- Nivel 0 ---------------
alter table endereco ADD numero double after cep;
insert into endereco (id, nome_rua, cidade, cep, numero)
values (default, "Eloy Chaves", default, "79602-003", 1110),
       (default, "Filinto Müller", default, "79600-003", 1153),
	   (default, "Antônio Trajano dos Santos", default, "79645-182", 2802),
       (default, "Egidio Thomé", default, "79600-150", 383);
select e.id as "ID", e.nome_rua as "Nome Rua", e.cidade as "Cidade", e.cep as "CEP", e.numero as "Número"
from endereco  e;
insert into pessoa (id, cpf, nome, idade, renda_familiar, numero, endereco, area_Atuacao)
values (default, "12345678910", "Miguel Davi", 19, 500.00, default, 1, 2),
	   (default, "10987654321", "Maria Eduarda", 45, 4500.00, default, 4, 2),
       (default, "34521768903", "João Pedro", 23, 3800.00, default, 3, 3),
       (default, "45786943039", "Ana Clara", 76, 1000.00, default, 2, 4);
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", pe.renda_familiar as "Renda Familiar"
, pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco"
from pessoa pe;
-- ---------- Prática -----------
-- 1), 2), 3) Faça uma consulta de todos os dados da tabelas: pessoa, area_atuacao e endereco ----------
-- --------- 3) endereco ------
select e.id as "ID", e.nome_rua as "Nome Rua", e.cidade as "Cidade", e.cep as "CEP", e.numero as "Número"
from endereco  e;
-- ou
select * from endereco;
-- --------- 1) pessoa ------
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", pe.renda_familiar as "Renda Familiar"
, pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco"
from pessoa pe;
-- ou
select * from pessoa;
-- --------- 2) area_atuacao ------
select aat.id as "ID", aat.area_atuacao as "Área Atuação", aat.bonus_salario as "Bonus Salario" 
from area_atuacao aat;
-- ou
select * from area_atuacao;
-- 4) -------
select pe.nome as "Nome", pe.cpf as "CPF", pe.idade as "Idade"
from pessoa pe order by CPF desc;
-- ou 
select pe.nome as "Nome", pe.cpf as "CPF", pe.idade as "Idade"
from pessoa pe order by pe.cpf desc;
-- 5) -------
select aat.id as "ID", aat.area_atuacao as "Área Atuação", aat.bonus_salario as "Bônus Salario" 
from area_atuacao aat where aat.bonus_salario > 20;
-- ou
select * from area_atuacao aat where aat.bonus_salario > 20;
-- 6) ---------
select aat.id as "ID", aat.area_atuacao as "Área Atuação", aat.bonus_salario as "Bônus Salario" 
from area_atuacao aat where aat.area_atuacao like 'E%' and aat.bonus_salario > 20;
-- ou
select * from area_atuacao aat where aat.area_atuacao like 'E%' and aat.bonus_salario > 20;
-- 7) -----
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", pe.renda_familiar as "Renda Familiar"
, pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco"
from pessoa pe where pe.renda_familiar >= 1000.00 and pe.renda_familiar <= 5000.00;
-- ou
select * from pessoa pe where pe.renda_familiar >= 1000.00 and pe.renda_familiar <= 5000.00;
-- ou 
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", pe.renda_familiar as "Renda Familiar"
, pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco"
from pessoa pe where pe.renda_familiar between 1000.00 and 5000.00;
-- ou
select * from pessoa pe where pe.renda_familiar between 1000.00 and 5000.00;
-- ------------
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", pe.renda_familiar as "Renda Familiar"
, pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco", aat.area_atuacao as "Área Atuação"
from pessoa pe inner join area_atuacao aat on pe.area_Atuacao = aat.id;
-- ou
select pe.*, aat.area_atuacao from pessoa pe inner join area_atuacao aat on pe.area_Atuacao = aat.id;
-- ou 
select pe.cpf as "CPF", pe.nome as "Nome", pe.idade as "Idade", pe.renda_familiar as "Renda Familiar"
, pe.numero as "Número", pe.area_Atuacao as "Area Atuacao", pe.endereco as "Endereco", aat.area_atuacao as "Área Atuação"
from pessoa pe, area_atuacao aat where pe.area_Atuacao = aat.id;
-- ou
select pe.*, aat.area_atuacao from pessoa pe, area_atuacao aat where pe.area_Atuacao = aat.id;
-- -----------
select pe.nome as "Nome", pe.cpf as "CPF", pe.idade as "Idade", aat.area_atuacao as "Área Atuação", 
aat.bonus_salario as "Bonus Salario", e.nome_rua as "Nome Rua", pe.numero as "Número"
from pessoa pe inner join area_atuacao aat 
inner join endereco e on pe.area_Atuacao = aat.id and pe.endereco = e.id 
where pe.idade > 20 order by pe.idade desc;
-- ou
select pe.nome, pe.cpf, pe.idade, aat.area_atuacao, aat.bonus_salario, e.nome_rua, pe.numero 
from pessoa pe inner join area_atuacao aat 
inner join endereco e on pe.area_Atuacao = aat.id and pe.endereco = e.id 
where pe.idade > 20 order by pe.idade desc;
-- ou 
select pe.nome as "Nome", pe.cpf as "CPF", pe.idade as "Idade", aat.area_atuacao as "Área Atuação", 
aat.bonus_salario as "Bonus Salario", e.nome_rua as "Nome Rua", pe.numero as "Número"
from pessoa pe, area_atuacao aat, endereco e
where pe.area_Atuacao = aat.id 
and pe.endereco = e.id 
and pe.idade > 20 
order by pe.idade desc;
-- ou
select pe.nome, pe.cpf, pe.idade, aat.area_atuacao, aat.bonus_salario, e.nome_rua, pe.numero 
from pessoa pe, area_atuacao aat, endereco e
where pe.area_Atuacao = aat.id 
and pe.endereco = e.id 
and pe.idade > 20 
order by pe.idade desc;
-- -------------- Nivel 1 ---------------
select aat.id as "ID", aat.area_atuacao as "Área Atuação", aat.bonus_salario as "Bonus Salario", pe.nome as "Nome"
from area_atuacao aat left join pessoa pe on aat.id = pe.area_Atuacao;
-- ou
select aat.*, pe.nome from area_atuacao aat left join pessoa pe on aat.id = pe.area_Atuacao;
-- ---------- Prática -----------
insert into endereco (id, nome_rua, cidade, cep, numero)
values (default, "Paranaiba", default, "79600-040", 539),
       (default, "Ranulpho Marques Leal", default, "79610-104", 1553);
-- --------
select pe.nome as "Nome", pe.cpf as "CPF", pe.idade as "Idade", 
pe.numero as "Número Pessoa", e.nome_rua as "Nome Rua", 
e.cidade as "Cidade", e.cep as "CEP", e.numero as "Número"
from pessoa pe right join endereco e on pe.endereco = e.id;
-- ou
select pe.*, e.* from pessoa pe right join endereco e on pe.endereco = e.id;
-- ---------------
create database estacionamento_tl;
use estacionamento_tl;
drop database estacionamento_tl;
drop table cliente;
create table cliente(
id integer not null primary key auto_increment,
cpf varchar(14),
nome varchar(60),
data_nasc date
);
ALTER TABLE cliente
MODIFY id int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
create table modelo(
codMod integer not null primary key auto_increment,
nome varchar(20)
);
ALTER TABLE modelo
MODIFY codMod int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
create table veiculo(
placa varchar(8) primary key,
cor varchar(20),
ano integer,
cliente_id integer,
modelo_codMod integer,
constraint fk_cliente_id foreign key (cliente_id) references cliente (id),
constraint fk_modelo_codMod foreign key (modelo_codMod) references modelo (codMod)
);
create table patio(
id integer not null primary key auto_increment,
endereco varchar(20),
capacidade integer
);
ALTER TABLE patio
MODIFY id int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
ALTER TABLE patio
MODIFY endereco varchar(100);
create table estacionamento(
codigo integer not null primary key auto_increment,
data_entrada date,
data_saida date,
hora_entrada time,
hora_saida time,
veiculo_placa varchar(8),
patio_id integer,
constraint fk_veiculo_placa foreign key (veiculo_placa) references veiculo (placa),
constraint fk_patio_id foreign key (patio_id) references patio (id)
);
ALTER TABLE estacionamento
MODIFY codigo int NOT null AUTO_INCREMENT, AUTO_INCREMENT=0;
-- -----------
-- -------------- cliente ---------------
insert into cliente (id, nome, cpf, data_nasc)
values (default, "Paulo Oliveira", 12345678910, '2000-05-03'),
	   (default, "Mariana Silva", 10987654321, '1967-12-28'),
       (default, "Claudia Ferreira", 34521768903, '1996-01-15'),
       (default, "Juliana Castro", 45786943039, '1988-04-30');
select c.id, c.cpf, c.nome, c.data_nasc from cliente c;
-- ou 
select * from cliente;
-- -------------- modelo ---------------
insert into modelo (codMod, nome)
values (default, "Uno"),
	   (default, "Corolla"),
       (default, "Gol"),
       (default, "Fox"),
       (default, "Renegade"),
       (default, "Civic");
select m.codMod, m.nome from modelo m;
-- ou 
select * from modelo;
-- -------------- veiculo ---------------
insert into veiculo (placa, cor, ano, cliente_id, modelo_codMod)
values ("JJJ-2020", "Verde", 2018, 3, 2),
	   ("XXD-3030", "Prata", 2015, 1, 4),
       ("JEG-1010", "Preto", 2006, 2, 5),
       ("PLO-4040", "Braco", 2010, 4, 2),
       ("MRT-5050", "Azul", 1997, 1, 3);
select * from veiculo v;
-- ou 
select * from veiculo;
-- -------------- pátio ---------------
insert into patio (id, endereco, capacidade)
values (default, "Eloy Chaves", 10),
	   (default, "Filinto Müiller", 45),
       (default, "Antôni Trajano Dos Santos", 15),
       (default, "Egídio Thomê", 35);
select c.id, c.cpf, c.nome, c.data_nasc from patio p;
-- ou 
select * from patio;
-- -------------- estacionamento ---------------
insert into estacionamento (codigo, data_entrada, data_saida, hora_entrada, hora_saida, veiculo_placa, patio_id)
values (default, '2020-01-02', '2020-01-02', '07:00:12', '13:45:57', "JJJ-2020", 3),
	   (default, '2020-01-04', '2020-01-04', '22:34:00', '23:23:45', "XXD-3030", 1),
       (default, '2020-01-05', '2020-01-10', '14:27:31', '07:23:32', "JEG-1010", 4),
       (default, '2020-01-07', '2020-01-07', '10:23:16', '12:54:00', "PLO-4040", 2);
select c.id, c.cpf, c.nome, c.data_nasc from estacionamento es;
-- ou 
select * from estacionamento;
-- ---------- Prática -----------
-- a) ---------
select v.placa, cl.Nome from veiculo v inner join cliente cl on v.cliente_id = cl.id;
-- b) ---------
select cl.cpf, cl.nome, v.placa from veiculo v inner join cliente cl on v.cliente_id = cl.id where v.placa like "JJJ-2020";
-- c) ---------
select v.placa, v.cor, est.codigo from veiculo v inner join estacionamento est on est.veiculo_placa = v.placa where est.codigo = 1;
-- d) ---------
select v.placa, v.ano, m.nome from veiculo v inner join modelo m on v.modelo_codMod = m.codMod where v.ano >= 2000;
-- e) ---------
select pat.endereco, est.data_entrada, est.data_saida, v.placa 
from veiculo v inner join estacionamento est inner join patio pat on est.veiculo_placa = v.placa 
and est.patio_id = pat.id where v.placa like "JEG-1010";
-- f) ---------
select v.cor, est.codigo, count(v.placa) from veiculo v inner join estacionamento est on est.veiculo_placa = v.placa where v.cor = "Verde";
-- g) ---------
select cl.nome, m.nome from cliente cl inner join veiculo v inner join modelo m on v.cliente_id = cl.id and v.modelo_codMod = m.codMod 
where m.codMod = 1;
-- h) ---------
select m.nome, v.placa from veiculo v left join modelo m on v.modelo_codMod = m.codMod;
-- i) ---------
select v.placa, est.* from estacionamento est inner join veiculo v on est.veiculo_placa = v.placa where v.placa = "JJJ-2020";
-- j) ---------
select cl.nome, est.* from veiculo v inner join cliente cl inner join estacionamento est on v.cliente_id = cl.id 
and est.veiculo_placa = v.placa where est.codigo = 2;
-- k) ---------
select m.nome, cl.cpf, est.* from veiculo v inner join cliente cl inner join estacionamento est inner join modelo m on v.cliente_id = cl.id 
and est.veiculo_placa = v.placa and v.modelo_codMod = m.codMod where est.codigo = 3;
-- l) ---------
select v.placa, cl.Nome, m.nome from veiculo v inner join cliente cl right join modelo m on v.cliente_id = cl.id and v.modelo_codMod = m.codMod;
-- m) ---------
select m.nome, est.data_entrada from modelo m
left join veiculo v on m.codMod = v.modelo_codMod
left join estacionamento est on v.placa = est.veiculo_placa; 
-- -------------- Nivel 2 ---------------
-- Correção da utima pratica com left join e right join ------------
use empresa_x;
select * from pessoa;
select * from pessoa p where p.area_atuacao = (select pessoa.area_atuacao from pessoa where pessoa.nome like "Maria Eduarda") 
and p.nome not like "Maria Eduarda";
-- -------------- Nivel 3 ---------------
use estacionamento_tl;
select * from cliente;
select cl.nome from veiculo v inner join cliente cl on v.cliente_id = cl.id 
where v.ano in(select veiculo.ano from veiculo where ano > 2015);
-- ---------
select cl.nome, 2020-year(cl.data_nasc) from cliente cl
where year(cl.data_nasc) < any (select veiculo.ano from veiculo);
-- ---------
select cl.nome, 2020-year(cl.data_nasc) from cliente cl
where year(cl.data_nasc) > all (select veiculo.ano from veiculo);
-- ---------
select cl.nome, v.placa from veiculo v inner join cliente cl 
on v.cliente_id = cl.id
inner join estacionamento est 
on est.veiculo_placa = v.placa
inner join patio p on est.patio_id = p.id where v.placa like "XXO-3030" and
exists(select patio.id from patio inner join estacionamento on estacionamento.patio_id = patio.id
inner join veiculo
on estacionamento.veiculo_placa = veiculo.placa where patio.id = 3);
-- ou 
select cl.nome, v.placa from veiculo v inner join cliente cl 
on v.cliente_id = cl.id
inner join estacionamento est 
on est.veiculo_placa = v.placa
inner join patio p on est.patio_id = p.id where
exists(select * from estacionamento where estacionamento.veiculo_placa 
like "XXO-3030" and estacionamento.patio_id = 3);
-- ou (Recomendado E Certo)
select cl.nome from cliente cl where
exists(select * from estacionamento where estacionamento.veiculo_placa 
like "XXO-3030" and estacionamento.patio_id = 3);
-- -------------- Nivel 4 ---------------
use empresa_x;
-- ---------
select p.nome, aat.area_atuacao, p.endereco from pessoa p 
inner join area_atuacao aat on p.area_Atuacao = aat.id;
-- ---------
create view dados_pessoais AS
select p.nome, aat.area_atuacao, p.endereco from pessoa p 
inner join area_atuacao aat on p.area_Atuacao = aat.id;
-- ou 
create view dados_pessoais AS
select p.nome as "Nome_Da_Pessoa", 
aat.area_atuacao as "Area_De_Atuacao", p.endereco as "ID_Do_Endereco"
from pessoa p inner join area_atuacao aat on p.area_Atuacao = aat.id; 
-- ---------
DROP VIEW dados_pessoais;
-- ---------
select * from dados_pessoais;
-- ---------
select * from dados_pessoais dp inner join endereco e on dp.ID_Do_Endereco = e.id;
-- ou (Remondado e correto a ser usado é inner join tamto para a Otimização como também para não forma código fragio)
select * from dados_pessoais dp join endereco e on dp.ID_Do_Endereco = e.id;
-- ---------
alter view dados_pessoais as 
select p.nome as "Nome_Da_Pessoa", 
aat.area_atuacao as "Area_De_Atuacao", p.endereco as "ID_Do_Endereco",
e.nome_rua as "Nome_Da_Rua", e.numero as "Numero_Da_Casa"
from pessoa p inner join area_atuacao aat on p.area_Atuacao = aat.id
inner join endereco e on p.endereco = e.id; 
-- ---------
select * from dados_pessoais;
-- ---------
use estacionamento_tl;
-- ---------- Prática -----------
-- 1) ---------
select cl.nome, est.data_entrada, est.data_saida, est.hora_entrada,
est.hora_saida, v.placa, p.endereco 
from estacionamento est inner join veiculo v
on est.veiculo_placa = v.placa 
inner join cliente cl
on v.cliente_id = cl.id
inner join patio p 
on est.patio_id = p.id 
where cl.nome like "Paulo Oliveira";
-- ---------
create view view_cliente as
select cl.nome, est.data_entrada, est.data_saida, est.hora_entrada,
est.hora_saida, v.placa, p.endereco 
from estacionamento est inner join veiculo v
on est.veiculo_placa = v.placa 
inner join cliente cl
on v.cliente_id = cl.id
inner join patio p 
on est.patio_id = p.id 
where cl.nome like "Paulo Oliveira";
-- ---------
DROP VIEW view_cliente;
-- ---------
select * from view_cliente;
-- ---------
-- 2) ---------
select cl.nome as "Nome_Cliente", m.nome as "Nome_Modelo", 
v.placa as "Placa", v.ano as "Ano" 
from veiculo v
inner join cliente cl
on v.cliente_id = cl.id
inner join modelo m 
on v.modelo_codMod = m.codMod;
-- ---------
create view view_cliente_placa as
select cl.nome as "Nome_Cliente", m.nome as "Nome_Modelo", 
v.placa as "Placa", v.ano as "Ano" 
from veiculo v
inner join cliente cl
on v.cliente_id = cl.id
inner join modelo m 
on v.modelo_codMod = m.codMod;
-- ---------
DROP VIEW view_cliente_placa;
-- ---------
select * from view_cliente_placa;
-- ---------
-- 3) ---------
select e.*
from .estacionamento e
inner join patio p
on e.patio_id = p.id 
where p.capacidade > (select avg(patio.capacidade) from patio);
-- ---------
select avg(patio.capacidade) from patio;
-- ---------
create view view_cliente_estacionamento as
select e.* from estacionamento e
inner join patio p
on e.patio_id = p.id 
where p.capacidade > (select avg(patio.capacidade) from patio);
-- ---------
DROP VIEW view_cliente_estacionamento;
-- ---------
select * from view_cliente_estacionamento;
-- -------------- Nivel 5 ---------------
use empresa_x;
-- ---------
Delimiter $$
create procedure ver_renda (cpf_pessoa varchar(14))
begin
select concat('A renda familiar de: ',nome,' é: ', renda_familiar,' reais. ') as "Renda"
from pessoa where cpf like cpf_pessoa;
select 'Procedimento Realizado!';
end $$
Delimiter ;
-- ---------
DROP PROCEDURE ver_renda;
-- ---------
select * from pessoa;
-- --------- (Maneira Não recomendado pois é um varchar e não um int)
CALL ver_renda (13569380912);
-- ou (Maneira recomendado pois é um varchar e não um int)
CALL ver_renda ("13569380912");
-- --------- (Maneira Não recomendado pois é um varchar e não um int)
CALL ver_renda (12345678910);
-- ou (Maneira recomendado pois é um varchar e não um int)
CALL ver_renda ("12345678910");
-- ---------
use estacionamento_tl;
-- ---------
-- ---------- Prática -----------
select cl.id as "ID_Cliente", cl.nome as "Nome_Cliente", m.nome as "Nome_Modelo", 
v.placa as "Placa", v.ano as "Ano" 
from veiculo v
inner join cliente cl
on v.cliente_id = cl.id
inner join modelo m 
on v.modelo_codMod = m.codMod;
-- ---------
Delimiter $$
create procedure pro_pessoa (IN id_pessoa integer)
begin
select cl.id as "ID_Cliente", cl.nome as "Nome_Cliente", m.nome as "Nome_Modelo", 
v.placa as "Placa", v.ano as "Ano" 
from veiculo v
inner join cliente cl
on v.cliente_id = cl.id
inner join modelo m 
on v.modelo_codMod = m.codMod 
where cl.id = id_pessoa;
end $$
Delimiter ;
-- ---------
DROP PROCEDURE pro_pessoa;
-- ---------
CALL pro_pessoa (1);
-- ou 
select cl.nome as "Nome_Cliente", m.nome as "Nome_Modelo", 
v.placa as "Placa", v.ano as "Ano" 
from veiculo v
inner join cliente cl
on v.cliente_id = cl.id
inner join modelo m 
on v.modelo_codMod = m.codMod;
-- ---------
Delimiter $$
create procedure pro_pessoa_new (IN id_pessoa integer)
begin
select cl.nome as "Nome_Cliente", m.nome as "Nome_Modelo", 
v.placa as "Placa", v.ano as "Ano" 
from veiculo v
inner join cliente cl
on v.cliente_id = cl.id
inner join modelo m 
on v.modelo_codMod = m.codMod 
where cl.id = id_pessoa;
end $$
Delimiter ;
-- ---------
DROP PROCEDURE pro_pessoa_new;
-- ---------
CALL pro_pessoa_new (1);
-- ---------
Delimiter $$
create function dobro_idade(idade int)
returns int
begin
return idade*2;
end $$
Delimiter ;
-- ---------
DROP FUNCTION dobro_idade;
-- ---------
select dobro_idade(11) as idade;
-- ---------
select 2020-year(data_nasc) as Idade, dobro_idade(2020-year(data_nasc)) as Dobro from cliente;
-- ou 
use empresa_x;
-- ---------
Delimiter $$
create function dobro_idade(idade int)
returns int
begin
return idade*2;
end $$
Delimiter ;
-- ---------
DROP FUNCTION dobro_idade;
-- ---------
select dobro_idade(11) as idade;
-- ---------
select idade, dobro_idade(idade) as Dobro from pessoa;
-- ---------
use estacionamento_tl;
-- ---------
-- ---------- Prática -----------
Delimiter $$
create function nome_idade(cpf_pessoa varchar(14))
returns varchar(60)
begin
return (select concat(nome, ' Possui: ', 2020-year(data_nasc), ' Anos. ') 
from cliente where cpf like cpf_pessoa);
end $$
Delimiter ;
-- ---------
DROP FUNCTION nome_idade;
-- ---------
select nome_idade(12345678910) as Frase;
-- ou 
use empresa_x;
-- ---------
Delimiter $$
create function nome_idade(cpf_pessoa varchar(14))
returns varchar(60)
begin
return (select concat(nome, ' Possui: ', idade, ' Anos. ') 
from pessoa where cpf like cpf_pessoa);
end $$
Delimiter ;
-- ---------
DROP FUNCTION nome_idade;
-- ---------
select nome_idade(12345678910) as Frase;
-- ---------
use empresa_x;
-- ---------
Delimiter $$
create procedure ver_renda_new (cpf_pessoa varchar(14), OUT frase varchar(50)) 
begin
select concat('A renda familiar de: ',nome,' é: ', renda_familiar,' reais. ') INTO frase
from pessoa where cpf like cpf_pessoa;
select 'Ralizado!';
end $$
Delimiter ;
-- ---------
DROP PROCEDURE ver_renda_new;
-- ---------
set @frase_fora = 'Aulas';
-- ---------
select @frase_fora;
-- ---------
CALL ver_renda_new(12345678910, @frase_fora);
-- ou 
use empresa_x;
-- ---------
Delimiter $$
create procedure dados (cpf_pessoa varchar(14), OUT frase varchar(50)) 
begin
select concat('A renda familiar de: ',nome,' é: ', renda_familiar,' reais. ') as "Renda"
from pessoa where cpf like cpf_pessoa;
end $$
Delimiter ;
-- ---------
DROP PROCEDURE dados;
-- ---------
set @frase_fora_new = 'Aulas_New';
-- ---------
select @frase_fora_new;
-- ---------
CALL dados(12345678910, @frase_fora_new);
-- -------------- Nivel 6 ---------------
-- ---------- Prática -----------
-- ---------
use empresa_x;
-- ---------
-- 1) ---------
DELIMITER $$
CREATE FUNCTION mostrar_cpf(CPF_pessoa VARCHAR(14))
RETURNS VARCHAR(14)
BEGIN
RETURN(
CONCAT(SUBSTR(CPF_pessoa, 1,3), '.', 
SUBSTR(CPF_pessoa, 4,3), '.',
SUBSTR(CPF_pessoa, 7,3), '-', 
SUBSTR(CPF_pessoa, 10,2)));
END $$
DELIMITER ;
-- ---------
DROP FUNCTION mostrar_cpf;
-- ---------
SELECT nome, mostrar_cpf(cpf) as cpf from pessoa;
-- ---------
-- 2) ---------
DELIMITER $$
CREATE PROCEDURE atualiza_idade(cpf_pessoa varchar(14))
BEGIN
UPDATE pessoa set idade = idade + 1 
where cpf like cpf_pessoa;
END $$
DELIMITER ;
-- ---------
DROP PROCEDURE atualiza_idade;
-- ---------
call atualiza_idade(1);
-- ---------
select idade from pessoa where cpf = "12345678910";
-- ---------
-- 3) ---------
DELIMITER $$
CREATE FUNCTION mostra_ano(idade integer)
RETURNS INT
BEGIN
RETURN(2020-idade);
END $$
DELIMITER ;
-- ---------
DROP FUNCTION mostra_ano;
-- ---------
SELECT nome, idade, mostra_ano(idade) as ANO from pessoa;
-- ---------
-- 4) ---------
-- ---------
use estacionamento_tl;
-- --------- (O oque não é o correto para a questão que na qual pede quantos ano tem de frabricação e não a que ano foi feito)
DELIMITER $$
CREATE PROCEDURE mostra_frase_new(id_cliente INTEGER)
BEGIN
SELECT CONCAT('Cliente ID: ', c.id, ' possui um carro ', 
m.nome, ' de ', v.ano) as Frase
FROM cliente c
INNER JOIN veiculo v ON c.id = v.cliente_id
INNER JOIN modelo m ON v.modelo_codMod = m.codMod
WHERE c.id = id_cliente;
END $$
DELIMITER ;
-- ---------
DROP PROCEDURE mostra_frase_new;
-- ---------
call mostra_frase_new(3);
-- ou 
DELIMITER $$
CREATE PROCEDURE mostra_frase_new_plus(id_cliente INTEGER)
BEGIN
SELECT CONCAT('Cliente ID: ', c.id, ' Cliente Nome: ', c.nome, ' possui um carro ', 
m.nome, ' de ', v.ano) as Frase
FROM cliente c
INNER JOIN veiculo v ON c.id = v.cliente_id
INNER JOIN modelo m ON v.modelo_codMod = m.codMod
WHERE c.id = id_cliente;
END $$
DELIMITER ;
-- ---------
DROP PROCEDURE mostra_frase_new_plus;
-- ---------
call mostra_frase_new_plus(3);
-- ou (O oque é o correto para a questão que pede quantos ano tem de frabricação e não a que ano foi feito)
use estacionamento_tl;
-- ---------
DELIMITER $$
CREATE PROCEDURE mostra_frase(id_cliente INTEGER)
BEGIN
SELECT CONCAT('Cliente ID: ', c.id, ' possui um carro ', 
m.nome, ' com ', 2020-v.ano, ' de fabricação ') as Frase
FROM cliente c
INNER JOIN veiculo v ON c.id = v.cliente_id
INNER JOIN modelo m ON v.modelo_codMod = m.codMod
WHERE c.id = id_cliente;
END $$
DELIMITER ;
-- ---------
DROP PROCEDURE mostra_frase;
-- ---------
call mostra_frase(3);
-- ou 
DELIMITER $$
CREATE PROCEDURE mostra_frase_plus(id_cliente INTEGER)
BEGIN
SELECT CONCAT('Cliente ID: ', c.id, ' Cliente Nome: ', c.nome, ' possui um carro ', 
m.nome, ' com ', 2020-v.ano, ' de fabricação ') as Frase
FROM cliente c
INNER JOIN veiculo v ON c.id = v.cliente_id
INNER JOIN modelo m ON v.modelo_codMod = m.codMod
WHERE c.id = id_cliente;
END $$
DELIMITER ;
-- ---------
DROP PROCEDURE mostra_frase_plus;
-- ---------
call mostra_frase_plus(3);
-- ---------
-- 5) ---------
-- ---------
use empresa_x;
-- ---------
DELIMITER $$
CREATE FUNCTION mostrar_cpf_plus(CPF_pessoa VARCHAR(14))
RETURNS VARCHAR(20)
BEGIN
IF(LENGTH(CPF_pessoa) != 11) THEN
RETURN (SELECT 'Está Errado! '); 
ELSE RETURN( CONCAT(SUBSTR(CPF_pessoa, 1,3), '.', 
SUBSTR(CPF_pessoa, 4,3), '.', 
SUBSTR(CPF_pessoa, 7,3), '-', 
SUBSTR(CPF_pessoa, 10,2))); END IF;  
END $$ 
DELIMITER ;
-- ---------
drop function mostrar_cpf_plus;
-- ---------
SELECT nome, mostrar_cpf_plus('12345678910321') as cpf from pessoa;
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
-- ou 
select i.nome as "Nome_instrutor", t.* from turmas t 
left join instrutores i on t.fkinstrutores_id = i.id
where i.id = 1;
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
-- ---------
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
-- ---------
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
-- ---------
SELECT nome as "Nome_Aluno", function_mostrar_cpf(cpf) as "CPF", 
function_idade(data_nascimento) as "Idade" from alunos;
-- ---------
-- 12) Crie uma view com as informações das turmas e dos alunos que estão 
-- em qualquer uma das turmas que ‘Alan’ também esteja matriculado. 
-- (Os alunos podem ter mais de uma turma). 
-- ---------
select t.*, a.cpf, a.nome as "Nome_Aluno", a.email, a.telefone, a.data_nascimento 
from turmas t inner join matriculas m on m.fkturmas_id = t.id 
inner join alunos a on m.fkalunos_id = a.id
where a.nome = exists
(select a.nome from alunos where a.nome like "ALAN RODRIGUES VINCLES  MATTOSO");
-- ---------
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
-- -------------- Nivel 8 ---------------
-- -----------------
use empresa_x;
-- -----------------
Delimiter $$
create function maior_idade(idade int)
returns varchar(50)
begin
declare frase varchar(50);
if idade >= 10 then set frase =  'Maior';
else set frase = 'Menor';
end if;
return frase;
end $$
Delimiter ;
-- -----------------
select maior_idade(5);
-- ou 
Delimiter $$
create function maior_idade_plus(idade int)
returns varchar(50)
begin
declare frase varchar(50);
if idade >= 10 then set frase =  'Maior';
else set frase = 'Menor';
end if;
if idade < 1 then set frase =  'Idade Errada';
end if;
return frase;
end $$
Delimiter ;
-- -----------------
select maior_idade_plus(5);
-- -----------------
use estacionamento_tl;
-- -----------------
Delimiter $$
create procedure valor_patio(id_patio int, out valor double)
begin
case id_patio
when 1 then select 2.50 into valor;
when 2 then select 3.50 into valor;
when 3 then select 4.50 into valor;
when 4 then select 5.50 into valor;
else select 'Não foi  encontrado esse id' as 'ERRO';
end case;
end $$
Delimiter ;
-- -----------------
set @valor = 3;
-- -----------------
call valor_patio(3,@valor);
-- -----------------
select @valor;
-- -----------------
Delimiter $$
create function maior_idade_news(idade int)
returns varchar(50)
begin
declare frase varchar(50);
if idade <= 10 then set frase =  'Criança';
elseif idade > 10 and idade <= 20 then set frase =  'Adolescente';
elseif idade > 20 and idade < 60 then set frase =  'Adulto';
elseif idade >= 60 then set frase =  'Idoso';
elseif idade <= 0 then set frase =  'Idade Errada';
end if;
return frase;
end $$
Delimiter ;
-- -----------------
select nome, idade, maior_idade_news(idade) from pessoa;
-- ou 
Delimiter $$
create function maior_idade_news_plus(idade int)
returns varchar(50)
begin
declare frase varchar(50);
if idade <= 10 then set frase =  'Criança';
elseif idade <= 0 then set frase =  'Idade Errada';
elseif idade <= 20 then set frase =  'Adolescente';
elseif idade < 60 then set frase =  'Adulto';
else set frase = 'Idoso';
end if;
return frase;
end $$
Delimiter ;
-- -----------------
select nome, idade, maior_idade_news_plus(idade) from pessoa;
-- -----------------
use estacionamento_tl;
-- -----------------
Delimiter $$
create procedure valor_patio_new(id_patio int, out valor double)
begin
declare capacidade_s int;
set capacidade_s = (select patio.capacidade 
from patio 
where patio.id = id_patio);
case 
when capacidade_s > 40 then select 3.00 into valor;
when capacidade_s > 30 then select 2.50 into valor;
when capacidade_s > 20 then select 2.00 into valor;
when capacidade_s > 10 then select 1.50 into valor;
when capacidade_s <= 10 then select 1.00 into valor;
else select 'Não foi  encontrado esse id' as 'ERRO';
end case;
end $$
Delimiter ;
-- -----------------
DROP PROCEDURE valor_patio_new;
-- -----------------
set @valor = '3';
-- -----------------
call valor_patio_new(1,@valor);
-- -----------------
select @valor;
-- -----------------
select * from patio;
-- -------------- Nivel 9 ---------------
-- -----------------
use estacionamento_tl;
-- -----------------
alter table veiculo
add imposto float;
-- -----------------
alter table veiculo
modify imposto double;
-- -----------------
-- ---------- Prática -----------
-- -----------------
select * from veiculo;
-- -----------------
Delimiter $$
create procedure procedure_leao_ipva(id_ipva varchar(8), in leao double)
begin
declare preco_ipva int;
set preco_ipva = (select veiculo.ano 
from veiculo 
where veiculo.placa = id_ipva);
if preco_ipva <= 2000 then 
UPDATE veiculo set imposto = leao*0.10
where veiculo.placa = id_ipva;
elseif preco_ipva <= 2010 then 
UPDATE veiculo set imposto = leao*0.15
where veiculo.placa = id_ipva;
elseif preco_ipva > 2010 then 
UPDATE veiculo set imposto = leao*0.20
where veiculo.placa like id_ipva;
else select 'Não foi encontrado essa Placa' as 'ERRO';
end if;
end $$
Delimiter ;
-- -----------------
desc veiculo;
-- -----------------
DROP PROCEDURE procedure_leao_ipva;
-- -----------------
call procedure_leao_ipva("MRT-5050", 1000);
-- -----------------
select * from veiculo;
-- -------------- Nivel 10 ---------------
-- -----------------
use estacionamento_tl;
-- -----------------
Delimiter $$
create procedure soma_numeros(n int)
begin
declare contador int default 0;
declare soma int default 0;
loop_soma: loop
if contador >= n then leave loop_soma;
end if;
set contador = contador +1;
set soma = soma +contador;
end loop loop_soma;
select soma;
end $$
Delimiter ;
-- -----------------
call soma_numeros(5);
-- -----------------
Delimiter $$
create procedure soma_numeros_new(n int)
begin
declare contador int default 0;
declare soma int default 0;
repeat_soma: repeat
if contador >= n then leave repeat_soma;
end if;
set contador = contador +1;
set soma = soma + contador;
until contador>=n
end repeat repeat_soma;
select soma;
end $$
Delimiter ;
-- -----------------
call soma_numeros_new(5);
-- -----------------
Delimiter $$
create procedure soma_numeros_plus(n int)
begin
declare contador int default 0;
declare soma int default 0;
while_soma: while contador < n do
set contador = contador +1;
set soma = soma + contador;
end while while_soma;
select soma;
end $$
Delimiter ;
-- -----------------
call soma_numeros_plus(5);
-- -----------------
-- ---------- Prática -----------
-- -----------------
Delimiter $$
create procedure procedure_forial_numeros(n int)
begin
declare contador int default 1;
declare forial int default 1;
loop_forial: loop
if contador >= n then leave loop_forial;
end if;
set contador = contador + 1;
set forial = forial * contador;
end loop loop_forial;
select forial;
end $$
Delimiter ;
-- -----------------
drop procedure procedure_forial_numeros;
-- -----------------
call procedure_forial_numeros(5);
-- -----------------
Delimiter $$
create function function_idade_cliente (n double)
returns double
begin
declare contador double default 0;
declare idade double default 0;
declare indicador double default 0;
loop_idade: loop
set indicador = indicador + count(cliente.id);
if contador >= indicador then leave loop_idade;
end if;
set contador = contador + 1;
set idade = idade + (2020-year(n));
end loop loop_idade;
return idade;
end $$
Delimiter ;
-- -----------------
drop function function_idade_cliente;
-- -----------------
select count(cliente.id) from cliente;
-- -----------------
select 2020-year(cliente.data_nasc), count(cliente.id) from cliente;
-- -----------------
select function_idade_cliente(year(cliente.data_nasc)) from cliente;
-- -------------- Nivel 11 ---------------
-- -----------------
use empresa_x;
-- -----------------
alter table pessoa
add clasificacao varchar(15);
-- -----------------
alter table pessoa
modify clasificacao varchar(15);
-- -----------------
Delimiter $$
create trigger trigger_pessoa_idade before insert
on pessoa
for each row
begin
if new.idade <= 10 then set new.clasificacao =  'Criança';
elseif new.idade <= 0 then set new.clasificacao =  'Idade Errada';
elseif new.idade <= 20 then set new.clasificacao =  'Adolescente';
elseif new.idade < 60 then set new.clasificacao =  'Adulto';
else set new.clasificacao = 'Idoso';
end if;
end $$
Delimiter ;
-- -----------------
drop trigger trigger_pessoa_idade;
-- -----------------
show triggers;
-- -----------------
Delimiter $$
create procedure maior_idade_news_plus(idade int)
begin
declare frase varchar(50);
if idade <= 10 then set frase =  'Criança';
elseif idade <= 0 then set frase =  'Idade Errada';
elseif idade <= 20 then set frase =  'Adolescente';
elseif idade < 60 then set frase =  'Adulto';
else set frase = 'Idoso';
end if;
end $$
Delimiter ;
-- -----------------
insert into pessoa (cpf, nome, idade)
values("73892647917", "Eduardo Prosa", 30),
	  ("73892977917", "Maria Paula", 18);
-- -----------------
select * from pessoa;
-- -----------------
use estacionamento_tl;
-- -----------------
create table produtos (
cod_barras varchar(11) not null primary key,
descricacao varchar(50),
estoque int(11),
preco double
);
use estacionamento_tl;
-- -----------------
create table produtos (
id int,
cod_barras varchar(11) not null primary key,
descricacao varchar(50),
estoque int(11),
preco double
);