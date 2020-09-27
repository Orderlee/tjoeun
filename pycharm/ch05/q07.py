a=[-8,2,7,5,-3,5,0,1]

m1 = max(a)
m2 = min(a)

print(m1)
print(m2)
print(m1+m2)

def mymax(a):
    result=a[0] #리스트의 첫번째값을 임시 최대값으로 설정
    #인덱스 1번부터 끝까지 검사
    for i in range(1,len(a)):
        if a[i] > result: #현재 사이클의 값이 더 크면
            result =a[i] #최대값 변경
    return result

print('최대값:', mymax(a))

def mymin(a):
    result=a[0]
    for i in range(1,len(a)):
        if a[i] <  result:
            result = a[i]
    return result

print('최솟값:',mymin(a))

print('최대값+최솟값:', mymax(a)+mymin(a))