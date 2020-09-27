#1~1000 사이 3,5의 배수의 합계

# def check(a):
#     return a%3 ==0 or a%5==0
#
# result=[]
#
# for i in range(1,1001):
#     if check(i):
#         result.append(i)
#
# print(result)

result=0
for i in range(1,1001):
    if i%3 == 0 or i%5==0:
        result += i

print('합계:{}'.format(result))


def mysum(a):
    result= 0
    for i in range(1, a+1):
        if i %3 ==0 or i%5==0:
            result +=i
    return result

print('합계:{}'.format(mysum(1000)))


def check(n):
    return n%3==0 or n%5==0
# range(1,1001) 1~1000
# filter(check, range(1,1001)) : check 함수에 1~1000 입력
#   리턴값이 True인 값들만 리스트로 저장
# sum(리스트) 리스트의 합계

print('합계:{}'.format(sum(list(filter(check,range(1,1001))))))
#람다식 사용
print('합계:{}'.format(sum(list(filter(lambda n: n%3==0 or n%5==0,range(1,1001))))))

a=[]
i=1
while True:
    if i*3>1000:
        break
    a.append(i*3)
    i += 1

print(a)