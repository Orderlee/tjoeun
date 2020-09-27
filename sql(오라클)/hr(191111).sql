-- 사번, 이름,부서코드,부서이름
select empno,ename,e.deptno,dname
from emp e, dept d --조인할 테이블
where e.deptno=d.deptno; --조인 조건

-- create view 뷰이름 as select 쿼리
-- 뷰(view) : 물리적인 테이블이 아니고 복잡한 sql을 쉽게 사용할 수 있도록 만든 것
create or replace view emp_v as
select empno,ename,e.deptno,dname
from emp e, dept d 
where e.deptno=d.deptno;
-- name is already used by an existing object

--뷰를 테이블처럼 사용할 수 있음
select * from emp_v;

select * from student;
select * from professor;
select * from department;
-- 학번/이름/학과명/학년/지도교수
select studno 학번,s.name 이름,dname 학과명, grade 학년, p.name 지도교수명
from student s, department d, professor p
where s.deptno1=d.deptno and s.profno=p.profno;

--위 join문장으로 뷰를 생성, 뷰이름 -student_v
create or replace view student_v as
select studno 학번,s.name 이름,dname 학과명, grade 학년, p.name 지도교수명
from student s, department d, professor p
where s.deptno1=d.deptno and s.profno=p.profno;

--사원번호,부서명,이름.급여
select  e.deptno,dname,ename,sal
from emp e, dept d
where e.deptno=d.deptno;
--직급이 '사원'인 이름,부서번호,부서이름
select e.deptno,dname,ename,sal
from emp e, dept d
where e.deptno=d.deptno and job='사원';
--이름이 황인태, 부서명
select ename,dname
from emp e, dept d
where e.deptno=d.deptno and ename='황인태';
-- ...의 매니저는 ...이다.
-- A||B=> A와B를 연결
select a.ename||'의 매니저는'||b.ename||'이다.'
from emp a, emp b
where a.mgr=b.empno;


select * from student;
--과목 테이블 (테이블 이름:subject)
--과목코드/담당교수사번/과목명/학점
create table subject(
subject_code varchar(50) primary key,
profno number, 
subject_name varchar(200),
point number
);

--수강 테이블(학번/과목코드/등급)
drop table lecture;
create table lecture(
studno number,
subject_code varchar(50),
grade varchar(2),
primary key (studno,subject_code) --복합키
);

--과목 레코드 추가
insert into subject values ('A1',1001,'python',3);
insert into subject values ('A2',1002,'데이터베이스',2);
insert into subject values ('A3',1003,'빅데이터',3);
select * from subject;
--수강 레코드 추가
insert into lecture values(9411,'A1','A+');
insert into lecture values(9411,'A2','B+');
insert into lecture values(9412,'A3','C0');
insert into lecture values(9413,'A1','A0');
insert into lecture values(9413,'A2','F');
select * from lecture;
commit;

--학번/이름/과목명/지도교수명/학점
select * from student;
select * from subject;
select * from lecture;
select * from professor;
select * from department;

select s.studno 학번, s.name 이름, subject_name 과목명, p.name 지도교수명, point 학점
from student s, professor p, lecture l, subject sb
where s.studno=l.studno and p.profno=sb.profno
 and sb.subject_code=l.subject_code;
 
 --학번/학과명/이름/과목명/담당교수명/학점/등급
select s.studno 학번, dname 학과명, s.name 이름, subject_name 과목명, p.name 지도교수명,
point 학점, l.grade 등급
from student s, professor p, lecture l, subject sb, department d
where s.studno=l.studno and p.profno=sb.profno and sb.subject_code=l.subject_code
and s.deptno1=d.deptno;

--위 sql 명령어를 view로 만들기 : 뷰이름 lecture_v
create or replace view lecture_v as
select s.studno 학번, dname 학과명, s.name 이름, subject_name 과목명, p.name 지도교수명,
point 학점, l.grade 등급
from student s, professor p, lecture l, subject sb, department d
where s.studno=l.studno and p.profno=sb.profno and sb.subject_code=l.subject_code
and s.deptno1=d.deptno;
select * from lecture_v;    