select * from memo;
drop table memo;   -- 테이블 제거
-- 테이블 생성
create table memo(
idx number primary key, -- 기본키
writer varchar2(50) not null, -- 필수입력
memo varchar2(500) not null,
post_date date default sysdate --기본값은 현재시각
);
--게시물 번호를 매기기 위한 시퀀스 생성
drop sequence memo_seq;
create sequence memo_seq
start with 1 --1번 부터
increment by 1 --1씩 증가
nomaxvalue; --무제한 증가

-- 시퀀스.netxtval 새로운 번호 발급
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'kim','memo...');
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'park','memo...');
insert into memo (idx,writer,memo) values
(memo_seq.nextval, 'song','memo...');
select * from memo;
commit;
--ip주소 추가
--새로운 필드 추가
--alter table 테이블 add 필드명 자료형(사이즈)
alter table memo add (ip varchar2(50));
select * from memo;

--저장프로시저 만들기
--in 입력매개변수
--out 출력매개변수 sys_refcursor 레코드 탐색 객체
--open 커서 for select 명령어(레코드셋을 한 행식 탐색)
create or replace procedure memo_list(v_row out sys_refcursor)
is
begin
open v_row for
select * from memo order by idx desc;
end;
/
--메모 쓰기 저장 프로시저
--변수형 in 자료형 : 입력매개변수 (in 생략가능)
--변수명 out 자료형 : 출력매개변수
create or replace procedure memo_insert
(v_writer varchar, v_memo varchar, v_ip varchar)
is
begin
insert into memo (idx,writer,memo,ip) values
(memo_seq.nextval,v_writer, v_memo,v_ip);
end;
/
--저장프로시저 호출
--exec 프로시저이름
exec memo_insert('김철수','메모...', '192.168.0.10');
select * from memo;
commit;

drop table emp3;
create table emp3 as select * from emp;
select * from emp3;

--새로운 사원을 추가하는 저장 프로시저 만들기 : emp_insert
-- 매개변수 사번, 이름, 급여
create or replace procedure emp_insert
(v_empno number, v_ename varchar, v_sal number)
is
begin
insert into emp3(empno,ename,sal) values
(v_empno,v_ename,v_sal);
end;
/
exec emp_insert('7131','한지원','300');
commit;
select empno,ename,sal from emp3;
--프로시저가 완성되면 파이썬 코드로 테스트

















