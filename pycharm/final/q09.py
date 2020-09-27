with open('d:/data/sample.txt') as f:
    lines=f.readlines() #전체 내용을 읽어서 리스트로 저장

#숫자로 변환후 합산하여 d:/data/result.txt에 저장
result=0
for line in lines:
    score = int(line) #숫자로 바꿔서 합산
    result +=score

average = result/len(lines)
#쓰기전용 모드로 파일 오픈
with open('d:/data/result.txt','w') as f:
    #파일에 내용을 기록
    f.write(str(average)) #숫자를 스트링으로 변환

print('완료되었습니다.')