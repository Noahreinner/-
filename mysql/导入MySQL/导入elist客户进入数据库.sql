TRUNCATE TABLE elist客户表;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/elist_customer.csv'
replace INTO TABLE elist客户表
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(customer_id, MARKETING_CHANNEL, ACCOUNT_CREATION_METHOD, LOYALTY_PROGRAM, @CREATED_ON,COUNTRY_CODE)
set
CREATED_ON  = NULLIF(STR_TO_DATE(@CREATED_ON, '%Y/%m/%d'), NULL);

select * from elist客户表
limit 10;

select count(*) from elist客户表