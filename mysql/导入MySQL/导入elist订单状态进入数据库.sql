truncate elist订单状态表;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/elist_order_status.csv'
INTO TABLE elist订单状态表
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@ORDER_ID, @PURCHASE_TS, @SHIP_TS, @DELIVERY_TS, @REFUND_TS)
SET 
    ORDER_ID = @ORDER_ID,
    PURCHASE_TS = @PURCHASE_TS,
    SHIP_TS = @SHIP_TS,
    DELIVERY_TS = @DELIVERY_TS,
    REFUND_TS = NULLIF(@REFUND_TS, '');

show warnings;

select * from elist订单状态表 limit 10;

select count(*) from elist订单状态表

