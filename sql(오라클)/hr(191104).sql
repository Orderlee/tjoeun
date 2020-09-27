select * from emp;
-- chr(�����ڵ�)-->����
select chr(65) from dual;
select chr(97) from dual;
-- ascii(����) -> ������ �����ڵ�
select ascii('A') from dual;
select ascii('a') from dual;
select ascii('��') from dual;

-- ���ڵ� ���� ���
select count(*) from emp;
-- desc: describe ���̺�, ���̺��� �ʵ� ����
desc dual;
desc emp;

-- A||B: A�� B ����  ->2�� �̻��� �ȵ�
-- concat(A,B) A�� B ����
select ename ||'�� ��å�� '|| job from emp;
select concat(ename,'�� ��å�� ') from emp;
select concat(concat(ename,'�� ��å�� '),job) from emp;

-- lower(�빮��) �ҹ��ڷ� ��ȯ
-- upper(�ҹ���) �빮�ڷ� ��ȯ
select lower('PYTHON'),upper('python') from dual;

-- lpad('���ڿ�',�ڸ���,���ڸ��� ä�� ����)
-- rapd('���ڿ�',�ڸ���,���ڸ��� ä�� ����)
select 'abcd',lpad('abcd',9,'#') from dual;
select 'abcd',rpad('abcd',9,'*') from dual;
select 'abcd',lpad('abcd',9) from dual;
select 'abcd',rpad('abcd',9) from dual;

-- replace(����,A,B) ���忡�� A�� ã�Ƽ� B�� �ٲٴ� �Լ�
select replace('asiancup is international festival', 'asiancup', 'worldcup') from dual;
--job �ʵ忡�� '��ǥ'�� '����'����
select ename,replace(job,'��ǥ','����') from emp;

-- 4��° ���ں��� 3����(0���Ͱ� �ƴϰ� 1����)
select substr('�����ͺм� ����',4,3) from dual;

select ename from emp;
-- substr(�ʵ� or ����, ������ġ, ���ڼ�)
select substr(ename,1,1), substr(ename,2,2) from emp;

-- �ý����� ���� ��¥,�ð�
select sysdate from dual;
-- to_char(��¥, �������)
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss') from dual;
--���� ��¥ ���� 100�� ��
select sysdate + 100 from dual;
--���� ��¥ ���� 100�� ��
select sysdate -100 from dual;
--�Ի����ڸ� �������� 90�� ���� ��¥
select ename, hiredate,hiredate+90 from emp;
--months_between(A,B) A-B ��¥�� ������
select months_between('2020-03-31', sysdate) from dual;
-- �ø� �Լ�
select ceil(months_between('2020-03-31',sysdate))from dual;
-- �ݿø� �Լ� round(�Ǽ���, �ڸ���)
select round(months_between('2020-03-31', sysdate),2) from dual;
-- �����Լ�
select trunc(months_between('2020-03-31',sysdate)) from dual;


select upper('python') from emp;

create table keywords(
keyword varchar(50)
);
insert into keywords values ('python1');
insert into keywords values ('python2');
insert into keywords values ('python3');
insert into keywords values ('python4');
insert into keywords values ('python5');
commit;
select * from keywords;
select keyword,upper(keyword),initcap(keyword) from keywords;

select upper('test') from dual;
select * from dual;
select 'test' from dual;

-- ���ں�ȯ �Լ�
-- ���� + ���ڴ� ����+���� ���·� �ٲپ�� ��
-- ���� +���� => ����, ����||���ڷ� �����ؾ� ��
select 10+20, 10*20, 10/20, 10-20 from dual;

select '100'+1 from dual;
select to_number('100')+1 from dual; -- to_number() �Լ��� �ڵ����� ȣ���
select 'hello ' + 'python' from dual; -- ����
select 'hello '||'python' from dual; -- ���ڿ� ����

--�ټӿ��� ���
select ename, (sysdate-hiredate)/365 from emp;
-- truct ����
select ename, trunc((sysdate-hiredate)/365) from emp;
-- �ʵ�� or ���� as ��Ī
select ename, trunc((sysdate-hiredate)/365) �ټӿ��� from emp;

select * from professor;
--null ���� �Էµ��� ���� ����(������)
select name,pay,bonus,pay*12 from professor;
--nvl(A,B) A�� null�̸� B, null�� �ƴϸ� A
select name,pay,bonus,pay*12 + nvl(bonus,0) from professor;
-- decode(A,B,�������� ��, �ٸ����� ��)
select ename, job,decode(job,'��ǥ','�ӿ�','����') from emp;
select * from emp;
select * from dept; --�μ����̺�
select ename,deptno,decode(deptno,10,'�渮��',20,'������',30,'�ѹ���',40,'������') from emp;

--�ǽ�����
--1)
select * from emp;
select ename,job,lpad(sal,5,'*') from emp
where sal>=300;
--2)
select * from emp;
select ename, trunc(months_between(sysdate,hiredate)) �ٹ������� from emp
where months_between(sysdate,hiredate)>=100;
--3)
select * from emp;
select ename,job,round((sysdate-hiredate)/7) �ٹ��ּ� from emp
order by (sysdate-hiredate)/7 desc, ename;
--4)
select * from student;
select name, deptno1,decode(substr(jumin,7,1),1,'����','����') ���� from student
where deptno1=101;
