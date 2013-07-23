drop table t_quarters;
create table t_quarters
(
quarter_number number(2, 0),
quarter_desc varchar2(36 byte),
constraint PK_quarter_no primary key (quarter_number)
);

--alter table t_quarters
--	add constraint FK_TIMES_QUARTERS foreign key (quarter_number)
--references dw.t_times (calendar_quarter_number) on delete cascade;
