--데이터베이스 생성
CREATE DATABASE mydb;
--데이터베이스 목록
SHOW DATABASES;
--작업할 데이터베이스 선택
USE mydb;

SHOW TABLES;
-- * 모든필드
SELECT * FROM emp ORDER BY empno; --정렬

SELECT empno,ename FROM emp;
SELECT job FROM emp;
--distinct 중복값 제거
SELECT DISTINCT job FROM emp;
--ALL  필드 => 모든 값
SELECT ALL job FROM emp;
--asc 오름차순,desc 내림차순
SELECT * FROM emp ORDER BY job,sal DESC;
--필드의 alias 별칭
SELECT ename 이름, job 직급, sal 급여 FROM emp
ORDER BY job,sal DESC;
--조건절
SELECT * FROM emp WHERE sal >= 100 AND sal <= 400
ORDER BY sal DESC;

-- between A and B : A~B
SELECT * FROM emp
WHERE sal BETWEEN 100 AND 400
ORDER BY sal DESC;
--from => where => select => order by
SELECT ename 이름, job 직급, sal 급여
FROM emp
ORDER BY 급여 DESC;
--에러 from => where => selsect
SELECT ename 이름, job 직급, sal 급여
FROM emp
WHERE 급여> 300
ORDER BY 급여 DESC;



SELECT empno,ename,sal
FROM emp 
WHERE sal>400
ORDER BY sal DESC; 
-- from => where 급여 필드 없음
SELECT empno,ename, sal 급여
FROM emp
WHERE 급여>400
ORDER BY sal DESC;

SELECT empno, ename, sal 급여
FROM emp
WHERE sal > 400
ORDER BY 급여 DESC;
--사원과 부서 테이블 조인
--테이블.필드 
SELECT empno, ename,sal 급여 #선택할 필드
FROM emp e, dept d #조인할 테이블
WHERE e.deptno=d.deptno #조인 조건
ORDER BY sal  DESC; #정렬

# 집계함수 count() 레코드수, sum() 합계
# min() 최소, max() 최대, avg() 평균
#전체 직원수
SELECT COUNT(*) FROM emp;
#부서별 직원수
SELECT deptno,job,COUNT(*) #3
FROM emp #1
GROUP BY deptno,job #2
ORDER BY deptno; #4

SELECT e.deptno,dname,job,COUNT(*) #4
FROM emp e, dept d #1 조인할 테이블들
WHERE e.deptno=d.deptno #2 조인 조건
GROUP BY e.deptno,dname,job #3 
ORDER BY e.deptno; #5

#조인 조건이 없으므로 양쪽 테이블의 모든 경우의 수 선택
#카티션 곱
SELECT empno,ename,sal,dname
FROM emp e , dept d
ORDER BY sal DESC;

# concat(A,B) A와 B를 연결
SELECT CONCAT(ename,'의 급여는 ',sal,'입니다.') sal
from emp;
# A||B : oracle 의 연결 연산자
SELECT ename ||'의 급여는' ||sal|| '입니다.' sal
FROM emp;


DROP TABLE member1;
# char(n) 고정사이즈, varchar(n) 가변사이즈
CREATE TABLE members(
userid VARCHAR(50) NOT NULL PRIMARY KEY,
passwd VARCHAR(50) NOT NULL,
NAME VARCHAR(50) NOT NULL
);

SELECT * FROM members;
INSERT INTO members (userid,passwd,NAME) VALUES('kim','1234','김철수');
INSERT INTO members (userid,passwd,NAME) VALUES('park','1234','박철호');

SELECT * FROM members;


--1 auto commit, 0 수동커밋
SELECT @@autocommit;

SET autocommit=0;

SELECT * FROM members;
DELETE FROM members;

COMMIT;
