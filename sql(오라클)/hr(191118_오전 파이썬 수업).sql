--ȸ������ ���̺�
drop table member;
create table member(
userid varchar(50) primary key,
pwd varchar(50),
name varchar(50)
);
--���ڵ� �߰�
insert into member values ('kim','1234','��ö��');
--��ϵ� ���̵�
select * from member where userid='kim';
--��ϵ��� ���� ���̵�
select * from member where userid='lee';

--ȸ�� ���̺�
select * from member;
--ȸ���������� join_date
alter table member add join_date date;
--join_date �ʵ尡 null�� ���ڵ带 ã�Ƽ� 2019-11-01�� ����
update member set join_date = '2019-11-01'
where join_date is null;
select * from member;
alter table member add email varchar2(50);
desc member;


commit;