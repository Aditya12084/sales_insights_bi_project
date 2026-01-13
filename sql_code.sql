-- Counts total number of records (transactions) present in the sales.transactions table
-- SELECT COUNT(*) FROM sales.transactions;

-- Counts total transactions for a specific market (Mark001)
-- SELECT COUNT(*) FROM sales.transactions WHERE market_code='Mark001';

-- Fetches first 5 transactions belonging to market Mark001
-- SELECT * FROM sales.transactions WHERE market_code='Mark001' limit 5;

-- Retrieves all transactions where the currency used is USD
-- SELECT * FROM sales.transactions WHERE currency='USD';

-- Joins transactions with date table and fetches all transactions from the year 2020
-- SELECT * FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020;

-- Calculates total sales amount for the year 2019
-- SELECT SUM(t1.sales_amount) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2019;

-- Calculates total sales amount for market Mark001 in the year 2020
-- SELECT SUM(sales_amount) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020 AND t1.market_code='Mark001';

-- Finds the maximum sales quantity recorded in April 2020
-- SELECT MAX(sales_qty) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020 AND t2.month_name='April';

-- Retrieves transactions where sales amount is zero or negative (data quality check)
-- SELECT * FROM sales.transactions WHERE sales_amount<=0;

-- Lists all distinct currencies used in transactions
-- SELECT DISTINCT(currency) FROM sales.transactions;

-- Counts total number of transactions made in INR currency
-- SELECT COUNT(*) FROM sales.transactions WHERE currency='INR';

-- Calculates total quantity of products sold in January 2020
-- SELECT SUM(sales_qty) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020 AND t2.month_name='January';

-- Calculates total sales quantity for market Mark001 in 2020 using INR or USD currency
-- SELECT SUM(sales_qty) FROM transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE market_code='Mark001' AND (currency='INR\r' OR currency='USD\r') AND t2.year=2020;

-- Calculates total sales amount per month for 2018 and sorts months by highest sales
SELECT t2.month_name,SUM(sales_amount) FROM transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
WHERE (currency='INR\r' OR currency='USD\r') AND t2.year=2018
GROUP BY t2.month_name ORDER BY SUM(sales_amount) DESC;
