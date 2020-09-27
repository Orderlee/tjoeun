from django.shortcuts import render
from member.models import UserForm, LoginForm
from django.contrib.auth.models import User
from django.contrib.auth import login as dlogin, logout as dlogout
from django.shortcuts import redirect





def home(request):
    if not request.user.is_authenticated: #로그인하지 않은 상태
        data={'username':request.user,
              'is_authenticated':request.user.is_authenticated}
    else: #로그인한 상태
        data={'last_login':request.user.last_login,
              'username':request.user.username,
              'password':request.user.password,
              'is_authenticated':request.user.is_authenticated}
    return render(request, 'member/index.html',{'data':data})



def join(request):
    if request.method =='POST': #post 방식이면
        form=UserForm(request.POST) #사용자가 입력한 폼
        if form.is_valid(): #입력값에 문제가 없으면
            #새로운 사용자 계정을 생성
            new_user=User.objects.create_user(**form.cleaned_data)
            dlogin(request,new_user) # 로그인 처리
            return redirect('/member') #member/index.html로 이동
        else:
            return render(request,'member/index.html',
                          {'msg':'회원가입 실패... 다시 시도해 보세요.'})
    else:
        form=UserForm() #회원가입폼 객체
        # join.html로 넘겨서 출력
        return render(request,'member/join.html',{'form':form})
    return render(request,'member/index.html')

from django.contrib.auth import authenticate

from django.views.decorators.csrf import csrf_exempt
@csrf_exempt

def login_check(request):
    if request.method == 'POST': #POST 방식이면
        #form=LoginForm(request.POST) #양식이 채워진 폼
        name=request.POST['username'] #아이디
        pwd=request.POST['password'] #패스워드
        user=authenticate(username=name, password=pwd) #인증
        if user is not None: #인증 성공
            dlogin(request, user) #장고 내장 로그인 함수
            request.session['userid']=name #세션변수에 저장(모든 페이지에서 사용가능)
            return redirect('/member/') #member 메인 페이지로 이동
        else: #인증 실패
            return render(request, 'member/index.html',
                          {'msg':'로그인 실패... 다시 시도해 보세요.'})
    else:
        form=LoginForm() #비어있는 폼
        return render(request, 'member/login.html',{'form':form})

def logout(request):
    dlogout(request) #로그아웃 처리 (장고 내장함수)
    return redirect('/member') # http://localhost/member 로 이동
