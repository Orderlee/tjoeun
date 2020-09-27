--뷰를 생성, 두번째부터는 수정
--create or replace view 뷰이름 as (sql 명령어)
create or replace view test_view as
select empno,ename,job,sal,deptno
from emp
where job='사원';
--뷰를 마치 테이블처럼 사용할 수 있음
select * from test_view;
--테이블,뷰의 목록 (데이터 사전 조회)
select * from tab;


drop view test_view;

create or replace view test_view as
select empno, ename, e.deptno, dname
from emp e, dept d
where e.deptno=d.deptno;
--뷰를 테이블처럼 사용가능
select * from test_view;
--뷰의 세부 정보 확인(데이터 사전)
select * from tab;
select * from user_views;

select * from user_views;
--emp 테이블의 empno 필드에 기본키 추가
alter table emp add primary key(empno);

--같은 결과가 나오지만 내부적인 실행 순서가 다름
-- 실행꼐획 보기 F10
select empno,ename from emp where empno=7900;
select empno,ename from emp where ename='박민성';
desc ontime;
--full scan(모든레코드를 전수조사)
select * from ontime where distance>1000;
--index scan(인덱스를 거쳐서 빠른 조회 가능)
select * from ontime where month=10;

drop table emp3;
create table emp3 (
no number,
name varchar2(50),
sal number
);


--PL/SQL
declare --변수 선언부
  i number :=1; 
  name varchar(20) := 'kim';
  sal number :=0;
begin --실행부
  while i<=1000000 loop
   if i mod 2 = 0 then
    name :='kim' || to_char(i);
    sal:=300;
  elsif i mod 3 = 0 then
    name:='park'|| to_char(i);
    sal:=400;
  elsif i mod 5 = 0 then
    name:= 'hong' || to_char(i);
    sal:=500;
  else
    name:= 'shin'||to_char(i);
    sal:= 250;
  end if;
  insert into emp3 values (i,name,sal);
  i := i+1;
 end loop;
end;
/

select * from emp3;
-- full scan, cost 893
select * from emp3 where name='shin691' and sal>200;
-- 인덱스 추가
-- create index 인덱스이름 on 테이블(필드)
-- emp3 테이블의  name,sal, 필드에 인덱스 추가(복합인덱스)
create index emp_name_idx on emp3(name,sal);
-- 인덱스를 추가한 후 실행계획을 다시 확인, index 사용, cost 11
select * from emp3 where name='shin691' and sal>200;






















