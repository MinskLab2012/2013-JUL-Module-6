drop table t_times;
create table t_times
(
  time_id date,
  day_number_in_week number(2, 0),
  day_number_in_month varchar2(2 byte),
  day_number_in_year varchar2(3 byte),
  calendar_week_number number(2,0),
  week_ending_date date,
  calendar_month_number number(2, 0),
  days_in_cal_month number(3, 0),
  end_of_cal_month date,
  beg_of_cal_quarter date,
  end_of_cal_quarter date,
  calendar_quarter_number number(1, 0),
  calendar_year number(5, 0)
);
/
alter table t_times
    add constraint FK_TIMES_QUARTERS foreign key (calendar_quarter_number)
references dw.t_quarters (quarter_number) on delete cascade;

alter table t_times
    add constraint FK_TIMES_WEEKS foreign key (calendar_week_number)
references dw.t_weeks (week_id) on delete cascade;

alter table t_times
    add constraint FK_TIMES_MONTHS foreign key (calendar_month_number)
    references dw.t_months(month_id) on delete cascade;

alter table t_times
    add constraint FK_TIMES_DAYS foreign key (day_number_in_week)
    references dw.t_days (day_id) on delete cascade;

alter table t_times
    add constraint FK_TIMES_YEARS foreign key (calendar_year)
    references dw.t_years(calendar_year) on delete cascade;