USE mydb;

SELECT * FROM emp;

SELECT ename,hiredate,deptno
FROM emp
WHERE hiredate <'2005-01-01'
ORDER BY hiredate;

SELECT ename, job, deptno
FROM emp
WHERE deptno =20 OR deptno=30
ORDER BY ename;

SELECT ename, job, deptno
FROM emp
WHERE deptno IN (20,30)
ORDER BY ename;

SELECT ASCII('A');
SELECT ASCII('a');
SELECT NOW();
# concat(A,B) A와 B를 연결시킴
SELECT CONCAT(ename,'의 직책은'),job FROM emp;
SELECT LOWER('PYTHON'); #소문자로
SELECT UPPER('python'); #대문자로
#replace(문자열,A,B) A를 B로 바꾸기
SELECT REPLACE('asiancup','asian','world');
#substr(문자열,인덱스,글자수)
select ename FROM emp WHERE SUBSTR(ename,2,1)='철';
SELECT ename FROM emp WHERE SUBSTR(ename,2,2)='철수';
#김으로 시작하는 문자열
SELECT ename FROM emp WHERE ename LIKE '김%';
#철이 포함된 문자열(처음중간끝 다 포함) 
SELECT ename FROM emp WHERE ename LIKE '%철%';
#문자열 길이
SELECT LENGTH('hello');
SELECT LENGTH('hello');
#가장 큰 값
SELECT GREATEST(10,20,30,40,50);
#문자코드로 비교
SELECT GREATEST('aaa','bbb','ccc','dddd');
#가장 작은 값
SELECT LEAST(10,20,30,40,50);
SELECT LEAST('aaa','bbb','ccc','dddd');

#날짜 계산 함수 : date_add(날짜, interval 숫자 옵션)
SELECT DATE_ADD(NOW(),INTERVAL -1 DAY);
SELECT DATE_ADD(NOW(),INTERVAL -1 week);
SELECT DATE_ADD(NOW(),INTERVAL -1 month);
SELECT DATE_ADD(NOW(),INTERVAL -1 YEAR);
#입사 후 3개월 경과 일자 구하기
SELECT ename,hiredate,DATE_ADD(hiredate,INTERVAL 3 MONTH)
FROM emp;
#날짜가 속한 월의 마지막 일자
SELECT LAST_DAY(NOW());
SELECT LAST_DAY('2020-02-01');
#근속 연수
#timestampdiff(옵션,날짜1,날짜2) 날짜 간격 구하기
SELECT ename,hiredate,TIMESTAMPDIFF(YEAR,hiredate,NOW()) 근속연수
FROM emp
ORDER BY 근속연수 DESC;

SELECT ename,hiredate,TIMESTAMPDIFF(month,hiredate,NOW()) 근속월수
FROM emp
ORDER BY 근속월수 DESC;

--날짜 출력 형식
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d'); # Y 4자리 연도
SELECT DATE_FORMAT(NOW(), '%y-%m-%d'); # y 2자리 연도
SELECT DATE_FORMAT(NOW(), '%H-%i-%s'); # H 24 시간제
SELECT DATE_FORMAT(NOW(), '%h-%i-%s'); # h 12시간제
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H-%i-%s');
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %h-%i-%s');
# %r 오전/오후
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %r %h-%i-%s');
# %w 요일 0일요일~6토요일
SELECT ename,DATE_FORMAT(hiredate, '%Y년 %m월 %d일 %w요일') 입사일자
FROM emp
ORDER BY 입사일자;

SELECT ename,DATE_FORMAT(hiredate, '%Y년 %m월 %d일') 입사일자
FROM emp
ORDER BY 입사일자;

#문자열 +숫자는 에러이지만 내부적으로 cast가 호출됨
SELECT '-10'+20; # -10 문자열이 숫자로 바뀜
SELECT CAST('-10' AS SIGNED)+20;
SELECT CAST('-10' AS UNSIGNED);

SELECT USER(); #현재 로그인중인 사용자 아이디

SELECT FLOOR(10.9); #버림 
SELECT ROUND(10.555,2); #소수 둘째자리에서 반올림
SELECT CEIL(10.1); #올림

SELECT ename,TIMESTAMPDIFF(DAY,hiredate,NOW())/365 근속연수
FROM emp;
SELECT ename,FLOOR(TIMESTAMPDIFF(DAY,hiredate,NOW())/365) 근속연수
FROM emp;
SELECT ename,round(TIMESTAMPDIFF(DAY,hiredate,NOW())/365,1) 근속연수
FROM emp;

SELECT NAME,pay,bonus,(pay*12 + bonus) 연봉
FROM professor
WHERE deptno=101;
--bonus가 null이면 0으로 치환 ifnull(bonus,0)
SELECT NAME,pay,bonus,(pay*12+IFNULL(bonus,0)) 연봉
FROM professor
WHERE deptno=101;

SELECT NAME,pay,ifnull(bonus,0),(pay*12+IFNULL(bonus,0)) 연봉
FROM professor
WHERE deptno=101;

#if(조건,참일때,거짓일때)
SELECT NAME,deptno,if(deptno=101,'컴퓨터공학과','')학과명
FROM professor;

SELECT*FROM department;
SELECT NAME,deptno,
if(deptno=101,'컴퓨터공학과',
if(deptno=102,'멀티미디어공학과',
if(deptno=103,'소프트웨어공학과','')))
FROM professor;

SELECT * FROM department;
#join을 사용한 경우
SELECT NAME, p.deptno ,dname
FROM professor p, department d
WHERE p.deptno=d.deptno;

#실습문제
SELECT ename,LPAD(sal,5,'*') FROM emp;

SELECT ename,job,LPAD(sal,5,'*') from emp WHERE sal>=300;

SELECT ename,TIMESTAMPDIFF(MONTH,hiredate,NOW()) 근무개월수#3
FROM emp #1
WHERE FLOOR(TIMESTAMPDIFF(month,hiredate,NOW())) >= 100 #2
ORDER BY 근무개월수 DESC; #4

SELECT ename,job,TIMESTAMPDIFF(WEEK,hiredate,NOW()) 총근무주수
FROM emp
ORDER BY 총근무주수 DESC, ename;

SELECT NAME,jumin,if(SUBSTR(jumin,7,1)=1,'남','여') 성별
FROM student
WHERE deptno1=101;