select * 
 from airbnb.dev.dim_listings_cleansed
 where minimum_nights < 1
 limit 10