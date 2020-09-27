from django.shortcuts import render

def home(request):
    return render(request,'survey/index.html')