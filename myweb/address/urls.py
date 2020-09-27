from address import views
from django.urls import path
from django.conf import settings

# 앱에서 사용할 url pattern을 정의하는 모듈
# path(url,method) url을 호출했을 때 실행할 함수 연결
urlpatterns= [
    # http://localhost/address => views.py home()
    path('',views.home),
    # http://localhost/address/write => views.py write()
    path('write',views.write),
    # http://localhost/address/insert => views.py insert()
    path('insert',views.insert),
    path('detail',views.detail),
    path('update',views.update),
    path('delete',views.delete),

]
