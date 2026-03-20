WITH shipping_stats AS (
    SELECT
        COALESCE(er.Geo, 'Unknown') AS Region,  -- NULL 变成 'Unknown'
        ROUND(AVG(DATEDIFF(eos.DELIVERY_TS, eos.PURCHASE_TS)), 2) AS avg_days_to_ship,
        COUNT(*) AS order_count
    FROM
        elist_order eo 
        JOIN elist_customer ec ON eo.customer_id = ec.customer_id
        LEFT JOIN elist_order_status eos ON eo.ID = eos.ORDER_ID 
        LEFT JOIN elist_region er ON ec.country_code = er.country_code
    WHERE
        eos.DELIVERY_TS IS NOT NULL
        AND ((YEAR(eos.PURCHASE_TS) = 2020 AND eo.PURCHASE_PLATFORM = 'website') 
            OR (eo.PURCHASE_PLATFORM = 'mobile app'))
    GROUP BY er.Geo
)
SELECT
    Region,
    avg_days_to_ship,
    order_count,
    RANK() OVER (ORDER BY avg_days_to_ship) AS rank_by_speed
FROM shipping_stats
ORDER BY rank_by_speed;