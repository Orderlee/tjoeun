--not null : null을 허용하지 않음
--varchar2 : 가변 사이즈 문자열
--number 최대 38자리 숫자 number(전체자리수,소수이하자리수)
drop table t_emp;
drop table s_emp;
create table t_emp(
id number(5) not null primary key,
name varchar2(25),
salary number(7,2),
phone varchar2(15),
dept_name varchar2(25)
);
select * from t_emp;
rename t_emp to s_emp; --테이블 이름 변경
select * from s_emp;
--테이블의 필드 목록
desc s_emp;

--레코드 추가
--모든 필드값을 입력하는 방법
--insert into 테이블 values (값1,값2,,,,)
insert into s_emp values(100,'이상헌',2000,'010-2222-3333','개발부');
insert into s_emp values(101,'최순철',3000,'010-3333-4444','총무부');
insert into s_emp values(102,'장혜숙',4000,'010-4444-5555','영업부');

insert into s_emp (id,name) values (103,'박상수');
--not null 필드는 반드시 입력해야함
--insert into s_emp (name,salary) value('김철수',5000);
--cannot insert NULL into ("HR","S_EMP","ID")

select * from s_emp;
commit;
--create 생성, drop 제거 alter 변경
--새로운 필드 추가:alter table 테이블 add (필드명 자료형)
alter table s_emp add (hire_date date);
select * from s_emp;

--id 100인 사원의 입사일자를 오늘날짜로
--update 테이블 set 필드=변경할값 where 조건
--sysdate : 시스템의 현재 날짜
update s_emp set hire_date=sysdate where id=100;
select * from s_emp;

--hire_date null인 레코드들의 입사일자를 2019-10-01로
update s_emp set hire_date='2019-10-01' where hire_date=null;
update s_emp set hire_date='2019-10-01' where hire_date is null;
commit;

insert into s_emp (id,name,phone)
values(200,'이상헌','011-233-010-222-3333');
--value too large for column "HR"."S_EMP"."PHONE" 
--(actual: 20, maximum: 15)

--alter table 테이블 modify(필드 자료형(사이즈))
--15바이트에서 50바이트로 늘림
alter table s_emp modify (phone varchar2(50));
select * from s_emp;
--숫자필드를 문자열로 바꾸기
alter table s_emp modify (salary varchar2(50));
update s_emp set salary= null;
select * from s_emp;

alter table s_emp add salary2 varchar2(50);
update s_emp set salary2=salary;
select * from s_emp;
desc s_empt;
commit;

--필드명을 A에서 B로 변경
--alter table 테이블 rename column A to B
alter table s_emp rename column id to t_id;
desc s_emp;

--drop column 삭제할 필드명
alter table s_emp drop column dept_name;

desc s_emp;
--delete from 테이블 where 조건
delete from s_emp where t_id=100;
select * from s_emp;

--maild 컬럼 추가
alter table s_emp add mailid varchar2(10);
--maild 컬럼을 20 바이트로 수정
alter table s_emp modify mailid varchar2(20);
--maild 컬럼명을 e_mail로 수정
alter table s_emp rename column mailid to e_mail;
--s_emp 테이블을t_emp 로 수정
rename s_emp to t_emp;

desc t_emp;

--회원 테이블
select * from member;
--회원가입일자 join_date
alter table member add join_date date;
--join_date 필드가 null인 레코드를 찾아서 2019-11-01로 수정
update member set join_date = '2019-11-01'
where join_date is null;

select * from member;
--email 필드 추가 :varchar2, 50byte
alter table member add email varchar2(50);
desc member;
commit;





