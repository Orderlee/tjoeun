#회원가입
import cx_Oracle
conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
#커서(sql실행+결과셋 탐색) 만들기
cursor=conn.cursor()
userid=input('아이디:')
pwd=input('비밀번호:')
name=input('이름:')
email=input('이메일:')
sql='insert into member values (:1,:2,:3,sysdate,:4)'
cursor.execute(sql,(userid,pwd,name,email))
#변경사항 확정
conn.commit()

cursor.close()
conn.close()
print('등록되었습니다.')