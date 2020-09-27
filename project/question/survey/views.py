from django.shortcuts import render
from survey.models import Survey, Answer
from django.views.decorators.csrf import csrf_exempt

def main(request):
    survey=Survey.objects.filter(status='y').order_by('survey_idx')
    num=list(range(len(survey)))

    return render(request, 'survey/main.html',{'survey':survey})

@csrf_exempt
def save_survey(request):
    #request.POST.getlist('')
    nums=request.POST.getlist('survey_idx')
    #print('survey_idx:',request.POST.getlist('survey_idx'))
    for num in nums:
        n='num'+str(num)
        print(n)
        # num1, num2
        row=Answer(survey_idx=num, num=request.POST[n])
        row.save()
    return render(request, 'survey/success.html')


def show_result(request):
    idx=request.GET['survey_idx']
    ans=Survey.objects.get(survey_idx=idx['survey_idx'])
    answer=[ans.ans1, ans.ans2, ans.ans3,ans.ans4,ans.ans5,ans.ans6,ans.ans7,ans.ans8,
            ans.ans9,ans.ans10,ans.ans11,ans.ans12,ans.ans13,ans.ans14,ans.ans15]
    surveyList=Survey.objects.raw('''
    select survey_idx,num,count(num) sum_num,
    round((select count(*) from survey_answer
    where survey_idx=a.survey_idx and num=a.num)*100.0 /
    (select count(*) from survey_answer where survey_idx=a.survey_idx),1) rate
    from survey_answer a
    where survey_idx=%s
    group by survey_idx,num
    order by num 
    ''', idx)
    surveyList=zip(surveyList, answer)
    return render(request, 'survey/result.html',{'surveyList':surveyList})


