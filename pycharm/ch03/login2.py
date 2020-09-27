import cx_Oracle#오라클 접속 모듈
#오라클 서버에 접속 아이디/비번@호스트:포트번호/sid
conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
#커서 만들기
cursor=conn.cursor()
#따옴표 주의
userid=input('아이디를 입력하세요:')
sql="select * from member where userid='%s'" % userid
#sql 명령어 실행
cursor.execute(sql)
#레코드 1개를 저장
row=cursor.fetchone()
if row:
    print('등록된 회원입니다.')
    pwd=input('비밀번호를 입력하세요:')
    if pwd==row[1]: #비밀번호가 맞을 때
        print(row[2]+'님 환영합니다.')
    else: #비밀번호가 틀릴때
        print('비밀번호가 일치하지 않습니다.')
else: #아이디가 없을때
    print('비회원입니다.')

#리소스 정리
cursor.close()
conn.close()