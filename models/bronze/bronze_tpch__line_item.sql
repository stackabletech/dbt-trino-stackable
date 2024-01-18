{{ config(materialized="ephemeral") }}
select
    orderkey as order_key,
    partkey as part_key,
    suppkey as supplier_key,
    linenumber as order_line_number,
    quantity as quantity,
    extendedprice as extended_price,
    discount as discount_percentage,
    tax as tax_rate,
    returnflag as return_status_code,
    linestatus as order_line_status_code,
    shipdate as ship_date,
    commitdate as commit_date,
    receiptdate as receipt_date,
    shipinstruct as ship_instructions_desc,
    shipmode as ship_mode_name,
    comment as order_line_comment
from {{ source("tpch_raw", "lineitem") }}
