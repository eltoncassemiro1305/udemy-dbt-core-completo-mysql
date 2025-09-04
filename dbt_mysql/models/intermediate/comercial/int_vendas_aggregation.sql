{{ 
    config(
        tags=['comercial']
    ) 
}}

with orders as (
    select 
        year(stg_orders.orderDate) as ano,
        month(stg_orders.orderDate) as mes,
        stg_order_details.priceEach as total
    from {{ ref('stg_orders') }} as stg_orders
	inner join {{ ref('stg_order_details') }} as stg_order_details
	on a.orderNumber = b.orderNumber 
)

, vendas as (
    SELECT
        ano,
        mes,
        sum(total) as total
    FROM orders
    GROUP BY mes
            , ano
)

SELECT
    *
from vendas