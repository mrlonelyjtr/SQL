-- Q1
SELECT center
FROM Materials2
GROUP BY center
HAVING COUNT(material || orgland) <> COUNT(DISTINCT material || orgland);

-- Q2
SELECT student_id
FROM TestScores
WHERE subject IN ('数学', '语文')
GROUP BY student_id
HAVING SUM(CASE WHEN subject = '数学' AND score >= 80 THEN 1 
                WHEN subject = '语文' AND score >= 50 THEN 1 
                ELSE 0 
           END) = 2;