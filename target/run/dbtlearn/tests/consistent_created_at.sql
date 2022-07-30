select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select *
from airbnb.dev.fct_reviews f
inner join airbnb.dev.dim_listings_cleansed d
on f.listing_id = d.listing_id
where  f.review_date < d.created_at
      
    ) dbt_internal_test