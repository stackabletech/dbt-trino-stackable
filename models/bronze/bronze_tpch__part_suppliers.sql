{{ config(materialized="ephemeral") }}
select
    partkey as part_key,
    suppkey as supplier_key,
    availqty as supplier_availabe_quantity,
    supplycost as supplier_cost_amount,
    comment as part_supplier_comment
from {{ source("tpch_raw", "partsupp") }}
