{{ config(materialized='view') }}

with raw_reviews as (
select * from SAPI_9436."in.c-airbnb"."raw-reviews"
)
select 

      LISTING_ID 
	, DATE review_date
	, REVIEWER_NAME 
	, COMMENTS  as review_text
	, SENTIMENT as REVIEW_SENTIMENT
from raw_reviews