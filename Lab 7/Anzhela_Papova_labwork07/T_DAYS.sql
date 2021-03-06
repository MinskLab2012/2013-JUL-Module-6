CREATE TABLE T_DAYS AS (
SELECT 
  TRUNC( SD + RN ) TIME_ID,
  TO_CHAR( SD + RN, 'FMDAY' ) DAY_NAME,
  TO_CHAR( SD + RN, 'D' ) DAY_NUMBER_IN_WEEK,
  TO_CHAR( SD + RN, 'DD' ) DAY_NUMBER_IN_MONTH,
  TO_CHAR( SD + RN, 'DDD' ) DAY_NUMBER_IN_YEAR,
  (CASE
      WHEN TO_CHAR( SD + RN, 'D' ) IN ( 1, 2, 3, 4, 5, 6 ) THEN
        NEXT_DAY( SD + RN, 'SATURDAY' )
      ELSE
        ( SD + RN )
    END ) -6 WEEK_ID,
  TRUNC(( SD + RN ),'MM') MONTH_ID,
  TRUNC(( SD + RN ), 'Q') QUARTER_ID,
  TRUNC(( SD + RN ), 'YYYY') YEAR_ID
 FROM
  ( 
    SELECT 
      TO_DATE( '12/31/2012', 'MM/DD/YYYY' ) SD,
      ROWNUM RN
    FROM DUAL
      CONNECT BY LEVEL <= 365
  ))

ALTER TABLE T_DAYS
ADD CONSTRAINT TD_PK PRIMARY KEY (TIME_ID);

ALTER TABLE T_DAYS
ADD CONSTRAINT TD_FK1 FOREIGN KEY (WEEK_ID) REFERENCES T_WEEKS (WEEK_ID);

ALTER TABLE T_DAYS
ADD CONSTRAINT TD_FK2 FOREIGN KEY (MONTH_ID) REFERENCES T_MONTHS (MONTH_ID);

ALTER TABLE T_DAYS
ADD CONSTRAINT TD_FK3 FOREIGN KEY (QUARTER_ID) REFERENCES T_QUARTERS (QUARTER_ID);

ALTER TABLE T_DAYS
ADD CONSTRAINT TD_FK4 FOREIGN KEY (YEAR_ID) REFERENCES T_YEARS (YEAR_ID);
