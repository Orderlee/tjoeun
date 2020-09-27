#짝수,홀수 판별
a=13
# a를 2로 나눈 나머지값이 0 이면
if a%2==0:
    print('짝수')
else:
    print('홀수')

#함수 이름: mynum
#입력값 : 숫자
#리턴값 : 짝수 / 홀수
def mynum(a):
    if a%2 ==0:
        return str(a)+'==> 짝수입니다.'
    else:
        return str(a)+'==> 홀수입니다.'

print(mynum(10))
print(mynum(33))