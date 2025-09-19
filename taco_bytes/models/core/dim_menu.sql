WITH BASE AS (
    SELECT 
        T.TRUCK_ID,
        T.MENU_TYPE_ID,
        M.MENU_ID,
        M.MENU_TYPE,
        M.TRUCK_BRAND_NAME,
        M.MENU_ITEM_ID,
        M.MENU_ITEM_NAME,
        M.ITEM_CATEGORY,
        M.ITEM_SUBCATEGORY
    FROM {{ ref('stg_truck') }} AS T
    INNER JOIN {{ ref('stg_menu') }} AS M
        ON T.MENU_TYPE_ID = M.MENU_TYPE_ID
)

SELECT *
FROM BASE
