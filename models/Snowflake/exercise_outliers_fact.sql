{{ config(materialized='view') }}

{%- set activities = ['Pull_Up_count', 'Crunch_count','Push_Up_count','Plank_Time_count','Dumbbells_count','Box_Jump_count'] -%}

select pf.*, 
       mf.*, 
 {% for activity in activities -%}
        f_exercise_out({{ activity }},{{ activity }}_avg, {{ activity }}_sd , 1)  as {{ activity }}_status

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}

       
FROM
{{ ref('exercise_pivot_fact') }} pf
CROSS JOIN {{ ref('stg_total_metrics') }} mf 
order by 1 desc
