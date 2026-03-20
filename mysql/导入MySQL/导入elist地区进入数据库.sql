truncate elist地区表;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/elist_region.csv'
INTO TABLE elist地区表
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

select * from elist地区表