select * from emp;
--null : ���� �Էµ��� ���� ����
--0 : 0�̶�� ���� �Էµ� ����
--null �� �����ϸ� --> null
select ename,sal,comm,sal+comm from emp;
--Ŀ�̼��� null�� �����
select * from emp where comm is null ;
--Ŀ�̼��� null�� �ƴ� �����
select * from emp where comm <> null ;
select * from emp where comm is not null ;
--Ŀ�̼��� null�̸� ������ 3% ����
--nvl(A,B) A�� null�̸� B, null�� �ƴϸ� A
select ename, job, sal, comm,sal+nvl(comm,sal*0.03)
from emp;

--������(deptno2) �� null�̸� '0'���� ǥ��
select studno,name,grade,deptno1,deptno2 from student;
select studno,name,grade,deptno1,nvl(deptno2,0)
from student;

-- decode (A,B, A�� B�� �������� ��, �ٸ����� ��)
-- �Լ��� ���޵Ǵ� ���� ������ ������
-- Trunc(�Ǽ�) -->  �Ҽ� ���ϸ� ����
select ename,sal,decode(trunc(sal/100), 0, 'E', 1, 'D',
 2, 'C', 3, 'B', 'A') �޿����
from emp;

select * from dept;
-- 10 �渮��, 20 ������, 30 �ѹ���
select ename,deptno,decode(deptno,10,'�渮��', 20,'������', 30, '�ѹ���') �μ���
from emp;

select * from department;
-- deptno 101 �İ�, 102 ��Ƽ, 103 �Ұ�, 201 ����, 202 ���
select studno,name,deptno1,decode(deptno1, 101, '�İ�', 102, '��Ƽ', 103, '�Ұ�', 201, '����', 202, '���', '��Ÿ') ����
from student; 


select * from score;
create table score(
student_no varchar2(20) primary key,
name varchar2(20) not null,
kor number(3) default 0,
eng number(3) default 0,
mat number(3) default 0
);

insert into score values ('1','kim',90,80,70);
insert into score values ('2','park',88,77,66);
insert into score values ('3','hong',95,84,54);
insert into score values ('4','choi',87,66,99);

select * from score;
commit;
--�й�,�̸�,����,����,����,����,���
-- round(��,�Ҽ������ڸ���)
select student_no,name,kor,eng,mat,(kor+eng+mat) ����, round((kor+eng+mat)/3,1) ���,
decode(trunc(((kor+eng+mat)/3)/10), 10,'A',9,'A',8,'B',7,'C',6,'D','F') ���
from score;
commit;

