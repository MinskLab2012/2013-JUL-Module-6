drop table t_months;
create table t_months
 (
    month_id number(2, 0) not null,
    month_name varchar2 (36 byte),
    constraint PK_month_id primary key (month_id)
 )
 organization index tablespace tbs_lab;
--alter table t_months
--	add constraint FK_TIMES_MONTHS foreign key (month_id)
--references dw.t_times (calendar_month_number) on delete cascade;
