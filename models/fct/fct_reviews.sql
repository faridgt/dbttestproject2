{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}

with src_reviws as (

select 


{{ dbt_utils.surrogate_key(['LISTING_ID', 'REVIEW_DATE', 'REVIEWER_NAME','REVIEW_TEXT'] ) }} as review_id,
* 

from {{ ref("src_reviews") }}

)

select * from src_reviws where review_text is not null
{% if is_incremental() %}
  and review_date>= coalesce((select max(review_date) from {{ this }}), '1900-01-01')
{% endif %}