{{ config(materialized='view') }}


WITH raw_hosts AS ( SELECT
*
FROM
       SAPI_9436."in.c-airbnb"."raw-hosts"
)
SELECT
id AS host_id,
NAME AS host_name, is_superhost, created_at, updated_at
FROM
raw_hosts