{{ config(materialized="table") }}
select
    orderkey as order_key,
    custkey as customer_key,
    orderstatus as order_status_code,
    totalprice as order_amount,
    orderdate as order_date,
    orderpriority as order_priority_code,
    clerk as order_clerk_name,
    shippriority as shipping_priority,
    comment as order_comment
from {{ source("tpch_raw", "orders") }}
