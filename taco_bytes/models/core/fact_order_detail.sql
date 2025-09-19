WITH BASE AS (
    SELECT 
        OD.ORDER_DETAIL_ID,
        OD.ORDER_ID,
        OD.MENU_ITEM_ID,
        OD.LINE_NUMBER,
        OD.QUANTITY,
        OD.PRICE,
        ME.SALE_PRICE_USD,
        ME.COST_OF_GOODS_USD,
        (ME.SALE_PRICE_USD - ME.COST_OF_GOODS_USD) * QUANTITY AS PROFIT_PER_ORDER
    FROM {{ ref('stg_order_details') }} AS OD
    JOIN {{ ref('stg_menu') }} AS ME 
        ON OD.MENU_ITEM_ID = ME.MENU_ITEM_ID
)

SELECT * 
FROM BASE
