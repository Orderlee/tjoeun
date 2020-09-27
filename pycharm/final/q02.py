#딕셔너리 {} 중괄호
# {key:value}
a={'A':90,'B':80}
print(a['A'],a.get('A'))
print(a['B'],a.get('B'))
#키가 존재하지 않으면 에러 발생
# print(a['C'])
#딕셔너리.get(key,default)
#key가 없을 때 출력할 기본값
print(a.get('C'))
print(a.get('C',70))
