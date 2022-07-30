select *
from airbnb.dev.fct_reviews f
inner join airbnb.dev.dim_listings_cleansed d
on f.listing_id = d.listing_id
where  f.review_date < d.created_at