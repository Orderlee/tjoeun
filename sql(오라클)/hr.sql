--191031
-- �� �� ����:F9, ��ü ����:F5
select * from  emp;
--order by ���ı����ʵ�
select * from emp order by ename;

-- desc �������� ����
-- * ��� �÷�(�ʵ�) ���
select * from emp order by ename desc;

--���,�̸� �ʵ常 �˻�
select empno, ename from emp order by ename;
-- ���޸� ����
select job from emp order by job;
-- distinct �ʵ� => �ߺ��� ����
select distinct job from emp order by job;
-- �ʵ�� as ��Ī(as ��������)
-- order by ������ ���ı��� �ʵ带 ������ ����� �� ����
select ename �̸�, job ����, sal �޿�
from emp
order by job, sal desc;

select * from emp
where sal> 100 and sal < 400
order by sal desc;
--������ '���'�� ������
select * from emp
where job ='���';
--������ '���'�̰� �޿��� 250 ���� ū ����
select * from emp
where sal >250 and job='���';


delete from emp;
commit;
insert into emp values (7369,'��ö��','���',7902,'2000-12-17',200,null,20);
insert into emp values (7499,'������','����',7698,'2001-02-20',260,300,30);
insert into emp values (7521,'������','����',7698,'2002-02-22',325,500,30);
insert into emp values (7566,'��äȣ','����',7839,'2001-04-02',497,null,20);
insert into emp values (7654,'����ȣ','����',7698,'2001-09-28',325,1400,30);
insert into emp values (7698,'������','����',7839,'2001-05-01',485,null,30);
insert into emp values (7782,'����ö','����',7839,'2001-06-09',445,null,10);
insert into emp values (7788,'�۱⼺','����',7566,'1997-04-17',500,null,20);
insert into emp values (7839,'��öȣ','��ǥ',null,'2001-11-17',800,null,10);
insert into emp values (7844,'������','����',7698,'2001-09-08',350,0,30);
insert into emp values (7876,'Ȳ����','���',7788,'2007-05-23',210,null,20);
insert into emp values (7900,'�ڹμ�','���',7698,'2001-12-03',295,null,30);
insert into emp values (7902,'������','����',7566,'2001-12-03',600,null,20);
insert into emp values (7934,'��öȣ','���',7782,'2012-01-23',230,null,10);
commit;
select * from emp;



-- 191101
select * from emp;
--r�޿� 100 ���� �Ǵ� 400 �̻�
--select �ʵ� from ���̺� where �༱������ order by ����


select * from emp
where sal<=100 or sal>=400
order by sal desc; -- �޿� �������� desc, �������� asc

select * from emp
where not(sal>100 and sal<400)
order by sal;


--deptono �μ��ڵ� 10 �Ǵ� 20
select * from emp
where deptno=10 or deptno=20 or deptno=30;

select * from emp
where deptno in (10,20,30);

--�޿��� 300~500�� ����
select * from emp
where sal<=300 and sal<=500
order by sal;

--�ʵ� between A and B ���� ������ A~B
select * from emp
where sal between 300 and 500
order by sal;

--��� �̸��� '��'���� ����
select * from emp
where ename like '��%'; --Ű���� �˻��� ������ like ~~~~;

--��� �̸��� '��'���� ����
select * from emp
where ename like '��%';
-- ��� �̸��� '��'�� ����
select * from emp
where ename like '%��%';

select * from emp;
-- null  ������ 
-- null���� �������� null
select * from emp
where comm = null;
-- comm �ʵ尪�� null�� ������
select * from emp
where comm is null;
-- comm �ʵ尪�� null�� �ƴ� ������
select * from emp
where comm is not null;


select empno,ename,sal,comm,sal*12,sal*12 + comm
from emp;

-- nvl(A,B) A�� null�̸� B, null�� �ƴϸ� A
select empno,ename,sal,comm,sal*12,sal*12+nvl(comm,0)
from emp;

select ename,job from emp;
-- A||B: A�� B�� ���� ��Ŵ
select ename ||' '|| job from emp;

-- ()�� ���� �κ��� ���� ó����
select empno,ename,sal from emp
where not(sal>200 and sal<300)
order by sal;

select empno,ename, sal from emp
where not sal> 200 and sal <300
order by sal;

select  ename,hiredate from emp
order by hiredate desc;

-- ��¥�� ���������� ���ڷ� ó���ǰ� sql���� ǥ���� ���� ����ǥ�� ����
-- 2007�� ���� �Ի���
select ename,hiredate from emp
where hiredate > '2007-01-01';


select deptno,ename,hiredate from emp
where hiredate> '2005-01-01';

select deptno,ename,job from emp
where deptno = 20 or deptno = 30;
select deptno,ename,job from emp
where deptno in (20,30);

select * from emp;
























