#인덱싱 : 문자의 위치 탐색
#슬라이싱 : 부분적인 내용을 잘라냄

a= 'Life is too short'
print(a)
print(len(a)) #글자수
print(a[0]) #첫번째 글자
print(a[-0]) #첫번째 글자
print(a[5])
# print(a[17])
print(a[-1]) #오른쪽에서 첫번째 글자

# [start:stop:step(간격)]
print(a[0:3]) #0~2
print(a[0:3:1]) #0~2
print(a[0:3:2]) #0,2 (step 2)
print(a[:3]) #0~2
print(a[2:5]) #2~4
print(a[3:]) #3~끝까지
print(a[:]) #처음부터 끝까지
print(a[::2]) #처음부터 끝까지, 스텝2
