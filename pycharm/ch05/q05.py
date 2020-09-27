#진법 변환
# 0xea => 10진수로
# int(숫자,진법)
# 0x 16진수
# 0o 8진수
print(int('0xea',16))
print(int('0o10',8))
print(int('1111',2))
print('%o %x %d' % (20,20,20))
# %o 8진수 %x 16진수 %d 10진수
print('{:b} {:o} {:x} {:d}'.format(20,20,20,20))
print(bin(42)) # 2진수로
print(oct(42)) # 8진수로
print(hex(42)) # 16진수로