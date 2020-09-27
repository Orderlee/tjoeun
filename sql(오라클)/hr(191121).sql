select sysdate from dual;

drop table c_emp;
-- ���̺� ���� (���̺��� ������ �����Ͱ� �����, ���������� ����)
-- create table ���̺� as sql ��ɾ�
-- where 1=0 => false�̹Ƿ� �ƹ� ���ڵ嵵 ������� ����
create table c_emp as select * from emp where 1=0;
select * from c_emp;
--Ŀ�� : insert,update,delete
commit;

--create sequence �������̸�
--start with ���۹�ȣ
-- increment by step
drop sequence c_emp_seq;
create sequence c_emp_seq
start with 1
increment by 1;
--�������̸�.nextval -> ������ȣ
--�������̸�.currval -> �ֱ� �߱޵� ��ȣ  (������ ����Ŭ���� ����)
select c_emp_seq.nextval from dual;
select c_emp_seq.currval from dual;

select * from c_emp;
--�������� �̿��� ����߱�
insert into c_emp (empno,ename,sal,deptno) values  
(c_emp_seq.nextval, 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'lee',5000,30);
select * from c_emp;
delete from c_emp;

insert into c_emp (empno,ename,sal,deptno) values  
(c_emp_seq.nextval, 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'lee',5000,30);
select * from c_emp;
delete  from c_emp;
select * from c_emp;
--���������� �̿��� �Ϸù�ȣ �߱� ���
--���ڵ尡 �ϳ��� ������ null�� ��µ�
select max(empno)+1 from c_emp;
insert into c_emp (empno,ename,sal,deptno) values  
(c_emp_seq.nextval, 'kim',3000,10);
select * from c_emp;
select max(empno)+1 from c_emp;
delete from c_emp;
select max(empno)+1 from c_emp;
--nvl �Լ��� ����Ͽ� ���ڵ尡 �ϳ��� ������ 1�� ó��
--nvl (A,B) A�� null�̸� B, null�� �ƴϸ� A
select nvl(max(empno)+1,1) from c_emp;

insert into c_emp (empno,ename,sal,deptno) values  
((select nvl(max(empno)+1,1) from c_emp), 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'lee',5000,30);
select * from c_emp;

delete from c_emp;
insert into c_emp (empno,ename,sal,deptno) values  
((select nvl(max(empno)+1,1) from c_emp), 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'lee',5000,30);
select * from c_emp;

-- 206~999 1�� �����Ǵ� ������ �����
create sequence c_emp_seq2
start with 206
increment by 1
maxvalue 999;

insert into c_emp (empno,ename,deptno)
values (c_emp_seq2.nextval, '��ö��', 10);

select * from c_emp;
commit;


create table memo(
idx number primary key, --�۹�ȣ(�Ϸù�ȣ)
writer varchar2(50), -- �̸�
memo varchar2(500), -- ����
post_date date default sysdate --�ۼ���¥,�⺻���� ���糯¥
);
-- 1���� 1�� ������ �����Ǵ� ������ ����, memo_seq
create sequence memo_seq
start with 1
increment by 1;


--memo���̺� �������� �̿��Ͽ� ���ڵ带 � �Է�
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'kim', '�޸�...');

select * from memo;
commit;









