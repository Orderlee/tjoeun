#191211
import pymysql

#mysql에 접속하여 커넥션을 리턴하는 함수
def get_connection():
    conn = pymysql.connect(host='localhost', user='web', password='1234',
                           db='web', charset='utf8')  # mysql에 접속
    return conn

#도서 목록을 리턴하는 함수
def book_list():
    conn=get_connection()
    cursor=conn.cursor() #커서 생성
    sql='select * from book'
    cursor.execute(sql) #sql 명령어가 실행됨
    rows=cursor.fetchall() # 전체 레코드셋을 리스트로 저장
    result=[]
    for row in rows:
        result.append('[{}] {}'.format(row[0],row[1]))
    cursor.close() #커서 닫기
    conn.close() #db 접속 종료
    return result #결과 리스트 리턴

#새로운 도서를 등록하는 함수
def book_register():
    isbn=input('isbn:')
    title=input('책이름:')
    author=input('저자:')
    price=int(input('가격:'))
    publisher=input('출판사:')
    pubdate=input('출판일자:')
    description=input('설명:')

    conn=get_connection()
    cursor=conn.cursor()
    sql='insert into book values(%s, %s, %s, %s, %s, %s, %s)'
    cursor.execute(sql,
                 (isbn,title,author,price,publisher,pubdate,description))
    conn.commit() #레코드 추가,수정,삭제는 commit()을 해야 처리됨
    cursor.close()
    conn.close()
    print('등록이 완료되었습니다.')

# print('새로운 도서를 등록하세요.')
# book_register()

#도서 레코드를 삭제하는 함수
def delete_book(isbn):
    conn=get_connection()
    sql='delete from book where isbn=%s' % isbn
    cursor=conn.cursor()
    cursor.execute(sql)
    conn.commit()
    print('삭제되었습니다.')
    cursor.close()
    conn.close()

#도서 상세정보를 리턴하는 함수
def detail_book(isbn):
    conn=get_connection()
    cursor=conn.cursor()
    sql='select * from book where isbn=%s' %isbn
    cursor.execute(sql)
    row=cursor.fetchone() #레코드 1개를 읽어서 변수에 저장
    cursor.close()
    conn.close()
    return row

#도서를 수정하는 함수
def update_book(item):
    conn=get_connection()
    sql='''
    update book set title=%s, author=%s, price=%s, publisher=%s,
    pubdate=%s, description=%s where isbn=%s'''
    cursor=conn.cursor()
    cursor.execute(sql,
                   (item[1],item[2],item[3],item[4],item[5],item[6],item[0]))
    conn.commit()
    cursor.close()
    conn.close()
    print('수정되었습니다.')

# isbn=input('수정할 책의 isbn을 입력하세요:')
# title=input('책이름:')
# author=input('저자:')
# price=int(input('가격:'))
# publisher=input('출판사:')
# pubdate=input('출판일자:')
# descriprion=input('설명:')
# item=[isbn,title,author,price,publisher,pubdate,description]
# update_book(item)

isbn=input('보고싶은 책의 isbn을 입력하세요:')
item=detail_book(isbn)
if item:
    print('isbn:',item[0])
    print('책이름:',item[1])
    print('저자:',item[2])
    print('가격:',item[3])
    print('출판사:',item[4])
    print('출판일자:',item[5])
    print('설명:',item[6])
else:
    print('그런 도서가 없습니다.')

isbn=input('수정할 책의 isbn을 입력하세요:')
title=input('책이름:')
author=input('저자:')
price=int(input('가격:'))
publisher=input('출판사:')
pubdate=input('출판일자:')
description=input('설명:')
item=[isbn,title,author,price,publisher,pubdate,description]
update_book(item)

# isbn=input('삭제할 도서의 isbn을 입력하세요:')
# delete_book(isbn)



books=book_list() #도서목록 리스트가 리턴됨
print('도서목록')
for book in books:
    print('{}'.format(book))
