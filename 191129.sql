--����� �����ͺ��̽� ����
use web;
-- �ƽ�Ű�ڵ�(���ĺ�,����,256��)
-- �����ڵ�(�ٱ��� ����,65535��)
--varchar
--nvarchar �����ڵ� �������ڿ�
drop table product;
create table product(
product_id int,
product_name nvarchar(50),
price int default 0,
description nvarchar(4000),
picture_url nvarchar(500),
primary key(product_id)
);

insert into product values(1,'����',1500,'���� ���Ե� �������� �Ƿ�ȸ���� �����ϴ�. ��Ÿ�� C�� ǳ���մϴ�.','lemon,jpg');
insert into product values(2,'������',2000,'��Ÿ�� C�� ǳ���մϴ�. ������ �ֽ��� ���ø� �����ϴ�.','orange.jpg');
insert into product values (3,'Ű��',3000,'��Ÿ�� C�� �ſ� ǳ���մϴ�. ���̾�Ʈ�� �̿뿡 �����ϴ�.','kiwi,jpg');
insert into product values (4,'����',5000,'��������� �ٷ� �����ϰ� �־� Ȳ��ȭ �ۿ��� �մϴ�.','grape.jpg');
insert into product values(5,'����',8000,'��Ÿ�� C�� �ö󺸳��̵带 �ٷ� �����ϰ� �ֽ��ϴ�.','strawberry.jpg');
insert into product values(6,'��',7000,'�ó��Ǹ��� �����ϰ� �־� ���� ���濡 ���ٰ� �մϴ�.','tangerine.jpg');
select * from product;