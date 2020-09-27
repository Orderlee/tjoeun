from django.urls import path
from guestbook import views

#방명록에서 사용할 url pattern 정의
# http://localhost/guestbook/
urlpatterns = [
    path('',views.list),
    path('write',views.write),
    path('gb_insert', views.insert),
    path('passwd_check', views.passwd_check),
    path('gb_detail', views.detail),
    path('gb_update', views.update),
    path('gb_delete', views.delete),
]