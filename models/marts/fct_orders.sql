{{ config(
    dbt_state={
        'lag_tolerance': '0m'
    }
) }}

with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(amount) as total_amount
    from payments
    group by order_id
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        CURRENT_TIMESTAMP() AS run_at,
        coalesce(order_payments.total_amount, 0) as total_amount
    from orders
    left join order_payments using (order_id)
)

select * from final