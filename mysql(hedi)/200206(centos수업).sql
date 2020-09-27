USE web;
INSERT INTO guestbook (NAME,email,content,passwd,post_date)
VALUES ('kim',kim@nate.com','I'm sorry',1234',now());

INSERT INTO guestbook (NAME,email,content,passwd,post_date)
VALUES ('kim',kim@nate.com','I''m sorry',1234',now());

select * from guestbook;

select * from guestbook where idx=12;