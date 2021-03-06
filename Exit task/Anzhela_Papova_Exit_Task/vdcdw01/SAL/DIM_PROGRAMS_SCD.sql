--DROP TABLE SAL.DIM_PROGRAMS_SCD CASCADE CONSTRAINTS;

CREATE TABLE SAL.DIM_PROGRAMS_SCD
(
  PROGRAM_SURR_ID      NUMBER        PRIMARY KEY,
  PROGRAM_ID           NUMBER        NOT NULL,
  PROGRAM_CODE         VARCHAR2(10)  NOT NULL,
  PROGRAM_DESC         VARCHAR2(100) NOT NULL,
  MANAGER_ID           NUMBER        NOT NULL,
  MANAGER_DESC         VARCHAR2(100) NOT NULL,
  VALID_FROM           DATE          NOT NULL,
  VALID_TO             DATE          NOT NULL,
  IS_ACTIVE            VARCHAR2(4)   NOT NULL,
  UNSERT_DT            DATE          NOT NULL
)
TABLESPACE TS_SAL_DATA_01
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );