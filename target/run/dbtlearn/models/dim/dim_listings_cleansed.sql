
  create or replace  view airbnb.dev.dim_listings_cleansed
  
   as (
    

with  __dbt__cte__src_listings as (
WITH raw_listings AS (
SELECT * FROM airbnb.raw.raw_listings
)
SELECT
id AS listing_id,
name AS listing_name,
listing_url,
room_type,
minimum_nights,
host_id,
price AS price_str,
created_at,
updated_at
FROM
raw_listings
),src_listings as(
    select * from __dbt__cte__src_listings
)
select 
    listing_id,
    listing_name,
    room_type,
    CASE
        WHEN minimum_nights =0 then 1
        else minimum_nights
    end as minimum_nights,
    host_id,
    replace(
        price_str,
        '$'
    ) ::number(
        10,2
    ) as price,
    created_at,
    updated_at
From 
src_listings
  );
