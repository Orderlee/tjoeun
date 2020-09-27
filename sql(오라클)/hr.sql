--191031
-- 한 줄 실행:F9, 전체 실행:F5
select * from  emp;
--order by 정렬기준필드
select * from emp order by ename;

-- desc 내림차순 정렬
-- * 모든 컬럼(필드) 출력
select * from emp order by ename desc;

--사번,이름 필드만 검색
select empno, ename from emp order by ename;
-- 직급만 선택
select job from emp order by job;
-- distinct 필드 => 중복값 제거
select distinct job from emp order by job;
-- 필드명 as 별칭(as 생략가능)
-- order by 절에는 정렬기준 필드를 여러개 사용할 수 없음
select ename 이름, job 직급, sal 급여
from emp
order by job, sal desc;

select * from emp
where sal> 100 and sal < 400
order by sal desc;
--직급이 '사원'인 직원들
select * from emp
where job ='사원';
--직급이 '사원'이고 급여가 250 보다 큰 직원
select * from emp
where sal >250 and job='사원';


delete from emp;
commit;
insert into emp values (7369,'김철수','사원',7902,'2000-12-17',200,null,20);
insert into emp values (7499,'이찬수','주임',7698,'2001-02-20',260,300,30);
insert into emp values (7521,'박종수','주임',7698,'2002-02-22',325,500,30);
insert into emp values (7566,'임채호','과장',7839,'2001-04-02',497,null,20);
insert into emp values (7654,'나대호','주임',7698,'2001-09-28',325,1400,30);
insert into emp values (7698,'박지성','과장',7839,'2001-05-01',485,null,30);
insert into emp values (7782,'구자철','과장',7839,'2001-06-09',445,null,10);
insert into emp values (7788,'송기성','부장',7566,'1997-04-17',500,null,20);
insert into emp values (7839,'김철호','대표',null,'2001-11-17',800,null,10);
insert into emp values (7844,'성명준','주임',7698,'2001-09-08',350,0,30);
insert into emp values (7876,'황인태','사원',7788,'2007-05-23',210,null,20);
insert into emp values (7900,'박민성','사원',7698,'2001-12-03',295,null,30);
insert into emp values (7902,'박진성','부장',7566,'2001-12-03',600,null,20);
insert into emp values (7934,'최철호','사원',7782,'2012-01-23',230,null,10);
commit;
select * from emp;



-- 191101
select * from emp;
--r급여 100 이하 또는 400 이상
--select 필드 from 테이블 where 행선택조건 order by 정렬


select * from emp
where sal<=100 or sal>=400
order by sal desc; -- 급여 내림차순 desc, 오름차순 asc

select * from emp
where not(sal>100 and sal<400)
order by sal;


--deptono 부서코드 10 또는 20
select * from emp
where deptno=10 or deptno=20 or deptno=30;

select * from emp
where deptno in (10,20,30);

--급여가 300~500인 직원
select * from emp
where sal<=300 and sal<=500
order by sal;

--필드 between A and B 값의 범위가 A~B
select * from emp
where sal between 300 and 500
order by sal;

--사원 이름이 '김'으로 시작
select * from emp
where ename like '김%'; --키워드 검색할 때에는 like ~~~~;

--사원 이름이 '성'으로 시작
select * from emp
where ename like '성%';
-- 사원 이름에 '성'이 포함
select * from emp
where ename like '%성%';

select * from emp;
-- null  결측값 
-- null과의 연산결과는 null
select * from emp
where comm = null;
-- comm 필드값이 null인 직원들
select * from emp
where comm is null;
-- comm 필드값이 null이 아닌 직원들
select * from emp
where comm is not null;


select empno,ename,sal,comm,sal*12,sal*12 + comm
from emp;

-- nvl(A,B) A가 null이면 B, null이 아니면 A
select empno,ename,sal,comm,sal*12,sal*12+nvl(comm,0)
from emp;

select ename,job from emp;
-- A||B: A와 B를 연결 시킴
select ename ||' '|| job from emp;

-- ()로 묶은 부분이 먼저 처리됨
select empno,ename,sal from emp
where not(sal>200 and sal<300)
order by sal;

select empno,ename, sal from emp
where not sal> 200 and sal <300
order by sal;

select  ename,hiredate from emp
order by hiredate desc;

-- 날짜는 내부적으로 숫자로 처리되고 sql에서 표현할 때는 따옴표로 묶음
-- 2007년 이후 입사자
select ename,hiredate from emp
where hiredate > '2007-01-01';


select deptno,ename,hiredate from emp
where hiredate> '2005-01-01';

select deptno,ename,job from emp
where deptno = 20 or deptno = 30;
select deptno,ename,job from emp
where deptno in (20,30);

select * from emp;
























