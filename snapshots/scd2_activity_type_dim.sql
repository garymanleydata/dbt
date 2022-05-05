{% snapshot SCD2_ACTIVITY_TYPE_DIM %}

    {{
        config(
          target_schema='WORKSPACE_15661914',
          strategy='check',
          unique_key='id',
          check_cols=['ID', 'DESCRIPTION'],
        )
    }}

    select * from {{ source('exercise_data', 'ACTIVITY_TYPE_DIM') }}

{% endsnapshot %}