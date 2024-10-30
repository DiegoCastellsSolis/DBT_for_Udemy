-- models/FACT_EXPERIENCIAS.sql
{{ config(materialized='table') }}  -- Asegúrate de que esta línea esté en la parte superior
 
SELECT
    E.ID AS EXPERIENCIA_ID,
    C.CATEGORIA_ID,
    U.UBICACION_ID,
    P.PAIS_ID,
    D.DURACION_ID,
    DISP.DISPONIBILIDAD_ID,
    E.PRECIO
FROM      {{ source('STAGING', 'experiencias')  }} AS E
LEFT JOIN {{ source('DW', 'DIM_CATEGORIA')      }} AS C ON E.CATEG3ORIA = C.CATEGORIA
LEFT JOIN {{ source('DW', 'DIM_UBICACION')      }} AS U ON E.UBICACION = U.UBICACION
LEFT JOIN {{ source('DW', 'DIM_PAIS')           }} AS P ON E.PAIS = P.PAIS
LEFT JOIN {{ source('DW', 'DIM_DURACION')       }} AS D ON E.DURACION = D.DURACION
LEFT JOIN {{ source('DW', 'DIM_DISPONIBILIDAD') }} AS DISP ON E.DISPONIBILIDAD = DISP.DISPONIBILIDAD