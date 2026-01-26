-- Use the correct database
USE sales_db;

-- Preview table data + structure
SELECT * FROM store_test;
DESCRIBE store_test;

-- Fix empty product values safely
SET SQL_SAFE_UPDATES = 0;

UPDATE store_test
SET product = 'Unknown'
WHERE product = '';

SET SQL_SAFE_UPDATES = 1;

-- Verify update worked (should return 0 rows)
SELECT *
FROM store_test
WHERE product = '';

-- Extract date only (YYYY-MM-DD) from datetime string
SELECT DATE(STR_TO_DATE(date, '%Y-%m-%d %H:%i:%s')) AS clean_date
FROM store_test;