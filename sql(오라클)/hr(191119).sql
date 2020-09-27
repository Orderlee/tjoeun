drop table c_emp;
create table c_emp(
id number(5), --�⺻Ű, ��Ű, ���ڵ��� �ĺ���
name varchar2(25),
salary number(7,2),
phone varchar2(15),
dept_id number(7)
);

--���̺��� ���� �Ŀ� ���� ������ �߰��ϴ� ���
--alter table ���̺� add constraing ���������̸� primary key(�ʵ�)
alter table c_emp add constraint c_emp_id_pk primary key(id);
alter table c_emp add primary key(id);


insert into c_emp (id,name) values (1,'��ö��');
insert into c_emp (id,name) values (1,'���ö');
insert into c_emp (id,name) values (1,'��ö��');
select * from c_emp;
-- unique constraint (HR.SYS_C007179) violated


--�������� ����Ʈ
--user_constraints : �ý��� ���̺�, ������ ����
-- ���������� ����� �����ϰ� �ִ� �ý��� ���̺�
select * from user_constraints
where TABLE_NAME='T1';

-- primary key : ����Ű(�ʵ� 1��), ����Ű(�ʵ� 2��)
-- �� ���̺� : �����̵�
-- ��ǰ���̺� : ��ǰ�ڵ�
-- �ֹ����̺� : �����̵�, ��ǰ�ڵ�, ����, ��۷�, �ּ�
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
--emp ���̺��� �����Ͽ� emp3 ���̺� �����(���������� ����)
--create table ���̺� as select ��ɾ�
create table emp3 as
select * from emp;

select * from emp3;
insert into emp3 (empno,ename) values (7369,'��ö��');
--�μ����̺� ���� �μ��ڵ� 50�� �Է�
insert into emp3 (empno,ename,deptno)
values (1000,'kim',50);

select * from emp3 where empno=1000;
--���̺� ���ο��� ������
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

-- foreign key ����
-- references ���̺�(�ʵ�)
-- dept_id �ʵ忡�� dept ���̺��� deptno �ʵ��� ���鸸 �Է� ����
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
--unique : �ߺ����� �ʴ� ��(null�� �����)
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
