from django.db import models

class Survey(models.Model):
    survey_idx = models.AutoField(primary_key=True)
    question = models.TextField(null=False)
    ans1 = models.TextField(null=True)
    ans2 = models.TextField(null=True)
    ans3 = models.TextField(null=True, blank=True)
    ans4 = models.TextField(null=True, blank=True)
    ans5 = models.TextField(null=True, blank=True)
    ans6 = models.TextField(null=True, blank=True)
    ans7 = models.TextField(null=True, blank=True)
    ans8 = models.TextField(null=True, blank=True)
    ans9 = models.TextField(null=True, blank=True)
    ans10 = models.TextField(null=True, blank=True)
    ans11 = models.TextField(null=True, blank=True)
    ans12 = models.TextField(null=True, blank=True)
    ans13 = models.TextField(null=True, blank=True)
    ans14 = models.TextField(null=True, blank=True)
    ans15 = models.TextField(null=True, blank=True)

    status=models.CharField(max_length=1, default='y')

class Answer(models.Model):
    answer_idx = models.AutoField(primary_key=True)
    survey_idx = models.IntegerField()
    num = models.IntegerField()