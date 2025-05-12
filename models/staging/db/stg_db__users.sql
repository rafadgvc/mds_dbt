WITH src_users AS (
    SELECT * 
    FROM {{ source('db', 'users') }}
    ),

renamed_casted AS (
    SELECT
         nombre
        ,DNI
        ,email
        ,fecha_alta_sistema
    FROM src_users
    )

SELECT * FROM renamed_casted