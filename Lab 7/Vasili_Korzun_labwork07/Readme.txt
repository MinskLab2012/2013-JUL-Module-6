At first look I thought I should normalize output of Calendar.sql to tables t_days, t_weeks, etc. 
I don't really thought it's a good idea, but decided to practice in writing simple ETL procedures. 
So I prepared user (DW), tables (T_TIMES, T_DAYS, T_WEEKS, T_MONTHS, T_QUARTERS, T_YEARS) 
to populate with data extracted from Calendar.sql. I prepared package with procedures intended to load data 
in every table.
Source files are stored in vol_1 folder.

As I learned how to do this task properly, I prepared simple clippings from Calendar.sql to extract information
to populate tables t_days, t_weeks, etc.
Source files are stored in vol_2 folder.