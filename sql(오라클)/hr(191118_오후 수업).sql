--not null : null�� ������� ����
--varchar2 : ���� ������ ���ڿ�
--number �ִ� 38�ڸ� ���� number(��ü�ڸ���,�Ҽ������ڸ���)
drop table t_emp;
drop table s_emp;
create table t_emp(
id number(5) not null primary key,
name varchar2(25),
salary number(7,2),
phone varchar2(15),
dept_name varchar2(25)
);
select * from t_emp;
rename t_emp to s_emp; --���̺� �̸� ����
select * from s_emp;
--���̺��� �ʵ� ���
desc s_emp;

--���ڵ� �߰�
--��� �ʵ尪�� �Է��ϴ� ���
--insert into ���̺� values (��1,��2,,,,)
insert into s_emp values(100,'�̻���',2000,'010-2222-3333','���ߺ�');
insert into s_emp values(101,'�ּ�ö',3000,'010-3333-4444','�ѹ���');
insert into s_emp values(102,'������',4000,'010-4444-5555','������');

insert into s_emp (id,name) values (103,'�ڻ��');
--not null �ʵ�� �ݵ�� �Է��ؾ���
--insert into s_emp (name,salary) value('��ö��',5000);
--cannot insert NULL into ("HR","S_EMP","ID")

select * from s_emp;
commit;
--create ����, drop ���� alter ����
--���ο� �ʵ� �߰�:alter table ���̺� add (�ʵ�� �ڷ���)
alter table s_emp add (hire_date date);
select * from s_emp;

--id 100�� ����� �Ի����ڸ� ���ó�¥��
--update ���̺� set �ʵ�=�����Ұ� where ����
--sysdate : �ý����� ���� ��¥
update s_emp set hire_date=sysdate where id=100;
select * from s_emp;

--hire_date null�� ���ڵ���� �Ի����ڸ� 2019-10-01��
update s_emp set hire_date='2019-10-01' where hire_date=null;
update s_emp set hire_date='2019-10-01' where hire_date is null;
commit;

insert into s_emp (id,name,phone)
values(200,'�̻���','011-233-010-222-3333');
--value too large for column "HR"."S_EMP"."PHONE" 
--(actual: 20, maximum: 15)

--alter table ���̺� modify(�ʵ� �ڷ���(������))
--15����Ʈ���� 50����Ʈ�� �ø�
alter table s_emp modify (phone varchar2(50));
select * from s_emp;
--�����ʵ带 ���ڿ��� �ٲٱ�
alter table s_emp modify (salary varchar2(50));
update s_emp set salary= null;
select * from s_emp;

alter table s_emp add salary2 varchar2(50);
update s_emp set salary2=salary;
select * from s_emp;
desc s_empt;
commit;

--�ʵ���� A���� B�� ����
--alter table ���̺� rename column A to B
alter table s_emp rename column id to t_id;
desc s_emp;

--drop column ������ �ʵ��
alter table s_emp drop column dept_name;

desc s_emp;
--delete from ���̺� where ����
delete from s_emp where t_id=100;
select * from s_emp;

--maild �÷� �߰�
alter table s_emp add mailid varchar2(10);
--maild �÷��� 20 ����Ʈ�� ����
alter table s_emp modify mailid varchar2(20);
--maild �÷����� e_mail�� ����
alter table s_emp rename column mailid to e_mail;
--s_emp ���̺���t_emp �� ����
rename s_emp to t_emp;

desc t_emp;

--ȸ�� ���̺�
select * from member;
--ȸ���������� join_date
alter table member add join_date date;
--join_date �ʵ尡 null�� ���ڵ带 ã�Ƽ� 2019-11-01�� ����
update member set join_date = '2019-11-01'
where join_date is null;

select * from member;
--email �ʵ� �߰� :varchar2, 50byte
alter table member add email varchar2(50);
desc member;
commit;





