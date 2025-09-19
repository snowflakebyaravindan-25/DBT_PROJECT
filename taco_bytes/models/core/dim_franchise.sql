WITH BASE AS (
    SELECT
        F.FRANCHISE_ID,
        F.FIRST_NAME,
        F.LAST_NAME,
        COALESCE(F.FIRST_NAME, '') || ' ' || COALESCE(F.LAST_NAME, '') AS FULL_NAME,
        F.CITY_NAME,
        F.COUNTRY_NAME,
        F.EMAIL,
        F.PHONE_NUMBER
    FROM {{ ref('stg_franchise') }} F
)

SELECT * 
FROM BASE