# with 절이 종료되면 파일참조변수가 가리키는 리소스가 자동으로 정리됨
with open('d:/data/test.txt','r',encoding='utf-8') as f2:
    lines = f2.readlines()  # 라인별로 리스트로 저장
    print(lines)
    for line in lines:
        print(line, end='')

# with open('d:/data/test.txt','r',encoding='utf-8') as f2:
#     lines = f2.readlines()  # 라인별로 리스트로 저장
#     result=[]
#     for row in lines:
#         row=row.replace('\n','') #공백,탭,개행문자 제거
#         result.append(result)
#
#     for line in result:
#         print(line)