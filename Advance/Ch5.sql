-- Q1
SELECT S1.year, S1.sale,
       CASE SIGN(sale - (SELECT sale 
                         FROM Sales S2
                         WHERE S2.year = S1.year - 1))
            WHEN 0 THEN '→'
            WHEN 1 THEN '↑'
            WHEN -1 THEN '↓'
       ELSE '-' END AS var
FROM Sales S1
ORDER BY year;

-- Q2
SELECT reserver, start_date, end_date
FROM Reservations R1
WHERE EXISTS (SELECT * 
              FROM Reservations R2
              WHERE R1.reserver <> R2.reserver
                    AND (R1.start_date, R1.end_date) OVERLAPS (R2.start_date, R2.end_date));

SELECT R1.reserver, R1.start_date, R1.end_date
FROM Reservations R1, Reservations R2
WHERE R1.reserver <> R2.reserver
      AND (R1.start_date, R1.end_date) OVERLAPS (R2.start_date, R2.end_date));