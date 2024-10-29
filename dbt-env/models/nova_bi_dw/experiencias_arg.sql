-- models/experiencias_arg.sql
{{ config(materialized='table') }}  -- Asegúrate de que esta línea esté en la parte superior

with source_data as (
    select * 
    from {{ source('STAGING', 'experiencias') }}  -- Referencia a la fuente
    WHERE pais = 'Argentina'
)

select * 
from source_data
