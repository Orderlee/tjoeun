--myemp ���̺� ����
drop table myemp;
-- emp ���̺��� �о myemp ���̺�� ����
-- ���̺��� ���� (��Ű��)�� �����͸� �����ϴ� ���(�������� ����)
-- primary key, not null
-- where 1=0 �����̹Ƿ� �����ʹ� ������� ����
create table myemp as
select * from emp;
--where 1=0;

delete from myemp;
select * from myemp;
insert into myemp (empno) values (1);

desc emp;
desc myemp;
