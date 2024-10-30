-- models/experiencias_pe.sql
{{ config(
    materialized='table',
    database='staging',
    schema='report'  
) }}
with source_data as (
    select * 
    from {{ source('STAGING', 'experiencias') }}  -- Referencia a la fuente
    WHERE pais = 'Perú'
)

select * 
from source_data
