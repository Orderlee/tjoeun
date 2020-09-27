USE pyweb;
--레코드 삭제
DELETE FROM board_board;
DELETE FROM board_comment;
SELECT * FROM board_board;
SELECT * FROM board_comment;

--저장 프로시저 만들ontime기
DELIMITER $$
DROP PROCEDURE if EXISTS loopInsert$$
CREATE PROCEDURE loopInsert()
BEGIN
DECLARE i INT DEFAULT 1;
while i<=991 DO
INSERT INTO board_board 
(idx,writer,title,content,hit,post_date,filesize,down)
VALUES (i,CONCAT('kim',i),CONCAT('제목',i),CONCAT('내용',i),
0,NOW(),0,0);
SET i=i+1;
END while;
END $$
DELIMITER $$

CALL loopInsert   #실행함수

SELECT * FROM board_board;

SELECT * FROM board_board
ORDER BY idx desc
LIMIT 10;

-- limit 레코드인덱스,레코드갯수
SELECT * FROM board_board
ORDER BY idx desc
LIMIT 0,10;

SELECT * FROM board_board
ORDER BY idx desc
LIMIT 10,10;

SELECT * FROM board_board
ORDER BY idx desc
LIMIT 40,10;


