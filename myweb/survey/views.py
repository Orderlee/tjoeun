from django.shortcuts import render
#모델 클래스 import
from survey.models import Survey, Answer
from django.views.decorators.csrf import csrf_exempt

def main(request):
    # status 필드값이 y인 레코드를 survey_idx 내림차순 정렬
    #  [0] 리스트 중에서 첫번재 레코드만 선택
    survey= Survey.objects.filter(status='y').order_by('-survey_idx')[0]
    #survey/templates/survey/main.html 페이지로 이동
    return render(request, 'survey/main.html',{'survey':survey})

@csrf_exempt
def save_survey(request):
     row=Answer(survey_idx=request.POST['survey_idx'],
                num=request.POST['num'])
     row.save()
     return render(request, 'survey/success.html')

def show_result(request):
    idx=request.GET['survey_idx'] #문제 번호
    ans=Survey.objects.get(survey_idx=idx) #문제 번호에 해당하는 레코드 선택
    answer=[ans.ans1, ans.ans2, ans.ans3, ans.ans4] #문제 내용
    # raw(sql명령어) sql 명령어를 직접 호출하는 함수
    surveyList=Survey.objects.raw('''
select survey_idx,num,count(num) sum_num,
round((select count(*) from survey_answer 
where survey_idx=a.survey_idx and num=a.num)*100.0 /
(select count(*) from survey_answer 
where survey_idx=a.survey_idx),1) rate
from survey_answer a
where survey_idx=%s
group by survey_idx,num
order by num
    ''', idx) # idx 변수에 저장된 값이 %s에 전달됨
    surveyList=zip(surveyList, answer) # % 같은 인덱스끼리 조합
    # 결과 페이지로 이동하여 출력됨
    return render(request, 'survey/result.html',{'surveyList':surveyList})