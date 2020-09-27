# two_times.py
def two_times(numberList):
    result=[]
    for number in numberList:
        result.append(number*2)
    return result

result = two_times([1,2,3,4,5])
print(result)

def two_times(x):
    return x*2
# map(함수이름, 리스트)
# 리스트의 각 요소를 함수에 입력한 결과값들을 리턴
print(list(map(two_times,[1,2,3,4,5])))
#람다식으로 표현
print(list(map(lambda x: x*2, [1,2,3,4,5])))