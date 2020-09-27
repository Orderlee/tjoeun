import tkinter as tk

root=tk.Tk()
root.title('리스트 박스')
root.geometry('240x180') #가로,세로 사이즈
#리스트박스 생성, MULTIPLE 다중선택 옵션
listbox=tk.Listbox(root,selectmode=tk.MULTIPLE)
listbox.insert(1, "Python") #index, value
listbox.insert(2, "MySQL")
listbox.insert(3, "C")
listbox.insert(4, "R")
listbox.insert(5, "JAVA")
listbox.insert(6, "Hadoop")

listbox.pack() #알맞게 배치
root.mainloop() #응용프로그램 시작