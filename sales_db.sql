USE sales_db;
SELECT * FROM store_test;
DESCRIBE store_test;
SET SQL_SAFE_UPDATES = 0;
UPDATE store_test
SET product = 'Unknown'
WHERE product = '';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM store_test WHERE product = '';
SELECT DATE(STR_TO_DATE(date, '%Y-%m-%d %H:%i:%s'))