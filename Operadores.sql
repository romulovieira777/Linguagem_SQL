/*Selecionando todos os dados da tabela*/
select * from pedido;

/*Busca todos os dados onde a coluna daentrega seja nulo*/
select * from pedido where daEntrega is null;

/*Traz o total de registros da consulta abaixo*/
select count(*) from pedido;
select count(*) from pedido where daEntrega is null;

/*Distinct - Desconsidera os valores repetidos*/
select distinct (nrPedido), count(idProduto) as 'Total de Produto' from pedido_item limit 100;

/*AVG - Média, SUM - Soma, Round - Para tratar as casas decimais, Limit - restringe o número de registro de uma query
Max - Retorna o maior valor daquele grupo, Min - Retorna o menor valor daquele grupo*/
select nrPedido, count(idProduto) as 'Total de Produto',
round(avg(vl_precUnit),2) as 'Med Preço Unit', sum(quantidade) as 'Total PC', sum(vl_total) as 'Total Pedido',
max(vl_precUnit) as valMax, min(vl_precUnit) as valMin
from pedido_item group by nrPedido limit 100;

/*Retorna o total de caracteres*/
select length(obs) as totCaract from pedido;

/*Concatenar - Os dados*/
select concat('Pedido: ', nrPedido, ' Tabela: ', idTbPreco, ' do Repres: ', idRepres) from pedido;

/*Rplace - Substitui um valor determinado por um novo
Substring - Retorna os caracteres com base em um intervalo estabelecido pode ser Ini -> Fim, ou inicio*/
select replace(cnpjEmit, '123', 'Novo'), substr(cnpjEmit, 10), substr(cnpjEmit, -1) from pedido;

/*Lcase - Minusculo, Upper - Maiusculo*/
select lcase(obs), upper(obs) from pedido where obs is not null and obs <> '';

/*Criando tabela*/
create table tabela1 (
cod int not null primary key,
nome varchar(50) not null
);

/*Criando tabela*/
create table tabela2 (
id int not null primary key auto_increment,
cod_tab2 int not null primary key,
nomeCli varchar(40) not null,
valor decimal(10, 2) not null default 0.01,
primary key pkTab2 (id, cod_tab2),
foreign key fkTab2_1 (cod_tab2) references tabela1 (cod)
);

/*Selecionando tabelas*/
select * from tabela1;
select * from tabela2;
describe tabela2;

/*Inserindo dados*/
insert into tabela2 (id, cod_tab2, nomeCli, valor) values (null, 89, 'Andressa', 189.77);


select * from tabela1, tabela2
where tabela1.cod = tabela2.cod_tab2;

/*Intersecção*/
select tabela2.id, tabela2.cod_tab2, tabela1.nome, tabela2.nomeCli, tabela2.valor 
from tabela2
inner join tabela1 on tabela2.cod_tab2 = tabela1.cod;

/*Left Join*/
select tabela2.id, tabela2.cod_tab2, tabela1.nome, tabela2.nomeCli, tabela2.valor 
from tabela2
left join tabela1 on tabela2.cod_tab2 = tabela1.cod;

/*Right Join*/
select tabela2.id, tabela2.cod_tab2, tabela1.nome, tabela2.nomeCli, tabela2.valor 
from tabela2
right join tabela1 on tabela2.cod_tab2 = tabela1.cod
where tabela2.id is not null;

/*Full Join*/
select tabela2.id, tabela2.cod_tab2, tabela1.nome, tabela2.nomeCli, tabela2.valor 
from tabela2
full join tabela1 on tabela2.cod_tab2 = tabela1.cod;

/*Full outer join*/
select tabela2.id, tabela2.cod_tab2, tabela1.nome, tabela2.nomeCli, tabela2.valor 
from tabela2
left outer join tabela1 on tabela2.cod_tab2 = tabela1.cod
union
select tabela2.id, tabela2.cod_tab2, tabela1.nome, tabela2.nomeCli, tabela2.valor 
from tabela2
right join tabela1 on tabela2.cod_tab2 = tabela1.cod;

/*Having - Utilizado para realizar pesquisas em um campo calculado ou um atributo derivado*/
select nrPedido, count(*) from pedido_item
group by nrPedido
having count(*) > 20;
