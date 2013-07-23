create table t_weeks as 
SELECT 
  TRUNC( sd + rn ) time_id,
  TO_CHAR( sd + rn, 'W' ) calendar_week_number,
  ( CASE
      WHEN TO_CHAR( sd + rn, 'D' ) IN ( 1, 2, 3, 4, 5, 6 ) THEN
        NEXT_DAY( sd + rn, 'Saturday' )
      ELSE
        ( sd + rn )
    END ) week_ending_date
FROM
  ( 
    SELECT 
      TO_DATE( '12/31/2002', 'MM/DD/YYYY' ) sd,
      rownum rn
    FROM dual
      CONNECT BY level <= 200
  )