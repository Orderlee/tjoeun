#집합 set()
#중복값을 허용하지 않고 순서대로 저장되지 않음
s1=set([1,2,3,4,51,2,3])
print(s1)
print(type(s1))
s2=set([3,4,5,6,])
print(s2)
print(s1 | s2) #합집합
print(s1.union(s2)) #합집합(중복값은 제거됨)

print(s1-s2) #차집합
print(s1.difference(s2))

print(s1 & s2) #교집합
print(s1.intersection((s2)))