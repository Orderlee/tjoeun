from django.shortcuts import render
from guestbook.models import Guestbook
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import redirect
from django.db.models import Q

def list(request):

    try:
        searchkey=request.POST['searchkey']
    except:
        searchkey='name'

    try:
        search=request.POST['search']
    except:
        search=''
    print('검색옵션:{}, 검색키워드:{}'.format(searchkey,search))
    try:
        msg=request.GET['msg'] #비번을 잘못 입력했을 때 전달하는 변수
    except:
        msg=''

    #idx 내림차순으로 정렬한 방명록 리스트
    #gbList=Guestbook.objects.order_by('-idx')

    if searchkey=='name_content':
        gbList=Guestbook.objects.filter(\
                Q(name__contains=search) | Q(content__contains=search)).order_by('-idx')
    elif searchkey=='name':
        gbList=Guestbook.objects.filter(\
                Q(name__contains=search)).order_by('-idx')
    elif searchkey=='content':
        gbList = Guestbook.objects.filter(\
                Q(content__contains=search)).order_by('-idx')

    # 레코드 갯수
    #gbCount=Guestbook.objects.count()
    if searchkey=='name_content':
        gbCount=Guestbook.objects.filter(\
                Q(name__contains=search) | Q(content__contains=search)).count()
    elif searchkey=='name':
        gbCount=Guestbook.objects.filter(\
                Q(name__contains=search)).count()
    elif searchkey=='content':
        gbCount=Guestbook.objects.filter(\
                Q(content__contains=search)).count()

    # guestbook/templates/guestbook/list.html로 이동
    return render(request, 'guestbook/list.html',
                  {'gbList':gbList, 'gbCount':gbCount, 'msg':msg,
                   'searchkey':searchkey, 'search':search})
def write(request):
    return render(request, 'guestbook/write.html')

@csrf_exempt
def insert(request):
    #사용자가 입력한 내용으로 Guestbook 인스턴스를 생성
    row=Guestbook(name=request.POST['name'],
                  email=request.POST['email'],
                  passwd=request.POST['passwd'],
                  content=request.POST['content'])
    #방명록 테이블에 레코드가 추가됨
    row.save()
    # http://localhost/guestbook 으로 이동, list() 함수가 다시 호출됨
    return redirect('/guestbook')

@csrf_exempt
def passwd_check(request):
    id=request.POST['idx'] #글번호
    pwd=request.POST['passwd'] #입력한 비밀번호
    #글번호에 해당하는 레코드를 조회
    row=Guestbook.objects.get(idx=id)

    if row.passwd==pwd: #비밀번호가 맞으면 수정 페이지로 이동
        return render(request, 'guestbook/edit.html',{'row':row})
    else: #비밀번호가 틀리면 되돌아감
        return redirect('/guestbook/?msg=error')

def detail(request):
    pass

@csrf_exempt
def update(request):
    id=request.POST['idx']
    row=Guestbook(idx=id, name=request.POST['name'],
                  email=request.POST['email'],
                  passwd=request.POST['passwd'],
                  content=request.POST['content'])
    row.save() #레코드가 저장됨
    return redirect('/guestbook')
@csrf_exempt
def delete(request):
    id=request.POST['idx'] #삭제할 글번호
    Guestbook.objects.get(idx=id).delete() #레코드를 삭제함
    return redirect('/guestbook') #글목록으로 이동