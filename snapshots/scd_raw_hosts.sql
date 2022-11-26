{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

{%- endmacro %}

{% snapshot scd_raw_hosts  %}

{{
   config(
        target_schema= 'WORKSPACE_925240422',
       unique_key='id',
       strategy='check',
        check_cols=['name', 'is_superhost'],
   )
}}
select * FROM   {{ source('in.c-airbnb', 'raw-hosts') }} --source use table name mapping from sources.yml

{% endsnapshot %}