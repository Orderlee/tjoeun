from django.db import models
from datetime import datetime

class Guestbook(models.Model):
    #자동증가 일련번호
    idx=models.AutoField(primary_key=True)
    # max length 최대 바이트수
    name = models.CharField(null=False, max_length=50)
    email = models.CharField(null=False, max_length=50)
    passwd = models.CharField(null=False, max_length=50)
    # TExtField 대용량 텍스트
    content = models.TextField(null=False)
    # 현재 날짜로 자동 입력
    post_date = models.DateTimeField(default=datetime.now,
                                     blank=True)
