/*
2 Q2 - Minimum Cost Supplier Query
This query finds which supplier should be selected to place an order for a given part in a given region
Full description:https://www.tpc.org/tpc_documents_current_versions/pdf/tpc-h_v3.0.1.pdf (Page 30)
*/
with
    parts_suppliers as (

        select
            s.supplier_account_balance,
            s.supplier_name,
            s.supplier_nation_key,
            s.supplier_region_key,
            s.supplier_nation_name,
            s.supplier_region_name,
            s.part_key,
            s.part_manufacturer_name,
            s.part_size,
            s.part_type_name,
            s.supplier_cost_amount,
            s.supplier_address,
            s.supplier_phone_number,
            rank() over (
                partition by s.supplier_region_key, s.part_key
                order by s.supplier_cost_amount
            ) as supplier_cost_rank,
            row_number() over (
                partition by s.supplier_region_key, s.part_key, s.supplier_cost_amount
                order by s.supplier_account_balance desc
            ) as supplier_rank
        from {{ ref("gold_dim_part_suppliers") }} s
    )
select s.*
from parts_suppliers s
where s.supplier_cost_rank = 1 and s.supplier_rank <= 100
order by s.supplier_name, s.part_key
