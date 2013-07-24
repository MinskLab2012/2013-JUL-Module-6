     /*Create table*/

DROP TABLE big_table;

CREATE TABLE big_table
AS
SELECT ROWNUM numb, 'row number ' || ROWNUM row_name
FROM DUAL
CONNECT BY LEVEL <= 1000000;




     /*Select Parallel execution*/
     
SELECT /*+ PARALLEL(1)*/ COUNT(*) FROM BIG_TABLE;
SELECT /*+ PARALLEL(2)*/ COUNT(*) FROM BIG_TABLE;
SELECT /*+ PARALLEL(5)*/ COUNT(*) FROM BIG_TABLE;
SELECT /*+ PARALLEL(10)*/ COUNT(*) FROM BIG_TABLE;
SELECT /*+ PARALLEL(30)*/ COUNT(*) FROM BIG_TABLE;


     /*Parallel DML*/

ALTER SESSION ENABLE PARALLEL DML;

UPDATE /*+ PARALLEL(1)*/  BIG_TABLE SET ROW_NAME = ROW_NAME || ' :)';
ROLLBACK;
UPDATE /*+ PARALLEL(2)*/  BIG_TABLE SET ROW_NAME = ROW_NAME || ' :)';
ROLLBACK;
UPDATE /*+ PARALLEL(5)*/  BIG_TABLE SET ROW_NAME = ROW_NAME || ' :)';
ROLLBACK;
UPDATE /*+ PARALLEL(10)*/  BIG_TABLE SET ROW_NAME = ROW_NAME || ' :)';
ROLLBACK;
UPDATE /*+ PARALLEL(30)*/  BIG_TABLE SET ROW_NAME = ROW_NAME || ' :)';
ROLLBACK;


      /*Parallel DDL*/

DROP TABLE TEST_TABLE ;
CREATE  /*+ PARALLEL(1)*/  TABLE TEST_TABLE AS (SELECT T1.NUMB, T1.ROW_NAME, T2.ROW_NAME PREV_ROW_MAME FROM BIG_TABLE T1 LEFT JOIN BIG_TABLE T2 ON (T1.NUMB-1)=T2.NUMB);
DROP TABLE TEST_TABLE ;
CREATE  /*+ PARALLEL(2)*/  TABLE TEST_TABLE AS (SELECT T1.NUMB, T1.ROW_NAME, T2.ROW_NAME PREV_ROW_MAME FROM BIG_TABLE T1 LEFT JOIN BIG_TABLE T2 ON (T1.NUMB-1)=T2.NUMB);
DROP TABLE TEST_TABLE ;
CREATE  /*+ PARALLEL(5)*/  TABLE TEST_TABLE AS (SELECT T1.NUMB, T1.ROW_NAME, T2.ROW_NAME PREV_ROW_MAME FROM BIG_TABLE T1 LEFT JOIN BIG_TABLE T2 ON (T1.NUMB-1)=T2.NUMB);
DROP TABLE TEST_TABLE ;
CREATE  /*+ PARALLEL(10)*/  TABLE TEST_TABLE AS (SELECT T1.NUMB, T1.ROW_NAME, T2.ROW_NAME PREV_ROW_MAME FROM BIG_TABLE T1 LEFT JOIN BIG_TABLE T2 ON (T1.NUMB-1)=T2.NUMB);
DROP TABLE TEST_TABLE ;
CREATE  /*+ PARALLEL(30)*/  TABLE TEST_TABLE AS (SELECT T1.NUMB, T1.ROW_NAME, T2.ROW_NAME PREV_ROW_MAME FROM BIG_TABLE T1 LEFT JOIN BIG_TABLE T2 ON (T1.NUMB-1)=T2.NUMB);