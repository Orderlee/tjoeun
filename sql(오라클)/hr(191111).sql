-- ���, �̸�,�μ��ڵ�,�μ��̸�
select empno,ename,e.deptno,dname
from emp e, dept d --������ ���̺�
where e.deptno=d.deptno; --���� ����

-- create view ���̸� as select ����
-- ��(view) : �������� ���̺��� �ƴϰ� ������ sql�� ���� ����� �� �ֵ��� ���� ��
create or replace view emp_v as
select empno,ename,e.deptno,dname
from emp e, dept d 
where e.deptno=d.deptno;
-- name is already used by an existing object

--�並 ���̺�ó�� ����� �� ����
select * from emp_v;

select * from student;
select * from professor;
select * from department;
-- �й�/�̸�/�а���/�г�/��������
select studno �й�,s.name �̸�,dname �а���, grade �г�, p.name ����������
from student s, department d, professor p
where s.deptno1=d.deptno and s.profno=p.profno;

--�� join�������� �並 ����, ���̸� -student_v
create or replace view student_v as
select studno �й�,s.name �̸�,dname �а���, grade �г�, p.name ����������
from student s, department d, professor p
where s.deptno1=d.deptno and s.profno=p.profno;

--�����ȣ,�μ���,�̸�.�޿�
select  e.deptno,dname,ename,sal
from emp e, dept d
where e.deptno=d.deptno;
--������ '���'�� �̸�,�μ���ȣ,�μ��̸�
select e.deptno,dname,ename,sal
from emp e, dept d
where e.deptno=d.deptno and job='���';
--�̸��� Ȳ����, �μ���
select ename,dname
from emp e, dept d
where e.deptno=d.deptno and ename='Ȳ����';
-- ...�� �Ŵ����� ...�̴�.
-- A||B=> A��B�� ����
select a.ename||'�� �Ŵ�����'||b.ename||'�̴�.'
from emp a, emp b
where a.mgr=b.empno;


select * from student;
--���� ���̺� (���̺� �̸�:subject)
--�����ڵ�/��米�����/�����/����
create table subject(
subject_code varchar(50) primary key,
profno number, 
subject_name varchar(200),
point number
);

--���� ���̺�(�й�/�����ڵ�/���)
drop table lecture;
create table lecture(
studno number,
subject_code varchar(50),
grade varchar(2),
primary key (studno,subject_code) --����Ű
);

--���� ���ڵ� �߰�
insert into subject values ('A1',1001,'python',3);
insert into subject values ('A2',1002,'�����ͺ��̽�',2);
insert into subject values ('A3',1003,'������',3);
select * from subject;
--���� ���ڵ� �߰�
insert into lecture values(9411,'A1','A+');
insert into lecture values(9411,'A2','B+');
insert into lecture values(9412,'A3','C0');
insert into lecture values(9413,'A1','A0');
insert into lecture values(9413,'A2','F');
select * from lecture;
commit;

--�й�/�̸�/�����/����������/����
select * from student;
select * from subject;
select * from lecture;
select * from professor;
select * from department;

select s.studno �й�, s.name �̸�, subject_name �����, p.name ����������, point ����
from student s, professor p, lecture l, subject sb
where s.studno=l.studno and p.profno=sb.profno
 and sb.subject_code=l.subject_code;
 
 --�й�/�а���/�̸�/�����/��米����/����/���
select s.studno �й�, dname �а���, s.name �̸�, subject_name �����, p.name ����������,
point ����, l.grade ���
from student s, professor p, lecture l, subject sb, department d
where s.studno=l.studno and p.profno=sb.profno and sb.subject_code=l.subject_code
and s.deptno1=d.deptno;

--�� sql ��ɾ view�� ����� : ���̸� lecture_v
create or replace view lecture_v as
select s.studno �й�, dname �а���, s.name �̸�, subject_name �����, p.name ����������,
point ����, l.grade ���
from student s, professor p, lecture l, subject sb, department d
where s.studno=l.studno and p.profno=sb.profno and sb.subject_code=l.subject_code
and s.deptno1=d.deptno;
select * from lecture_v;    