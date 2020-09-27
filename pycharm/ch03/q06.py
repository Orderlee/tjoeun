numbers = [1,2,3,4,5]
#홀수에만 2를 곱하여 저장
result=[]
for n in numbers:
    if n %2 ==1:
        result.append(n*2)
print(result)

#리스트 속에 반복문,조건문이 포함된 코드
result= [n*2 for n in numbers if n % 2 ==1]
print(result)