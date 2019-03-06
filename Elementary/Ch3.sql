-- Q2
SELECT product_type, SUM(sale_price), SUM(purchase_price)
FROM Product
GROUP BY product_type
HAVING SUM(sale_price) > 1.5 * SUM(purchase_price);

-- Q3
SELECT *
FROM Product
ORDER BY regist_date DESC, sale_price ASC;