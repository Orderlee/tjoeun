#예외처리

a=[1,2,3,4,5]
try: #예외가 발생할 가능성이 있는 코드
    print(a[5])
except IndexError as e : #예외가 발생했을 때 처리할 코드 (Exception 사용해도 됨)
    print('예외 발생...',e)
finally: #항상 실행되는 코드
    print('try절 종료')

print('종료')

