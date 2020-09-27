--회원정보 테이블
drop table member;
create table member(
userid varchar(50) primary key,
pwd varchar(50),
name varchar(50)
);
--레코드 추가
insert into member values ('kim','1234','김철수');
--등록된 아이디
select * from member where userid='kim';
--등록되지 않은 아이디
select * from member where userid='lee';

--회원 테이블
select * from member;
--회원가입일자 join_date
alter table member add join_date date;
--join_date 필드가 null인 레코드를 찾아서 2019-11-01로 수정
update member set join_date = '2019-11-01'
where join_date is null;
select * from member;
alter table member add email varchar2(50);
desc member;


commit;