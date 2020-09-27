select * from product;
--���� ���̺� ����
drop table product;
--���̺� ����
-- varchar2 �ִ� 400����Ʈ, clob ��뷮 �ؽ�Ʈ �ִ� 4GB
create table product (
product_id number,
product_name varchar2(50),
price number default 0,
description clob,
picture_url varchar2(500),
primary key(product_id)
);

insert into product values(1,'����',1500,
'���� ���Ե� �������� �Ƿ�ȸ���� �����ϴ�','lemon.jpg');
insert into product values(2,'������',2000,
'��Ÿ�� C�� ǳ���մϴ�.','orange.jpg');
insert into product values(3,'Ű��',3000,
'���̾�Ʈ�� �̿뿡 �����ϴ�.','kiwi.jpg');
insert into product values(4,'����',5000,
'��������� �ٷ� �����ϰ� �ֽ��ϴ�.','grape.jpg');
insert into product values(5,'����',8000,
'��Ÿ�� C�� �ö󺸳��̵带 �ٷ� �����ϰ� �ֽ��ϴ�.','strawberry.jpg');
insert into product values(6,'��',7000,
'�ó��Ǹ��� �����ϰ� �־� ���� ���濡 ���ٰ� �մϴ�.','tangerine.jpg');
select * from product;
commit;



select count(*) from product;