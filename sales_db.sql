-- 🏗️ Step 1: Create the `product_analysis` table by selecting relevant columns from `your_table`
CREATE TABLE product_analysis AS 
SELECT product_code, revenue, purchase_size
FROM your_table;

-- 🔍 Step 2: Verify table creation and check data
SELECT * FROM product_analysis;

-- 🏆 Step 3: Sort data by revenue in descending order
SELECT * FROM product_analysis 
ORDER BY revenue DESC;

-- 📊 Step 4: Count total records in the table
SELECT COUNT(*) FROM product_analysis;

-- 🚀 Step 5: Clean the `revenue` column by removing `$` and `,` and converting it to numeric format
SET SQL_SAFE_UPDATES = 0;  -- Disable safe updates for unrestricted modification
UPDATE product_analysis 
SET revenue = REPLACE(REPLACE(revenue, '$', ''), ',', '') * 1;
SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 🔄 Step 6: Convert `revenue` column to DECIMAL(10,2) for accurate numeric representation
ALTER TABLE product_analysis 
MODIFY COLUMN revenue DECIMAL(10,2);

-- 🔍 Step 7: Check if any revenue values still contain `$` or `,` (should return 0 rows if cleaned properly)
SELECT revenue FROM product_analysis WHERE revenue LIKE '%$%' OR revenue LIKE '%,%';

-- 🏗️ Step 8: View the structure of `product_analysis`
DESC product_analysis;

-- 🔥 Step 9: Final verification - check `product_analysis` sorted by revenue
SELECT * FROM product_analysis ORDER BY revenue DESC;

-- 📈 Step 10: Analyze customer purchases: count purchases and total spending per product
SELECT product_code, customer_id, COUNT(*) AS purchase_count, SUM(revenue) AS total_spent 
FROM store 
GROUP BY product_code, customer_id
ORDER BY total_spent DESC;

-- 🔍 Step 11: Final check - display all databases
SHOW DATABASES;
