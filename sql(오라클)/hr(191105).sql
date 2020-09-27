select * from emp;
select * from dept;

select ename,e.deptno,dname
from emp e,dept d --join �� ���̺�
where e.deptno=d.deptno; --join ����, ���̺�,�ʵ��

-- deptno1 ��1�����ڵ�
select * from student;
-- deptno �а��ڵ�, dname �а���
select * from department;

select s.name,s.deptno1,d.dname
from student s, department d--join�� ���̺��
where s.deptno1=d.deptno; --join ����

--�й�,�̸� ���������̸�
--studno �й�, name �̸�, profeno �����������
select * from student;
--profono �������, name ������
select * from professor;
--���̺� �̸�, �ʵ��̸�
select s.studno �й�,s.name �л��̸�,p.name �����̸�
from student s, professor p
where s.profno=p.profno;

--p_code ��ǰ�ڵ�, p_name ��ǰ�̸�, p_price ����
select * from product;
--p_code ��ǰ�ڵ�, p_qty ����
select * from panmae;

--��ǰ�ڵ�,��ǰ�̸�,����,����,�Ǹűݾ�(����x����)
select a.p_code ��ǰ�ڵ�, a.p_price ����, b.p_qty ����, p_price*p_qty  �Ǹűݾ�
from product a, panmae b
where a.p_code=b.p_code;



drop table product;

-- ���̺� �����
-- varchar2 ���������� ���ڿ�, char ���������� ���ڿ�
-- not null ���� ������� ���� (�ʼ� �Է�)
-- primary key (��Ű,�⺻Ű)���ڵ��� �ĺ���(�ߺ��� �� ����)
-- default �⺻��

create table product(
product_code varchar2(20) not null primary key,
product_name varchar2(50) not null,
price number default 0,
company varchar2(50),
make_date date default sysdate
);
-- ���ڵ� �Է�
-- insert into ���̺� values (��1,��2...)
-- sql������ ���ڿ�, ��¥�� ��������ǥ�� ���ΰ� ���ڴ� ����ǥ�� ���� ����
insert into product values
('A1','������',900000,'����','2019-03-01');
insert into product values
('A2','�����ó�Ʈ',1000000,'�Ｚ','2019-04-01');
insert into product values
('A3','��������',1100000,'�Ｚ','2019-05-01');

select * from product;
--�Ǹ� ���̺�
create table product_sales(
product_code varchar2(20) not null,
amount number default 0
);

insert into product_sales values ('A1',20);
insert into product_sales values ('A2',30);
insert into product_sales values ('A3',40);


select * from product_sales;
select * from product;
--��ǰ�ڵ�,��ǰ�̸�,������,��������,�ܰ�,�Ǹż���,�Ǹűݾ�(price*amount)
select  a.product_code ��ǰ�ڵ�, product_name ��ǰ�̸�, company ������, 
make_date ��������, price �ܰ�, amount �Ǹż���, price*amount �Ǹűݾ�
from product a, product_sales b -- join �� ���̺�
where a.product_code = b.product_code; --join ����

--��������
select empno,ename,(select dname from dept where deptno=e.deptno)
from emp e;

select * from student;
--���� ���̺� 
create table point (
studno number,
kor number,
eng number,
mat number
);
insert into point values (9411,80,90,100);
insert into point values (9412,85,95,75);
insert into point values (9413,82,93,67);
select * from point;
-- �й�, �̸�,����,����,����,����,��� (student�� point join)

select s.studno �й�, name �̸�, kor ����, eng ����, mat ����, 
kor+eng+mat ����, round((kor+eng+mat)/3,1) ���
from student s, point p --join �� ���̺�
where s.studno = p.studno; --join ����



commit;

-- ���蹮��
select * from emp;
select * from dept;

select empno �����ȣ, ename ����̸�, sal ���޿�, nvl(comm,0) ���ʽ�, (sal*12+nvl(comm,0)) ����, e.deptno �μ��ڵ�
from emp e, dept d
where e.deptno = d.deptno;












