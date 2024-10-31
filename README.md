# Guía de Instalación y Uso de DBT con Snowflake

Este documento describe los pasos para instalar  y desplegar DBT. Asegúrate de tener python instalado.

## Requisitos Previos
Para poder desarrollar a cabo las tareas debemos tenes instalado python y posteriormente DBT con el conector al warehouse deseado, en mi caso Snowflake.
Instalamos python en caso de tenerlo instalado
- [python](python.org/downloads./)

## Documentacion

- [DBT](https://docs.getdbt.com/docs/build/documentation/)
- [Snowflake](https://docs.snowflake.com/en/user-guide/warehouses/)


## Pasos para Desplegar DBT

1. **Crear un entorno virtual**  
Crea el entorno de trabajo para el proyecto
    ```bash
        python -m venv dbt-env
    ```

2. **Activa el entorno**
Activa el entorno de trabajo para el proyecto
    ```bash
        .\dbt-env\Scripts\activate
    ```
3. **Ingresa al proyecto**
Ingresamos a el entorno de trabajo para el proyecto
    ```bash
        cd dbt-env
    ```

4. **Creamos las conecciones a las bases de datos**
Ubicamos la carpeta .dbt donde se encuentra 
    ```bash
       C:\Users\{{usuario}}\.dbt
    ```
remplazar {{usuario}} por tu usuario.
dentro de dicha carpeta encontraremos el archivo profiles.yml que deberia de tener la siguiente apariencia:
      
5. **Creamos modelos**
Eje 

6. **Creamos Seeds**
De 

7. **Compilamos**
Ahora compilamos los modelos y las semillas
    ```bash
        dbt run
        dbt seed 
    ```

7.**Acceso a la Interfaz de Usuario de Airflow**
Puedes acceder a la interfaz de usuario de Airflow abriendo un navegador y navegando a:
    ```bash
        dbt docs generate
        dbt docs serve 
    ```
O en su defecto.
    ```bash
        http://localhost:8081
    ```