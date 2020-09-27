select * from emp
order by sal desc;
--월급 최대값
select max(sal) from emp;
--월급을 가장 많이 받는 사원의 정보
select * from emp
where sal=800;

select * from emp
where sal=(select max(sal) from emp);
--월급이 가장 적은 사원의 정보
select min(sal from emp;

select * from emp where sal=200;

select * from emp
where sal=(select min(sal) from emp);

--평균급여보다 더 많은 급여를 받는 사원 정보
select avg(sal) from emp;

select * from emp
where sal>394.428571428571428571428571428571428571;

select * from emp
where sal>(select avg(sal) from emp);

-- professor 테이블 
--급여합계(pay+bonus)가 평균보다 큰 레코드
--nvl 함수 사용해야함
select pay,bonus,pay+bonus,pay+nvl(bonus,0) from professor;

select avg(pay+bonus) from professor;
--nvl (A,B)가 A가 null이면 B,null아니면 A
select avg(pay+nvl(bonus,0)) from professor;


select * from professor
where (pay+nvl(bonus,0))> 418.75;

select * from professor
where (pay+nvl(bonus,0))>(select avg(pay+nvl(bonus,0)) from professor);

--총무팀 직원들의 최고급여보다 월급을 많이 받는 직원들
select * from emp where deptno=30;

select * from emp where sal>485;

select * from emp
where sal>(select max(sal) from emp where deptno=30);

--연구팀 직원중 최소월급보다 월급이 많은 직원들
select min (sal) from emp where deptno=20; --200

select * from emp where sal>200;

select * from emp
where sal>(select min(sal) from emp where deptno=20);

--본인 월급, 전체평균월급과의 차액
select avg(sal) from emp;
select ename,sal,round((select avg(sal) from emp)-sal,1) 차액
from emp;

--본인 월급, 본인소속부서평균월급과의 차액
--김철수(부서코드:20)
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=30;
select ename, sal, deptno,
((select avg(sal) from emp where deptno=e.deptno)-sal)
from emp e;
--사원이름, 부서코드,부서이름
--joing을 사용한 경우
select ename,e.deptno,dname
from emp e, dept d --조인할 테이블들
where e.deptno=d.deptno; --조인 조건
--서브쿼리를 이용한 방법
select ename, deptno,
(select dname from dept where deptno=e.deptno)
from emp e;

--직급 사원인 직원들의 이름,직급,부서명
--from절에 사용한 서브쿼리를 인라인 뷰라고 함
select ename, job, dname
from (select ename, job,deptno from emp where job='사원') e,
dept d
where e.deptno=d.deptno;

--create or replace view 뷰이름 as(select 명령어)
--뷰를 만들거나 수정
--자주 사용되거나 복잡한 sql 명령어를 단순하게 보고 싶을 때 사용

create or replace view emp2_v as
select ename,job,deptno from emp where job='사원';

select * from emp2_v;

--송도권 교수보다 나중에 입사한 사람의 이름, 입사일, 학과명
select name, hiredate, dname
from professor p, department d --조인할 테이블들
where p.deptno=d.deptno --조인할 필드
and hiredate>(select hiredate from professor where name='송도권');

--심슨교수와 같은 입사일에 입사한 교수중에서 조인형 교수보다 월급 적게 받는 교수 이름,급여 입사일
select name,pay,hiredate
from professor
where hiredate=(select hiredate from professor where name='심슨')
and pay<(select pay from professor where name='조인형');

--각 학년별로 가장 키가 큰 학생들 (학년,이름,키)
select grade,name, max(height)
from student
group by grade,name
order by grade;

select grade,name,height
from student s
where height=(select max(height) from student where grade=s.grade)
order by grade;

--항공사별 평균도착지연시간
select code,description,(select avg(arrdelay) from ontime 
where uniquecarrier=c.code) delay
from (select * from carrier
where count(*)
where rownum<100;
