from django.urls import path
from survey import views

urlpatterns=[
    # http://localhost/survey 설문조사 메인 페이지
    path('',views.main),
    # http://localhost/survey/save_survey 설문응답 저장
    path('save_survey', views.save_survey),
    # http://localhost/survey/show_result 설문결과 화면
    path('show_result',views.show_result),
]