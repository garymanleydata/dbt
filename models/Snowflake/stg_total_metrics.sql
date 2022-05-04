{{ config(materialized='view') }}

{%- set activities = ['Pull_Up_count', 'Crunch_count','Push_Up_count','Plank_Time_count','Dumbbells_count','Box_Jump_count'] -%}

select {% for activity in activities -%}
        stddev({{ activity }}) as {{ activity }}_sd, 
        avg({{ activity }}) {{ activity }}_avg

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}

FROM
{{ ref('exercise_pivot_fact') }}