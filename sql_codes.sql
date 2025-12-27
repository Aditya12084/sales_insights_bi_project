-- SELECT COUNT(*) FROM sales.transactions;
-- SELECT COUNT(*) FROM sales.transactions WHERE market_code='Mark001';
-- SELECT * FROM sales.transactions WHERE market_code='Mark001' limit 5;
-- SELECT * FROM sales.transactions WHERE currency='USD';

-- SELECT * FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020

-- SELECT SUM(t1.sales_amount) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2019

-- SELECT SUM(sales_amount) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020 AND t1.market_code='Mark001'

-- SELECT MAX(sales_qty) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020 AND t2.month_name='April'

-- SELECT * FROM sales.transactions WHERE sales_amount<=0

-- SELECT DISTINCT(currency) FROM sales.transactions

-- SELECT COUNT(*) FROM sales.transactions WHERE currency='INR'


-- SELECT SUM(sales_qty) FROM sales.transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE t2.year=2020 AND t2.month_name='January'

-- SELECT SUM(sales_qty) FROM transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
-- WHERE market_code='Mark001' AND (currency='INR\r' OR currency='USD\r') AND t2.year=2020

SELECT t2.month_name,SUM(sales_amount) FROM transactions t1 INNER JOIN sales.date t2 ON t1.order_date=t2.date
WHERE (currency='INR\r' OR currency='USD\r') AND t2.year=2018
GROUP BY t2.month_name ORDER BY SUM(sales_amount) DESC 