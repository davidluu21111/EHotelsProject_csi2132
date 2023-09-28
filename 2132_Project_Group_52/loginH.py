import tkinter as tk
from tkinter import *

from tkinter import messagebox

def login():
    if usernameEntry.get() == "admin" and passwordEntry.get() == "admin":
        messagebox.showinfo("Login", "Login Successful")
        window.destroy()
        import hotelChain
    else:
        messagebox.showinfo("Login", "Error! Invalid Username or Password")
       

window = Tk()
window.title("Login Page")
window.geometry("1280x700+0+0")
window.resizable(False, False)


loginFrame = Frame(window, bg="white")
loginFrame.place(x=400, y=150)


usernameLabel=Label(loginFrame,text='Username',font=('Arial',20,'bold'),fg='black')
usernameLabel.grid(row=1,column=0,pady=10,padx=20)
usernameEntry=Entry(loginFrame,font=('Arial',20,'bold'),bd=5,fg='royalblue')
usernameEntry.grid(row=1,column=1,pady=10,padx=20)

passwordLabel=Label(loginFrame,text='Password',font=('Arial',20,'bold'),fg='black')
passwordLabel.grid(row=2,column=0,pady=10,padx=20)
passwordEntry=Entry(loginFrame,font=('Arial',20,'bold'),bd=5,fg='royalblue')
passwordEntry.grid(row=2,column=1,pady=10,padx=20)

loginButton=Button(loginFrame,text='Login',font=('Arial',14,'bold'),width=15
                   ,fg='grey',bg='cornflowerblue',activebackground='cornflowerblue',
                   activeforeground='black',cursor='hand2',command=login)
loginButton.grid(row=3,column=1,pady=10)





window.mainloop()