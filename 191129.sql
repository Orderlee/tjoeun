--사용할 데이터베이스 선택
use web;
-- 아스키코드(알파벳,숫자,256자)
-- 유니코드(다국어 지원,65535자)
--varchar
--nvarchar 유니코드 가변문자열
drop table product;
create table product(
product_id int,
product_name nvarchar(50),
price int default 0,
description nvarchar(4000),
picture_url nvarchar(500),
primary key(product_id)
);

insert into product values(1,'레몬',1500,'레몬에 포함된 구연산은 피로회복에 좋습니다. 비타민 C도 풍부합니다.','lemon,jpg');
insert into product values(2,'오렌지',2000,'비타민 C가 풍부합니다. 생과일 주스로 마시면 좋습니다.','orange.jpg');
insert into product values (3,'키위',3000,'비타민 C가 매우 풍부합니다. 다이어트나 미용에 좋습니다.','kiwi,jpg');
insert into product values (4,'포도',5000,'폴리페놀을 다량 함유하고 있어 황산화 작용을 합니다.','grape.jpg');
insert into product values(5,'딸기',8000,'비타민 C나 플라보노이드를 다량 함유하고 있습니다.','strawberry.jpg');
insert into product values(6,'귤',7000,'시네피린을 함유하고 있어 감기 예방에 좋다고 합니다.','tangerine.jpg');
select * from product;