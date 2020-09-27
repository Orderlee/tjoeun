create or replace procedure cursor_test2(v_deptno number)
is --�����
-- Ŀ������ ���� cursor Ŀ���̸� is select ��ɾ�
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
--�Ͻ��� Ŀ��
open dept_avg; --Ŀ�� ����
--Ŀ���� ����Ű�� ���ڵ� 1���� �о ������ ����
fetch dept_avg into v_dname,emp_cnt,sal_avg;
dbms_output.put_line('�μ���:'|| v_dname);
dbms_output.put_line('�����:'|| emp_cnt);
dbms_output.put_line('��ձ޿�:'|| sal_avg);
--Ŀ���� ����
close dept_avg;
end;
/
--����Ŭ �ֿܼ� ����� �� �ֵ��� ���� ����
set serveroutput on
--�������ν��� ���� exec ���ν����̸�(������ ��)
exec cursor_test2(10);


create or replace procedure cursor_test3
is 
cursor dept_avg is
select dname,count(empno) cnt, round(avg(sal),1) salary
from emp e, dept d
where e.deptno=d.deptno
group by dname;
begin
--�Ͻ��� Ŀ��
for emp_row in dept_avg loop
dbms_output.put_line('�μ���:'|| emp_row.dname);
dbms_output.put_line('�����:'|| emp_row.cnt);
dbms_output.put_line('��ձ޿�:'|| emp_row.salary);
end loop;
end;
/

exec cursor_test3;


create or replace trigger sum_trigger --Ʈ���� �����
after --��� ���̺��� ����� �� �ڵ� ȣ��Ǵ� Ʈ����
insert or update or delete on emp
declare --���� �����
avg_sal number;
begin
select avg(sal) into avg_sal from emp;
dbms_output.put_line('�޿����:'|| avg_sal);
end;
/


select avg(sal) from emp; --401
insert into emp (empno,ename,hiredate,sal) values
(3002,'��ö��',sysdate,500);
update emp set sal=600 where empno=3002;

delete from emp where empno=3002;


select * from dept;
update dept set deptno=90 where deptno=10;
--value larger than specified precision allowed for this column

--emp,dept ���̺� ����
drop table myemp;
drop table mydept;
create table myemp as select * from emp;
create table mydept as select * from dept;
--10�� �μ��� 90������ ����
update mydept set deptno=90 where deptno=10;
update mydept set deptno=80 where deptno=20;
select * from mydept;
select * from myemp;
--join�� ������ �߻���
select empno,ename,dname
from myemp e, mydept d
where e.deptno=d.deptno;


create or replace trigger dept_change
after -- mydept ���̺��� update�� �� �ڵ� ȣ��Ǵ� Ʈ����
update on mydept
for each row --������ �࿡ �����ϴ� Ʈ����
begin
-- :old ���� ���� ��, :new ���� ���� ��
update myemp set deptno = :new.deptno
where deptno = :old.deptno;
end;
/

drop table ontime;
select * from emp;
select * from myemp;
drop table myemp;
drop table emp;











