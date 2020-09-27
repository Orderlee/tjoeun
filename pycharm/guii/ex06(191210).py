import tkinter as tk

root=tk.Tk()
root.title('슬라이더') #창의 제목
root.geometry('240x160') #가로,세로 사이즈

#배경색상변경 red,green,blue
def update_value1(a):
    #print(a)
    rgb='#%02x%02x%02x' % (int(a),int(scale2.get()),int(scale3.get()))
    root['bg']=rgb


def update_value2(a):
    rgb='#%02x%02x%02x' % (int(scale1.get()),int(a),int(scale3.get()))
    root['bg'] = rgb

def update_value3(a):
    rgb='#%02x%02x%02x' % (int(scale1.get()),int(scale2.get()),int(a))
    root['bg'] = rgb

var1=tk.DoubleVar()
var2=tk.DoubleVar()
var3=tk.DoubleVar()
#scale=tk.Scale(toot) #슬라이더(세로형)
# 범위 : from_~to, update_value 함수에 var 변수값을 전달
scale1=tk.Scale(root, from_=0, to=255, orient=tk.HORIZONTAL, variable=var1,
                command=update_value1)
scale2=tk.Scale(root, from_=0, to=255, orient=tk.HORIZONTAL, variable=var2,
                command=update_value2)
scale3=tk.Scale(root, from_=0, to=255, orient=tk.HORIZONTAL, variable=var3,
                command=update_value3)
#초기값
scale1.set(255)
scale2.set(255)
scale3.set(255)

scale1.pack(anchor=tk.CENTER)
scale2.pack(anchor=tk.CENTER)
scale3.pack(anchor=tk.CENTER)

root.mainloop()