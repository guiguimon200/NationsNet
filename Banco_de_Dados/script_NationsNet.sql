drop database nationsnet;
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
	nome varchar(50),
    descricao varchar(50)
);

create table tentativa (
	fkUsuario int,
	fkQuiz int,
	idTentativa int,
	dataTentativa datetime,
	pontuacao int,

	primary key (fkUsuario, fkQuiz, idTentativa),
	foreign key (fkUsuario) references usuario (idUsuario),
	foreign key (fkQuiz) references quiz (idQuiz)
);

create table pergunta (
	idPergunta int primary key auto_increment,
	pergunta varchar(200),
	resposta varchar(45),
	fkPerguntaQz int,

	foreign key (fkPerguntaQz) references quiz (idQuiz)
);

select * from usuario;