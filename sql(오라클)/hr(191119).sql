drop table c_emp;
create table c_emp(
id number(5), --기본키, 주키, 레코드의 식별자
name varchar2(25),
salary number(7,2),
phone varchar2(15),
dept_id number(7)
);

--테이블을 만든 후에 제약 조건을 추가하는 방법
--alter table 테이블 add constraing 제약조건이름 primary key(필드)
alter table c_emp add constraint c_emp_id_pk primary key(id);
alter table c_emp add primary key(id);


insert into c_emp (id,name) values (1,'김철수');
insert into c_emp (id,name) values (1,'김기철');
insert into c_emp (id,name) values (1,'김철수');
select * from c_emp;
-- unique constraint (HR.SYS_C007179) violated


--제약조건 리스트
--user_constraints : 시스템 테이블, 데이터 사전
-- 제약조건의 목록을 저장하고 있는 시스템 테이블
select * from user_constraints
where TABLE_NAME='T1';

-- primary key : 단일키(필드 1개), 복합키(필드 2개)
-- 고객 테이블 : 고객아이디
-- 상품테이블 : 상품코드
-- 주문테이블 : 고객아이디, 상품코드, 수량, 배송료, 주소
create table t1(
a number,
b number,
c varchar2(50),
d varchar2(50),
primary key(a,b)
);


drop table c_emp;
create table c_emp(
id number(5), 
name varchar2(25),
salary number(7,2) constraint emp_check
check(salary >= 100 and salary <=1000),
phone varchar2(15),
dept_id number(7)
);
insert into c_emp (id,name,salary) values (1,'kim',500);
insert into c_emp (id,name,salary) values (2,'park',50000);
insert into c_emp (id,name,salary) values (1,'choi',-200);
select * from c_emp;


select * from emp;
select * from dept;
--emp 테이블을 복사하여 emp3 테이블 만들기(제약조건은 제외)
--create table 테이블 as select 명령어
create table emp3 as
select * from emp;

select * from emp3;
insert into emp3 (empno,ename) values (7369,'김철수');
--부서테이블에 없는 부서코드 50을 입력
insert into emp3 (empno,ename,deptno)
values (1000,'kim',50);

select * from emp3 where empno=1000;
--테이블 조인에서 누락됨
select empno,ename,dname
from emp3 e, dept d
where e.deptno=d.deptno;

drop table c_emp;
create table c_emp(
id number(5), 
name varchar2(25),
salary number(7,2),
phone varchar2(15),
dept_id number(7) references dept(deptno)
);

-- foreign key 설정
-- references 테이블(필드)
-- dept_id 필드에는 dept 테이블의 deptno 필드의 값들만 입력 가능
insert into c_emp (id,name,dept_id) values(1,'kim',10);
insert into c_emp (id,name,dept_id) values(2,'lee',20);
insert into c_emp (id,name,dept_id) values(3,'park',5);
--integrity constraint (HR.SYS_C007188) violated -
--  parent key not found

drop table c_emp;
create table c_emp(
id number(5) unique, 
name varchar2(25),
salary number(7,2),
phone varchar2(15),
dept_id number(7)
);
--unique : 중복되지 않는 값(null을 허용함)
insert into c_emp (id,name) values(1,'kim');
insert into c_emp (id,name) values(2,'song');
insert into c_emp (id,name) values(2,'park');
insert into c_emp (name) values ('choi');

select * from c_emp;

--not null
create table salary (
id number primary key,
name varchar2(50),
salary number,
bonus number
);
select * from salary;
alter table salary add (y_salary varchar2(50));
alter table salary add (tax varchar2(50));
alter table salary add (R_M varchar2(50));


commit;
