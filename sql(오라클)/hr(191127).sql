create or replace function fn_update_sal(v_empno number)
return number --�����ڷ���
is 
v_sal number; --�Լ� �ȿ��� ����� ��������
begin
-- �޿� 10% �λ� ó��
--update emp set sal=sal*1.1 where empno=v_empno;
-- �ʵ� into ���� : �ʵ��� ���� ������ ����
select sal into v_sal from emp
where empno=v_empno;
return v_sal; --�Լ��� ȣ���� ������ ������� �ǵ�����
end;
/

select * from emp;
select fn_update_sal(7499) from dual;
select sysdate from dual;
--"cannot perform a DML operation inside a query "
-- DML ������ ���� ��� insert,update,delete
-- := (sqlplus���� ����), :salary ->�Ű�����

--���ν��� �����
create or replace procedure dept_search(p_empno in number)
is
v_deptno number;
begin
--����� �ش�Ǵ� ���ڵ��� �μ��ڵ带 ������ ����
select deptno into v_deptno from emp
where empno=p_empno;
--����Ŭ �ֿܼ� ���
dbms_output.put_line('�μ��ڵ�:'|| v_deptno);
if v_deptno=10 then
dbms_output.put_line('�渮�� ����Դϴ�.');
elsif v_deptno=20 then
dbms_output.put_line('������ ����Դϴ�.');
elsif v_deptno =30 then
dbms_output.put_line('�ѹ��� ����Դϴ�.');
else
dbms_output.put_line('��Ÿ�μ� ����Դϴ�.');
end if;
end;
/
-- ����Ŭ �ڼֿ� ��� �� �� �ֵ��� ���� ����
set serveroutput on
--exec ���ν����̸�(�����Ұ�)
exec dept_search(7499);

delete from emp where empno>=9010;
select * from emp where empno>=9010;
declare -- ���� �����
v_cnt number :=9010; --������ �ڷ��� :=�ʱⰪ
begin
loop
v_cnt := v_cnt+1; --ī��Ʈ ���� ó��
--���ڵ尡 �߰���
insert into emp (empno,ename,hiredate) values
(v_cnt, 'tell'||v_cnt, sysdate);
--���� ���� ����
exit when v_cnt >=9100; 
end loop;-- ��������
dbms_output.put_line(v_cnt-9010||'���� ���ڵ尡 �ԷµǾ����ϴ�.');
end;
/

select * from emp order by empno desc;

delete from emp where empno>=9010;
declare
cnt number :=9050; --cnt ������ �ʱⰪ ����
begin
while cnt < 9060 loop --������ true�ϵ��� �ݺ� ó��
insert into emp(empno,ename,hiredate)
values (cnt,'test',sysdate); 
cnt:=cnt+1; --������ �����Ű�� �ڵ�
end loop;
dbms_output.put_line(cnt-9050||'���� ���ڵ尡 �ԷµǾ����ϴ�.');
end;
/

select * from emp where empno >= 9050;









