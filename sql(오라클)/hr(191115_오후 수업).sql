select * from emp
order by sal desc;
--���� �ִ밪
select max(sal) from emp;
--������ ���� ���� �޴� ����� ����
select * from emp
where sal=800;

select * from emp
where sal=(select max(sal) from emp);
--������ ���� ���� ����� ����
select min(sal from emp;

select * from emp where sal=200;

select * from emp
where sal=(select min(sal) from emp);

--��ձ޿����� �� ���� �޿��� �޴� ��� ����
select avg(sal) from emp;

select * from emp
where sal>394.428571428571428571428571428571428571;

select * from emp
where sal>(select avg(sal) from emp);

-- professor ���̺� 
--�޿��հ�(pay+bonus)�� ��պ��� ū ���ڵ�
--nvl �Լ� ����ؾ���
select pay,bonus,pay+bonus,pay+nvl(bonus,0) from professor;

select avg(pay+bonus) from professor;
--nvl (A,B)�� A�� null�̸� B,null�ƴϸ� A
select avg(pay+nvl(bonus,0)) from professor;


select * from professor
where (pay+nvl(bonus,0))> 418.75;

select * from professor
where (pay+nvl(bonus,0))>(select avg(pay+nvl(bonus,0)) from professor);

--�ѹ��� �������� �ְ�޿����� ������ ���� �޴� ������
select * from emp where deptno=30;

select * from emp where sal>485;

select * from emp
where sal>(select max(sal) from emp where deptno=30);

--������ ������ �ּҿ��޺��� ������ ���� ������
select min (sal) from emp where deptno=20; --200

select * from emp where sal>200;

select * from emp
where sal>(select min(sal) from emp where deptno=20);

--���� ����, ��ü��տ��ް��� ����
select avg(sal) from emp;
select ename,sal,round((select avg(sal) from emp)-sal,1) ����
from emp;

--���� ����, ���μҼӺμ���տ��ް��� ����
--��ö��(�μ��ڵ�:20)
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=30;
select ename, sal, deptno,
((select avg(sal) from emp where deptno=e.deptno)-sal)
from emp e;
--����̸�, �μ��ڵ�,�μ��̸�
--joing�� ����� ���
select ename,e.deptno,dname
from emp e, dept d --������ ���̺��
where e.deptno=d.deptno; --���� ����
--���������� �̿��� ���
select ename, deptno,
(select dname from dept where deptno=e.deptno)
from emp e;

--���� ����� �������� �̸�,����,�μ���
--from���� ����� ���������� �ζ��� ���� ��
select ename, job, dname
from (select ename, job,deptno from emp where job='���') e,
dept d
where e.deptno=d.deptno;

--create or replace view ���̸� as(select ��ɾ�)
--�並 ����ų� ����
--���� ���ǰų� ������ sql ��ɾ �ܼ��ϰ� ���� ���� �� ���

create or replace view emp2_v as
select ename,job,deptno from emp where job='���';

select * from emp2_v;

--�۵��� �������� ���߿� �Ի��� ����� �̸�, �Ի���, �а���
select name, hiredate, dname
from professor p, department d --������ ���̺��
where p.deptno=d.deptno --������ �ʵ�
and hiredate>(select hiredate from professor where name='�۵���');

--�ɽ������� ���� �Ի��Ͽ� �Ի��� �����߿��� ������ �������� ���� ���� �޴� ���� �̸�,�޿� �Ի���
select name,pay,hiredate
from professor
where hiredate=(select hiredate from professor where name='�ɽ�')
and pay<(select pay from professor where name='������');

--�� �г⺰�� ���� Ű�� ū �л��� (�г�,�̸�,Ű)
select grade,name, max(height)
from student
group by grade,name
order by grade;

select grade,name,height
from student s
where height=(select max(height) from student where grade=s.grade)
order by grade;

--�װ��纰 ��յ��������ð�
select code,description,(select avg(arrdelay) from ontime 
where uniquecarrier=c.code) delay
from (select * from carrier
where count(*)
where rownum<100;
