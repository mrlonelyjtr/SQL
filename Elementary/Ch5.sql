-- Q1
CREATE VIEW ViewPractice5_1
AS
SELECT product_name, sale_price, regist_date
FROM Product
WHERE sale_price >= 1000
    AND regist_date = '2009-09-20';

-- Q3
SELECT product_id, product_name, product_type, sale_price, 
        (SELECT AVG(sale_price) FROM Product) AS sale_price_all
FROM Product;

-- Q4
CREATE VIEW AvgPriceByType
AS
SELECT product_id, product_name, product_type, sale_price,
        (SELECT AVG(sale_price)
        FROM Product P2
        WHERE P1.product_type = P2.product_type) AS avg_sale_price
FROM Product P1;