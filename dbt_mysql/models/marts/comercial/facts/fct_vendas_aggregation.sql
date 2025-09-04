{{ 
    config(
        tags=['comercial']
    ) 
}}

with vendas_aggregation as (
    SELECT
        *
    FROM {{ ref('int_vendas_aggregation') }}
)

SELECT
    *
from vendas_aggregation
