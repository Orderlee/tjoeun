#딕셔너리
# {key:value}
# key는 중복될 수 없음
# 숫자 인덱스 대신 문자열 key를 사용

m1={'id':'kim','age':20,'tel':'02-999-9999','addr':'서울 강남구'}
print(m1)
print(m1.keys()) #key 목록
print(m1.values()) #values 목록
print(m1.items()) #(key,value) 튜플로 저장된 목록
print(m1['id']) #딕셔너리['key'] -> values
m1['id']='park' #값을 변경
print(m1['id'])
m1['point']=50000 # key 를 추가
print(m1)