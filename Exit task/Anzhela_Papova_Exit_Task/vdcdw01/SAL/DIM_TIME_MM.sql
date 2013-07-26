--DROP TABLE SAL.DIM_TIME_MM CASCADE CONSTRAINTS;

CREATE TABLE SAL.DIM_TIME_MM
(
  TIME_ID                  DATE          PRIMARY KEY,
  CALENDAR_MONTH_NUMBER    VARCHAR2(10)  NOT NULL,
  DAYS_IN_CAL_MONTH        VARCHAR2(10)  NOT NULL,
  END_OF_CAL_MONTH         DATE          NOT NULL,
  CALENDAR_MONTH_NAME      VARCHAR2(40)  NOT NULL,
  DAYS_IN_CAL_QUARTER      NUMBER        NOT NULL,
  BEG_OF_CAL_QUARTER       DATE          NOT NULL,
  END_OF_CAL_QUARTER       DATE          NOT NULL,
  CALENDAR_QUARTER_NUMBER  VARCHAR2(10)  NOT NULL,
  CALENDAR_YEAR            VARCHAR2(10)  NOT NULL,
  DAYS_IN_CAL_YEAR         NUMBER        NOT NULL,
  BEG_OF_CAL_YEAR          DATE          NOT NULL,
  END_OF_CAL_YEAR          DATE          NOT NULL
)
TABLESPACE TS_SAL_DATA_01
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );