{% macro pivot_to_monthly_sales(source_table) %}
    with base as (
        select *
        from {{ source(source_table[0], source_table[1]) }}
    ),
    monthly_sales as (
        {% set months = range(1, 13) %}
        {% for month in months %}
            select 
                vendedor,
                empresa,
                ubicacion,
                'mes{{ month }}' as mes_num, 
                case 
                    when {{ month }} = 1 then 'Enero'
                    when {{ month }} = 2 then 'Febrero'
                    when {{ month }} = 3 then 'Marzo'
                    when {{ month }} = 4 then 'Abril'
                    when {{ month }} = 5 then 'Mayo'
                    when {{ month }} = 6 then 'Junio'
                    when {{ month }} = 7 then 'Julio'
                    when {{ month }} = 8 then 'Agosto'
                    when {{ month }} = 9 then 'Septiembre'
                    when {{ month }} = 10 then 'Octubre'
                    when {{ month }} = 11 then 'Noviembre'
                    when {{ month }} = 12 then 'Diciembre'
                end as mes,
                mes{{ month }} as venta
            from base
            {% if not loop.last %} union all {% endif %}
        {% endfor %}
    )
    select *
    from monthly_sales
{% endmacro %}
