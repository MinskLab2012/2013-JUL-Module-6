select /*+parallel(100)*/ count(col) from big_table;
select /*+parallel(30)*/ count(col) from big_table;
select /*+parallel(8)*/ count(col) from big_table;
select /*+parallel(6)*/ count(col) from big_table;
select /*+parallel(2)*/ count(col) from big_table;
select count(col) from big_table;



update /*+parallel(100)*/ big_table set col = 'Ihar_Yelin';
update /*+parallel(20)*/ big_table set col = 'Ihar_Yelin';
update /*+parallel(2)*/ big_table set col = 'Ihar_Yelin';
update big_table set col = 'Ihar_Yelin';

create table par100 parallel 100 as (select * from big_table)
;
truncate table par100;

create table par20 parallel 20 as (select * from big_table)
;
truncate table par20;

create table par2 parallel 2 as (select * from big_table)
;
truncate table par2;


create table bez as (select * from big_table)
;
truncate table bez;