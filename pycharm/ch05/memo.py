#191121 오후-오라클 수업


import cx_Oracle #오라클 접속 모듈
#함수선언
def memo_list():
    #오라클 접속
    conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
    cursor=conn.cursor() #sql 명령어를 실행하고 레코드셋을 탐색하는 커서 생성
    sql='select * from memo order by idx desc'
    cursor.execute(sql) #sql 명령어를 실행시킴
    rows=cursor.fetchall() #레코드셋을 리스트로 저장
    print('번호\t이름\t날짜\t\t\t\t내용')
    print('='*50)
    for row in rows:
        print('{}\t\t{}\t\t{}\t{}'.format(row[0],row[1],row[3],row[2]))

    cursor.close() #커서 닫기
    conn.close() #DB접속 종료
#새로운 메모를 저장하는 함수
def memo_insert():
    conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
    cursor=conn.cursor()
    writer=input('이름:')
    memo=input('내용:')
    #글번호는 시퀀스를 이용하여 입력
    #:1에 이름이 :2에 내용이 입력됨
    #날짜는 default sysdate로 기본값으로 처리됨
    sql='''insert into memo (idx,writer,memo) values (memo_seq.nextval,:1,:2)
    '''
    cursor.execute(sql, (writer,memo))
    conn.commit() #커밋을 하지 않으면 레코드가 저장되지 않음
    print('저장되었습니다.')
    cursor.close()
    conn.close()

#함수 호출
memo_insert()
memo_list()