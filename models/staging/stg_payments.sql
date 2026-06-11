with source as (
    select * from `dbt-tutorial.stripe.payment`
),

renamed as (
    select
        id              as payment_id,
        orderid         as order_id,
        payment_method,
        amount / 100    as amount
    from source
)

select * from renamed