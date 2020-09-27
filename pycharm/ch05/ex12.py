#1~100 숫자 3의 배수 여부

a= list(range(1,101))
def check(n):
    if n%3==0:
        return n,'3의배수'
    else:
        return n,'3의 배수가 아님'

print(list(map(check,a)))
#람다식으로 표현
# True일대의 값 if 조건식 else False 일때의 값
print(list(map(lambda n: '3의배수' if n%3==0 else '3의배수가 아님',a)))