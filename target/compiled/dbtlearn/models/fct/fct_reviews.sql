-- auto-incremental set up--

-------------------------------
with  __dbt__cte__src_reviews as (
with raw_reviews as (
    select * from "AIRBNB"."RAW"."RAW_REVIEWS"
)
select
	listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
FROM raw_reviews
),src_reviews as (
    select * from __dbt__cte__src_reviews
)
 
select 
    md5(cast(coalesce(cast(listing_id as 
    varchar
), '') || '-' || coalesce(cast(review_date as 
    varchar
), '') || '-' || coalesce(cast(review_text as 
    varchar
), '') as 
    varchar
)) as review_id,  /*这个是扩展包里的surrogate_key*/
    * 
from src_reviews
where review_text is not null

--------------------------------
--tell pc how to incremental--


    and review_date > (select max(review_date) from airbnb.dev.fct_reviews)
