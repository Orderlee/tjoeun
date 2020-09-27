# 1~100 숫자 중에서 3의 배수 또는 5의 배수 출력

# def check(a):
#     return a%3==0 and a%5==0 #a를 3 또는 5로 나눈 나머지값이 0 이면 True, 아니면 False 리턴

# 람다식 : 함수이름 = lambda input: output
check = lambda a: a%3==0 and a%5==0

# result=[]
# for i in range(1,101):
#     if check(i): #함수의 리턴값이 True이면 결과 리스트에 추가
#         result.append(i)
#
# print(result)

print(list(filter(check,range(1,101))))
print(list(filter(lambda a: a%3==0 and a%5==0, range(1,101))))