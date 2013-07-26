 CREATE TABLE T_QUARTERS AS (
  SELECT DISTINCT
  TRUNC(( SD + RN ), 'Q') QUARTER_ID,
    ( ( CASE
      WHEN TO_CHAR( SD + RN, 'Q' ) = 1 THEN
        TO_DATE( '03/31/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
      WHEN TO_CHAR( SD + RN, 'Q' ) = 2 THEN
        TO_DATE( '06/30/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
      WHEN TO_CHAR( SD + RN, 'Q' ) = 3 THEN
        TO_DATE( '09/30/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
      WHEN TO_CHAR( SD + RN, 'Q' ) = 4 THEN
        TO_DATE( '12/31/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
    END ) - TRUNC( SD + RN, 'Q' ) + 1 ) DAYS_IN_CAL_QUARTER,
  TRUNC( SD + RN, 'Q' ) BEG_OF_CAL_QUARTER,
  ( CASE
      WHEN TO_CHAR( SD + RN, 'Q' ) = 1 THEN
        TO_DATE( '03/31/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
      WHEN TO_CHAR( SD + RN, 'Q' ) = 2 THEN
        TO_DATE( '06/30/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
      WHEN TO_CHAR( SD + RN, 'Q' ) = 3 THEN
        TO_DATE( '09/30/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
      WHEN TO_CHAR( SD + RN, 'Q' ) = 4 THEN
        TO_DATE( '12/31/' || TO_CHAR( SD + RN, 'YYYY' ), 'MM/DD/YYYY' )
    END ) END_OF_CAL_QUARTER,
  TO_CHAR( SD + RN, 'Q' ) CALENDAR_QUARTER_NUMBER,
   TRUNC(( SD + RN ), 'YYYY') YEAR_ID
 FROM
  ( 
    SELECT 
      TO_DATE( '12/31/2012', 'MM/DD/YYYY' ) SD,
      ROWNUM RN
    FROM DUAL
      CONNECT BY LEVEL <= 365
  ));
  
ALTER TABLE T_QUARTERS
ADD CONSTRAINT TQ_PK PRIMARY KEY (QUARTER_ID);

ALTER TABLE T_QUARTERS
ADD CONSTRAINT TQ_FK1 FOREIGN KEY (YEAR_ID) REFERENCES T_YEARS (YEAR_ID);
