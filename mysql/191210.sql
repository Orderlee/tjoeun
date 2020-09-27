--작업할 데이터베이스 선택
USE web;

DROP TABLE book;
--테이블 생성
CREATE TABLE book(
isbn VARCHAR(50) NOT NULL PRIMARY KEY,
title VARCHAR(50) NOT NULL,
author VARCHAR(50) NOT NULL,
price INT NOT NULL,
publisher VARCHAR(50) NOT NULL,
pubdate DATE,
description VARCHAR(2000) NOT NULL
);
--테이블 목록 확인
SHOW TABLES;

--now () 현재 날짜와 시각
--curdate() 현재 날짜ㅓ
SELECT NOW();
SELECT CURDATE();

INSERT INTO book VALUES('100','java','kim',20000,'영진',curdate(),'자바책');
INSERT INTO book VALUES('200','python','hong',30000,'한빛',curdate(),'Python 책');

SELECT * FROM book;hive