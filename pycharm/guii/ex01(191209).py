import tkinter as tk

root=tk.Tk() #프레임 생성
root.title('체크박스 테스트') #프레임 타이틀
root.geometry('240x120') #가로,세로 사이즈
ck1=tk.Checkbutton(root, text='music') #체크박스 만들기
ck2=tk.Checkbutton(root, text='video')
ck1.pack() #사이즈를 적절하게 배치
ck2.pack()
root.mainloop() #응용프로그램 시작