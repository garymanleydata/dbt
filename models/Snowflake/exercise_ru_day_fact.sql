{{ config(materialized='table') }}

select date_done, activity_type_id, sum(activity_count) activity_count
from exercise_fact
group by date_done, activity_type_id