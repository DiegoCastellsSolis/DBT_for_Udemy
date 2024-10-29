-- models/DIM_CATEGORIA.sql
{{ config(materialized='table') }}  -- Asegúrate de que esta línea esté en la parte superior

SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY CATEGORIA) AS CATEGORIA_ID, -- Generar un ID único
    CATEGORIA
FROM {{ source('STAGING', 'experiencias') }} 