from django import forms
from django.contrib.auth.models import User

# ModelForm : 웹폼을 만들어주는 클래스
# Meta : 클래스를 만드는 클래스
# User : 장고에서 지원하는 사용자 클래스
# 회원가입폼 클래스

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username','email','password']
#로그인폼 클래스
class LoginForm(forms.ModelForm):
    class Meta:
        model=User
        fields=['username','password']