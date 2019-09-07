-- Q1
SELECT CASE WHEN COUNT(*) <> MAX(seq) THEN '存在缺失的编号' ELSE '不存在缺失的编号' END AS gap
FROM SeqTbl;

-- Q2
SELECT dpt
FROM Students
GROUP BY dpt
HAVING COUNT(*) = SUM(CASE WHEN sbmt_date BETWEEN '2005-09-01' AND '2005-09-30' 
                           THEN 1 ELSE 0 END);

SELECT dpt
FROM Students
GROUP BY dpt
HAVING COUNT(*) = SUM(CASE WHEN EXTRACT(YEAR FROM sbmt_date) = 2005
                                AND BETWEEN EXTRACT(MONTH FROM sbmt_date) = 09 
                           THEN 1 ELSE 0 END);

-- Q3
SELECT SI.shop,
       COUNT(SI.item) AS my_item_cnt,
       (SELECT COUNT(item) FROM Items) - COUNT(SI.item) AS diff_cnt
FROM ShopItems SI, Items I
WHERE SI.item = I.item
GROUP BY SI.shop;