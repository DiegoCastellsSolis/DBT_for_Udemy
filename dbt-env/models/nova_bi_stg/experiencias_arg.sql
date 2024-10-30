-- models/experiencias_arg.sql
{{ config(
    materialized='table',
    database='staging' 
) }}
with source_data as (
    select * 
    from {{ source('STAGING_NOVA_BI_STG', 'experiencias') }}  -- Referencia a la fuente
    WHERE pais = 'Argentina'
)

select * 
from source_data
