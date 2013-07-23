create table t_years as 
select time_id, days_in_cal_year, beg_of_cal_year, end_of_cal_year
from u_dw_ext_references.ext_time_table