USE web;
DROP TABLE memo;
create table memo(
idx int primary KEY auto_increment,
writer varchar(50), 
memo varchar(500), 
post_date datetime default NOW()
);
SHOW TABLES;
insert into memo (writer,memo) values
('kim', '메모...');
SELECT * FROM memo ORDER BY idx DESC;