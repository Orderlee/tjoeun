-- 작업할 데이터베이스 선택
USE myweb;
-- auto_increment 자동증가 일련번호
-- varchar 가변사이즈 문자열, text 대용량 문자열
-- timestamp 타임스태프 : 날짜의 숫자값

CREATE TABLE pages(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(200),
content TEXT,
created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM pages;
INSERT INTO pages (title,content) VALUES ('aaa','bbb');
INSERT INTO pages (title,content)
VALUES ('I''m sorry','bbb');
INSERT INTO pages (title,content)
VALUES('"yes"','bbb');