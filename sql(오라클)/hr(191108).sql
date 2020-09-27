select * from product;
--기존 테이블 삭제
drop table product;
--테이블 생성
-- varchar2 최대 400바이트, clob 대용량 텍스트 최대 4GB
create table product (
product_id number,
product_name varchar2(50),
price number default 0,
description clob,
picture_url varchar2(500),
primary key(product_id)
);

insert into product values(1,'레몬',1500,
'레몬에 포함된 구연산은 피로회복에 좋습니다','lemon.jpg');
insert into product values(2,'오렌지',2000,
'비타민 C가 풍부합니다.','orange.jpg');
insert into product values(3,'키위',3000,
'다이어트나 미용에 좋습니다.','kiwi.jpg');
insert into product values(4,'포도',5000,
'폴리페놀을 다량 함유하고 있습니다.','grape.jpg');
insert into product values(5,'딸기',8000,
'비타민 C나 플라보노이드를 다량 함유하고 있습니다.','strawberry.jpg');
insert into product values(6,'귤',7000,
'시네피린을 함유하고 있어 감기 예방에 좋다고 합니다.','tangerine.jpg');
select * from product;
commit;



select count(*) from product;