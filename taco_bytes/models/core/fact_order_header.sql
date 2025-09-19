WITH BASE AS (
    SELECT 
        OH.ORDER_ID,
        CL.CUSTOMER_ID,
        TR.TRUCK_ID,
        LO.LOCATION_ID,
        OH.SHIFT_ID,
        OH.ORDER_TS,
        OH.ORDER_AMOUNT,
        OH.ORDER_TOTAL
    FROM {{ ref('stg_order_header') }} AS OH
    JOIN {{ ref('dim_customer') }} AS CL 
        ON OH.CUSTOMER_ID = CL.CUSTOMER_ID
    JOIN {{ ref('dim_truck') }} AS TR 
        ON OH.TRUCK_ID = TR.TRUCK_ID
    JOIN {{ ref('dim_location') }} AS LO 
        ON OH.LOCATION_ID = LO.LOCATION_ID
    JOIN {{ ref('dim_date') }} AS DD 
        ON CAST(OH.ORDER_TS AS DATE) = CAST(DD.DATE_DAY AS DATE)
)

SELECT * 
FROM BASE
