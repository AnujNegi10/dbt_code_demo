with source as (
    select * from `dbt-tutorial.jaffle_shop.orders`
),

renamed as (
    select
        id              as order_id,
        user_id         as customer_id,
        order_date,
        status,
        CURRENT_TIMESTAMP() AS run_at
    from source
)

select * from renamed