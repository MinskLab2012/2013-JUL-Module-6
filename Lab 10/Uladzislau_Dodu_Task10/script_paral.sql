alter session enable parallel dml

create table PARAL
(id number(3),
value number(5)
)


insert into paral
(select round(dbms_random.value(1,999)), dbms_random.value(1,1000)
from dual
connect by rownum <= 500000
)




