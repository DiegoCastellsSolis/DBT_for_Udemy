-- models/DIM_PAIS.sql
{{ config(materialized='table') }}  -- Asegúrate de que esta línea esté en la parte superior

SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY PAIS) AS PAIS_ID, -- Generar un ID único
    PAIS 
FROM {{ source('STAGING', 'experiencias') }} 
