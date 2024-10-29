-- models/DIM_DURACION.sql
{{ config(materialized='table') }}  -- Asegúrate de que esta línea esté en la parte superior


SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY DURACION) AS DURACION_ID, -- Generar un ID único
    DURACION
FROM      {{ source('STAGING', 'experiencias')  }}  