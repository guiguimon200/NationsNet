-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

-- CREATE DATABASE aquatech;

-- USE aquatech;

-- CREATE TABLE empresa (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	razao_social VARCHAR(50),
-- 	cnpj CHAR(14)
-- );

-- CREATE TABLE usuario (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	nome VARCHAR(50),
-- 	email VARCHAR(50),
-- 	senha VARCHAR(50),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );

-- CREATE TABLE aviso (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	titulo VARCHAR(100),
-- 	descricao VARCHAR(150),
-- 	fk_usuario INT,
-- 	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
-- );

-- create table aquario (
-- /* em nossa regra de negócio, um aquario tem apenas um sensor */
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	descricao VARCHAR(300),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );

-- /* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

-- create table medida (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	dht11_umidade DECIMAL,
-- 	dht11_temperatura DECIMAL,
-- 	luminosidade DECIMAL,
-- 	lm35_temperatura DECIMAL,
-- 	chave TINYINT,
-- 	momento DATETIME,
-- 	fk_aquario INT,
-- 	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
-- );

-- insert into empresa (razao_social, cnpj) values ('Empresa 1', '00000000000000');
-- insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);

create database nationsnet;

use nationsnet;

create table usuario (
	idUsuario int primary key AUTO_INCREMENT,
	nome varchar(50),
	ddd char(2),/*substr(0,2) */
	prefixo char(5), /*substr(2,5) */
	sufixo char(4), /*substr(6,4) */
	email varchar(50), 
	senha varchar(20)
);

create table quiz (
	idQuiz int primary key auto_increment,
	nome varchar(50)
);

create table pontuacao (
	fkUsuario int,
	fkQuiz int,
	idPontuacao int primary key,
	dtPontuacao datetime,
	pontuacao int,

	primary key (fkUsuario, fkQuiz, idPontuacao),
	foreign key (fkUsuario) references usuario (idUsuario),
	foreign key (fkQuiz) references quiz (idQuiz)
);

create table resposta (
	idQuiz int primary key auto_increment,
	pergunta varchar(200),
	resposta char(1),
	fkQuizRes int,

	foreign key (fkQuizRes) references quiz (idQuiz)
);