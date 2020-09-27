--case when ���� then ��            else       end
select name, position,
case when position ='������' then (pay+nvl(bonus,0))*1.1
when position ='������' then (pay+nvl(bonus,0))*1.07
when position = '���Ӱ���' then (pay+nvl(bonus,0))*1.05
else pay+nvl(bonus,0)
end �޿�
from professor
order by 3 desc; --sql�� 1�� ���� ���� as�� ������ ��ȣ�� ��� ��

select * from dept;
-- 10 �渮��, 20 ������, 30 �ѹ���, 40 ������
create or replace view emp2_v as
select empno,ename,deptno,
case when deptno = 10 then '�渮��'
when deptno = 20 then '������'
when deptno = 30 then '�ѹ���'
when deptno = 40 then '������'
end �μ���
from emp
order by ename; --�׹�° �ʵ带 �������� �������� ����
--sql������ �ʵ� �ε����� 1����
select * from emp2_v;


create or replace view score_v as
select name, kor, eng, mat, kor+eng+mat ����,
round((kor+eng+mat)/3,2) ���,
case 
when (kor+eng+mat)/3 >= 90 then 'A'
when (kor+eng+mat)/3 >= 80 then 'B'
when (kor+eng+mat)/3 >= 70 then 'C'
when (kor+eng+mat)/3 >= 60 then 'D'
else 'F'
end ���
from score;

select * from score_v;
--�������� ó��
select deptno,ename,sal,rank() over(order by sal desc) ����
from emp;
-- ���������� ���� ������ +1�� ó��
select deptno,ename,sal,dense_rank() over (order by sal desc) ����
from emp;


-- PL/SQL --
-- create or replace procedure ���ν����̸�(�Ű�����)
-- in �Է¸Ű�����, out ��¸Ű�����
create or replace procedure update_sal(v_empno in number)
is --���ν��� �ȿ��� ����� �������� ����
begin
update emp
set sal=sal*1.1
where empno=v_empno;
end;
/
select * from emp;
--7369 200
-- execute ���ν����̸�(�����Ұ�)
execute update_sal(7369);


--��� ���̺� ����
create table emp_copy as select * from emp;
select * from emp_copy;
--��� ���̺��� Ŀ�̼�comm 
create or replace procedure update_comm(v_empno in number, v_comm in number)
is
begin
update emp_copy
set comm=v_comm where empno=v_empno;
end;
/
select * from emp_copy;
execute update_comm(7369,500);
select * from emp_copy;
commit;






