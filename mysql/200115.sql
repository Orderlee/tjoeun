#트랜잭션과 그룹쿼리
USE mydb;

SELECT * FROM emp;
SELECT * FROM dept;

SELECT e.deptno 부서번호,d.dname 부서명, ename 이름 , sal 급여 
FROM emp e, dept d #조인할 테이블
WHERE e.deptno=d.deptno; #조인 조건

SELECT ename,e.deptno,dname
FROM emp e, dept d
WHERE e.deptno=d.deptno AND job='사원';

select ename,dname
FROM emp e , dept d
WHERE e.deptno=d.deptno AND ename='황인태';

SELECT CONCAT(e.ename,'의 매니저는 ',m.ename,'이다')
FROM emp e, emp m
WHERE e.mgr=m.empno;

#mysql은 기본적으로 auto commit
DROP TABLE dep;
CREATE TABLE dep(
id VARCHAR(10) PRIMARY KEY,
NAME VARCHAR(15) NOT NULL,
location VARCHAR(50)
);

#트랜잭션 처리 관련 환경변수 확인, 0수동커밋,1자동커밋
SELECT @@autocommit;
#수동커밋으로 변경
SET autocommit=0;

INSERT INTO dep VALUES('10','영업부','서울 강남구');
SAVEPOINT a;
INSERT INTO dep VALUES('20','회계부','부산 동래구');
SAVEPOINT b;
INSERT INTO dep VALUES('30','개발부','인천 계양구');

#레코드 변경 사항 확정(레코드 추가, 수정, 삭제)
COMMIT;
#레코드 변경 사항 취소
ROLLBACK;

ROLLBACK to a;
ROLLBACK to b;

SELECT * FROM dep;
DELETE FROM dep;
SELECT * FROM dep;

SELECT * FROM emp; #14행
#전체 직원수, 급여합계,평균급여
SELECT COUNT(*),SUM(sal),AVG(sal)
FROM emp;

SELECT deptno FROM emp;

#다른 부서가 나오지 않음
SELECT deptno,COUNT(*),SUM(sal),AVG(sal)
FROM emp;

#부서별 집계
SELECT deptno,COUNT(*),SUM(sal),AVG(sal)
FROM emp
GROUP BY deptno; #요약기준 필드


USE web;
SELECT * FROM iris;

#품종별 레코드갯수, sepal_length합계, sepal_length 평균
SELECT COUNT(*),SUM(sepal_length),AVG(sepal_length)
FROM iris
GROUP BY target;

#round(숫자,자릿수)
SELECT COUNT(*),round(SUM(sepal_length),1),round(AVG(sepal_length),1)
FROM iris
GROUP BY target;


USE web;
SELECT * FROM traffic;
#호선별 계
SELECT line,COUNT(*),SUM(tot),ROUND(AVG(tot),1)
FROM traffic
GROUP BY line;

#having : group by의 결과행 중에서 선택
SELECT line,COUNT(*),SUM(tot),ROUND(AVG(tot),1) #3
FROM traffic #1
GROUP BY line #2
HAVING SUM(tot)>=100000000; #4

SELECT * FROM titanic;
#객실등급별(Pclass) 승객수, 요금합계(fare), 평균요금
SELECT Pclass, COUNT(*), SUM(fare), AVG(fare)
FROM titanic
GROUP BY Pclass
ORDER BY Pclass;

#성별 승객수, 생존자수,사망자수
SELECT Sex,survived,COUNT(*)
FROM titanic
GROUP BY Sex,Survived
ORDER BY Sex,Survived; 

#distinct 중복값 제외 대표값만 출력
SELECT distinct Pclass
FROM titanic;

#객실등급별,생존자수,사망자수,생존률
SELECT DISTINCT Pclass,
	(SELECT COUNT(*) FROM titanic WHERE Pclass=t.Pclass
		AND Survived=1) 생존자수, 
	(SELECT COUNT(*) FROM titanic WHERE Pclass=t.Pclass
		AND Survived=0) 사망자수, 
	((SELECT COUNT(*) FROM titanic WHERE Pclass=t.Pclass
		AND Survived=1)*100 /
		(SELECT COUNT(*) FROM titanic WHERE Pclass=t.Pclass)) 생존률
FROM titanic t
ORDER BY Pclass;