{{ config(materialized='view') }}

select *
from {{ source('WALKING_DATA','') }}