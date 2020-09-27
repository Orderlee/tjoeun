a=[1,2,3,4]
#map 과 lambda 이용하여 [3,6,9,12]

def check(x):
    return x*3

# map(함수이름, 집합데이터)
# 각 요소를 함수에 입력하여 리턴되는 값들을 리스트로 저장
print(list(map(check,a)))

# 함수 대신 람다식 사용
# lambda 입력값 : 출력값
print(list(map(lambda x: x*3,a)))


