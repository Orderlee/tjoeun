#음수 제거, filter와 람다식 사용

a=[1,-2,3,-5,8,-3]

def check(x):
    return x>=0

for i in filter(check, a):
    print(i,end=' ')
#filter (함수이름,집합데이터)
# 개별값을 함수에 전달하여 리턴값이 True인 값들만 추출하는 함수

print(list(filter(check,a)))

# lambda 입력값 : 출력값
print(list(filter(lambda x: x>=0,a)))