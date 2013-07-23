 drop table t_days;
 create table t_days
 (
    day_id number(2, 0) not null,
    day_name varchar2 (36 byte),
    constraint PK_day_id primary key (day_id)
 )
 organization index tablespace tbs_lab;