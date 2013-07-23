begin
    pkg_load_times.load_t_days;
    pkg_load_times.load_t_weeks;
    pkg_load_times.load_t_months;
    pkg_load_times.load_t_years;
    pkg_load_times.load_t_quarters;
    pkg_load_times.load_t_times;
end;


select * from t_times
    join t_months
    on t_times.calendar_month_number = t_months.month_id
        join t_years
        on t_times.calendar_year = t_years.calendar_year
            join t_days
            on t_times.day_number_in_week = t_days.day_id
                join t_weeks
                on t_times.calendar_week_number = t_weeks.week_id
                    join t_quarters 
                    on t_times.calendar_quarter_number = t_quarters.quarter_number;


SELECT DISTINCT calendar_year AS mn,                                    
                                    days_in_cal_year,
                                    decode(mod(days_in_cal_year, 360), 5, 1, 0) AS bool,
                                    beg_of_cal_year,
                                    end_of_cal_year
                      FROM dw.cls_times
                  ORDER BY mn;