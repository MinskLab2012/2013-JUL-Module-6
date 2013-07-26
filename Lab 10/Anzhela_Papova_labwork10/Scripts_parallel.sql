---Example of Select Parallel execution
--select statement - single serial process 
select  count(*) from t_days

--select statement - parallel processes
select /*+  parallel(50)*/  count(*) from t_days



---Example Parallel  DML
--Update statement - single serial process
update t_days set day_number_in_year = '888'

--Update statement - parallel processes
update/*+  parallel(50)*/ t_days set day_number_in_year = '999'



---Example of Parallel DDL
--Creating table - single serial process
create table t_days as (
SELECT 
  TRUNC( sd + rn ) time_id,
  TO_CHAR( sd + rn, 'fmDay' ) day_name,
  TO_CHAR( sd + rn, 'D' ) day_number_in_week,
  TO_CHAR( sd + rn, 'DD' ) day_number_in_month,
  TO_CHAR( sd + rn, 'DDD' ) day_number_in_year,
  TO_CHAR( sd + rn, 'W' ) calendar_week_number
FROM
  ( 
    SELECT 
      TO_DATE( '12/31/2012', 'MM/DD/YYYY' ) sd,
      rownum rn
    FROM dual
      CONNECT BY level <=2000000
  ))

--Creating table - parallel processes
create table t_days parallel as (
SELECT 
  TRUNC( sd + rn ) time_id,
  TO_CHAR( sd + rn, 'fmDay' ) day_name,
  TO_CHAR( sd + rn, 'D' ) day_number_in_week,
  TO_CHAR( sd + rn, 'DD' ) day_number_in_month,
  TO_CHAR( sd + rn, 'DDD' ) day_number_in_year,
  TO_CHAR( sd + rn, 'W' ) calendar_week_number
FROM
  ( 
    SELECT 
      TO_DATE( '12/31/2012', 'MM/DD/YYYY' ) sd,
      rownum rn
    FROM dual
      CONNECT BY level <=2000000
  ))