{{ config(materialized="ephemeral") }}
select
    suppkey as supplier_key,
    name as supplier_name,
    address as supplier_address,
    nationkey as nation_key,
    phone as supplier_phone_number,
    acctbal as supplier_account_balance,
    comment as supplier_comment
from {{ source("tpch_raw", "supplier") }}
