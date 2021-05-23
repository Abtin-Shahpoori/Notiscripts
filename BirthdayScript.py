import tkinter as tk
from tkinter.font import BOLD, Font
from tkinter.ttk import *
root = tk.Tk()
root.title("Happy Birthday")
root['background'] = '#C6EFF1'

# adding the pictures
gif = tk.PhotoImage(file="./clipArts/BirthdayCake.gif")

# Runing the gif
gif_index = 0
def next_frame():
    global gif_index
    try:
        gif.configure(format="gif -index {}".format(gif_index))
        gif_index += 1
    except tk.TclError:
        gif_index = 0
        return next_frame()
    else:
        root.after(100, next_frame)

# open age
f = open(".Age.txt", "r")
age = f.read()

# open name
f = open(".Name.txt", "r")
name = f.read()

Cake = Label(image=gif, borderwidth=0)
Text = Label(text=f"Happy {age}th Birthday {name}" ,font=("Comic Sans MS", 45, "bold"), background="#C6EFF1", foreground="#9C67CB")


# Packing into the screen
Cake.pack()
Text.pack(pady=150)

# Close the window after 10 seconds
root.after(10000, lambda: root.destroy())

root.after_idle(next_frame)
root.mainloop()