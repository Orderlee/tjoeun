from django.shortcuts import render
from memo.models import Memo
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_exempt

#http://localhost/memo 메모 목록을 출력하는 함수
def home(request):
    # memo 테이블의 전체 레코드를 idx 필드 내림차순으로 정렬
    memoList=Memo.objects.order_by('-idx')
    #memo 테이블의 레코드 갯수
    memoCount=Memo.objects.all().count()
    # memo/templates/list.html로 이동하여 출력
    return render(request, 'memo/list.html',
                  {'memoList':memoList, 'memoCount':memoCount})


#크로스 사이트 스크립팅 공격을 막기 위한 코드
@csrf_exempt
def insert_memo(request):
    # Memo 클래스의 인스턴스가 만들어짐
    memo=Memo(writer=request.POST['writer'],memo=request.POST['memo'])
    # memo 테이블에 새로운 레코드가 저장됨
    memo.save()
    # http://localhost/memo url로 이동(목록이 갱신됨)
    return redirect('/memo')

def detail_memo(request):
    id=request.GET['idx'] #get 방식으로 전달된 변수 idx의 값
    row=Memo.objects.get(idx=id) #글번호로 레코드를 조회
    # detail.html로 데이터가 전달되고 출력됨
    return render(request,'memo/detail.html',{'row':row})

@csrf_exempt
def update_memo(request):
    id=request.POST['idx'] #수정할 메모 번호
    #수정할 내용을 Memo 객체로 생성
    memo=Memo(idx=id, writer=request.POST['writer'],
              memo=request.POST['memo'])
    #테이블의 레코드를 수정함
    memo.save()
    #메모 목록 함수로 이동
    return redirect('/memo')

@csrf_exempt
def delete_memo(request):
    id=request.POST['idx'] #삭제할 메모 번호
    Memo.objects.get(idx=id).delete() #레코드가 삭제됨
    return redirect('/memo') #메모 목록 함수로 이동










