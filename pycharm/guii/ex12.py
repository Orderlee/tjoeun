from tkinter import*
import tkinter.messagebox

main=Tk()

def quit():
    main.destroy() #현재 폼(프레임)을 메모리에서 언로드
    exit() #프로그램 강제 종료

def btnclick():
    if tkinter.messagebox.askyesno('질문','종료할까요?'): #질문 대화상자
        tkinter.messagebox.showwarning('종료','프로그램을 종료합니다.') #경고 대화상자
        quit()
    else:
        tkinter.messagebox.showinfo('계속','프로그램을 계속 실행합니다.') #단순 정보 대화상자

btn = Button(main, text='클릭하세요', foreground='Blue',background='yellow',command=btnclick)
btn.pack()

main.mainloop()
