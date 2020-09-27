import tkinter as tk

root = tk.Tk()
root.title('Tkinter GUI')
root.geometry('240x120')

frame = tk.Frame(root, background='blue')
frame.pack()

btnRed=tk.Button(frame,text='red',fg='red')
btnRed.pack(side=tk.LEFT)

btnBrown=tk.Button(frame,text='Brown',fg='brown')
btnBrown.pack(side=tk.LEFT)

btnBlue=tk.Button(frame,text="Blue",fg="blue")
btnBlue.pack(side=tk.LEFT)

root.mainloop()