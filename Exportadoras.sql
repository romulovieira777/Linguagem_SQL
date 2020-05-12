create table exportadoras (
cnpj varchar(14) primary key,
empresa varchar(100),
endereco varchar(100),
numero char(10),
bairro varchar(50),
cep char(9),
municipio varchar(50),
uf char(2),
cnae_primaria varchar(200),
natureza_juridica varchar(200)
);