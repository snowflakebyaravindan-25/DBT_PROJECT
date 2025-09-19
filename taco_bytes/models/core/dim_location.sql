WITH BASE AS (
    SELECT 
        L.LOCATION_ID,
        L.LOCATION_NAME,
        L.CITY_NAME,
        L.REGION,
        L.COUNTRY_NAME
    FROM {{ ref('stg_location') }} AS L
    LEFT JOIN {{ ref('stg_country') }} AS C
        ON L.COUNTRY_NAME = C.COUNTRY_NAME
)

SELECT *
FROM BASE
