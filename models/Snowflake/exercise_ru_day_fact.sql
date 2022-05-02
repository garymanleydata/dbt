{{ config(materialized='table') }}

select date_done, activity_type_id, sum(activity_count) activity_count
from {{ source('exercise_data','EXERCISE_FACT') }}
group by date_done, activity_type_id