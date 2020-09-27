from django.contrib import admin
from survey.models import Survey, Answer

class SurveyAdmin(admin.ModelAdmin):
    list_display=('question','ans1','ans2','ans3','ans4','ans5','ans6',
                  'ans7','ans8','ans9','ans10','ans11','ans12','ans13',
                  'ans14','ans15','status')


admin.site.register(Survey, SurveyAdmin)
admin.site.register(Answer)

