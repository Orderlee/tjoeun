select * from memo;
drop table memo;   -- ���̺� ����
-- ���̺� ����
create table memo(
idx number primary key, -- �⺻Ű
writer varchar2(50) not null, -- �ʼ��Է�
memo varchar2(500) not null,
post_date date default sysdate --�⺻���� ����ð�
);
--�Խù� ��ȣ�� �ű�� ���� ������ ����
drop sequence memo_seq;
create sequence memo_seq
start with 1 --1�� ����
increment by 1 --1�� ����
nomaxvalue; --������ ����

-- ������.netxtval ���ο� ��ȣ �߱�
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'kim','memo...');
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'park','memo...');
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'song','memo...');
select * from memo;
commit;
--ip�ּ� �߰�
--���ο� �ʵ� �߰�
--alter table ���̺� add �ʵ�� �ڷ���(������)
alter table memo add (ip varchar2(50));
select * from memo;

--�������ν��� �����
--in �Է¸Ű�����
--out ��¸Ű����� sys_refcursor ���ڵ� Ž�� ��ü
--open Ŀ�� for select ��ɾ�(���ڵ���� �� ��� Ž��)
create or replace procedure memo_list(v_row out sys_refcursor)
is
begin
open v_row for
select * from memo order by idx desc;
end;
/
--�޸� ���� ���� ���ν���
--������ in �ڷ��� : �Է¸Ű����� (in ��������)
--������ out �ڷ��� : ��¸Ű�����
create or replace procedure memo_insert
(v_writer varchar, v_memo varchar, v_ip varchar)
is
begin
insert into memo (idx,writer,memo,ip) values
(memo_seq.nextval,v_writer, v_memo,v_ip);
end;
/
--�������ν��� ȣ��
--exec ���ν����̸�
exec memo_insert('��ö��','�޸�...', '192.168.0.10');
select * from memo;
commit;

drop table emp3;
create table emp3 as select * from emp;
select * from emp3;

--���ο� ����� �߰��ϴ� ���� ���ν��� ����� : emp_insert
-- �Ű����� ���, �̸�, �޿�
create or replace procedure emp_insert
(v_empno number, v_ename varchar, v_sal number)
is
begin
insert into emp3(empno,ename,sal) values
(v_empno,v_ename,v_sal);
end;
/
exec emp_insert('7131','������','300');
commit;
select empno,ename,sal from emp3;
--���ν����� �ϼ��Ǹ� ���̽� �ڵ�� �׽�Ʈ

















