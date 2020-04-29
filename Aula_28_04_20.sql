create table linha (
	numero int auto_increment primary key not null,
    extensao decimal(5,3) not null,
    descricao varchar(50) not null,
    primary key pkLinha (numero)
);

create table estacao (
	sigla char(10) not null,
    descricao varchar(50) not null,
    primary key pkEstacao (sigla)
);

create table estacao_linha (
	sigla char(10) not null, 
    numero int not null,
    primary key pkEstLinha (sigla, numero),
    foreign key fkEstcLinha_esta (sigla) references estacao (sigla),
    foreign key fkEstcLinha_linha (numero) references linha (numero)
);

create table recurso (
	numero_serie char(10) not null,
    numero int not null,
    primary key pk_recurso (numero_serie),
    foreign key fkRec_linha (numero) references linha (numero)
);

create table locomotiva (
	numero_serie char(10) not null,
    capacidade_tracao varchar(10) not null,
    comprimento decimal(6,3),
    primary key pkLocomotiva (numero_serie),
    foreign key fkLoc_rec (numero_serie) references recurso (numero_serie)
);

create table vagao (
	numero_serie char(10) not null,
    tipo int not null,
    capacidade decimal(10,2) not null,
    comp_test decimal(6,3) not null,
    comp_eng decimal(6,3) not null,
    primary key pkVagao (numero_serie),
    foreign key fkVagao_rec (numero_serie) references recurso(numero_serie)
);

create table trem (
	numero_serie char(10) not null,
    prefixo char(3) not null,
    data date not null,
    hora time not null,
    sigla_estac_orig char(10) not null,
    sigla_estac_dest char(10) not null,
    data_hora_partida datetime not null,
    data_hora_chegada datetime,
    primary key pkTrem (numero_serie),
    foreign key fkTrem_rec (numero_serie) references recurso (numero_serie),
    foreign key fkTrem_estOri (sigla_estac_orig) references estacao (sigla),
    foreign key fkTrem_estDest (sigla_estac_dest) references estacao (sigla)
);

create table trem_recursos (
	numero_serie_trem char(10) not null,
    numero_serie_rec char(10) not null,
    primary key pkTremRec (numero_serie_trem, numero_serie_rec),
    foreign key fkTremRec_trem (numero_serie_trem) references trem (numero_serie),
    foreign key fkTremRec_Rec (numero_serie_rec) references recurso (numero_serie)
);
