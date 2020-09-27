-- ���̺� �����
-- �ʵ�� �ڷ���(������)
-- primary key �⺻Ű, ���ڵ��� �ĺ���
-- varchar2 ���������� ���ڿ� �ڷ��� (����Ŭ���� varchar2�� ���� ���)
drop table dep;
create table dep(
id varchar2(10) primary key,
name varchar2(15) not null,
location varchar2(50)
);

insert into dep values('10','������','���� ������');
savepoint a;
insert into dep values('20','ȸ���','�λ� ������');
savepoint b;
insert into dep values('30','���ߺ�','��õ ��籸');
select * from dep;
-- �ѹ� : �ֱ� commit�� ������ ��������� ��ȿȭ ��Ŵ
rollback;
rollback to a;
--Ŀ�� insert,update,delete ������ ��������� Ȯ����
commit;

--��� ���ڵ带 ��� ����
delete from emp;
commit;
select * from emp;
--show parameter undo 
show parameter undo;


-- �μ��ڵ庰 ������, �޿��հ�, �޿����
-- �����Լ� : count, sum, avg, max, min
-- count(*) ���ڵ��� ����
-- sum(�ʵ�) �հ�, avg(�ʵ�) ���

-- ��ü ������, ��ü������ �޿��հ�
select count(*),sum(sal),avg(sal),max(sal),min(sal) from emp;

select count(*) from emp;
select deptno,count(*),sum(sal),round(avg(sal),1),max(sal),min(sal)
from emp
group by deptno --��� ���� �ʵ�
order by deptno;

--goup by + join ����
select count(*) from emp;
select e.deptno,dname,count(*),sum(sal),round(avg(sal),1),max(sal),min(sal)
from emp e, dept d
where e.deptno=d.deptno
group by e.deptno, dname --��� ���� �ʵ�
order by e.deptno;

--round(�Ǽ���, �Ҽ������ڸ���) �ݿø� �Լ�
select deptno, round(avg(pay),1)
from professor
group by deptno
order by deptno;
-- �а��ڵ�/�а���/�޿��հ�/�޿����/�ִ�޿�/�ּұ޿�
-- �а��� ��� �� �� �ֵ��� join ���� �߰�
-- python �ڵ�� �����Ͽ� ȭ�鿡 ���

select * from student;
select * from professor;
select * from department;
select p.deptno, dname, sum(pay), round(avg(pay),1), max(pay), min(pay)
from professor p, department d
where p.deptno=d.deptno
group by p.deptno, dname
order by p.deptno;