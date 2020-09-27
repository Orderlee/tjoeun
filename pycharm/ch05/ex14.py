import random

for i in range(10):
    #실수형 난수: 0.0~1.0 미만인 값
    print(random.random(),end='')
    #정수형 난수 randint(start,end)
    print(random.randint(1,10),end='')
    print(random.randint(10,30))

result=[]
for i in range(10):
    result.append(random.randint(1,10))

print(result)
#무작위로 섞음
random.shuffle(result)
print(result)
#리스트 중에서 임의의 값을 선택
print(random.choice(result))