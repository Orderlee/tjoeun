from django.contrib import admin
from board.models import Board

class BoardAdmin(admin.ModelAdmin):
    #관리자 화면에 표시할 필드 선언
    list_display = ('writer','title','content')

# Board Class와 BoardAdmin class를 매핑시키는 작업
admin.site.register(Board, BoardAdmin)
