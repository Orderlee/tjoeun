import tkinter as tk

root = tk.Tk()
root.title("Tkinter GUI")
root.geometry("240x120")

win1= tk.PanedWindow(root)
win1.pack(fill=tk.BOTH, expand=1)

left = tk.Label(win1, text='left pane', bg='blue')
win1.add(left)

right=tk.Label(win1, text='right pane',bg='red')
win1.add(right)

root.mainloop()