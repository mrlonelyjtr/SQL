-- Q3
INSERT INTO ProductMargin (product_id, product_name, sale_price, purchase_price, margin)
SELECT product_id, product_name, sale_price, purchase_price, sale_price - purchase_price
FROM Product;

-- Q4
UPDATE ProductMargin
SET sale_price = 3000
WHERE product_name = '运动T恤';

UPDATE ProductMargin
SET margin = sale_price - purchase_price
WHERE product_name = '运动T恤';