create table departamento (
	dnome varchar(45) not null,
    dnumero int auto_increment primary key not null,
    gerssn int,
    gerdatainicio date
);

	create table empregado (
	ssn int auto_increment primary key not null,
	pnome varchar(50) not null,
    minicial varchar(15) not null,
    unome varchar(15) not null,
    datanasc date not null,
    endereco varchar(150) not null,
    sexo tinyint(1) not null,
    salario decimal(9,2) not null default 0,
    superssn int,
    dno varchar(20) not null,
    foreign key fkEmp_depa (dno) references departamento (dnumero)
);

alter table  departamento
add foreign key fkDep_emp (gerssn) references empregado (ssn);

create table dependente (
	essn int not null,
    idDep int not null,
    nome_dependente varchar(45) not null,
    sexo tinyint(1) not null,
    datanasc date not null,
    parentesco varchar(40) not null,
    primary key pkDependente (essn, idDep),
    foreign key fkDep_empr (ssn) references empregado (ssn)
);

create table depto_localizacoes (
	Dnumero int not null,
    dlocalizacao varchar(50) not null,
    primary key pkDeptoLocal (dnumero, dlocalizacao)    
);

create table projeto (
	pjnome varchar(50) not null,
    pnumero int auto_increment primary key not null,
    plocalizacao varchar(50) not null,
    dnum int not null,
    constraint fkProjeto_Dep foreign key (dnum) references departamento (dnumero)
);

create table trabalha_em (
	essn int not null,
    pno int not null,
    horas decimal(6,2) default 0,
    primary key pkTrab (ssn, pno)
);
