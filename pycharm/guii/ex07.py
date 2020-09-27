import tkinter as tk

root=tk.Tk()
root.title('스크롤바')

scrollbar= tk.Scrollbar(root) #스크롤바
scrollbar.pack(side=tk.RIGHT, fill=tk.Y,) #오른쪽 배치

#리스트박스와 스크롤바 연결
listbox=tk.Listbox(root,yscrollcommand = scrollbar.set) #리스트 박스
for line in range(100):
    # tk.END 리스트의 마지막에 삽입
    listbox.insert(tk.END, '라인'+str(line))

listbox.pack(side=tk.LEFT, fill=tk.BOTH)
#리스트박스의 아이템 위치와 스크롤바 연결
scrollbar['command']=listbox.yview
root.mainloop()
