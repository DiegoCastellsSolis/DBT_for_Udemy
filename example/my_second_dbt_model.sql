select *
from {{ source('public', 'importaciones') }}  -- Referencia a la tabla de origen
--where marca like '%PIONEER%'
