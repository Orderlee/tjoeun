import tkinter as tk
from tkinter import ttk

root = tk.Tk()

root.title("Tkinter GUI")

tabControl = ttk.Notebook(root)
tabControl.grid(column=0, row=0, sticky="NS")

tab1=ttk.Frame(tabControl)
tabControl.add(tab1, text='Color')

tab2=ttk.Frame(tabControl)
tabControl.add(tab2, text='Fruit')

color_frame = ttk.Frame(tab1,padding=20)
color_frame.pack()

button0 = ttk.Button(color_frame, text="Red")
button0.pack(side=tk.LEFT)

button1 = ttk.Button(color_frame, text='Green')
button1.pack(side=tk.LEFT)

button2=ttk.Button(color_frame, text="Blue")
button2.pack(side=tk.LEFT)

fruit_frame = ttk.Frame(tab2,padding =20)
fruit_frame.pack()

button0=ttk.Button(fruit_frame, text='Apple')
button0.pack(side=tk.LEFT)

button1 = ttk.Button(fruit_frame, text='Banana')
button1.pack(side=tk.LEFT)

root.mainloop()