-- drop database dbJornalSN;

-- create database dbJornalSN;

use dbJornalSN;

create table tbadmMaster(
codAdm int not null auto_increment,
usuario varchar(30) not null,
senha varchar(14) not null,
primary key(codAdm)
);

insert into tbadmMaster(usuario,senha) values('Master','Master@1');

create table tbAdmNot(
codAdmNot int not null auto_increment,
codAdm int not null,
nome varchar(100) not null,
cpf char(14) unique not null,
telCel char(15) not null,
emailpessoal varchar(100) not null,
emailinst varchar(100) not null,
endereco varchar(100) not null,
numero varchar(10) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
cep char(9) not null,
primary key(codAdmNot),
foreign key(codAdm) references tbadmMaster(codAdm)
);

-- insert into tbAdmNot(nome,cpf,telCel,emailpessoal,emailinst,endereco,numero,bairro,cidade,estado,cep) values('Willian Brito','403.180.848-80','(11) 96624-0614','willianhenriquevb@gmail.com','willian.hvbrito@senacsp.edu.br','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100');


create table tbAdmCad(
codAdmCad int not null auto_increment,
codAdm int not null,
nome varchar(100) not null,
cpf char(14) unique not null,
telCel char(15) not null,
emailpessoal varchar(100) not null,
emailinst varchar(100) not null,
endereco varchar(100) not null,
numero varchar(10) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
cep char(9) not null,
primary key(codAdmCad),
foreign key(codAdm) references tbadmMaster(codAdm)
);

insert into tbAdmCad(nome,cpf,telCel,emailpessoal,emailinst,endereco,numero,bairro,cidade,estado,cep) values('Willian Brito','403.180.848-80','(11) 96624-0614','willianhenriquevb@gmail.com','willian.hvbrito@senacsp.edu.br','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100');

create table tbDocente(
codDoc int not null auto_increment,
codAdmCad int not null,
nome varchar(100) not null,
cpf char(14) unique not null,
telCel char(15) not null,
emailpessoal varchar(100) not null,
emailinst varchar(100) not null,
endereco varchar(100) not null,
numero varchar(10) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
cep char(9) not null,
curso varchar(20) default 'Técnico Informática' not null,
area ENUM('hardware/software','redes','programação','todas') not null,
turma char(5) not null,
primary key(codDoc),
foreign key(codAdmCad) references tbAdmCad(codAdmCad),
foreign key(codAdm) references tbadmMaster(codAdm),
foreign key(codTur) references tbTurma(codTur)
);

insert into tbAluno(nome,cpf,telCel,emailpessoal,emailinst,endereco,numero,bairro,cidade,estado,cep,curso,area,turma) values('Willian Brito','403.180.848-80','(11) 96624-0614','willianhenriquevb@gmail.com','willian.hvbrito@senacsp.edu.br','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100','Técnico Informática','Todas','TI100');

create table tbAluno(
codAlu int not null auto_increment,
codAdmCad int not null,
nome varchar(100) not null,
cpf char(14) unique not null,
telCel char(15) not null,
emailpessoal varchar(100) not null,
emailinst varchar(100) not null,
endereco varchar(100) not null,
numero varchar(10) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
cep char(9) not null,
responsavel varchar(100),
curso varchar(20) default 'Técnico Informática' not null,
area ENUM('hardware/software','redes','programação','todas') not null,
turma char(5) not null,
primary key(codAlu),
foreign key(codAdmCad) references tbAdmCad(codAdmCad),
foreign key(codAdm) references tbadmMaster(codAdm),
foreign key(codTur) references tbTurma(codTur)
);

insert into tbAluno(nome,cpf,telCel,emailpessoal,emailinst,endereco,numero,bairro,cidade,estado,cep,responsavel,curso,area,turma) values('Willian Brito','403.180.848-80','(11) 96624-0614','willianhenriquevb@gmail.com','willian.hvbrito@senacsp.edu.br','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100','','Técnico Informática','Todas','TI100');

create table tbTurma(
codTur int not null auto_increment,
codAdm int not null,
turma varchar(5) not null,
curso varchar(20) default 'Técnico Informática' not null,
area ENUM('hardware/software','redes','programação','todas') not null,
primary key(codTur),
foreign key(codAdm) references tbadmMaster(codAdm)
);

insert into tbTurma(turma,curso,area) values('TI100','Técnico Informática','Todas');

create table tbNot(
codNot int not null auto_increment,
codAdm int not null,
codAdmNot int not null,
categoria ENUM('hardware/software','redes','programação','senac') not null,
titulo varchar (50) not null,
tempo DATETIME not null,
autor varchar (30) not null,
conteudo varchar (5000),
primary key(codNot),
foreign key(codAdmNot) references tbAdmNot(codAdmNot),
foreign key(codAdm) references tbadmMaster(codAdm)
);

select * from dbJornalSN; 
