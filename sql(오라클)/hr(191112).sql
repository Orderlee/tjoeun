-- 테이블 만들기
-- 필드명 자료형(사이즈)
-- primary key 기본키, 레코드의 식별자
-- varchar2 가변사이즈 문자열 자료형 (오라클에서 varchar2를 많이 사용)
drop table dep;
create table dep(
id varchar2(10) primary key,
name varchar2(15) not null,
location varchar2(50)
);

insert into dep values('10','영업부','서울 강남구');
savepoint a;
insert into dep values('20','회계부','부산 동래구');
savepoint b;
insert into dep values('30','개발부','인천 계양구');
select * from dep;
-- 롤백 : 최근 commit한 이후의 변경사항을 무효화 시킴
rollback;
rollback to a;
--커밋 insert,update,delete 쿼리의 변경사항을 확정함
commit;

--사원 레코드를 모두 삭제
delete from emp;
commit;
select * from emp;
--show parameter undo 
show parameter undo;


-- 부서코드별 직원수, 급여합계, 급여평균
-- 집계함수 : count, sum, avg, max, min
-- count(*) 레코드의 갯수
-- sum(필드) 합계, avg(필드) 평균

-- 전체 직원수, 전체직원의 급여합계
select count(*),sum(sal),avg(sal),max(sal),min(sal) from emp;

select count(*) from emp;
select deptno,count(*),sum(sal),round(avg(sal),1),max(sal),min(sal)
from emp
group by deptno --요약 기준 필드
order by deptno;

--goup by + join 문장
select count(*) from emp;
select e.deptno,dname,count(*),sum(sal),round(avg(sal),1),max(sal),min(sal)
from emp e, dept d
where e.deptno=d.deptno
group by e.deptno, dname --요약 기준 필드
order by e.deptno;

--round(실수값, 소수이하자리수) 반올림 함수
select deptno, round(avg(pay),1)
from professor
group by deptno
order by deptno;
-- 학과코드/학과명/급여합계/급여평균/최대급여/최소급여
-- 학과명도 출력 될 수 있도록 join 문장 추가
-- python 코드로 연동하여 화면에 출력

select * from student;
select * from professor;
select * from department;
select p.deptno, dname, sum(pay), round(avg(pay),1), max(pay), min(pay)
from professor p, department d
where p.deptno=d.deptno
group by p.deptno, dname
order by p.deptno;