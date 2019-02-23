-- Q1
SELECT product_name, regist_date
FROM Product
WHERE regist_date >= '2009-04-28';

-- Q3
SELECT product_name, sale_price, purchase_price
FROM Product
WHERE sale_price - purchase_price >= 500;

SELECT product_name, sale_price, purchase_price
FROM Product
WHERE NOT sale_price - purchase_price < 500;

-- Q4
SELECT product_name, product_type, (0.9 * sale_price) - purchase_price AS profit
FROM Product
WHERE (0.9 * sale_price) - purchase_price > 100
    AND (product_type = '办公用品'
    OR  product_type = '厨房用具'); 