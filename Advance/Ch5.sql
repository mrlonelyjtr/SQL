-- Q1
SELECT MASTER.age_class AS age_class,
       MASTER.sex_cd AS sex_cd,
       SUM(CASE WHEN pref_name IN ('秋田', '青森') THEN population ELSE NULL END) AS pop_tohoku,
       SUM(CASE WHEN pref_name IN ('东京', '千叶') THEN population ELSE NULL END) AS pop_kanto
FROM (SELECT age_class, sex_cd
      FROM TblAge CROSS JOIN TblSex) MASTER
LEFT OUTER JOIN TblPop DATA
     ON MASTER.age_class = DATA.age_class 
        AND MASTER.sex_cd = DATA.sex_cd
GROUP BY MASTER.age_class, MASTER.sex_cd;

-- Q2
CREATE VIEW Children(child)
AS 
SELECT child_1 FROM Personnel
UNION
SELECT child_2 FROM Personnel
UNION
SELECT child_3 FROM Personnel;

SELECT EMP.employee, 
       COUNT(CHILDREN.child) AS child_cnt
FROM Personnel EMP
LEFT OUTER JOIN Children ON CHILDREN.child IN (EMP.child_1, EMP.child_2, EMP.child_3)
GROUP BY EMP.employee;

-- Q3
MERGE INTO Class_A A
USING (SELECT * FROM Class_B) B ON (A.id = B.id)
WHEN MATCHED THEN 
     UPDATE SET A.name = B.name
WHEN NOT MATCHED THEN
     INSERT (id, name) INTO (B.id, B.name);