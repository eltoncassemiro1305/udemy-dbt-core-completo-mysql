
{{ 
    config(
        tags=['comercial']
    ) 
}}

with ordersdetails as (
    select
        orderNumber,
        productCode,
        quantityOrdered,
        priceEach,
        orderLineNumber
    from {{ source('sys_venda','orderdetails') }}

)

select
  *
from ordersdetails 