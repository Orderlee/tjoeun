# with open('파일,'모드') as 파일참조변수
with open('d:/data/abc.txt') as f:
    #전체라인을 읽어서 리스트로 저장
    lines=f.readlines()

print(lines)
#리스트의 내용을 역순으로 저장
lines.reverse()
print(lines)

with open('d:/data/abc.txt', 'w') as f:
    for line in lines:
        #strip() 문자열 좌우 공백,탭,개행문자 제거
        f.write(line.strip()+'\n')

print('완료되었습니다.')
