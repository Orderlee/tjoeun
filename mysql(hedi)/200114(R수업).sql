USE myweb;

CREATE TABLE score(
student_no VARCHAR(50) PRIMARY KEY,
kor INT DEFAULT 0,
eng INT DEFAULT 0,
mat INT DEFAULT 0
);

INSERT INTO score VALUES ('1',90,80,70);
INSERT INTO score VALUES ('2',88,77,70);
INSERT INTO score VALUES ('3',99,89,79);
INSERT INTO score VALUES ('4',95,85,89);
INSERT INTO score VALUES ('5',77,55,83);
SELECT * FROM score;

ALTER USER 'web'@'localhost'
identified WITH mysql_native_password BY '1234';


