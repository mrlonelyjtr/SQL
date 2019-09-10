-- Q1
SELECT seq
FROM Sequence N
WHERE seq BETWEEN 1 AND 12
      AND NOT EXISTS (SELECT * 
                      FROM SeqTbl S
                      WHERE S.seq = N.seq);

SELECT N.seq
FROM Sequence N
LEFT OUTER JOIN SeqTbl S ON N.seq = S.seq
WHERE N.seq BETWEEN 1 AND 12
      AND S.seq IS NULL;

-- Q2
SELECT S1.seat AS start_seat, '~', S2.seat AS end_seat
FROM Seats S1, Seats S2, Seats S3
WHERE S2.seat = S1.seat + (:head_cnt - 1)
      AND S3.seat BETWEEN S1.seat AND S2.seat
GROUP BY S1.seat, S2.seat
HAVING COUNT(*) = SUM(CASE WHEN S3.status = '未预订' THEN 1 ELSE 0 END);

SELECT S1.seat AS start_seat, '~', S2.seat AS end_seat
FROM Seats2 S1, Seats2 S2, Seats2 S3
WHERE S2.seat = S1.seat + (:head_cnt - 1)
      AND S3.seat BETWEEN S1.seat AND S2.seat
GROUP BY S1.seat, S2.seat
HAVING COUNT(*) = SUM(CASE WHEN S3.status = '未预订' AND S3.row_id = S1.row_id 
                           THEN 1 ELSE 0 END);

-- Q3
SELECT S1.seat AS start_seat,
       S2.seat AS end_seat,
       S2.seat - S1.seat + 1 AS seat_cnt
FROM Seats3 S1, Seats3 S2, Seats3 S3
WHERE S1.seat <= S2.seat
      AND S3.seat BETWEEN S1.seat - 1 AND S2.seat + 1
GROUP BY S1.seat, S2.seat
HAVING COUNT(*) = SUM(CASE WHEN S3.seat BETWEEN S1.seat AND S2.seat
                                AND S3.status = '未预订' THEN 1
                           WHEN S3.seat = S2.seat + 1 
                                AND S3.status <> '未预订' THEN 1
                           WHEN S3.seat = S1.seat - 1 
                                AND S3.status <> '未预订' THEN 1
                           ELSE 0
                      END);