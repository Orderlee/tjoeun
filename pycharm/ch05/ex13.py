#  zip : 요소의 갯수가 같은 리스트의 인덱스별로 묶어주는 함수
names=['김철수','박철호','송영선','황숙희']
kor=[90,100,80,75]
eng=[88,77,66,55]
mat=[77,88,99,100]
a = list(zip(names,kor,eng,mat))
for i in a:
    print(i)