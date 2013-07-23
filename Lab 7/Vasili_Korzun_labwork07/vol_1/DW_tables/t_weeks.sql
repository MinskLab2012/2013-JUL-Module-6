 drop table t_weeks cascade constraints;
 create table t_weeks
 (
 week_id number(2, 0) not null,
 week_desc varchar2 (36 byte),
 constraint PK_week_id primary key (week_id)
 );
--alter table t_weeks
--	add constraint FK_TIMES_WEEKS foreign key (week_id)
--references dw.t_times (calendar_week_number) on delete cascade;