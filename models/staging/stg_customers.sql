with source as (
    select * from `dbt-tutorial.jaffle_shop.customers`
),

renamed as (
    select
        id          as customer_id,
        first_name,
        last_name,
        CURRENT_TIMESTAMP() AS run_at
    from source
)

select * from renamed