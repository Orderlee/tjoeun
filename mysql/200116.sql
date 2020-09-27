#최고월급
USE mydb;
SELECT MAX(sal) FROM emp;

SELECT * FROM emp WHERE sal=600;
#서브쿼리는 ()로 묶어야 함
#서브쿼리가 먼저 실행된 후 메인쿼리가 실행함
SELECT * FROM emp WHERE sal=(SELECT MAX(sal) FROM emp);

#평균월급보다 높은 월급을 받는 살원들
SELECT AVG(sal) FROM emp;

SELECT * FROM emp WHERE sal > 401.4;

SELECT * FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);

#사원이름,부서코드,부서명 - 서브쿼리 사용
SELECT ename, dptno FROM emp;

#메인 쿼리와 연관된 서브쿼리
#메인 쿼리에서 값을 전달해야만 실행됨
SELECT ENAME,DEPTNO,(SELECT dname FROM dept WHERE deptno=30)
FROM emp e;

SELECT ename,deptno,(SELECT dname FROM dept WHERE deptno=e.deptno) dname
FROM emp e;

#부서코드,부서명,직원수-group by 사용 ->40번 부서 나오지 않음, 교집합만 출력됨
SELECT d.deptno,dname,COUNT(*)
FROM dept d, emp e
WHERE d.deptno=e.deptno
GROUP BY d.deptno,dname
ORDER BY d.deptno;

#outer join -> 40번 부서 나옴
SELECT d.deptno,dname,COUNT(e.deptno)
FROM dept d left outer join emp e
ON d.deptno=e.deptno
GROUP BY d.deptno,dname
ORDER BY d.deptno; 

#전산팀 1명으로 나옴 (why:count(*):필드상관 없이 레코드수 카운트,필드를 따지지 않음,부서테이블에 전산팀이 있어서 카운트 됨)
SELECT d.deptno,dname,COUNT(*)
FROM dept d left outer join emp e
ON d.deptno=e.deptno
GROUP BY d.deptno,dname
ORDER BY d.deptno; 

#부서코드,부서명,직원수 - 서브쿼리 사용
SELECT deptno,dname FROM dept;
SELECT deptno,dname,
(SELECT COUNT(*) FROM emp WHERE deptno=d.deptno) 직원수
FROM dept d;

USE web;
SELECT * FROM iris;
#품종이 setosa인 레코드
SELECT * FROM iris WHERE target='setosa';

#from 절에도 서브쿼리를 사용할 수 있음 (inline view(임시뷰))
SELECT *
FROM (SELECT * FROM iris WHERE target='setosa') iris;

USE mydb;
#timestampdiff(day/month/year, A,B) 날짜 A와 B의 차이 계산
#실행순서 : from => where => select => order by
SELECT ename, TIMESTAMPDIFF(MONTH,hiredate,NOW()) 근무개월수
FROM emp
WHERE timestampdiff(MONTH,hiredate,NOW()) >=100
order BY 근무개월수 DESC;

#from절에 서브쿼리 사용
SELECT ename,근무개월수
FROM(
SELECT ename,TIMESTAMPDIFF(month,hiredate,NOW()) 근무개월수
FROM emp) emp
WHERE 근무개월수 >=100
ORDER BY 근무개월수 DESC;

#실습문제
SELECT * FROM professor;
SELECT * FROM department;
SELECT * FROM student;

SELECT NAME,hiredate,dname
FROM professor p, department d
WHERE p.deptno=d.deptno
AND hiredate>(SELECT hiredate FROM professor WHERE NAME='송도권');

SELECT NAME,pay,hiredate
FROM professor
WHERE hiredate=(SELECT hiredate FROM professor WHERE NAME ='심슨')
AND pay<(SELECT pay FROM professor WHERE NAME='조인형');

#실행계획
explain

explain
SELECT grade,NAME,height
FROM student s
WHERE height=(SELECT MAX(height) FROM student WHERE grade=s.grade)
ORDER BY grade;

USE web;
SELECT * FROM university;

#group by
#subquery
#year,country별 평균점수(score) - 상위 10개국

SELECT country,round(AVG(score),2) average
FROM university
GROUP BY country
order BY AVG(score) DESC
LIMIT 10;

SELECT country,
(SELECT round(AVG(score),2) FROM university
WHERE country=u.country) average
FROM (SELECT DISTINCT country FROM university) u
ORDER BY average DESC
LIMIT 10;





















