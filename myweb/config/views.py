from django.shortcuts import render

# http://localhost => home 함수 호출
# request : 사용자가 입력한 내용, 요청사항을 저장하고 있는 변수
def home(request):
    # index.html 페이지로 넘가서 출력됨
    name='지송팍'
    msg='안녕하세요'

    dan=3
    result=''
    for i in range(1,10):
        result+='{}x{}={}\n'.format(dan,i,dan*i)

    try:
        userid=request.session['userid']
    except:
        userid='guest'


# render(request객체, url, 전달할데이터)
    return render(request,'index.html',
                  {'userid':userid, 'name':name,'msg':msg,'result':result})