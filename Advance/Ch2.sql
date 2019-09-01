-- Q1
SELECT P1.name AS name_1,
       P2.name AS name_2
FROM Products P1, Products P2
WHERE P1.name >= P2.name;

-- Q2
SELECT district, name, price,
       RANK() OVER (PARTITION BY district ORDER BY price DESC) AS rank_1
FROM DistrictProducts;

SELECT P1.district, P1.name, P1.price,
       (SELECT COUNT(P2.price)
        FROM DistrictProducts P2
        WHERE P2.price > P1.price
              AND P1.district = P2.district) + 1 AS rank_1
FROM DistrictProducts P1;

SELECT P1.district, P1.name,
       MAX(P1.price) AS price,
       COUNT(P2.name) + 1 AS rank_1
FROM DistrictProducts P1
LEFT OUTER JOIN DistrictProducts P2 ON P1.price < P2.price AND P1.district = P2.district
GROUP BY P1.district, P1.name;

-- Q3
UPDATE DistrictProducts2 P1
SET ranking = (SELECT COUNT(P2.price) + 1
               FROM DistrictProducts2 P2
               WHERE P2.price > P1.price
                     AND P1.district = P2.district);

UPDATE DistrictProducts2
SET ranking = (SELECT P1.ranking
               FROM (SELECT district, name,
                            RANK() OVER (PARTITION BY district ORDER BY price DESC) AS ranking
                     FROM DistrictProducts2) P1
               WHERE P1.name = DistrictProducts2.name
                     AND P1.district = DistrictProducts2.district);