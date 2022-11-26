{% snapshot scd_raw_hosts  %}

{{
   config(
        target_schema= env_var("DBT_KBC_KEBOOLADBTPROJECT2_SCHEMA"),
       unique_key='id',
       strategy='check',
        check_cols=['name', 'is_superhost'],
   )
}}
select * FROM   {{ source('in.c-airbnb', 'raw-hosts') }} --source use table name mapping from sources.yml

{% endsnapshot %}