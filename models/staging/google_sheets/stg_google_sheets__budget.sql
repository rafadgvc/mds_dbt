{{ config(
    materialized='incremental',
    incremental_strategy='microbatch',
    event_time='date_load',
    begin='2024-10-25',
    batch_size='day',
    lookback=2
) }}

WITH src_budget AS (
    SELECT * 
    FROM {{ source('google_sheets', 'budget') }}
    ),

renamed_casted AS (
    SELECT
          _row
        , product_id
        , quantity
        , month
        , _fivetran_synced AS date_load
    FROM src_budget
    )

SELECT * FROM renamed_casted