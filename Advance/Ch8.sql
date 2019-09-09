-- Q1
SELECT DISTINCT key
FROM ArrayTbl2 A1
WHERE NOT EXISTS (SELECT * 
                  FROM ArrayTbl2 A2
                  WHERE A1.key = A2.key
                        AND (A2.val <> 1
                             OR A2.val IS NULL));

SELECT DISTINCT key
FROM ArrayTbl2 A1
WHERE 1 = ALL (SELECT val 
               FROM ArrayTbl2 A2
               WHERE A1.key = A2.key);

SELECT key
FROM ArrayTbl2
ORDER BY key
HAVING SUM(CASE WHEN val = 1 THEN 1 ELSE 0 END) = 10;

SELECT key
FROM ArrayTbl2
ORDER BY key
HAVING MIN(val) = 1
       AND MAX(val) = 1;

-- Q2
SELECT *
FROM Projects P1
WHERE 'O' = ALL (SELECT CASE WHEN step_nbr <= 1 AND status = '完成' THEN 'O'
                             WHEN step_nbr > 1 AND status = '等待' THEN 'O'
                             ELSE 'X' END
                 FROM Projects P2
                 WHERE P1.project_id = P2.project_id);

-- Q3
SELECT num AS prime
FROM Numbers Dividend
WHERE num > 1
      AND NOT EXISTS (SELECT * 
                      FROM Numbers Divisor
                      WHERE Dividend.num / 2 >= Divisor.num
                            AND Divisor.num <> 1
                            AND MOD(Dividend.num, Divisor.num) = 0)
ORDER BY prime;