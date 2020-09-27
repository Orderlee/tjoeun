import tkinter as tk

def change():
    selection="you selected the option" +str(var.get())
    label.config(text = selection)
    if var.get()==1:
        rdoRed.configure(background='red')
        rdoGreen.configure(background='red')
        rdoBlue.configure(background='red')
        root.configure(background='red')
    elif var.get()==2:
        rdoRed.configure(background='green')
        rdoGreen.configure(background='green')
        rdoBlue.configure(background='green')
        root.configure(background='green')
    elif var.get()==3:
        rdoRed.configure(background='blue')
        rdoGreen.configure(background='blue')
        rdoBlue.configure(background='blue')
        root.configure(background='blue')

root=tk.Tk()
root.title('Tkinter GUI')
root.geometry('240x120')

var=tk.IntVar()
rdoRed=tk.Radiobutton(root,text='Red', variable=var,
                      value=1, command=change)
rdoRed.pack(anchor = tk.W)
rdoGreen = tk.Radiobutton(root,text='green',variable=var,
                          value=2, command=change)
rdoGreen.pack(anchor=tk.W)

rdoBlue = tk.Radiobutton(root,text="blue",variable=var,
                         value=3,command=change)
rdoBlue.pack(anchor =tk.W)

label = tk.Label(root)
label.pack()

root.mainloop()