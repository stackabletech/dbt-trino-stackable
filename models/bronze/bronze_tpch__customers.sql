{{ config(materialized="ephemeral") }}
select
    custkey as customer_key,
    name as customer_name,
    address as customer_address,
    nationkey as nation_key,
    phone as customer_phone_number,
    acctbal as customer_account_balance,
    mktsegment as customer_market_segment_name,
    comment as customer_comment
from {{ source("tpch_raw", "customer") }}
