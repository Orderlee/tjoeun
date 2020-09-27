--�並 ����, �ι�°���ʹ� ����
--create or replace view ���̸� as (sql ��ɾ�)
create or replace view test_view as
select empno,ename,job,sal,deptno
from emp
where job='���';
--�並 ��ġ ���̺�ó�� ����� �� ����
select * from test_view;
--���̺�,���� ��� (������ ���� ��ȸ)
select * from tab;


drop view test_view;

create or replace view test_view as
select empno, ename, e.deptno, dname
from emp e, dept d
where e.deptno=d.deptno;
--�並 ���̺�ó�� ��밡��
select * from test_view;
--���� ���� ���� Ȯ��(������ ����)
select * from tab;
select * from user_views;

select * from user_views;
--emp ���̺��� empno �ʵ忡 �⺻Ű �߰�
alter table emp add primary key(empno);

--���� ����� �������� �������� ���� ������ �ٸ�
-- ���ಾȹ ���� F10
select empno,ename from emp where empno=7900;
select empno,ename from emp where ename='�ڹμ�';
desc ontime;
--full scan(��緹�ڵ带 ��������)
select * from ontime where distance>1000;
--index scan(�ε����� ���ļ� ���� ��ȸ ����)
select * from ontime where month=10;

drop table emp3;
create table emp3 (
no number,
name varchar2(50),
sal number
);


--PL/SQL
declare --���� �����
  i number :=1; 
  name varchar(20) := 'kim';
  sal number :=0;
begin --�����
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
-- �ε��� �߰�
-- create index �ε����̸� on ���̺�(�ʵ�)
-- emp3 ���̺���  name,sal, �ʵ忡 �ε��� �߰�(�����ε���)
create index emp_name_idx on emp3(name,sal);
-- �ε����� �߰��� �� �����ȹ�� �ٽ� Ȯ��, index ���, cost 11
select * from emp3 where name='shin691' and sal>200;






















