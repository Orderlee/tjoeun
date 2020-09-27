import tkinter
from tkinter import messagebox as msg #메시지박스 함수 import

root= tkinter.Tk()
root.title('Tkinter GUI')
root.geometry('240x80')

def show():
    #다이얼로그가 화면에 표시됨
    msg.showinfo('정보','안녕하세요')

#버튼을 누르면 show 함수가 호출되도록 설정
button = tkinter.Button(root, text='클릭하세요', command = show)

button.pack()

root.mainloop()
