create table t_weeks as select time_id, calendar_week_number, week_ending_date
from u_dw_ext_references.ext_time_table