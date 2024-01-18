{% snapshot orders_snapshot %}
    {{
        config(
            target_database="lakehouse",
            target_schema="dbt",
            unique_key="orderkey",
            strategy="timestamp",
            updated_at="orderdate",
        )
    }}

    select *
    from {{ source("tpch_raw", "orders") }}

{% endsnapshot %}
