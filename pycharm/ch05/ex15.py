import random
result=[]
for i in range(10):
    result.append(random.randint(1,10))

print(result)
#중복값이 발생하지 않도록 5개의 정수 난수

result=set() #집합 자료형 (중복값을 허용하지 않음)
while len(result)<5:    
    #집합에 추가
    result.add(random.randint(1,10))

print(list(result))