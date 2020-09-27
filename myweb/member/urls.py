from django.urls import path
from member import views

#회원관리에서 사용할 url pattern 정의
# path(url,function) url을 호출했을 때 실행할 함수를 매핑
urlpatterns=[
    path('',views.home),
    path('join',views.join),
    path('login',views.login_check),
    path('logout',views.logout),

]