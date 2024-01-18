with
    suppliers as (select * from {{ ref("bronze_tpch__supplier") }}),
    nations as (select * from {{ ref("bronze_tpch__nation") }}),
    regions as (select * from {{ ref("bronze_tpch__region") }})
select
    s.supplier_key,
    s.supplier_name,
    s.supplier_address,
    n.nation_key as supplier_nation_key,
    n.nation_name as supplier_nation_name,
    r.region_key as supplier_region_key,
    r.region_name as supplier_region_name,
    s.supplier_phone_number,
    s.supplier_account_balance
from suppliers s
join nations n on s.nation_key = n.nation_key
join regions r on n.region_key = r.region_key
order by s.supplier_key
