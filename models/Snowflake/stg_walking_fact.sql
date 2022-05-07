{{ config(materialized='view') }}

select  WALKING_DATE, 
        STEPS , 
        DISTANCE as DISTANCE_M , 
        STEPS/1000 as STEP_K,
        DISTANCE / 1000 DISTANCE_KM, 
        ROUND(DISTANCE / 1609,3) DISTANCE_MILES 
from {{ source('exercise_data','WALKING_DATA') }}