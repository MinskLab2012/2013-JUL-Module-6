--DROP TABLE SAL.DIM_FIN_SOURCES CASCADE CONSTRAINTS;

CREATE TABLE SAL.DIM_FIN_SOURCES
(
  FIN_SOURCE_ID         NUMBER        PRIMARY KEY,
  FIN_SOURCE_DESC       VARCHAR2(100) NOT NULL,
  INSERT_DT             DATE          NOT NULL,
  UPDATE_DT             DATE          NOT NULL
)
TABLESPACE TS_SAL_DATA_01
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );