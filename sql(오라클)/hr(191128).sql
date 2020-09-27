create or replace procedure cursor_test2(v_deptno number)
is --선언부
-- 커서변수 선언 cursor 커서이름 is select 명령어
cursor dept_avg is
select dname,count(empno) cnt, round(avg(sal),1) salary
from emp e, dept d
where e.deptno=d.deptno
and e.deptno=v_deptno
group by dname;
v_dname varchar(50);
emp_cnt number;
sal_avg number;
begin
--암시적 커서
open dept_avg; --커서 오픈
--커서가 가리키는 레코드 1개를 읽어서 변수에 저장
fetch dept_avg into v_dname,emp_cnt,sal_avg;
dbms_output.put_line('부서명:'|| v_dname);
dbms_output.put_line('사원수:'|| emp_cnt);
dbms_output.put_line('평균급여:'|| sal_avg);
--커서를 닫음
close dept_avg;
end;
/
--오라클 콘솔에 출력할 수 있도록 설정 변경
set serveroutput on
--저장프로시저 실행 exec 프로시저이름(전달할 값)
exec cursor_test2(10);


create or replace procedure cursor_test3
is 
cursor dept_avg is
select dname,count(empno) cnt, round(avg(sal),1) salary
from emp e, dept d
where e.deptno=d.deptno
group by dname;
begin
--암시적 커서
for emp_row in dept_avg loop
dbms_output.put_line('부서명:'|| emp_row.dname);
dbms_output.put_line('사원수:'|| emp_row.cnt);
dbms_output.put_line('평균급여:'|| emp_row.salary);
end loop;
end;
/

exec cursor_test3;


create or replace trigger sum_trigger --트리거 만들기
after --사원 테이블이 변경된 후 자동 호출되는 트리거
insert or update or delete on emp
declare --변수 선언부
avg_sal number;
begin
select avg(sal) into avg_sal from emp;
dbms_output.put_line('급여평균:'|| avg_sal);
end;
/


select avg(sal) from emp; --401
insert into emp (empno,ename,hiredate,sal) values
(3002,'박철수',sysdate,500);
update emp set sal=600 where empno=3002;

delete from emp where empno=3002;


select * from dept;
update dept set deptno=90 where deptno=10;
--value larger than specified precision allowed for this column

--emp,dept 테이블 복사
drop table myemp;
drop table mydept;
create table myemp as select * from emp;
create table mydept as select * from dept;
--10번 부서를 90번으로 변경
update mydept set deptno=90 where deptno=10;
update mydept set deptno=80 where deptno=20;
select * from mydept;
select * from myemp;
--join에 문제가 발생함
select empno,ename,dname
from myemp e, mydept d
where e.deptno=d.deptno;


create or replace trigger dept_change
after -- mydept 테이블이 update된 후 자동 호출되는 트리거
update on mydept
for each row --복수의 행에 적용하는 트리거
begin
-- :old 변경 전의 값, :new 변경 후의 값
update myemp set deptno = :new.deptno
where deptno = :old.deptno;
end;
/

drop table ontime;
select * from emp;
select * from myemp;
drop table myemp;
drop table emp;











