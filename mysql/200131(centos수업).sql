USE web; #작업할 데이터베이스 선택
#테이블 추가,auto_increment 자동증가필드
CREATE TABLE guestbook(
idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
passwd VARCHAR(50) NOT NULL,
content TEXT,
post_date DATETIME
);
#레코드 추가, now() 시스템의 현재시각을 구하는 함수
insert INTO guestbook (NAME,email,passwd,content,post_date)
VALUES ('kim','kim@nate.com','1234','방명록...',NOW());

SELECT * from guestbook;