import cx_Oracle #오라클 접속 모듈
#오라클 서버에 접속 : 아이디/비번@호스트:포트번호/sid
conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
cursor=conn.cursor() #커서 생성

with open('d:/data/salary.csv') as f: #파일 오픈
    lines=f.readlines() #모든 라인을 읽어서 리스트로 저장
    for line in lines[1:]: #첫라인은 skip(header)
        row=line.split(',') #각 라인을 컴머 단위로 나누어 리스트로 저장
        sql='insert into salary values (:1,:2,:3,:4,:5,:6,:7)'
        #sql 명령어 실행
        cursor.execute(sql,(int(row[0]),row[1],(int(row[2])),int(row[3]),int(row[4]),int(row[5]),int(row[6])))
        sql2='select id, name,salary,bonus, y_salary(salary*12+bonus), tax(salary*0.03), R_M(y_salary-tax)' \
             ''
#변경사항 확정
conn.commit()
#리소스 정리
cursor.close()
conn.close()
print('완료되었습니다.')