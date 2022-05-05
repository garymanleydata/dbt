{%- set activities = dbt_utils.get_column_values(
    table=ref('stg_exercise_star'),
    column= 'description'
) -%}

SELECT 
      {{ dbt_utils.current_timestamp() }} last_refresh,
       date_done,
       {% for activity in activities -%}

       sum(case when description = '{{ activity }}' then act_count else 0 end)
            as {{ dbt_utils.slugify(activity) }}_count

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
 
from {{ ref('stg_exercise_star') }}

   group by 2