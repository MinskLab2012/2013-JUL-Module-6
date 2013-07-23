 drop table t_years cascade constraints purge;
 create table t_years
 (
    calendar_year number(5, 0) not null,
    days_in_cal_year number(5, 0) not null,
    is_bissextile varchar2 (1 byte),
    beg_of_cal_year varchar2 (36 byte),
    end_of_cal_year varchar2 (36 byte),
    constraint PK_year primary key (calendar_year)
 );
--alter table dw.t_years 
--	add constraint FK_TIMES_YEARS foreign key (calendar_year) references dw.t_times(calendar_year) on delete cascade;