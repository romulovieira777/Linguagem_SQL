/* Total de registros na tabela */
select count(*) from mov_est;

/* Quantos operadores ja trabalharam */
select count(distinct(codOperador)) from mov_est;

/* Qual o operador que mais trabalhou em quantidade e total*/
select codOperador,count(codOperador) as total, sum(qtdMovto) as soma from mov_est
group by codOperador order by total Desc;

select codOperador, sum(qtdMovto) as soma from mov_est
group by codOperador order by soma Desc;

/* Quantos itens foram utilizados*/
select count(distinct(coditem)) from mov_est;

/* qual operação foi mais utilizada */
select tipoOper,count(tipoOper) from mov_est group by tipoOper;

/* Qual a posição mais utilizada */
select posicao,count(posicao) as total from mov_est group by posicao order by total desc limit 1;

/* Qual o Item mais utilizado */
select codItem,count(codItem) as total from mov_est group by codItem order by total desc limit 1;

/* Qual é a quantidade média, minima e Maxima */
select avg(qtdMovto),min(qtdMovto),max(qtdMovto) from mov_est;

/* Qual o registro que teve a maior Quantidade */
select * from mov_est order by qtdMovto desc limit 1;

/* Qual o dia em que houve maior numero de registros */
select daMovto,count(daMovto) as total from mov_est group by daMovto order by total desc limit 1;

/* Quantos depósitos existem */
select count(distinct(codDepOrig)) from mov_est ;

/* Quantos registros existem com o campo idPallet preenchido */
select count(*) from mov_est where idPallet is not null;