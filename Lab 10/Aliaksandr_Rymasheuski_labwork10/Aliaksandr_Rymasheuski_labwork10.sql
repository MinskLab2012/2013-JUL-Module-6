CREATE TABLESPACE big_table_ts
DATAFILE 'db_big_table1.dat'
SIZE 1000M
 AUTOEXTEND ON NEXT 500M
 SEGMENT SPACE MANAGEMENT AUTO;
drop table test_big_table;
create table test_big_table
(t_id number(20),
t_values varchar2(50)
)
tablespace big_table_ts;


insert into test_big_table
select rownum,
    DBMS_RANDOM.string('l', 15)
from dual 
connect by level <1000000;
commit;

execute dbms_stats.gather_table_stats(user, 'test_big_table');
--task1
select /*+parallel(2)*/ distinct(t_values) from test_big_table;

select distinct(t_values) from test_big_table;


--task2
update test_big_table set t_values = t_values||'l';


rollback;

update /*+parallel(100)*/  test_big_table set t_values = t_values||'l';
rollback;

--task3
create index inx_test_ddl on test_big_table(t_id);

drop index inx_test_ddl;

create /*+parallel(100)*/ index inx_test_ddl on test_big_table(t_id);