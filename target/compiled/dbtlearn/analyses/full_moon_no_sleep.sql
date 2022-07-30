with mart_fullmoon_reviews as (
    select * from airbnb.dev.mart_fullmoon_reviews
)
select
    is_full_moon,
    review_sentiment,
    count(*) as review

from
    mart_fullmoon_reviews
group by 
    is_full_moon,
    review_sentiment
order by
    is_full_moon,
    review_sentiment