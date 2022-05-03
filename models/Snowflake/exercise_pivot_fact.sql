{%- set activities = ['Pull_Up', 'Crunch','Push_Up','Plank_Time','Dumbbells','Box_Jump'] -%}

select date_done,
       {% for activity in activities -%}

       sum(case when replace(description,' ','_') = '{{ activity }}' then act_count else 0 end)
            as {{ activity }}_count

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
 
from {{ source('exercise_data','V_EXERCISE_STAR') }}

   group by 1