# ch05 패키지의 mod1 모듈을 불러옴
# import ch05.mod1
#
# print(ch05.mod1.add(10,20))
#
# print(ch05.mod1.sub(20,10))

# ch05 패키지의 mod1 모듈을 불러옴
# from ch05 import mod1
#
# print(mod1.add(10,20))
#
# print(mod1.sub(20,10))

# ch05 패키지의 mod1 모듈의 모든 함수를 불러움
# from ch05.mod1 import*
# print(add(10,20))
# print(sub(20,10))


from ch05.mod1 import add
print(add(10,20))
print(sub(20,10))