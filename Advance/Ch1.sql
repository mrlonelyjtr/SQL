-- Q1
SELECT key,
       CASE WHEN CASE WHEN x < y THEN y ELSE x END < z THEN z
            ELSE CASE WHEN x < y THEN y ELSE x END
       END AS greatest
FROM Greatests;

SELECT key, MAX(col) AS greatest
FROM (SELECT key, x AS col FROM Greatests
      UNION ALL
      SELECT key, y AS col FROM Greatests
      UNION ALL
      SELECT key, z AS col FROM Greatests) TMP
GROUP BY key;

-- Q2
SELECT sex,
       SUM(population) AS total,
       SUM(CASE WHEN pref_name = '德岛' THEN population ELSE 0 END) AS col_1,
       SUM(CASE WHEN pref_name = '香川' THEN population ELSE 0 END) AS col_2,
       SUM(CASE WHEN pref_name = '爱媛' THEN population ELSE 0 END) AS col_3,
       SUM(CASE WHEN pref_name = '高知' THEN population ELSE 0 END) AS col_4,
       SUM(CASE WHEN pref_name IN ('德岛', '香川', '爱媛', '高知') THEN population ELSE 0 END) AS zaijie
From PopTbl2
GROUP BY sex;

-- Q3
SELECT key, 
       CASE key WHEN 'B' THEN 1,
                WHEN 'A' THEN 2,
                WHEN 'D' THEN 3,
                WHEN 'C' THEN 4
                ELSE NULL
       END AS sort_col
FROM Greatests
ORDER BY sort_col;