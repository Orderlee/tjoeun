import math
import os
from django.shortcuts import render
from board.models import Board
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import redirect
from django.db.models import Q
UPLOAD_DIR = 'd:/upload/'




#게시물 목록
@csrf_exempt
def list(request):
    #검색옵션과 검색키워드
    try:
        search_option=request.POST['search_option']
    except:
        search_option='writer'

    try:
        search=request.POST['search']
    except:
        search=''
    print('검색옵션:',search_option)
    print('검색키워드:',search)

    boardCount = Board.objects.count()  # 레코드 갯수

    # 페이지 나누기 코드
    try:
        start = int(request.GET['start'])
    except:
        start = 0

    page_size = 10  # 한 페이지에 표시할 게시물수
    page_list_size = 10  # 한 화면에 표시할 페이지수
    end =start+page_size
    total_page = math.ceil(boardCount / page_size)  # 전체 페이지 갯수, 올림 함수
    current_page = math.ceil((start + 1) / page_size)  # 현재 페이지 번호
    start_page = math.floor((current_page - 1) /
                            page_list_size) * page_list_size + 1  # 시작페이지

    end_page = start_page + page_list_size - 1  # 끝페이지
    if total_page < end_page:
        end_page = total_page
    if start_page >= page_list_size:  # 이전 페이지
        prev_list = (start_page - 2) * page_size
    else:
        prev_list = 0
    if total_page > end_page:  # 다음 페이지
        next_list = end_page * page_size
    else:
        next_list = 0

    # boardList=Board.objects.order_by('-idx') #글번호 내림차순 리스트
    if search_option == 'all': #이름+제목+내용으로 검색
        boardList=Board.objects.filter(Q(writer__contains=search)|Q(title__contains=search)
                                       | Q(content__contains=search)).order_by('-idx')[start:end]
    elif search_option == 'writer': #이름으로 검색
        boardList=Board.objects.filter(Q(writer__contains=search)).order_by('-idx')[start:end]
    elif search_option == 'title': #제목으로 검색
        boardList = Board.objects.filter(Q(title__contains=search)).order_by('-idx')[start:end]
    elif search_option == 'content': #내용으로 검색
        boardList = Board.objects.filter(Q(content__contains=search)).order_by('-idx')[start:end]

    #페이지 나누기 링크
    links=[]
    for i in range(start_page, end_page + 1):
        page=(i-1) * page_size
        links.append("<a href='?start="+str(page)+"'>"+str(i)+"</a>")

    # board/templates/list.html로 이동하여 출력
    return render(request, 'list.html',
                  {'boardList':boardList, 'boardCount':len(boardList),
                   'search_option': search_option, 'search': search,
                   'range':range(start_page - 1, end_page),
                   'start_page':start_page,'end_page':end_page,'page_list_size':page_list_size,
                   'total_page':total_page,'prev_list':prev_list,
                   'next_list':next_list, 'links':links})


#글쓰기 페이지로 이동
def write(request):
    return render(request,'write.html')



@csrf_exempt
def insert(request):
    fname="" #첨부파일 이동
    fsize=0 #첨부파일 크기
    if "file" in request.FILES:
        file=request.FILES['file'] #첨부파일이 있으면
        fname=file._name #첨부파일의 이름
        with open('%s%s' % (UPLOAD_DIR, fname), 'wb') as fp:
            for chunk in file.chunks(): #파일 조각들
                fp.write(chunk) #저장
        fsize=os.path.getsize(UPLOAD_DIR + fname) #파일의 크기 계산
    row=Board(writer=request.POST['writer'],title=request.POST['title'],
              content=request.POST['content'],filename=fname, filesize=fsize)
    row.save() #레코드 저장
    return redirect('/') #목록으로 이동

def detail(request):
    id=request.GET['idx'] #글번호
    row=Board.objects.get(idx=id) #레코드 조회
    row.hit_up() #조회수 증가 처리
    row.save() #조회수 증가 업데이트 처리
    filesize='%.2f' % (row.filesize / 1024) #첨부파일의 사이즈
    #댓글 목록
    commentList=Comment.objects.filter(board_idx=id).order_by('idx')
    # detail.html 페이지로 이동하여 출력
    return render(request, 'detail.html',{'row':row, 'filesize':filesize,
                                          'commentList':commentList})

@csrf_exempt
def update(request):
    id=request.POST['idx'] #수정할 글번호
    row_src=Board.objects.get(idx=id) #수정할 레코드 조회
    fname=row_src.filename #수정 전의 첨부파일 이름
    fsize=row_src.filesize #수정 전의 첨부파일 사이즈
    hit=row_src.hit #수정전의 조회수
    down=row_src.down #수정 전의 다운로드 횟수
    if "file" in request.FILES:
        file = request.FILES['file']  # 첨부파일이 있으면
        fname = file._name  # 새로운 첨부파일으 ㅣ이름
        with open('%s%s' % (UPLOAD_DIR, fname), 'wb') as fp:
            for chunk in file.chunks():  # 파일 조각들
                fp.write(chunk)  # 파일 저장
        fsize = os.path.getsize(UPLOAD_DIR + fname)  # 파일의 크기 계산

    row_new=Board(idx=id, writer=request.POST['writer'],
                  title=request.POST['title'],content=request.POST['content'],
                  filename=fname, filesize=fsize, hit=hit, down=down)
    row_new.save()  # 레코드 저장
    return redirect('/')  # 목록으로 이동

@csrf_exempt
def delete(request):
    id=request.POST['idx'] #삭제할 글번호
    Board.objects.get(idx=id).delete() #레코드 삭제
    return redirect('/') #목록으로 이동

from django.utils.http import urlquote
from django.http import HttpResponse

def download(request):
    id=request.GET['idx'] #글번호
    row=Board.objects.get(idx=id) #레코드 조회
    path=UPLOAD_DIR + row.filename #다운로드할 파일이름
    filename=os.path.basename(path) #디렉토리를 제외한 파일 이름
    filename=urlquote(filename) #한글/특수문자 인코딩 처리
    with open(path, 'rb') as file:
        #서버의 파일을 읽음, content_type 파일의 종류
        response=HttpResponse(file.read(),content_type='application/octet-stream')
        response['Content-Disposition']=\
        "attchment;filename*=UTF-8''{0}".format(filename) #첨부파일 정보
        row.down_up() #다운로드 횟수 증가 처리
        row.save() #다운로드 횟수가 1증가 됨
        return response #서버의 파일이 클라이언트로 전달됨

from board.models import Comment
from django.http import HttpResponseRedirect

@csrf_exempt
def reply_insert(request):
    id=request.POST['idx'] #댓글을 추가할 게시물 번호
    #댓글 내용
    row=Comment(board_idx=id, writer=request.POST['writer'],
                content=request.POST['content'])
    row.save() #댓글 저장
    #상세 화면으로 이동
    return HttpResponseRedirect('detail?idx='+id)
