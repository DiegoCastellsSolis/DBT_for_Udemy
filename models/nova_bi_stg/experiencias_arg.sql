{{ config(
    materialized='table',
    database='staging',
    schema='report'  
) }}

with source_data as (
    select * 
    from {{ source('STAGING', 'experiencias') }}  -- Asegúrate de que coincida
    WHERE pais = 'Argentina'
)

select * 
from source_data
