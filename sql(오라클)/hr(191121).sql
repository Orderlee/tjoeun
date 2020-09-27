select sysdate from dual;

drop table c_emp;
-- 테이블 복사 (테이블의 구조와 데이터가 복사됨, 제약조건은 제외)
-- create table 테이블 as sql 명령어
-- where 1=0 => false이므로 아무 레코드도 저장되지 않음
create table c_emp as select * from emp where 1=0;
select * from c_emp;
--커밋 : insert,update,delete
commit;

--create sequence 시퀀스이름
--start with 시작번호
-- increment by step
drop sequence c_emp_seq;
create sequence c_emp_seq
start with 1
increment by 1;
--시퀀스이름.nextval -> 다음번호
--시퀀스이름.currval -> 최근 발급된 번호  (시퀀스 오라클에만 있음)
select c_emp_seq.nextval from dual;
select c_emp_seq.currval from dual;

select * from c_emp;
--시퀀스를 이용한 사번발급
insert into c_emp (empno,ename,sal,deptno) values  
(c_emp_seq.nextval, 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'lee',5000,30);
select * from c_emp;
delete from c_emp;

insert into c_emp (empno,ename,sal,deptno) values  
(c_emp_seq.nextval, 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
(c_emp_seq.nextval, 'lee',5000,30);
select * from c_emp;
delete  from c_emp;
select * from c_emp;
--서브쿼리를 이용한 일련번호 발급 방법
--레코드가 하나도 없으면 null로 출력됨
select max(empno)+1 from c_emp;
insert into c_emp (empno,ename,sal,deptno) values  
(c_emp_seq.nextval, 'kim',3000,10);
select * from c_emp;
select max(empno)+1 from c_emp;
delete from c_emp;
select max(empno)+1 from c_emp;
--nvl 함수를 사용하여 레코드가 하나도 없으면 1로 처리
--nvl (A,B) A가 null이면 B, null이 아니면 A
select nvl(max(empno)+1,1) from c_emp;

insert into c_emp (empno,ename,sal,deptno) values  
((select nvl(max(empno)+1,1) from c_emp), 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'lee',5000,30);
select * from c_emp;

delete from c_emp;
insert into c_emp (empno,ename,sal,deptno) values  
((select nvl(max(empno)+1,1) from c_emp), 'kim',3000,10);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'park',2000,20);
insert into c_emp (empno,ename,sal,deptno) values 
((select nvl(max(empno)+1,1) from c_emp), 'lee',5000,30);
select * from c_emp;

-- 206~999 1씩 증가되는 시퀀스 만들기
create sequence c_emp_seq2
start with 206
increment by 1
maxvalue 999;

insert into c_emp (empno,ename,deptno)
values (c_emp_seq2.nextval, '김철수', 10);

select * from c_emp;
commit;


create table memo(
idx number primary key, --글번호(일련번호)
writer varchar2(50), -- 이름
memo varchar2(500), -- 내용
post_date date default sysdate --작성날짜,기본값은 현재날짜
);
-- 1부터 1씩 무제한 증가되는 시퀀스 생성, memo_seq
create sequence memo_seq
start with 1
increment by 1;


--memo테이블에 시퀀스를 이용하여 레코드를 몇개 입력
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'kim', '메모...');

select * from memo;
commit;









