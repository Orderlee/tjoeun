select * from emp;
-- chr(문자코드)-->문자
select chr(65) from dual;
select chr(97) from dual;
-- ascii(문자) -> 문자의 숫자코드
select ascii('A') from dual;
select ascii('a') from dual;
select ascii('가') from dual;

-- 레코드 갯수 계산
select count(*) from emp;
-- desc: describe 테이블, 테이블의 필드 정보
desc dual;
desc emp;

-- A||B: A와 B 연결  ->2개 이상은 안됨
-- concat(A,B) A와 B 연결
select ename ||'의 직책은 '|| job from emp;
select concat(ename,'의 직책은 ') from emp;
select concat(concat(ename,'의 직책은 '),job) from emp;

-- lower(대문자) 소문자로 변환
-- upper(소문자) 대문자로 변환
select lower('PYTHON'),upper('python') from dual;

-- lpad('문자열',자리수,빈자리에 채울 내용)
-- rapd('문자열',자리수,빈자리에 채울 내용)
select 'abcd',lpad('abcd',9,'#') from dual;
select 'abcd',rpad('abcd',9,'*') from dual;
select 'abcd',lpad('abcd',9) from dual;
select 'abcd',rpad('abcd',9) from dual;

-- replace(문장,A,B) 문장에서 A를 찾아서 B로 바꾸는 함수
select replace('asiancup is international festival', 'asiancup', 'worldcup') from dual;
--job 필드에서 '대표'를 '사장'으로
select ename,replace(job,'대표','사장') from emp;

-- 4번째 문자부터 3글자(0부터가 아니고 1부터)
select substr('빅데이터분석 과정',4,3) from dual;

select ename from emp;
-- substr(필드 or 문장, 시작위치, 글자수)
select substr(ename,1,1), substr(ename,2,2) from emp;

-- 시스템의 현재 날짜,시간
select sysdate from dual;
-- to_char(날짜, 출력형식)
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss') from dual;
--오늘 날짜 기준 100일 후
select sysdate + 100 from dual;
--오늘 날짜 기준 100일 전
select sysdate -100 from dual;
--입사일자를 기준으로 90일 후의 날짜
select ename, hiredate,hiredate+90 from emp;
--months_between(A,B) A-B 날짜의 개월수
select months_between('2020-03-31', sysdate) from dual;
-- 올림 함수
select ceil(months_between('2020-03-31',sysdate))from dual;
-- 반올림 함수 round(실수값, 자리수)
select round(months_between('2020-03-31', sysdate),2) from dual;
-- 버림함수
select trunc(months_between('2020-03-31',sysdate)) from dual;


select upper('python') from emp;

create table keywords(
keyword varchar(50)
);
insert into keywords values ('python1');
insert into keywords values ('python2');
insert into keywords values ('python3');
insert into keywords values ('python4');
insert into keywords values ('python5');
commit;
select * from keywords;
select keyword,upper(keyword),initcap(keyword) from keywords;

select upper('test') from dual;
select * from dual;
select 'test' from dual;

-- 숫자변환 함수
-- 문자 + 숫자는 숫자+숫자 형태로 바꾸어야 함
-- 문자 +문자 => 에러, 문자||문자로 연결해야 함
select 10+20, 10*20, 10/20, 10-20 from dual;

select '100'+1 from dual;
select to_number('100')+1 from dual; -- to_number() 함수가 자동으로 호출됨
select 'hello ' + 'python' from dual; -- 에러
select 'hello '||'python' from dual; -- 문자열 연결

--근속연수 계산
select ename, (sysdate-hiredate)/365 from emp;
-- truct 버림
select ename, trunc((sysdate-hiredate)/365) from emp;
-- 필드명 or 계산식 as 별칭
select ename, trunc((sysdate-hiredate)/365) 근속연수 from emp;

select * from professor;
--null 값이 입력되지 않은 상태(미지수)
select name,pay,bonus,pay*12 from professor;
--nvl(A,B) A가 null이면 B, null이 아니면 A
select name,pay,bonus,pay*12 + nvl(bonus,0) from professor;
-- decode(A,B,같을때의 값, 다를때의 값)
select ename, job,decode(job,'대표','임원','직원') from emp;
select * from emp;
select * from dept; --부서테이블
select ename,deptno,decode(deptno,10,'경리팀',20,'연구팀',30,'총무팀',40,'전산팀') from emp;

--실습문제
--1)
select * from emp;
select ename,job,lpad(sal,5,'*') from emp
where sal>=300;
--2)
select * from emp;
select ename, trunc(months_between(sysdate,hiredate)) 근무개월수 from emp
where months_between(sysdate,hiredate)>=100;
--3)
select * from emp;
select ename,job,round((sysdate-hiredate)/7) 근무주수 from emp
order by (sysdate-hiredate)/7 desc, ename;
--4)
select * from student;
select name, deptno1,decode(substr(jumin,7,1),1,'남자','여자') 성별 from student
where deptno1=101;
