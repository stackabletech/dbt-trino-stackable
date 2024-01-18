with
    parts as (select * from {{ ref("bronze_tpch__part") }}),
    suppliers as (select * from {{ ref("bronze_tpch__supplier") }}),
    part_suppliers as (select * from {{ ref("bronze_tpch__part_suppliers") }})
select

    {{ dbt_utils.generate_surrogate_key(["p.part_key", "s.supplier_key"]) }}
    as part_supplier_key,
    -- p.part_supplier_key,
    p.part_key,
    p.part_name,
    p.part_manufacturer_name,
    p.part_brand_name,
    p.part_type_name,
    p.part_size,
    p.part_container_desc,
    p.retail_price,

    s.supplier_key,
    s.supplier_name,
    s.nation_key,

    ps.supplier_availabe_quantity,
    ps.supplier_cost_amount
from parts p
join part_suppliers ps on p.part_key = ps.part_key
join suppliers s on ps.supplier_key = s.supplier_key
order by p.part_key
