USE web; #작업할 데이터베이스 선택

SHOW TABLES; #테이블 목록
#테이블 만들기
CREATE TABLE member(
userid varhcar(50) NOT NULL PRIMARY KEY,
pwd VARCHAR(50) NOT NULL,
NAME VARCHAR(50) NOT NULL
);
#레코드추가
INSERT INTO memver VALUES ('kim','1234','김철수');
SELECT * FROM member;
#로그인 실패
SELECT * FROM member WHERE userid='kim' AND pwd='123';
#로그인 성공
SELECT * FROM member WHERE userid='kim' AND pwd='1234';

