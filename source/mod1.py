def sum(a,b):
    return a+b

def safe_sum(a,b):
    if type(a) != type(b):
        print("자료형이 다르므로 계산할 수 없습니다.")
        return
    else:
        result = sum(a,b)
    return result


print('테스트 문자열')
print('name:',__name__)

if __name__ == "__main__":  #python.exe  모듈이름
    print(sum(3,5))
    print(safe_sum(3,5))
    print(safe_sum(3,'a'))
