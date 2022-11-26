{% snapshot scd_raw_hosts  %}

{{
   config(
       target_database='SAPI_9436',
       target_schema='WORKSPACE_925240422',
       unique_key='id',
       strategy='check',
        check_cols=['name', 'is_superhost'],
   )
}}
select * FROM {{ source('in.c-airbnb', 'raw-hosts') }} --source use table name mapping from sources.yml

{% endsnapshot %}