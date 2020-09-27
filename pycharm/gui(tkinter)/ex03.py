import tkinter as tk

root = tk.Tk()
root.title("Tkinter GUI")
root.geometry("240x100")
root.resizable(False,False)

button=tk.Button(root, text='Hello', width=30, height=5)
button.pack()

root.mainloop()