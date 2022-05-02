{{ config(materialized='table') }}

select activity_type_id, sum(activity_count) activity_count
from {{ source('exercise_data','EXERCISE_FACT') }}
group by activity_type_id