{{ config (
    materialized="table"
)}}

select  date_day, 
        year(date_day) date_year, 
        month(date_day) date_month,
        quarter(date_day) date_quarter, 
        DAYOFWEEK( date_day ) day_of_week,
        DAYOFYEAR( date_day ) day_of_year,
        WEEK( date_day ) week_of_day,
        DAYNAME( date_day ) day_name,
        date_day -1 lag_date_1, 
        year(date_day)*100+ lpad(month(date_day),2,'0') year_month  
    FROM
{{ source('exercise_data', 'ALL_DATES') }}