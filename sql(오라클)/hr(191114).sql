--��ü �������� �޿� ���
-- * ��� �ʵ�
--round (��, �Ҽ������ڸ���)
-- �����Լ�: avg() ���, count() ����, sum() �հ�, max(), min()

select count(*) ������, sum(sal) �޿��հ�, round(avg(sal),1) ��ձ޿�,
max(sal) �ְ�޿�, min(sal) �����޿� from emp;
-- ��ü �μ��� �ƴ� �μ����� �����Ϸ���?
select deptno,count(*) ������, sum(sal) �޿��հ�, round(avg(sal),1) ��ձ޿�,
max(sal) �ְ�޿�, min(sal) �����޿� 
from emp
group by deptno --������ �ʵ�
order by deptno;

-- ontime ���̺�, ���ڵ尹��, ��������ð��հ�, ��������ð����,
-- �ִ���������ð�, ������������ð�
select count(*) ���ڵ��, sum(depdelay) �հ�, round(avg(depdelay),2) ���,
    max(depdelay) �ִ밪, min(depdelay) �ּҰ�
from ontime;
select * from ontime;
--���� ���
select month,count(*) ����Ƚ��, sum(depdelay) �հ�, round(avg(depdelay),2) ���,
    max(depdelay) �ִ밪, min(depdelay) �ּҰ�
from ontime
group by month
order by month;
--���Ϻ� ���
select dayofweek, count(*) ���ڵ��, sum(depdelay) �հ�, round(avg(depdelay),2) ���,
    max(depdelay) �ִ밪, min(depdelay) �ּҰ�
from ontime
group by dayofweek
order by dayofweek;
--
select month,dayofweek, count(*) ���ڵ��, sum(depdelay) �հ�, round(avg(depdelay),2) ���,
    max(depdelay) �ִ밪, min(depdelay) �ּҰ�
from ontime
group by month,dayofweek
order by month,dayofweek;


--�а��� ��ձ޿�
-- group by �� ����� �ʵ常 select ���� �� �� ����
select deptno, round(avg(pay),1)
from professor
group by deptno --������ �ʵ�
order by deptno; --���ı��� �ʵ�

--�� ������� ��ձ޿��� 400�̻��� �а��� ����Ϸ���?
select deptno, round(avg(pay),1) pay
from professor
group by deptno --������ �ʵ�
having avg(pay)>=400 --��������� ���̴� �ɼ�
order by pay desc; --���ı��� �ʵ�

--sql��ɾ��� �������
-- from -> where -> group by -> having -> select -> order by
-- ��ü   -  �༱�� -    ���   - ����༱�� - �ʵ弱�� - ����
-- select ������� ���� �ռ��� alais�� ����� �� ����

--�а���,���޺� ��ձ޿�
select deptno, position, round(avg(pay),1)
from professor
group by deptno,position --������ �ʵ�
order by deptno; --���ı��� �ʵ�

-- �μ��ڵ�,�μ��̸�,������,�޿��հ��,��ձ޿���, �ִ�޿���, �ּұ޿���
select * from emp;
select * from dept;
select e.deptno �μ��ڵ�, dname �μ��̸�, count(*) ������, sum(sal) �޿��հ�, round(avg(sal),1) ��ձ޿�,
max(sal) �ְ�޿�, min(sal) �����޿� 
from emp e, dept d
where e.deptno=d.deptno
group by e.deptno,dname --������ �ʵ�
order by e.deptno;

--�а��ڵ�, �а��̸�, �л��� 
select deptno1, dname,count(*)
from student s, department d
where s.deptno1=d.deptno
group by deptno1,dname
order by deptno1;

--�����������,���������̸�,�����л���
select s.profno,p.name,count(*)
from student s, professor p
where s.profno=p.profno
group by s.profno,p.name
order by s.profno;

select * from professor;
select deptno, sum(pay+nvl(bonus,0)), max(pay+nvl(bonus,0)), min(pay+nvl(bonus,0)),
round(avg(pay+nvl(bonus,0)),1)
from professor 
group by deptno
order by deptno;

--���� ����ο���
select to_char(birthday,'MM'),count(*)
from student
group by to_char(birthday,'MM')
order by to_char(birthday,'MM');

select sum(cnt)
from
    (select to_char(birthday,'MM'), count(*) cnt
    from student
    group by to_char(birthday,'MM')
    order by to_char(birthday,'MM')
    );
    






