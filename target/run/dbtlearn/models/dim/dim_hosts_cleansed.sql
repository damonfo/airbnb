
  create or replace  view airbnb.dev.dim_hosts_cleansed
  
   as (
    

with  __dbt__cte__src_hosts as (
with raw_hosts as (
    select * from airbnb.raw.raw_hosts
)
select 
    id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at
from
    raw_hosts
),src_hosts as (
    select * from __dbt__cte__src_hosts
)
select
    host_id,
  /*  CASE
        when host_name is null then 'Anonymous'
        else host_name
    end as host_name,
  */

    NVL(host_name, 'Anonymous') as host_name,

    is_superhost,
    created_at,
    updated_at
from src_hosts
  );
