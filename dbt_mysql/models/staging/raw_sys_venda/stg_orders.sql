
{{ 
    config(
        tags=['comercial']
    ) 
}}

with orders as (
    select
        orderNumber as orderNumber,
        orderDate,
        requiredDate,
        shippedDate,
        status,
        comments,
        customerNumber
    from {{ source('sys_venda','orders') }}

)

select
  *
from orders 