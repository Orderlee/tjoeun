#1~1000 3의 배수의 합계, while 사용

n=int(input('숫자를 입력하세요:'))
result=0
i=0
while i <n: #조건식이 True일 동안 반복 처리
    i=i+1
    if i % 3 == 0:
        result=result+i #합계를 누적
print('{}부터 {}까지 3의 배수 합계={}'.format(1,n,result))

