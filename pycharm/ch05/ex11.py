a = [90,89,79,59,45,77,99,30]

def check(n):
    if n>=60:
        return n,'합격'
    else:
        return n,'불합격'

# map(함수이름,컨테이너) 함수가 여러번 호출되고 결과값을 리스트로 저장
print(list(map(check,a)))
#람다식으로 작성
print(list(map(lambda n : (n,'합격') if n>=60 else (n,'불합격'),a)))