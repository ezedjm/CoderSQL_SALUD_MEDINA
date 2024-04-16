-- backp de cosas puntuales 

-- genero bkp de la estructura
create table bkp_doctors1 as (
select * from doctors where 1=0
);

select * from bkp_doctors1;

-- genero bkp de la estructura con los datos, todo entero
create table bkp_doctors2 as (
select * from doctors where 1=1
);

select * from bkp_doctors2;