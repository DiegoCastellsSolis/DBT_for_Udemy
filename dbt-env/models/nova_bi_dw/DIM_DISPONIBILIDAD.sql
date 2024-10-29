-- models/DIM_CATEGORIA.sql
{{ config(materialized='table') }}  -- Asegúrate de que esta línea esté en la parte superior

SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY DISPONIBILIDAD) AS DISPONIBILIDAD_ID, -- Generar un ID único
    DISPONIBILIDAD
FROM {{ source('STAGING', 'experiencias') }}