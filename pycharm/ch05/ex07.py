# filter

# def positive(l):
#     result = [] #결과를 저장할 리스트
#     for i in l:
#         if i>0: #양수만 리스트에 저장
#             result.append(i)
#     return result #결과리스트를 리턴
#
#
nums=[1,2,-3,4,-5,6,-7]
# print(positive([1,-3,2,4,-5,6,-7]))

def positive(x):
    return x>0

result=[]
for i in nums:
    if positive(i) == True:
        result.append(i)
    # print(positive(i))
print(result)

#filter (함수이름, 입력값), 리턴값이 True인 값들만 리스트로 만들어주는 함수
print(list(filter(positive,nums)))