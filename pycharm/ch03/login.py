import cx_Oracle#오라클 접속 모듈
#오라클 서버에 접속 아이디/비번@호스트:포트번호/sid
conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
#커서 만들기
cursor=conn.cursor()
sql='select * from member'
#sql 명령어 실행
cursor.execute(sql)
#결과셋 전체를 리스트로 저장
rows=cursor.fetchall()
for row in rows:
    print(row)

#리소스 정리
cursor.close()
conn.close()