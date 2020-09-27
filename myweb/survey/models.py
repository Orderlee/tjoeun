from django.db import models

class Survey(models.Model):
    # 설문 문항 코드
    survey_idx = models.AutoField(primary_key=True)

    # 문제 (여러줄 입력시 TextField)
    question = models.TextField(null=False)
    #답1~4
    ans1=models.TextField(null=True)
    ans2=models.TextField(null=True)
    ans3=models.TextField(null=True)
    ans4=models.TextField(null=True)



    #진행상태 (한 줄 입력시 CharField)
    status=models.CharField(max_length=1, default='y')

class Answer(models.Model):
    #응답일련번호
    answer_idx=models.AutoField(primary_key=True)
    #설문문항 코드
    survey_idx=models.IntegerField()
    num=models.IntegerField()

