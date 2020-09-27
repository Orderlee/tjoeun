from django.conf.urls import url
from memo import views
from django.urls import path

# 메모장에서 사용할 url pattern 틀을 정의함
# path (url, 함수) url과 함수를 매핑하는 코드
urlpatterns=[
    # http://localhost/memo
    path('',views.home),

    #http://localhost/memo/insert_memo
    path('insert_memo',views.insert_memo),

    #http://localhost/memo/detail
    path('detail',views.detail_memo),

    #http://localhost/memo/update_memo
    path('update_memo',views.update_memo),

    #http://localhost/memo/delete_memo
    path('delete_memo',views.delete_memo),
]
