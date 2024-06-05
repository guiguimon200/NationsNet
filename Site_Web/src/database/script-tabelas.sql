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

drop database nationsnet;
create database nationsnet;

use nationsnet;

create table usuario (
	idUsuario int primary key AUTO_INCREMENT,
	nome varchar(50),
	ddd char(2),/*substr(0,2) */
	prefixo char(5), /*substr(2,5) */
	sufixo char(4), /*substr(6,4) */
	email varchar(200), 
	senha varchar(20)
);

create table quiz (
	idQuiz int primary key auto_increment,
	nome varchar(50),
    descricao varchar(50)
);

create table tentativa (
	fkUsuario int,
	fkQuiz int,
	idTentativa int auto_increment,
	dataTentativa datetime,
	pontuacao int,

	primary key (fkUsuario, fkQuiz, idTentativa),
    unique (idTentativa),
	foreign key (fkUsuario) references usuario (idUsuario),
	foreign key (fkQuiz) references quiz (idQuiz)
);

/*create table pergunta (
	idPergunta int primary key auto_increment,
	pergunta varchar(200),
	resposta varchar(45),
	fkPerguntaQz int,

	foreign key (fkPerguntaQz) references quiz (idQuiz)
);*/

create table pais (
idPais int primary key auto_increment,
nomePais varchar(45)
);

create table caracteristica (
idCarac int primary key auto_increment,
dtFundacao date,
populacao int,
lingua varchar(45),
pibBruto decimal(17,2),
pibPc decimal(8,2),
areaTerritorial decimal(10,2),
continente varchar(45),
constraint chkContinente check (continente in ('America', 'Europa', 'Africa', 'Asia', 'Oceania')),
fkPais int,

constraint fkCaracPais foreign key (fkPais) references pais(idPais) 
);

insert into quiz values 
(default, 'Quiz Bandeiras', 'Bandeiras');

insert into pais values 
(default, 'Afeganistão'),
(default, 'África do Sul'),
(default, 'Albânia'),
(default, 'Alemanha'),
(default, 'Andorra'),
(default, 'Angola'),
(default, 'Antígua e Barbuda'),
(default, 'Arábia Saudita'),
(default, 'Argélia'),
(default, 'Argentina'),
(default, 'Armênia'),
(default, 'Austrália'),
(default, 'Áustria'),
(default, 'Azerbaijão'),
(default, 'Bahamas'),
(default, 'Bahrein'),
(default, 'Bangladesh'),
(default, 'Barbados'),
(default, 'Belarus'),
(default, 'Bélgica'),
(default, 'Belize'),
(default, 'Benin'),
(default, 'Bolívia'),
(default, 'Bósnia e Herzegovina'),
(default, 'Botsuana'),
(default, 'Brasil'),
(default, 'Brunei'),
(default, 'Bulgária'),
(default, 'Burkina Faso'),
(default, 'Burundi'),
(default, 'Butão'),
(default, 'Cabo Verde'),
(default, 'Camarões'),
(default, 'Camboja'),
(default, 'Canadá'),
(default, 'Catar'),
(default, 'Cazaquistão'),
(default, 'Chade'),
(default, 'Chile'),
(default, 'China'),
(default, 'Chipre'),
(default, 'Colômbia'),
(default, 'Comores'),
(default, 'Congo'), -- Congo-Kinshasa republica democratica do congo
(default, 'Coreia do Norte'),
(default, 'Coreia do Sul'),
(default, 'Costa do Marfim'),
(default, 'Costa Rica'),
(default, 'Croácia'),
(default, 'Cuba'),
(default, 'Dinamarca'),
(default, 'Djibouti'),
(default, 'Dominica'),
(default, 'Egito'),
(default, 'El Salvador'),
(default, 'Emirados Árabes Unidos'),
(default, 'Equador'),
(default, 'Eritreia'),
(default, 'Eslováquia'),
(default, 'Eslovênia'),
(default, 'Espanha'),
(default, 'Estados Unidos'),
(default, 'Estônia'),
(default, 'Essuatíni'),
(default, 'Etiópia'),
(default, 'Fiji'),
(default, 'Filipinas'),
(default, 'Finlândia'),
(default, 'França'),
(default, 'Gabão'),
(default, 'Gâmbia'),
(default, 'Gana'),
(default, 'Geórgia'),
(default, 'Granada'),
(default, 'Grécia'),
(default, 'Granada'),
(default, 'Guatemala'),
(default, 'Guiana'),
(default, 'Guiné'),
(default, 'Guiné Equatorial'),
(default, 'Guiné-Bissau'),
(default, 'Haiti'),
(default, 'Honduras'),
(default, 'Hungria'),
(default, 'Iêmen'),
(default, 'Ilhas Marshall'),
(default, 'Ilhas Salomão'),
(default, 'Índia'),
(default, 'Indonésia'),
(default, 'Irã'),
(default, 'Iraque'),
(default, 'Irlanda'),
(default, 'Islândia'),
(default, 'Israel'),
(default, 'Itália'),
(default, 'Jamaica'),
(default, 'Japão'),
(default, 'Jordânia'),
(default, 'Kiribati'),
(default, 'Kuwait'),
(default, 'Laos'),
(default, 'Lesoto'),
(default, 'Letônia'),
(default, 'Líbano'),
(default, 'Libéria'),
(default, 'Líbia'),
(default, 'Liechtenstein'),
(default, 'Lituânia'),
(default, 'Luxemburgo'),
(default, 'Macedônia do Norte'),
(default, 'Madagascar'),
(default, 'Malásia'),
(default, 'Maláui'),
(default, 'Maldivas'),
(default, 'Mali'),
(default, 'Malta'),
(default, 'Marrocos'),
(default, 'Maurício'),
(default, 'Mauritânia'),
(default, 'México'),
(default, 'Mianmar'),
(default, 'Micronésia'),
(default, 'Moçambique'),
(default, 'Moldávia'),
(default, 'Mônaco'),
(default, 'Mongólia'),
(default, 'Montenegro'),
(default, 'Namíbia'),
(default, 'Nauru'),
(default, 'Nepal'),
(default, 'Nicarágua'),
(default, 'Níger'),
(default, 'Nigéria'),
(default, 'Noruega'),
(default, 'Nova Zelândia'),
(default, 'Omã'),
(default, 'Países Baixos'),
(default, 'Palau'),
(default, 'Panamá'),
(default, 'Papua-Nova Guiné'),
(default, 'Paquistão'),
(default, 'Paraguai'),
(default, 'Peru'),
(default, 'Polônia'),
(default, 'Portugal'),
(default, 'Quênia'),
(default, 'Quirguistão'),
(default, 'Reino Unido'),
(default, 'República Centro-Africana'),
(default, 'República do Congo'),
(default, 'República Dominicana'),
(default, 'Romênia'),
(default, 'Ruanda'),
(default, 'Rússia'),
(default, 'Samoa'),
(default, 'Santa Lúcia'),
(default, 'São Cristóvão e Nevis'),
(default, 'São Marino'),
(default, 'São Tomé e Príncipe'),
(default, 'São Vicente e Granadinas'),
(default, 'Senegal'),
(default, 'Serra Leoa'),
(default, 'Sérvia'),
(default, 'Seychelles'),
(default, 'Singapura'),
(default, 'Síria'),
(default, 'Somália'),
(default, 'Sri Lanka'),
(default, 'Sudão'),
(default, 'Sudão do Sul'),
(default, 'Suécia'),
(default, 'Suíça'),
(default, 'Suriname'),
(default, 'Tailândia'),
(default, 'Tajiquistão'),
(default, 'Tanzânia'),
(default, 'Tcheca'),
(default, 'Timor-Leste'),
(default, 'Togo'),
(default, 'Tonga'),
(default, 'Trinidad e Tobago'),
(default, 'Tunísia'),
(default, 'Turquemenistão'),
(default, 'Turquia'),
(default, 'Tuvalu'),
(default, 'Ucrânia'),
(default, 'Uganda'),
(default, 'Uruguai'),
(default, 'Uzbequistão'),
(default, 'Vanuatu'),
(default, 'Venezuela'),
(default, 'Vietnã'),
(default, 'Zâmbia'),
(default, 'Zimbábue');

select * from usuario join tentativa on fkUsuario = idUsuario;