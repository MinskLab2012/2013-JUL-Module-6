exec sys.DBMS_STATS.GATHER_TABLE_STATS ('U_DW_EXT_REFERENCES', 'paral')

select * from paral

select /*+ PARALLEL(4)*/  * from paral

select /*+ PARALLEL(10)*/ * from paral 