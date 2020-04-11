SELECT `lista`.`id`,
    `lista`.`jogo`,
    `lista`.`diretor`,
    `lista`.`estudio`,
    `lista`.`genero`,
    `lista`.`vercao`
FROM `tads4_jogo`.`lista`;


CREATE TABLE `lista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `livro` varchar(255) DEFAULT NULL,
  `altor` varchar(20) DEFAULT NULL,
  `editora` varchar(255) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `volume` decimal(15,2) DEFAULT NULL,
   PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  SET FOREIGN_KEY_CHECKS=0;
  
  
  SELECT `lista`.`id`,
    `lista`.`livro`,
    `lista`.`altor`,
    `lista`.`editora`,
    `lista`.`genero`,
    `lista`.`volume`
FROM `tads4_livro`.`lista`;


CREATE TABLE `lista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autor` varchar(255) DEFAULT NULL,
  `direcao` varchar(20) DEFAULT NULL,
  `estudio` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,  
  `vercao` decimal(15,2) DEFAULT NULL,
  `formato` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tads4_animacao`.`lista` (
`id`, `autor`, `direcao`, `estudio`, `data`, `vercao`, `formato`, `genero`) 
VALUES ('1', 'IF', 'IFMS', 'SSS', '2019-10-10', '1', 'Anime', 'Romance');



SELECT `lista`.`id`,
    `lista`.`autor`,
    `lista`.`direcao`,
    `lista`.`estudio`,
    `lista`.`data`,
    `lista`.`vercao`,
    `lista`.`formato`,
    `lista`.`genero`
FROM `tads4_animacao`.`lista`;






-- Carregando... 
/* 16:51:37.013 [main] INFO  org.hibernate.jpa.internal.util.LogHelper - HHH000204: Processing PersistenceUnitInfo [name: bdPU]
16:51:37.410 [main] INFO  org.hibernate.Version - HHH000412: Hibernate Core {5.4.3.Final}
16:51:38.378 [main] INFO  org.hibernate.annotations.common.Version - HCANN000001: Hibernate Commons Annotations {5.1.0.Final}
16:51:56.540 [main] WARN  org.hibernate.orm.connections.pooling - HHH10001002: Using Hibernate built-in connection pool (not for production use!)
16:51:56.574 [main] INFO  org.hibernate.orm.connections.pooling - HHH10001005: using driver [com.mysql.jdbc.Driver] at URL [jdbc:mysql://localhost:3306/tads4_bd]
16:51:56.576 [main] INFO  org.hibernate.orm.connections.pooling - HHH10001001: Connection properties: {user=root}
16:51:56.578 [main] INFO  org.hibernate.orm.connections.pooling - HHH10001003: Autocommit mode: false
16:51:56.593 [main] INFO  org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl - HHH000115: Hibernate connection pool size: 20 (min=1)
Sat Oct 05 16:51:57 BRT 2019 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
16:51:58.526 [main] INFO  org.hibernate.dialect.Dialect - HHH000400: Using dialect: org.hibernate.dialect.MySQL5Dialect
16:52:05.531 [main] INFO  org.hibernate.orm.connections.access - HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@78c7f9b3] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
   */ 

-- tads4_bd -> utf8_general_ci = Banco de Dados



create table tb_enfermidade (
       idEnfermidade integer not null auto_increment,
        descricao varchar(255),
        nome varchar(255),
        tipo varchar(255),
        constraint PK_Enfermidade primary key (idEnfermidade)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=0;

  create table tb_pessoa (
       idPessoa integer not null auto_increment,
        cpf varchar(255),
        idade integer,
        nome varchar(255),
        sexo varchar(1),
        statusDePessoa varchar(255),
        tipoSanguineo varchar(255),
        constraint PK_Pessoa primary key (idPessoa)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=0;

 create table tb_funcionariopessoa (
       idFuncionario integer not null auto_increment,
        cargo varchar(255),
        especialidade varchar(255),
        login varchar(255),
        numeroDeRegistroEnfermeiro integer,
        numeroDeRegistroMedico integer,
        senha varchar(255),
        statusDeUsuario varchar(255),
        fk_idPessoa integer,
        constraint PK_Funcionario primary key (idFuncionario),
        constraint FK_Pessoa_FuncionarioPessoa foreign key (fk_idPessoa) references tb_pessoa (idPessoa)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=0;

 create table tb_paciente (
       idPaciente integer not null auto_increment,
        fk_idPessoa integer,
        constraint PK_Paciente primary key (idPaciente),
        constraint FK_Pessoa_paciente foreign key (fk_idPessoa) references tb_pessoa (idPessoa)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
    SET FOREIGN_KEY_CHECKS=0;

    create table tb_entrada (
       idEntrada integer not null auto_increment,
        dataEntrada varchar(255),
        dataSaida varchar(255),
        statusEntrada varchar(255),
        fk_idPaciente integer,
        fk_idEntrada integer,
        constraint PK_Entrada primary key (idEntrada),
        constraint FK_Paciente_entrada foreign key (fk_idPaciente) references tb_paciente (idPaciente),
        constraint FK_Entrada_entrada foreign key (fk_idEntrada) references tb_entrada (idEntrada)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
    SET FOREIGN_KEY_CHECKS=0;
    
    create table tb_atendimento (
       idAtendimento integer not null auto_increment,
        altura float,
        comentarioEnfermeiro varchar(255),
        comentarioMedico varchar(255),
        data varchar(255),
        peso float,
        fk_idFuncionarioPessoa integer,
        fk_idEntrada integer,
        constraint PK_Atendimento primary key (idAtendimento),
        constraint FK_FuncionarioPessoa_atendimento foreign key (fk_idFuncionarioPessoa) references tb_funcionariopessoa (idFuncionario),
		constraint FK_Entrada_atendimento foreign key (fk_idEntrada) references tb_entrada (idEntrada)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
    SET FOREIGN_KEY_CHECKS=0;
    
    create table tb_enfermidadepessoal (
       idEnfermidadePessoal integer not null auto_increment,
        comentario varchar(255),
        statusDeEnfermidade varchar(255),
        fk_idAtendimento integer,
        fk_idEnfermidade integer,
        fk_idPaciente integer,
        constraint PK_EnfermidadePessoal primary key (idEnfermidadePessoal),
        constraint FK_Atendimento_enfermidadePessoal foreign key (fk_idAtendimento) references tb_atendimento (idAtendimento),
        constraint FK_Enfermidade_enfermidadePessoal foreign key (fk_idEnfermidade) references tb_enfermidade (idEnfermidade),
        constraint FK_Paciente_enfermidadePessoal foreign key (fk_idPaciente) references tb_Paciente (idPaciente)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    SET FOREIGN_KEY_CHECKS=0;


    
 
select tb_pessoa.nome, tb_enfermidadepessoal.comentario, tb_enfermidadepessoal.statusDeEnfermidade
from tb_enfermidadepessoal, tb_paciente, tb_pessoa;


   -- -------------------------------------------------- 
  
  
  SELECT `tb_pessoa`.`idPessoa`,
    `tb_pessoa`.`cpf`,
    `tb_pessoa`.`idade`,
    `tb_pessoa`.`nome`,
    `tb_pessoa`.`sexo`,
    `tb_pessoa`.`statusDePessoa`,
    `tb_pessoa`.`tipoSanguineo`
FROM `tads4_bd`.`tb_pessoa`;


 SELECT `tb_pessoa`.`idPessoa`,
    `tb_pessoa`.`nome`
FROM `tads4_bd`.`tb_pessoa`;



  
  
    
    alter table tb_atendimento 
       add constraint FKhoa0flp66306kx0uqei4hc3eh 
       foreign key (fk_idFuncionarioPessoa) 
       references tb_FuncionarioPessoa (idFuncionario);

    
    alter table tb_atendimento 
       add constraint FKf294e4a48aimkdl875fiivo7k 
       foreign key (fk_idEntrada) 
       references tb_entrada (idEntrada);

    
    alter table tb_atendimento 
       add constraint FKbvm17fknr3rbexh9926wd4w6o 
       foreign key (fk_idAtendimento) 
       references tb_entrada (idEntrada);
    
    alter table tb_enfermidadePessoal 
       add constraint FK5dbc66t1hdbuwmnimirxgkh88 
       foreign key (fk_idAtendimento) 
       references tb_atendimento (idAtendimento);

    
    alter table tb_enfermidadePessoal 
       add constraint FKsrf8r8klggwcpwsk780pqrnmf 
       foreign key (fk_idEnfermidade) 
       references tb_enfermidade (idEnfermidade);

    
    alter table tb_enfermidadePessoal 
       add constraint FK23qoyj6d2nrl59ro7mh57noyy 
       foreign key (fk_idPaciente) 
       references tb_paciente (idPaciente);
    
    alter table tb_enfermidadePessoal 
       add constraint FK7qhnba0yjylu4tiduc67aeyoo 
       foreign key (fk_idEnfermidadePessoal) 
       references tb_atendimento (idAtendimento);
    
    alter table tb_entrada 
       add constraint FK1e97900px2xjy3h63m35yq7di 
       foreign key (fk_idPaciente) 
       references tb_paciente (idPaciente);
 
    
    alter table tb_entrada 
       add constraint FKq0o7s0qr83oib0fxb77iwqaqy 
       foreign key (fk_idEntrada) 
       references tb_paciente (idPaciente);

    
    alter table tb_FuncionarioPessoa 
       add constraint FKsul2oudfdhte9wljk8rh3aihp 
       foreign key (fk_idPessoa) 
       references tb_pessoa (idPessoa);
    
    alter table tb_paciente 
       add constraint FK5bp4ed43douj4p5rc2d0u052l 
       foreign key (fk_idPessoa) 
       references tb_pessoa (idPessoa);



SELECT `tb_pessoa`.`idPessoa`,
    `tb_pessoa`.`cpf`,
    `tb_pessoa`.`idade`,
    `tb_pessoa`.`nome`,
    `tb_pessoa`.`sexo`,
    `tb_pessoa`.`statusDePessoa`,
    `tb_pessoa`.`tipoSanguineo`
FROM tb_pessoa;


/*
   create table tb_funcionario (
       DTYPE varchar(31) not null,
        idFuncionario integer not null auto_increment,
        login varchar(255),
        senha varchar(255),
        statusDeUsuario varchar(255),
        numeroDeRegistro integer,
        especialidade varchar(255),
        cargo varchar(255),
        fk_idPessoa integer,
        primary key (idFuncionario)
    ) engine=InnoDB
    
   */ 
    SELECT `tb_funcionario`.`DTYPE`,
    `tb_funcionario`.`idFuncionario`,
    `tb_funcionario`.`login`,
    `tb_funcionario`.`senha`,
    `tb_funcionario`.`statusDeUsuario`,
    `tb_funcionario`.`numeroDeRegistro`,
    `tb_funcionario`.`especialidade`,
    `tb_funcionario`.`cargo`,
    `tb_funcionario`.`fk_idPessoa`
FROM `tads4_bd`.`tb_funcionario`;

    
    
    -- =======================================================
    
    
    SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `cadcomputadores` (
  `id` int(11) NOT NULL,
  `processador` varchar(255) DEFAULT NULL,
  `placaMae` varchar(255) DEFAULT NULL,
  `memoriaRam` int(255) DEFAULT NULL,
  `armazenamento` varchar(255) NOT NULL,
  `placaVideo` varchar(255) NOT NULL,
  `gabinete` varchar(255) NOT NULL,
  `discoOptico` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cadcomputadores` (`id`, `processador`, `placaMae`, `memoriaRam`, `armazenamento`, `placaVideo`, `gabinete`, `discoOptico`) VALUES
(70, ' Core i3 8100', 'ASUS PRIME Z370-A DDR4 SOCKET LGA1151 CHIPSET INTEL Z370', 8, '2 TeraByte', ' GeForce GTX 1050Ti', 'Pichau Gaming Pouter II Led RGB', 'nao'),
(71, ' Ryzen 5 2400G', 'GIGABYTE B450M DS3H DDR4 SOCKET AM4 CHIPSET AMD B450', 12, '1 teraByte', 'Nvidia Geforce 1080 TI', 'Gamer Warrior com Lateral em AcrÃ­lico e 3 Baias Internas', 'sim'),
(72, 'i5-8250U', 'Lenovo LNVNB161216', 8, '1 teraByte', 'UHD Graphics 620', 'Notebook', 'nao');

ALTER TABLE `cadcomputadores`
  ADD PRIMARY KEY (`id`);
  
  ALTER TABLE `cadcomputadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

SELECT `cadcomputadores`.`id`,
    `cadcomputadores`.`processador`,
    `cadcomputadores`.`placaMae`,
    `cadcomputadores`.`memoriaRam`,
    `cadcomputadores`.`armazenamento`,
    `cadcomputadores`.`placaVideo`,
    `cadcomputadores`.`gabinete`,
    `cadcomputadores`.`discoOptico`
FROM `computadores`.`cadcomputadores`;

-- ===============


CREATE TABLE `atividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `descricao` text,
  `numero_participantes` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  `sala` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `palestrante` text,
  `obs` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `membros` (
    `id` INT(110) NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `cargo` VARCHAR(50) NOT NULL,
    `descricao` TEXT NOT NULL,
    `imagem` VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=UTF8 ROW_FORMAT=COMPACT;


INSERT INTO `atividades` VALUES ('1', 'Curso de Android 2.0', 'Curso de Android 1', '20', '2019-05-08', '20:00:00', '22:00:00', 'Sala 6', 'Noturno 1', 'Denis 1', 'Nenhuma 1');
INSERT INTO `atividades` VALUES ('2', 'Dia Nerd', 'Dia de comemorar o orgulho nerd', '300', '2019-05-25', '08:00:00', '12:00:00', 'IFMS', 'Matutino', 'VÃ¡rios', 'Todos devem fazer inscriÃ§Ã£o');


INSERT INTO `membros` VALUES ('1', 'Denis H. D. Lima', 'Professor', 'Mussum Ipsum, cacilds vidis litro abertis. Quem num gosta di mÃ©, boa gentis num Ã©. ', '9cfc66dc8f621491fe92fbb28f69988b.jpg');
INSERT INTO `membros` VALUES ('2', 'Maria', 'Programadora', 'Mussum Ipsum, cacilds vidis litro abertis. Quem num gosta di mÃ©, boa gentis num Ã©. ', '33d8dff62bc75f828ffe2af7bb933062.jpg');
INSERT INTO `membros` VALUES ('3', 'JosÃ©', 'Teste', 'Mussum Ipsum, cacilds vidis litro abertis. Quem num gosta di mÃ©, boa gentis num Ã©. ', '9a256e4bb86a0f157303168ea467e672.jpg');


SELECT `lista`.`id`,
    `lista`.`autor`,
    `lista`.`direcao`,
    `lista`.`estudio`,
    `lista`.`data`,
    `lista`.`vercao`,
    `lista`.`formato`,
    `lista`.`genero`
FROM `tads4_animacao`.`lista`;


-- ------------------------------

-- Pessoa

SELECT `tb_pessoa`.`idPessoa`,
    `tb_pessoa`.`cpf`,
    `tb_pessoa`.`idade`,
    `tb_pessoa`.`nome`,
    `tb_pessoa`.`sexo`,
    `tb_pessoa`.`statusDePessoa`,
    `tb_pessoa`.`tipoSanguineo`
FROM `bd`.`tb_pessoa`;

-- Enfermidade Pessoal

SELECT `tb_enfermidadepessoal`.`idEnfermidadePessoal`,
    `tb_enfermidadepessoal`.`comentario`,
    `tb_enfermidadepessoal`.`statusDeEnfermidade`,
    `tb_enfermidadepessoal`.`fk_idAtendimento`,
    `tb_enfermidadepessoal`.`fk_idEnfermidade`,
    `tb_enfermidadepessoal`.`fk_idPaciente`
FROM `bd`.`tb_enfermidadepessoal`;

-- ---------------------------------

-- Atendimento

SELECT `tb_atendimento`.`idAtendimento`,
    `tb_atendimento`.`altura`,
    `tb_atendimento`.`comentarioEnfermeiro`,
    `tb_atendimento`.`comentarioMedico`,
    `tb_atendimento`.`data`,
    `tb_atendimento`.`peso`,
    `tb_atendimento`.`fk_idFuncionarioPessoa`,
    `tb_atendimento`.`fk_idEntrada`
FROM `bd`.`tb_atendimento`;

select p.nome, enfp.comentario, enfp.statusDeEnfermidade 
from tb_atendimento a, tb_enfermidadepessoal enfp, tb_pessoa p 
group by p.nome ASC;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_atendimento` AS(
    SELECT 
        `p`.`nome` AS `Nome`,
        `enfp`.`comentario` AS `Comentario`,
        `enfp`.`statusDeEnfermidade` AS `Status De Enfermidade`
    FROM
        ((`tb_atendimento` `a`
        JOIN `tb_enfermidadepessoal` `enfp`)
        JOIN `tb_pessoa` `p`)
    GROUP BY `p`.`nome`);
    
    SELECT `view_atendimento`.`Nome`,
    `view_atendimento`.`Comentario`,
    `view_atendimento`.`Status De Enfermidade`
FROM `bd`.`view_atendimento`;



-- -------------------------

-- Entrada

SELECT `tb_entrada`.`idEntrada`,
    `tb_entrada`.`dataEntrada`,
    `tb_entrada`.`dataSaida`,
    `tb_entrada`.`statusEntrada`,
    `tb_entrada`.`fk_idPaciente`,
    `tb_entrada`.`fk_idEntrada`
FROM `bd`.`tb_entrada`;

select p.nome, ate.comentarioEnfermeiro, ate.comentarioMedico, ate.peso, ate.altura, ate.data 
from tb_entrada ent, tb_atendimento ate, tb_pessoa p
group by p.nome ASC;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_entrada` AS
    SELECT 
        `p`.`nome` AS `nome`,
        `ate`.`comentarioEnfermeiro` AS `comentarioEnfermeiro`,
        `ate`.`comentarioMedico` AS `comentarioMedico`,
        `ate`.`peso` AS `peso`,
        `ate`.`altura` AS `altura`,
        `ate`.`data` AS `data`
    FROM
        ((`tb_entrada` `ent`
        JOIN `tb_atendimento` `ate`)
        JOIN `tb_pessoa` `p`)
    GROUP BY `p`.`nome`;
    
    SELECT `view_entrada`.`nome`,
    `view_entrada`.`comentarioEnfermeiro`,
    `view_entrada`.`comentarioMedico`,
    `view_entrada`.`peso`,
    `view_entrada`.`altura`,
    `view_entrada`.`data`
FROM `bd`.`view_entrada`;


-- ----------------------------------

-- Paciente

SELECT `tb_paciente`.`idPaciente`,
    `tb_paciente`.`fk_idPessoa`
FROM `bd`.`tb_paciente`;

-- view_paciente0

select p.nome, enfp.comentario, enfp.statusDeEnfermidade 
from tb_paciente, tb_enfermidadepessoal enfp, tb_pessoa p 
group by p.nome ASC;


CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_paciente0` AS
    SELECT 
        `p`.`nome` AS `nome`,
        `enfp`.`comentario` AS `comentario`,
        `enfp`.`statusDeEnfermidade` AS `statusDeEnfermidade`
    FROM
        ((`tb_paciente`
        JOIN `tb_enfermidadepessoal` `enfp`)
        JOIN `tb_pessoa` `p`)
    GROUP BY `p`.`nome`;


   SELECT `view_paciente0`.`nome`,
    `view_paciente0`.`comentario`,
    `view_paciente0`.`statusDeEnfermidade`
FROM `bd`.`view_paciente0`;

-- view_paciente1

select p.nome, ent.dataEntrada, ent.dataSaida, ent.statusEntrada
from tb_paciente, tb_entrada ent, tb_pessoa p
group by p.nome ASC;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_paciente1` AS
    SELECT 
        `p`.`nome` AS `nome`,
        `ent`.`dataEntrada` AS `dataEntrada`,
        `ent`.`dataSaida` AS `dataSaida`,
        `ent`.`statusEntrada` AS `statusEntrada`
    FROM
        ((`tb_paciente`
        JOIN `tb_entrada` `ent`)
        JOIN `tb_pessoa` `p`)
    GROUP BY `p`.`nome`;
    
    SELECT `view_paciente1`.`nome`,
    `view_paciente1`.`dataEntrada`,
    `view_paciente1`.`dataSaida`,
    `view_paciente1`.`statusEntrada`
FROM `bd`.`view_paciente1`;


-- view_paciente

select p.nome, enfp.comentario, enfp.statusDeEnfermidade, ent.dataEntrada, ent.dataSaida, ent.statusEntrada 
from tb_paciente, tb_enfermidadepessoal enfp, tb_entrada ent, tb_pessoa p 
group by p.nome ASC;
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_paciente` AS
    SELECT 
        `p`.`nome` AS `nome`,
        `enfp`.`comentario` AS `comentario`,
        `enfp`.`statusDeEnfermidade` AS `statusDeEnfermidade`,
        `ent`.`dataEntrada` AS `dataEntrada`,
        `ent`.`dataSaida` AS `dataSaida`,
        `ent`.`statusEntrada` AS `statusEntrada`
    FROM
        (((`tb_paciente`
        JOIN `tb_enfermidadepessoal` `enfp`)
        JOIN `tb_entrada` `ent`)
        JOIN `tb_pessoa` `p`)
    GROUP BY `p`.`nome`;
    
    SELECT `view_paciente`.`nome`,
    `view_paciente`.`comentario`,
    `view_paciente`.`statusDeEnfermidade`,
    `view_paciente`.`dataEntrada`,
    `view_paciente`.`dataSaida`,
    `view_paciente`.`statusEntrada`
FROM `bd`.`view_paciente`;

-- --------------------

-- view_paciente 0 e 1 Duas Chamadas

select * from view_paciente0, view_paciente1;

-- view_paciente Uma Chamada

select * from view_paciente;
-- 'NomeEnfermidade'

-- CREATE VIEW view_testy005 AS

-- view_funcionariopessoa

select p.nome, p.cpf, p.idade, p.tipoSanguineo, p.sexo, p.statusDePessoa,
f.login, f.senha, f.statusDeUsuario, f.numeroDeRegistroEnfermeiro, f.cargo, f.numeroDeRegistroMedico, f.especialidade
from tb_pessoa p, tb_funcionariopessoa f
where f.fk_idPessoa = p.idPessoa 
order by p.nome ASC;

-- ---------------


-- view_pacientepessoa

select p.nome, p.cpf, p.idade, p.tipoSanguineo, p.sexo, p.statusDePessoa, 
a.comentarioEnfermeiro, a.comentarioMedico, a.peso, a.altura, a.data,
enp.comentario, enp.statusDeEnfermidade,
en.nome AS 'NomeEnfermidade', en.tipo, en.descricao,
e.dataEntrada, e.dataSaida, e.statusEntrada
from tb_pessoa p, tb_atendimento a, tb_enfermidadepessoal enp, tb_enfermidade en, tb_entrada e, tb_paciente pa
where enp.fk_idAtendimento = a.idAtendimento
and a.fk_idEntrada = e.idEntrada
and e.fk_idPaciente = pa.idPaciente
and pa.fk_idPessoa = p.idPessoa
and enp.fk_idEnfermidade = en.idEnfermidade
group by p.nome ASC;

-- ----------------------------

SELECT `view_testy001`.`nome`,
    `view_testy001`.`cpf`,
    `view_testy001`.`idade`,
    `view_testy001`.`tipoSanguineo`,
    `view_testy001`.`sexo`,
    `view_testy001`.`statusDePessoa`,
    `view_testy001`.`comentarioEnfermeiro`,
    `view_testy001`.`comentarioMedico`,
    `view_testy001`.`peso`,
    `view_testy001`.`altura`,
    `view_testy001`.`data`,
    `view_testy001`.`comentario`,
    `view_testy001`.`statusDeEnfermidade`,
    `view_testy001`.`dataEntrada`,
    `view_testy001`.`dataSaida`,
    `view_testy001`.`statusEntrada`
FROM `bd`.`view_testy001`;

SELECT `view_testy002`.`nome`,
    `view_testy002`.`cpf`,
    `view_testy002`.`idade`,
    `view_testy002`.`tipoSanguineo`,
    `view_testy002`.`sexo`,
    `view_testy002`.`statusDePessoa`,
    `view_testy002`.`comentarioEnfermeiro`,
    `view_testy002`.`comentarioMedico`,
    `view_testy002`.`peso`,
    `view_testy002`.`altura`,
    `view_testy002`.`data`,
    `view_testy002`.`comentario`,
    `view_testy002`.`statusDeEnfermidade`,
    `view_testy002`.`NomeEnfermidade`,
    `view_testy002`.`tipo`,
    `view_testy002`.`descricao`,
    `view_testy002`.`dataEntrada`,
    `view_testy002`.`dataSaida`,
    `view_testy002`.`statusEntrada`
FROM `bd`.`view_testy002`;


SELECT `view_testy003`.`nome`,
    `view_testy003`.`cpf`,
    `view_testy003`.`idade`,
    `view_testy003`.`tipoSanguineo`,
    `view_testy003`.`sexo`,
    `view_testy003`.`statusDePessoa`,
    `view_testy003`.`comentarioEnfermeiro`,
    `view_testy003`.`comentarioMedico`,
    `view_testy003`.`peso`,
    `view_testy003`.`altura`,
    `view_testy003`.`data`,
    `view_testy003`.`comentario`,
    `view_testy003`.`statusDeEnfermidade`,
    `view_testy003`.`NomeEnfermidade`,
    `view_testy003`.`tipo`,
    `view_testy003`.`descricao`,
    `view_testy003`.`dataEntrada`,
    `view_testy003`.`dataSaida`,
    `view_testy003`.`statusEntrada`
FROM `bd`.`view_testy003`;



-- ----------------


-- view_funcionariopessoa

select p.nome, p.cpf, p.idade, p.tipoSanguineo, p.sexo, p.statusDePessoa,
f.login, f.senha, f.statusDeUsuario, f.numeroDeRegistroEnfermeiro, f.cargo, f.numeroDeRegistroMedico, f.especialidade
from tb_pessoa p, tb_funcionariopessoa f
where f.fk_idPessoa = p.idPessoa 
order by p.nome ASC;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_funcionariopessoa` AS
    SELECT 
        `p`.`nome` AS `nome`,
        `p`.`cpf` AS `cpf`,
        `p`.`idade` AS `idade`,
        `p`.`tipoSanguineo` AS `tipoSanguineo`,
        `p`.`sexo` AS `sexo`,
        `p`.`statusDePessoa` AS `statusDePessoa`,
        `f`.`login` AS `login`,
        `f`.`senha` AS `senha`,
        `f`.`statusDeUsuario` AS `statusDeUsuario`,
        `f`.`numeroDeRegistroEnfermeiro` AS `numeroDeRegistroEnfermeiro`,
        `f`.`cargo` AS `cargo`,
        `f`.`numeroDeRegistroMedico` AS `numeroDeRegistroMedico`,
        `f`.`especialidade` AS `especialidade`
    FROM
        (`tb_pessoa` `p`
        JOIN `tb_funcionariopessoa` `f`)
    WHERE
        (`f`.`fk_idPessoa` = `p`.`idPessoa`)
    ORDER BY `p`.`nome`;
    
    
    SELECT `view_funcionariopessoa`.`nome`,
    `view_funcionariopessoa`.`cpf`,
    `view_funcionariopessoa`.`idade`,
    `view_funcionariopessoa`.`tipoSanguineo`,
    `view_funcionariopessoa`.`sexo`,
    `view_funcionariopessoa`.`statusDePessoa`,
    `view_funcionariopessoa`.`login`,
    `view_funcionariopessoa`.`senha`,
    `view_funcionariopessoa`.`statusDeUsuario`,
    `view_funcionariopessoa`.`numeroDeRegistroEnfermeiro`,
    `view_funcionariopessoa`.`cargo`,
    `view_funcionariopessoa`.`numeroDeRegistroMedico`,
    `view_funcionariopessoa`.`especialidade`
FROM `bd`.`view_funcionariopessoa`;

select * from view_funcionariopessoa;
    
    
    -- -------------------
    
    
-- view_pacientepessoa

select p.nome, p.cpf, p.idade, p.tipoSanguineo, p.sexo, p.statusDePessoa, 
a.comentarioEnfermeiro, a.comentarioMedico, a.peso, a.altura, a.data,
enp.comentario, enp.statusDeEnfermidade,
en.nome AS 'NomeEnfermidade', en.tipo, en.descricao,
e.dataEntrada, e.dataSaida, e.statusEntrada
from tb_pessoa p, tb_atendimento a, tb_enfermidadepessoal enp, tb_enfermidade en, tb_entrada e, tb_paciente pa
where enp.fk_idAtendimento = a.idAtendimento
and a.fk_idEntrada = e.idEntrada
and e.fk_idPaciente = pa.idPaciente
and pa.fk_idPessoa = p.idPessoa
and enp.fk_idEnfermidade = en.idEnfermidade
group by p.nome ASC;
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_pacientepessoa` AS
    SELECT 
        `p`.`nome` AS `nome`,
        `p`.`cpf` AS `cpf`,
        `p`.`idade` AS `idade`,
        `p`.`tipoSanguineo` AS `tipoSanguineo`,
        `p`.`sexo` AS `sexo`,
        `p`.`statusDePessoa` AS `statusDePessoa`,
        `a`.`comentarioEnfermeiro` AS `comentarioEnfermeiro`,
        `a`.`comentarioMedico` AS `comentarioMedico`,
        `a`.`peso` AS `peso`,
        `a`.`altura` AS `altura`,
        `a`.`data` AS `data`,
        `enp`.`comentario` AS `comentario`,
        `enp`.`statusDeEnfermidade` AS `statusDeEnfermidade`,
        `en`.`nome` AS `NomeEnfermidade`,
        `en`.`tipo` AS `tipo`,
        `en`.`descricao` AS `descricao`,
        `e`.`dataEntrada` AS `dataEntrada`,
        `e`.`dataSaida` AS `dataSaida`,
        `e`.`statusEntrada` AS `statusEntrada`
    FROM
        (((((`tb_pessoa` `p`
        JOIN `tb_atendimento` `a`)
        JOIN `tb_enfermidadepessoal` `enp`)
        JOIN `tb_enfermidade` `en`)
        JOIN `tb_entrada` `e`)
        JOIN `tb_paciente` `pa`)
    WHERE
        ((`enp`.`fk_idAtendimento` = `a`.`idAtendimento`)
            AND (`a`.`fk_idEntrada` = `e`.`idEntrada`)
            AND (`e`.`fk_idPaciente` = `pa`.`idPaciente`)
            AND (`pa`.`fk_idPessoa` = `p`.`idPessoa`)
            AND (`enp`.`fk_idEnfermidade` = `en`.`idEnfermidade`))
    GROUP BY `p`.`nome`;
    
    
    
    SELECT `view_pacientepessoa`.`nome`,
    `view_pacientepessoa`.`cpf`,
    `view_pacientepessoa`.`idade`,
    `view_pacientepessoa`.`tipoSanguineo`,
    `view_pacientepessoa`.`sexo`,
    `view_pacientepessoa`.`statusDePessoa`,
    `view_pacientepessoa`.`comentarioEnfermeiro`,
    `view_pacientepessoa`.`comentarioMedico`,
    `view_pacientepessoa`.`peso`,
    `view_pacientepessoa`.`altura`,
    `view_pacientepessoa`.`data`,
    `view_pacientepessoa`.`comentario`,
    `view_pacientepessoa`.`statusDeEnfermidade`,
    `view_pacientepessoa`.`NomeEnfermidade`,
    `view_pacientepessoa`.`tipo`,
    `view_pacientepessoa`.`descricao`,
    `view_pacientepessoa`.`dataEntrada`,
    `view_pacientepessoa`.`dataSaida`,
    `view_pacientepessoa`.`statusEntrada`
FROM `bd`.`view_pacientepessoa`;


select * from view_pacientepessoa;
    
    
    -- -----------
    
    -- view_login
    
    select f.login, f.senha from tb_funcionariopessoa f;
    
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_login` AS
    SELECT 
        `f`.`login` AS `login`, `f`.`senha` AS `senha`
    FROM
        `tb_funcionariopessoa` `f`;
        
	SELECT `view_login`.`login`,
    `view_login`.`senha`
FROM `bd`.`view_login`;

select * from view_login;

    
    