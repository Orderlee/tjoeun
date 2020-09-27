a = '파이썬은 '
b = '쉽다'
print(a+b) #문자열 연결
#연산자 오버로딩
print(a,b) #공백이 추가됨
print(a*5) # 문자열 5회 반복
c = a+b #문자열 연결 결과를 c에 할당
print(c)
print(len(c)) #글자수
#숫자 + 문자열 =>에러
a='hello'
b=100
# print(a+b)
# str(숫자) 숫자를 문자열로 변환
print(a+str(b))
a=100
b='200'
# print(a+b)
# int(문자열) 문자열을 숫자로 변환
print(a+int(b))

