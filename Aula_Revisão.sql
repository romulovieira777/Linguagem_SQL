create table empregado (
	pnome varchar(45) not null,
    minicial char(1) not null,
    unome varchar(30) not null,
    ssn varchar(11) not null,
    datanasc date not null,
    endereco varchar(150) not null,
    sexo char(1) not null,
    salario decimal(12,2) not null,
    superssn varchar(11) not null,
    dno char(4) not null,
    constraint pkEmpregado primary key (ssn),
    constraint fkEmpregado foreign key (superssn) references empregado (ssn)
);

create table departamento (
	dnome varchar(50) not null,
    dnumero int not null,
    gerssn varchar(11) not null,
    gerdatainicio date not null,
    primary key pkDepartamento (dnumero),
    constraint fkDepartamento foreign key (gerssn) references empregado (ssn)
);

create table depto_localizacoes (
	Dnumero int not null,
    dlocalizacao varchar(30) not null,
    primary key pkDepto_localizacoes (dnumero, dlocalizacao),
    constraint fkDepto_localizacoes foreign key (dnumero) references departamento (dnumero)
);

create table projeto (
	pjnome varchar(40) not null,
    pnumero int not null,
    plocalizacao varchar(30) not null,
    dnum int not null,
    primary key pkProjeto (pnumero),
    constraint fkProjeto foreign key (dnum) references Departamento (dnumero)
);

create table trabalha_em (
	essn varchar(40) not null,
    pno varchar(30) not null,
    horas decimal(4,2) not null,
    primary key pkTrabalha_em (essn, pno),
    constraint fkTrabalha_em foreign key (pno) references projeto (pnumero)
);

create table dependente (
	essn varchar(40) not null,
    nome_dependente varchar(100) not null,
    sexo char(1) not null,
    datanasc date not null,
    parentesco varchar(50) not null,
    primary key pkDependente (essn, nome_dependente),
    constraint fkDependente foreign key (essn) references empregado (ssn)
);

