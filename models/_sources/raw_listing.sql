{{ config(materialized='view') }}

with raw_listtings as (
select * from  SAPI_9436."in.c-airbnb"."raw-listings"
    )
    select 
    ID as listing_id
   ,name as listing_name
   ,LISTING_URL
   ,ROOM_TYPE
   ,MINIMUM_NIGHTS
   ,HOST_ID
   ,price as price_str
   ,CREATED_AT
   ,UPDATED_AT
    from raw_listtings
