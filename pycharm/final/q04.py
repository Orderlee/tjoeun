a=[20,55,67,82,45,33,90,87,100,25]

result=0
for i in a:
    if i >= 50:
        result += i

print('합계:{}'.format(result))

#위 코드를 함수로 작성
def mysum(x):
    result=0
    for i in x:
        if i >=50:
            result +=i
    return result

print('합계:{}'.format(mysum(a)))

#filter를 이용하여 처리
def check(i):
    return i>=50
# check 함수에 리스트 a의 개별값들을 전달하여
# 리턴값이 True인 값들만 리스트로 저장하고 합계 계산
print('합계:{}'.format(sum(list(filter(check, a)))))