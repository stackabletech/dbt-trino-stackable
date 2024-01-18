{{ config(materialized="ephemeral") }}
select regionkey as region_key, name as region_name, comment as region_comment
from {{ source("tpch_raw", "region") }}
