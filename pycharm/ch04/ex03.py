n = 100
result = 0
for i in range(1, n + 1):
    result = result + i

print('합계:', result)


def mysum(n):
    result=0
    for i in range(1,n+1):
        result=result+i
    #함수를 호출한 곳으로 리턴값을 되돌려줌
    return result
#함수를 실행하고 리턴갑승ㄹ 받아서 화면에 출력함
print(mysum(100))
print(mysum(1000))