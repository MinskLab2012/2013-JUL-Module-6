/* Formatted on 21.07.2013 23:08:12 (QP5 v5.139.911.3011) */
CREATE OR REPLACE PACKAGE BODY pkg_load_times
AS
   PROCEDURE load_t_days
   AS
   BEGIN
      DELETE FROM dw.t_days
            WHERE day_id NOT IN
                     (SELECT DISTINCT day_number_in_week
                        FROM dw.cls_times);

      MERGE INTO dw.t_days days
           USING (  SELECT DISTINCT day_number_in_week AS dn, day_name
                      FROM dw.cls_times
                  ORDER BY dn) cls
              ON (days.day_id = cls.dn)
      WHEN NOT MATCHED
      THEN
         INSERT            (day_id, day_name)
             VALUES (cls.dn, cls.day_name);

      COMMIT;
   END load_t_days;

   PROCEDURE load_t_weeks
   AS
   BEGIN
      DELETE FROM dw.t_weeks
            WHERE week_id NOT IN
                     (SELECT DISTINCT calendar_week_number
                        FROM dw.cls_times);

      MERGE INTO dw.t_weeks weeks
           USING (  SELECT DISTINCT
                           calendar_week_number AS mn,
                           TO_CHAR (calendar_week_number) || 'th week' AS descr
                      FROM dw.cls_times
                  ORDER BY mn) cls
              ON (weeks.week_id = cls.mn)
      WHEN NOT MATCHED
      THEN
         INSERT            (week_id, week_desc)
             VALUES (cls.mn, cls.descr);

      COMMIT;
   END load_t_weeks;

   PROCEDURE load_t_months
   AS
   BEGIN
      DELETE FROM dw.t_months
            WHERE month_id NOT IN
                     (SELECT DISTINCT calendar_month_number
                        FROM dw.cls_times);

      MERGE INTO dw.t_months mon
           USING (  SELECT DISTINCT
                           calendar_month_number AS mn,
                           calendar_month_name AS mname
                      FROM dw.cls_times
                  ORDER BY mn) cls
              ON (mon.month_id = cls.mn)
      WHEN NOT MATCHED
      THEN
         INSERT            (month_id, month_name)
             VALUES (cls.mn, cls.mname);

      COMMIT;
   END load_t_months;

   PROCEDURE load_t_years
   AS
   BEGIN
      DELETE FROM dw.t_years
            WHERE calendar_year NOT IN
                     (SELECT DISTINCT calendar_year FROM dw.cls_times);

      MERGE INTO dw.t_years yrs
           USING (  SELECT DISTINCT calendar_year AS mn,                                    
                                    days_in_cal_year,
                                    decode(mod(days_in_cal_year, 360), 5, 1, 0) AS bool,
                                    beg_of_cal_year,
                                    end_of_cal_year
                      FROM dw.cls_times
                  ORDER BY mn) cls
              ON (yrs.calendar_year = cls.mn)
      WHEN NOT MATCHED
      THEN
         INSERT  (calendar_year,
                            days_in_cal_year,
                            is_bissextile,
                            beg_of_cal_year,
                            end_of_cal_year)
             VALUES (cls.mn,                     
                     cls.days_in_cal_year,
                     cls.bool,
                     cls.beg_of_cal_year,
                     cls.end_of_cal_year);

      COMMIT;
   END load_t_years;

   PROCEDURE load_t_quarters
   AS
   BEGIN
      DELETE FROM dw.t_quarters
            WHERE quarter_number NOT IN
                     (SELECT DISTINCT calendar_quarter_number
                        FROM dw.cls_times);

      MERGE INTO dw.t_quarters qtrs
           USING (SELECT DISTINCT
                         calendar_quarter_number AS mn,
                         TO_CHAR (calendar_quarter_number) || 'th quarter'
                            AS descr
                    FROM cls_times) cls
              ON (qtrs.quarter_number = cls.mn)
      WHEN NOT MATCHED
      THEN
         INSERT            (quarter_number, quarter_desc)
             VALUES (cls.mn, cls.descr);

      COMMIT;
   END load_t_quarters;

   PROCEDURE load_t_times
   AS
   BEGIN
      DELETE FROM dw.t_times
            WHERE time_id NOT IN (     SELECT time_id FROM dw.cls_times);

      MERGE INTO dw.t_times times
           USING (SELECT time_id,
                         day_number_in_week,
                         day_number_in_month,
                         day_number_in_year,
                         calendar_week_number,
                         week_ending_date,
                         calendar_month_number,
                         days_in_cal_month,
                         end_of_cal_month,
                         beg_of_cal_quarter,
                         end_of_cal_quarter,
                         calendar_quarter_number,
                         calendar_year
                    FROM cls_times) cls
              ON (times.time_id = cls.time_id)
      WHEN NOT MATCHED
      THEN
         INSERT            (time_id,
                            day_number_in_week,
                            day_number_in_month,
                            day_number_in_year,
                            calendar_week_number,
                            week_ending_date,
                            calendar_month_number,
                            days_in_cal_month,
                            end_of_cal_month,
                            beg_of_cal_quarter,
                            end_of_cal_quarter,
                            calendar_quarter_number,
                            calendar_year)
             VALUES (cls.time_id,
                     cls.day_number_in_week,
                     cls.day_number_in_month,
                     cls.day_number_in_year,
                     cls.calendar_week_number,
                     cls.week_ending_date,
                     cls.calendar_month_number,
                     cls.days_in_cal_month,
                     cls.end_of_cal_month,
                     cls.beg_of_cal_quarter,
                     cls.end_of_cal_quarter,
                     cls.calendar_quarter_number,
                     cls.calendar_year);

      COMMIT;
   END load_t_times;
END;