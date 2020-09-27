from django.contrib import admin
from survey.models import Survey, Answer

class SurveyAdmin(admin.ModelAdmin):
    #관리자 페이지에서 사용할 필드 정의
    list_display=('question','ans1','ans2','ans3','ans4','status')

#관리자 페이지에 등록
admin.site.register(Survey, SurveyAdmin)
admin.site.register(Answer)
