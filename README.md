# Guía de Instalación y Uso de DBT con Snowflake

Este documento describe los pasos para instalar  y desplegar DBT. Asegúrate de tener python instalado.

## Requisitos Previos
Para poder desarrollar a cabo las tareas debemos tenes instalado python y posteriormente DBT con el conector al warehouse deseado, en mi caso Snowflake.
Instalamos python en caso de tenerlo instalado
- [python](python.org/downloads/)
- [cuenta de Snowflake](https://signup.snowflake.com/?utm_cta=trial-en-www-homepage-top-right-nav-ss-evg&_ga=2.74406678.547897382.1657561304-1006975775.1656432605&_gac=1.254279162.1656541671.Cj0KCQjw8O-VBhCpARIsACMvVLPE7vSFoPt6gqlowxPDlHT6waZ2_Kd3-4926XLVs0QvlzvTvIKg7pgaAqd2EALw_wcB)

## Documentacion

- [DBT](https://docs.getdbt.com/docs/build/documentation/)
- [Snowflake](https://docs.snowflake.com/en/user-guide/warehouses/)


## Pasos para Desplegar DBT

1. **Crear un entorno virtual.**  
Crea el entorno de trabajo para el proyecto
    ```bash
        python -m venv dbt-env
    ```

2. **Activa el entorno.**
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
    Remplazar {{usuario}} por tu usuario.
    dentro de dicha carpeta encontraremos el archivo profiles.yml que deberia de tener la siguiente apariencia:
    ``` yaml
    {{profile}}:
        outputs: 
        {{name_selected_for_enviroment_dbt_input}}:  # Cambia esto por el nombre que desees para tu entorno
            type: {{name_warehouse}}
            account: {{}}  # Sin ".snowflakecomputing.com"
            user: {{name_user_wh}}  # Tu nombre de usuario de Snowflake
            password: {{password_wh}}  # Tu contraseña de Snowflake
            warehouse: {{wh_name}}  # Reemplaza con tu warehouse de Snowflake
            role: {{wh_role}}
            database: {{name_database}}  # Reemplaza con el nombre de tu base de datos
            schema: {{name_schema}}  # Reemplaza con el esquema que deseas usar
            authenticator: {{type_authentication}}  # Este es el valor predeterminado
        {{name_selected_for_enviroment_dbt_target}}:  # Cambia esto por el nombre que desees para tu entorno
            type: {{name_warehouse}}
            account: {{}}  # Sin ".snowflakecomputing.com"
            user: {{name_user_wh}}  # Tu nombre de usuario de Snowflake
            password: {{password_wh}}  # Tu contraseña de Snowflake
            warehouse: {{wh_name}}  # Reemplaza con tu warehouse de Snowflake
            role: {{wh_role}}
            database: {{name_database}}  # Reemplaza con el nombre de tu base de datos
            schema: {{name_schema}}  # Reemplaza con el esquema que deseas usar
            authenticator: {{type_authentication}}  # Este es el valor predeterminado          
        target: {{name_selected_for_enviroment_dbt_target}}  # Define cuál de las salidas usar como objetivo por defecto
    ```
    En mi caso tiene la siguiente apariencia:
    ``` yaml
    DBT_for_Udemy:
        outputs: 
        STAGING:  # Cambia esto por el nombre que desees para tu entorno
            type: snowflake
            account: ww00509.eu-west-3.aws  # Sin ".snowflakecomputing.com"
            user: NOVABI  # Tu nombre de usuario de Snowflake
            password: Nova-bi2024  # Tu contraseña de Snowflake
            warehouse: COMPUTE_WH  # Reemplaza con tu warehouse de Snowflake
            role: ACCOUNTADMIN
            database: STAGING  # Reemplaza con el nombre de tu base de datos
            schema: PUBLIC  # Reemplaza con el esquema que deseas usar
            authenticator: snowflake  # Este es el valor predeterminado
        DW:  # Cambia esto por el nombre que desees para tu entorno
            type: snowflake
            account: ww00509.eu-west-3.aws  # Sin ".snowflakecomputing.com"
            user: NOVABI  # Tu nombre de usuario de Snowflake
            password: Nova-bi2024  # Tu contraseña de Snowflake
            warehouse: COMPUTE_WH  # Reemplaza con tu warehouse de Snowflake
            role: ACCOUNTADMIN
            database: DW  # Reemplaza con el nombre de tu base de datos
            schema: PUBLIC  # Reemplaza con el esquema que deseas usar
            authenticator: snowflake  # Este es el valor predeterminado           
        target: DW  # Define cuál de las salidas usar como objetivo por defecto
    ```
5. **Crear modelos**
    Los modelos en DBT se crean en el directorio models. Un modelo es simplemente un archivo SQL que contiene una consulta sobre la cual DBT ejecutará transformaciones.

    Crea un archivo SQL dentro de la carpeta models, por ejemplo my_first_model.sql, con una consulta básica:
    ``` sql
    -- model_1.sql
    SELECT *
    FROM {{ source('schema', 'table') }}    
    ```
    ejecuta el siguiente comando para cargar el modelo:
    ``` bash
    dbt run
    ```

6. **Crear Seeds**
    Los seeds son archivos CSV que puedes cargar directamente en Snowflake mediante DBT. Coloca tus archivos CSV en la carpeta seeds y luego ejecuta el siguiente comando para cargarlos:
    ``` bash
    dbt seed  
    ```
    Se puede cambiar el schema target agregando la siguiente configuracion en dbt_project.yml
     ``` yaml
    seeds: 
        {{name_profile}}:  #Asegúrate de que el nombre coincida exactamente con el de profiles.yml
            +database: {{name_database_target}}  #Base de datos donde se insertarán los seeds
            +schema: {{name_schema_target}}  #Puedes añadir el esquema deseado si es necesario
            +quote_columns: false  #Opcional, para evitar comillas en nombres de columnas
    ```
    En mi caso:
     ``` yaml
    seeds: 
        DBT_for_Udemy:  #Asegúrate de que el nombre coincida exactamente con el de profiles.yml
            +database: staging  #Base de datos donde se insertarán los seeds
            +schema: public  #Puedes añadir el esquema deseado si es necesario
            +quote_columns: false  #Opcional,para evitar comillas en nombres de columnas
    ```

7. **Compilamos**
    Ahora compilamos los modelos y las semillas
    ```bash
        dbt run
        dbt seed 
    ```

8. **Acceso a la Interfaz de la documentación de DBT**
    Puedes acceder a la interfaz de usuario de dbt abriendo un navegador se debe ejecutar los sig comandos:
    ```bash
        dbt docs generate
        dbt docs serve 
    ```
    Esto de permite acceder al catalogo generado en base a nuestro proyecto.
    Automaticamente esto te redirigira a 
    ```bash
        http://localhost:8080/#!/overview
    ```