-- models/DIM_UBICACION.sql
{{ config(materialized='table') }}  -- Asegúrate de que esta línea esté en la parte superior

SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY UBICACION) AS UBICACION_ID, -- Generar un ID único
    UBICACION
FROM {{ source('STAGING', 'experiencias') }} 