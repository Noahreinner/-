SELECT
  er.Geo AS Region,  
  -- 计算平均发货时间
  ROUND(AVG(DATEDIFF(eos.DELIVERY_TS, eos.PURCHASE_TS)), 2) AS Days_to_Ship
FROM
  elist_order eo 
  JOIN elist_customer ec ON eo.customer_id = ec.customer_id
  LEFT JOIN elist_order_status eos ON eo.ID = eos.ORDER_ID 
  LEFT JOIN elist_region er ON ec.country_code = er.country_code  
WHERE
  -- 过滤条件：2020年的网站订单 或者 所有年份的手机应用订单
  (EXTRACT(YEAR FROM eos.PURCHASE_TS) = 2020 AND eo.PURCHASE_PLATFORM = 'website') 
  OR (eo.PURCHASE_PLATFORM = 'mobile app')
GROUP BY er.Geo  
ORDER BY 2 DESC;