

exec sys.DBMS_STATS.GATHER_TABLE_STATS ('U_DW_EXT_REFERENCES', 'paral')



update paral
set id = 500 
where value = 300

rollback

update /*+ PARALLEL(4)*/  paral
set id = 500 
where value = 300

rollback

update /*+ PARALLEL(10)*/ paral
set id = 500 
where value = 300

rollback

select * from user_tables