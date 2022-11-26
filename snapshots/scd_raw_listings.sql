{% snapshot scd_raw_listings %}
{{
config(
       target_schema='WORKSPACE_925240422',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       invalidate_hard_deletes=True
) }}
select * FROM  {{ source('in.c-airbnb', 'raw-listings') }}  --source use table name mapping from sources.yml
{% endsnapshot %}