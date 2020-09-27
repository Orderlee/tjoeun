points=[100,80,57,44,61,79,59,65]

def check(p):
    # 60이상이면 True, 아니면 False
    return p>=60

result=[]
for point in points:
    if check(point)==True: # True인 값들만 리스트에 추가
        result.append(point)

print(result)


print(list(filter(check,points)))