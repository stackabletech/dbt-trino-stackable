{{ config(materialized="ephemeral") }}
select
    partkey as part_key,
    name as part_name,
    mfgr as part_manufacturer_name,
    brand as part_brand_name,
    type as part_type_name,
    size as part_size,
    container as part_container_desc,
    retailprice as retail_price,
    comment as part_comment
from {{ source("tpch_raw", "part") }}
