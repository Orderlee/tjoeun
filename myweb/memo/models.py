from django.db import models
from datetime import datetime

class Memo(models.Model):
    #자동증가 필드, primary key 필드
    idx=models.AutoField(primary_key=True)
    writer=models.TextField(null=False)
    memo=models.TextField(null=False)
    #작성날짜-기본값: 현재 시간으로 입력
    post_date=models.DateTimeField(default=datetime.now,
                                   blank=True)
