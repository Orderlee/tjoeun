import tkinter as tk

root=tk.Tk()
root.title("Tkinter GUI")

scrollbar = tk.Scrollbar(root)
scrollbar.pack(side = tk.RIGHT, fill=tk.Y)

listbox = tk.Listbox(root,yscrollcommand = scrollbar.set)
for line in range(100):
    listbox.insert(tk.END, "This is line number" +str(line))

listbox.pack(side = tk.LEFT, fill=tk.BOTH)

scrollbar.config(command = listbox.yview)

root.mainloop()