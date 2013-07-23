create table t_days as
 select  time_id,day_name, day_number_in_week, day_number_in_month, 
day_number_in_year
from u_dw_ext_references.ext_time_table;