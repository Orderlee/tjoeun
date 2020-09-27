#20191209
import MySQLdb
conn=MySQLdb.connect(host='localhost',port=3306,db='web',
                     user='web',passwd='1234',charset='utf8')
def list():
    cursor=conn.cursor()
    cursor.execute('select * from members')
    rows=cursor.fetchall()
    for row in rows:
        print(row)

    cursor.close()
    conn.close()

def login_check(userid,passwd):
    conn = MySQLdb.connect(host='localhost', port=3306, db='web',
                           user='web', passwd='1234', charset='utf8')
    cursor = conn.cursor()
    cursor.execute('''
    select * from members where userid=%s and passwd=%s
    ''', (userid,passwd))
    row = cursor.fetchone() #레코드 1개를 변수에 저장
    cursor.close()
    conn.close()
    if row: #레코드가 존재하면 (로그인 성공)
        return row[2]+'님 환영합니다.'
    else: #레코드가 없으면 (로그인 실패)
        return '아이디 또는 비밀번호가 일치하지 않습니다.'

print(login_check('kim',1234))
print(login_check('kim',12345))