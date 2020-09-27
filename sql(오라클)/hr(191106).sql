select * from emp;
select * from dept;

select empno,ename,dname
from emp e, dept d --join �� ���̺�
where e.deptno=d.deptno; --join ����
-- cross join 
select empno,ename,dname
from emp e, dept d;

select * from emp;
select empno,ename,job,mgr from emp;

--self join
select a.empno ���, a.ename �̸�, b.empno �μ�����, b.ename �μ����̸�
from emp a, emp b --���� ���̺��� join (self join)
where a.mgr=b.empno;

select studno, name, profno from student;
--���� ���̺�
select * from professor;
-- ���������� �̹����� �л����� ���ܵ�
select studno �й�, s.name �л��̸�, p.name ���������̸�
from student s, professor p
where s.profno=p.profno;

-- ���������� �̹����� �л��鵵 ���
-- �ܺ�join outer join
select studno �й�, s.name �л��̸�, p.name ���������̸�
from student s, professor p
where s.profno=p.profno(+);

--��ǰ ���̺�
select * from product;
--�Ǹ� ���̺�
select * from product_sales;
-- ��ǰ 1�� �߰�
insert into product values 
('A4','�����е�',150000,'����','2019-06-01');
--��ǰ ���̺�
select * from product;
--�Ǹ� ���̺�
select * from product_sales;
-- join(inner join,equi join, a4��ǰ�� ������)
select p.product_code,product_name,price,amount,price*amount
from product p, product_sales s
where p.product_code=s.product_code;
--outer join, �����Ǿ��� A4��ǰ�� ǥ�õ�
select p.product_code,product_name,price,amount,price*amount
from product p, product_sales s
where p.product_code=s.product_code(+);


--���� ���̺�
select * from point;
select * from student;
-- �л� ���̺��� ���ڵ� ����20, ���� ���̺��� ���ڵ� ����3
-- �������ο����� ���� ���̺��� ��ġ�ϴ� �ڷḸ ǥ�õ�
select s.studno, name, kor,eng,mat
from student s, point p
where s.studno=p.studno;
--������ ���� �л��� �� ��µǵ��� �Ϸ���?
--�ڷᰡ ���� ���̺��ʿ� (+)
select s.studno, name, kor,eng,mat
from student s, point p
where s.studno=p.studno(+);

--�μ� ���̺�
select * from dept;
--���� ���̺�
select * from emp;
-- ���, �̸�, �μ���
select empno, ename, dname
from emp e, dept d
where e.deptno=d.deptno;
-- �������� ������ �Ϸ���?
select empno, ename, dname
from emp e, dept d
where e.deptno(+)=d.deptno
order by dname,ename;

select * from department;
-- �а��ڵ�, �а���, �л��̸�
select deptno,dname,name
from department d, student s
where d.deptno=s.deptno1;
--�л��� ���� �а��� ��µǰ� �Ϸ���?
--�ڷᰡ ���� �ʿ� (+)
select deptno,dname,name
from department d, student s
where d.deptno=s.deptno1(+);

--�ڷᰡ ���� ���� ��������
--left outer join
--right outer join
--full outer join

--�������� �̹��� �л��� ���
select * from student;
select studno, s.name, p.name
from student s, professor p
where s.profno=p.profno(+);

--�����ϴ� �л��� ���� ������ ���
select * from professor;
select studno, s.name, p.name
from student s, professor p
where s.profno(+)=p.profno;

-- full outer join
-- A union B ������ : �ߺ��� ����
-- A union all B ������ : �ߺ��� ����

--full outer join:(+)�� ���ʿ� �� �� �����Ƿ� union ������ ���

select studno, s.name, p.name
from student s, professor p
where s.profno=p.profno(+)
union
select studno, s.name, p.name
from student s, professor p
where s.profno(+)=p.profno;

--ANSI SQL �������� inner join
select empno, ename, dname
from emp e join dept d 
 on e.deptno=d.deptno;

select name, dname
from student s, department d
where s.deptno1=d.deptno;

--ANSI join���� ���� (�ĸӸ� join���� , where�� on����)
select name, dname
from student s join department d
    on s.deptno1=d.deptno;
    
--4�г� �л����� �̸�, �а���
select name, dname
from student s, department d
where s.deptno1 = d.deptno and grade=4;
--ANSI join���� ����
select name, dname
from student s join department d
    on s.deptno1 = deptno --> ���� ����
where grade=4; --> �Ϲ����� ����

--������ '���'�� �������� �̸�, �μ��̸�
select ename, dname
from emp e, dept d
where e.deptno = d.deptno 
and job='���';


--�� ��ɾ ANSI join���� ����
select ename, dname
from emp e join dept d
on e.deptno = d.deptno  --join�� ���� ����
where job='���'; --�Ϲ����� ����

-- �ڷᰡ ���� ���� �������� ��
-- A left outer join B: A���� �ڷᰡ �ְ� B���� ���� ���
-- A right outer join B: B���� �ڷᰡ �ְ� A���� ���� ���
-- A full outer join B: left8+right

-- ���������� �������� ���� �л��� ���Ե� join(left outer join)
select s.name, p.name
from student s, professor p
where s.profno=p.profno(+);

select s.name, p.name
from student s left outer join professor p
    on s.profno = p.profno;
    
select s.name, p.name
from  professor p right outer join  student s
    on s.profno = p.profno;    
    
-- �����ϴ� �л��� ���� ������ ���
select s.name, p.name
from student s, professor p 
where s.profno(+)=p.profno;
    
select s.name, p.name
from student s right outer join professor p
on s.profno=p.profno;

--���������� �������� ���� �л��� �����ϴ� �л��� ���� ������ ���
--full outer join
select s.name, p.name
from student s full outer join professor p
on s.profno=p.profno;
    
    
    
    