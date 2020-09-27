#오존량 평균값 구하기, 평균 이상인 값들만 저장
with open('d:/data/ozone/ozone.csv') as f:
    lines=f.readlines() #라인별로 리스트로 저장
    total=0 #합계를 저장할 변수
    cnt=0 #NA가 아닌 샘플수를 저장할 변수
    result=[]
    for line in lines[1:]: #첫행은 건너뜀
        row = line.split(',') #컴머로 구분하여 리스트로 저장
        if row[0]=='NA': #값이 NA이면 skip
            continue
        else:
            result.append(int(row[0]))
            total += int(row[0]) #숫자로 바꿔서 합산
            cnt += 1 #카운트 증가 처리


average=total/cnt
print('샘플수:',cnt)
print('합계:',total)
print('평균:',average)
print(result)


def check(a):
    return a>=average


print(list(filter(check,result)))
#람다식으로 표현
print(list(filter(lambda a: a>=average,result)))