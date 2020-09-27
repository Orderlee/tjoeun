--전체 직원들의 급여 평균
-- * 모든 필드
--round (값, 소수이하자리수)
-- 집계함수: avg() 평균, count() 갯수, sum() 합계, max(), min()

select count(*) 직원수, sum(sal) 급여합계, round(avg(sal),1) 평균급여,
max(sal) 최고급여, min(sal) 최저급여 from emp;
-- 전체 부서가 아닌 부서별로 집계하려면?
select deptno,count(*) 직원수, sum(sal) 급여합계, round(avg(sal),1) 평균급여,
max(sal) 최고급여, min(sal) 최저급여 
from emp
group by deptno --요약기준 필드
order by deptno;

-- ontime 테이블, 레코드갯수, 출발지연시간합계, 출발지연시간평균,
-- 최대출발지연시간, 최저출발지연시간
select count(*) 레코드수, sum(depdelay) 합계, round(avg(depdelay),2) 평균,
    max(depdelay) 최대값, min(depdelay) 최소값
from ontime;
select * from ontime;
--월별 요약
select month,count(*) 운항횟수, sum(depdelay) 합계, round(avg(depdelay),2) 평균,
    max(depdelay) 최대값, min(depdelay) 최소값
from ontime
group by month
order by month;
--요일별 요약
select dayofweek, count(*) 레코드수, sum(depdelay) 합계, round(avg(depdelay),2) 평균,
    max(depdelay) 최대값, min(depdelay) 최소값
from ontime
group by dayofweek
order by dayofweek;
--
select month,dayofweek, count(*) 레코드수, sum(depdelay) 합계, round(avg(depdelay),2) 평균,
    max(depdelay) 최대값, min(depdelay) 최소값
from ontime
group by month,dayofweek
order by month,dayofweek;


--학과별 평균급여
-- group by 절 사용한 필드만 select 절에 올 수 있음
select deptno, round(avg(pay),1)
from professor
group by deptno --요약기준 필드
order by deptno; --정렬기준 필드

--위 결과에서 평균급여가 400이상인 학과만 출력하려면?
select deptno, round(avg(pay),1) pay
from professor
group by deptno --요약기준 필드
having avg(pay)>=400 --요약결과행을 줄이는 옵션
order by pay desc; --정렬기준 필드

--sql명령어의 실행순서
-- from -> where -> group by -> having -> select -> order by
-- 전체   -  행선택 -    요약   - 요약행선택 - 필드선택 - 정렬
-- select 실행순서 보다 앞서서 alais를 사용할 수 없음

--학과별,직급별 평균급여
select deptno, position, round(avg(pay),1)
from professor
group by deptno,position --요약기준 필드
order by deptno; --정렬기준 필드

-- 부서코드,부서이름,직원수,급여합계액,평균급여액, 최대급여액, 최소급여액
select * from emp;
select * from dept;
select e.deptno 부서코드, dname 부서이름, count(*) 직원수, sum(sal) 급여합계, round(avg(sal),1) 평균급여,
max(sal) 최고급여, min(sal) 최저급여 
from emp e, dept d
where e.deptno=d.deptno
group by e.deptno,dname --요약기준 필드
order by e.deptno;

--학과코드, 학과이름, 학생수 
select deptno1, dname,count(*)
from student s, department d
where s.deptno1=d.deptno
group by deptno1,dname
order by deptno1;

--지도교수사번,지도교수이름,지도학생수
select s.profno,p.name,count(*)
from student s, professor p
where s.profno=p.profno
group by s.profno,p.name
order by s.profno;

select * from professor;
select deptno, sum(pay+nvl(bonus,0)), max(pay+nvl(bonus,0)), min(pay+nvl(bonus,0)),
round(avg(pay+nvl(bonus,0)),1)
from professor 
group by deptno
order by deptno;

--월별 출생인원수
select to_char(birthday,'MM'),count(*)
from student
group by to_char(birthday,'MM')
order by to_char(birthday,'MM');

select sum(cnt)
from
    (select to_char(birthday,'MM'), count(*) cnt
    from student
    group by to_char(birthday,'MM')
    order by to_char(birthday,'MM')
    );
    






