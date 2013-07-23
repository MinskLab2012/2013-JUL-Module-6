create user DW identified by DW default tablespace tbs_lab;
grant resource to DW;
grant connect to DW;
alter user DW quota unlimited on tbs_lab;