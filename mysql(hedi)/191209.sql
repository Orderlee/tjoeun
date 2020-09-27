USE web;

SHOW TABLES;

DROP TABLE members;
CREATE TABLE members(
userid VARCHAR(50) PRIMARY key,
passwd VARCHAR(50),
username VARCHAR(50)
);
INSERT INTO members VALUES ('kim','1234','김철수');
INSERT INTO members VALUES ('park','1234','박혜경');
INSERT INTO members VALUES ('lee','1234','이현수');
SELECT * FROM members;


SELECT * FROM members
WHERE userid='kim' AND passwd='1234';

SELECT * FROM members
WHERE userid='kim' AND passwd='12345';


