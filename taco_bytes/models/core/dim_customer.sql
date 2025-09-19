WITH BASE AS (
    SELECT 
        CL.CUSTOMER_ID,
        CL.FIRST_NAME,
        CL.LAST_NAME,
        CL.FIRST_NAME || ' ' || CL.LAST_NAME AS FULL_NAME,
        CL.GENDER,
        CL.MARITAL_STATUS,
        CL.CHILDREN_COUNT,
        CL.FAVOURITE_BRAND,
        CL.PREFERRED_LANGUAGE,
        CL.CITY_NAME,
        CL.POSTAL_CODE,
        CL.COUNTRY_NAME,
        CO.ISO_CODE,
        CO.ISO_CURRENCY,
        CL.SIGN_UP_DATE,
        CL.BIRTHDAY_DATE,
        DATEDIFF(YEAR, CL.BIRTHDAY_DATE, CURRENT_DATE) AS AGE,
        CASE 
            WHEN AGE < 18 THEN 'Minor'
            WHEN AGE BETWEEN 18 AND 25 THEN 'Youth'
            WHEN AGE BETWEEN 26 AND 40 THEN 'Adult'
            WHEN AGE BETWEEN 41 AND 60 THEN 'Middle Age'
            WHEN AGE > 60 THEN 'Senior'
        END AS AGE_GROUP,
        CL.EMAIL,
        CL.PHONE_NUMBER
    FROM {{ ref('stg_customer_loyalty') }} AS CL
    JOIN {{ ref('stg_country') }} AS CO
        ON CL.COUNTRY_NAME = CO.COUNTRY_NAME --COUNTRY_NAME was used because the dataset does not have COUNTRY_ID in the CUSTOMER_LOYALTY table. The best practice is always to use IDs.
)

SELECT *
FROM BASE

