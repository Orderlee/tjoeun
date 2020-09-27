#리스트 내포 :  리스트 내부에 for문을 사용한 문장
a=[1,2,3,4]
#리스트의 각 요소의 값에 3을 곱한 결과 리스트
#result=[num*3 for num in a]
result=[]
for num in a:
    result.append(num*3)

print(result)

#리스트의 각 요소 중에서 짝수의 값에 3을 곱한 결과 리스트
# result=[num*3 for num in a if num%2 ==0]
result=[]
for num in a:
    if num %2 ==0: #2로 나눈 나머지가 0 => 짝수
        result.append(num*3)
print(result)