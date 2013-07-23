create table t_days as
SELECT 
  TRUNC( sd + rn ) time_id,
  TO_CHAR( sd + rn, 'fmDay' ) day_name,
  TO_CHAR( sd + rn, 'D' ) day_number_in_week,
  TO_CHAR( sd + rn, 'DD' ) day_number_in_month,
  TO_CHAR( sd + rn, 'DDD' ) day_number_in_year
FROM
  ( 
    SELECT 
      TO_DATE( '12/31/2002', 'MM/DD/YYYY' ) sd,
      rownum rn
    FROM dual
      CONNECT BY level <= 200
  );