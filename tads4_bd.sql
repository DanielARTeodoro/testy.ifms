
-- tads4_bd -> utf8_general_ci = Banco de Dados >>> No PhpMyAdmim. 



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
        sexo char(1),
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


    
   
    
   
