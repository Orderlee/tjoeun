#고급함수
SELECT ename,job,sal,comm,sal*0.03 커미션
FROM emp
#where comm=null; #연산이 안됨
#where comm is null; #comm 필드값이 null 이면
WHERE comm IS NULL; #null이 아니면

#comm필드가 null이면 연산이 안됨
SELECT ename,job,sal,comm,IFNULL(comm,sal*0.03) 커미션
FROM emp;

# ifnull(A,B) A가 null이면 B,아니면 A
SELECT ename,job,sal,comm,(sal+IFNULL(comm,0)) 커미션
FROM emp;

# sal*12+comm 연봉
SELECT ename,job,sal,comm,(sal*12+comm) 연봉
FROM emp;

SELECT ename,job,sal,comm,sal*12+IFNULL(comm,0) 연봉
FROM emp;

#if (조건식, 참일때, 거짓일때)
SELECT ename, deptno, comm, sal*if(comm IS NULL,0.03,0.05) 커미션
FROM emp;


INSERT INTO emp (empno,ename) VALUES (5000,'김철수');
SELECT * FROM emp;

#coalesce(), null이 아닌 첫번째값을 리턴
SELECT ename, comm, sal, COALESCE(comm, sal, 20) 치환값
FROM emp;

#비교 처리 함수
# if(조건식 ,A,B) 조건식이 True=>A, False=B
# floor() 버림함수
SELECT sal,sal/100,floor(sal/100) FROM emp;

SELECT ename, sal, if(sal Is NULL OR FLOOR(sal/100)=0,'E',
if(FLOOR(sal/100)=1,'D',
if(FLOOR(sal/100)=2,'C',
if(FLOOR(sal/100)=3,'B','A')))) 급여등급
FROM emp;

USE web;
SHOW TABLES;
SELECT DISTINCT target FROM iris;

#setosa 0, versicolor 1, virginica 2
CREATE TABLE iris2 as
SELECT target,if(target='setosa',0,
if(target='versicolor',1,2))
FROM iris;

SELECT * FROM iris2;


DROP TABLE score;
CREATE TABLE score (
student_no VARCHAR(20) PRIMARY KEY,
NAME VARCHAR(20) NOT NULL,
kor INT DEFAULT 0,
eng INT DEFAULT 0,
mat INT DEFAULT 0
);
DELETE TABLE score;
INSERT INTO score VALUES ('1','kim',90,80,70);
INSERT INTO score VALUES ('2','park',88,85,75);
INSERT INTO score VALUES ('3','hong',99,89,79);
INSERT INTO score VALUES ('4','choi',100,100,100);
INSERT INTO score VALUES ('5','lee',50,62,80);
INSERT INTO score VALUES ('6','han',45,90,80);
INSERT INTO score VALUES ('7','im',70,80,55);
INSERT INTO score VALUES ('8','kang',0,0,100);

CREATE TABLE score2 AS #복사
SELECT NAME, kor, eng, mat, (kor+eng+mat) 총점,
ROUND((kor+eng+mat)/3,2) 평균,
if(FLOOR(((kor+eng+mat)/3)/10) = 10, 'A',
if(FLOOR(((kor+eng+mat)/3)/10) = 9,'A',
if(FLOOR(((kor+eng+mat)/3)/10) = 8,'B',
if(FLOOR(((kor+eng+mat)/3)/10) = 7,'C',
if(FLOOR(((kor+eng+mat)/3)/10) =6,'D','F'))))) 등급
FROM score;

SELECT * FROM score2;


USE mydb;
SELECT NAME, POSITION, pay+IFNULL(bonus,0),
case when POSITION='정교수' then (pay+IFNULL(bonus,0))*1.1
when POSITION ='조교수' then (pay+IFNULL(bonus,0))*1.07
when POSITION ='전임강사' then (pay+IFNULL(bonus,0))*1.05
ELSE pay+IFNULL(bonus,0)
END 급여
FROM professor
ORDER BY 3 DESC;

#setosa 0, versicolor 1, virginica 2
USE web;
SELECT target,
case when target='setosa' then 0
when target='versicolor' then 1
when target='virginica' then 2
END 품종
FROM iris;

USE web;
SELECT NAME, kor, eng, mat, kor+eng+mat 총점,
ROUND((kor+eng+mat)/3,2) 평균,
case
when (kor+eng+mat)/3 >= 90 then 'A'
when (kor+eng+mat)/3 >= 80 then 'B'
when (kor+eng+mat)/3 >= 70 then 'C'
when (kor+eng+mat)/3 >= 60 then 'D'
ELSE 'F'
END 등급
FROM score;

SELECT * FROM titanic;

CREATE TABLE titanic2 as
SELECT survived,Pclass,
if(Pclass=1,1,0) Pclass1,
if(Pclass=2,1,0) Pclass2,
if(Pclass=3,1,0) Pclass3,
sex,
if(Sex='male',1,0) male,
if(Sex='female',1,0) female,
Age,SibSp,Fare
FROM titanic;

SELECT * from titanic2;




