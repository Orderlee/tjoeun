#문자열 함수
a = 'hobby'
print(a.count('b')) #'b'의 갯수 세기
print(','.join(a)) #원소 사이에 컴머 삽입

names=['김철수','박순영','홍민수']
#리스트의 각 원소 사이에 컴머를 넣어서 문자열로 저장
# print(','.join(names))
a=','.join(names)
print('join 문자열:',a)
print('리스트로 변환:',a.split(','))

a = 'hobby'
print('대문자로 변환 후 :',a.upper()) #대문자로 전환
print('a:',a)
b=a.upper()
print(b)
print(b.lower()) #소문자로 전환
c='    hi    '
print(c.strip()) #좌우 공백 제거
d='python은 재미있다.'
# replace(A,B) A를 B로 바꾸기
print(d.replace('python','파이썬'))
#문자열을 공백 단위로 나누어 리스트로 저장
e=d.split()
print(e)
a='김철수,전산학과,4학년'
f=a.split(',') #컴머 단위로 나누어 리스트로 저장
print(f)
