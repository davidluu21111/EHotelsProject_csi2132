from datetime import date
from threading import currentThread
import tkinter as tk
from tkinter import *
import time
import ttkthemes
from tkinter import ttk,messagebox,filedialog
import pymysql
import pandas

#implement functionality

def iExit():
    iExit = messagebox.askyesno("Hotel Management System", "Confirm if you want to exit")
    if iExit > 0:
        root.destroy()
    else: 
        pass 


def toplevel_data(title,button_text,command):
    global idEntry,phoneEntry,nameEntry,emailEntry,addressEntry,genderEntry,dobEntry,screen
    screen = Toplevel()
    screen.title(title)
    screen.grab_set()
    screen.resizable(False, False)
    idLabel = Label(screen, text='Id', font=('times new roman', 20, 'bold'))
    idLabel.grid(row=0, column=0, padx=30, pady=15, sticky=W)
    idEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    idEntry.grid(row=0, column=1, pady=15, padx=10)

    nameLabel = Label(screen, text='Name', font=('times new roman', 20, 'bold'))
    nameLabel.grid(row=1, column=0, padx=30, pady=15, sticky=W)
    nameEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    nameEntry.grid(row=1, column=1, pady=15, padx=10)

    phoneLabel = Label(screen, text='Phone', font=('times new roman', 20, 'bold'))
    phoneLabel.grid(row=2, column=0, padx=30, pady=15, sticky=W)
    phoneEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    phoneEntry.grid(row=2, column=1, pady=15, padx=10)

    emailLabel = Label(screen, text='Email', font=('times new roman', 20, 'bold'))
    emailLabel.grid(row=3, column=0, padx=30, pady=15, sticky=W)
    emailEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    emailEntry.grid(row=3, column=1, pady=15, padx=10)

    addressLabel = Label(screen, text='Address', font=('times new roman', 20, 'bold'))
    addressLabel.grid(row=4, column=0, padx=30, pady=15, sticky=W)
    addressEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    addressEntry.grid(row=4, column=1, pady=15, padx=10)

    genderLabel = Label(screen, text='Gender', font=('times new roman', 20, 'bold'))
    genderLabel.grid(row=5, column=0, padx=30, pady=15, sticky=W)
    genderEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    genderEntry.grid(row=5, column=1, pady=15, padx=10)

    dobLabel = Label(screen, text='D.O.B', font=('times new roman', 20, 'bold'))
    dobLabel.grid(row=6, column=0, padx=30, pady=15, sticky=W)
    dobEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    dobEntry.grid(row=6, column=1, pady=15, padx=10)

    """ roomType = Label(screen, text='Room Type', font=('times new roman', 20, 'bold'))
    roomType.grid(row=7, column=0, padx=30, pady=15, sticky=W)
    roomCombo = ttk.Combobox(screen, font=('roman', 15, 'bold'), width=22, state='readonly')
    roomCombo['values'] = ('Single', 'Double', 'Family') """

    student_button = ttk.Button(screen, text=button_text, command=command)
    student_button.grid(row=7, columnspan=2, pady=15)
    if title=='Update Booking':
        indexing = bookingTable.focus()

        content = bookingTable.item(indexing)
        listdata = content['values']
        idEntry.insert(0, listdata[0])
        nameEntry.insert(0, listdata[1])
        phoneEntry.insert(0, listdata[2])
        emailEntry.insert(0, listdata[3])
        addressEntry.insert(0, listdata[4])
        genderEntry.insert(0, listdata[5])
        dobEntry.insert(0, listdata[6])



# STILL IN PROGRESS!!
def add_booking():
    if idEntry.get()=='' or nameEntry.get()=='' or phoneEntry.get()=='' or emailEntry.get()=='' or addressEntry.get()=='' or genderEntry.get()=='' or dobEntry.get()=='':
        messagebox.showerror('Error','All Feilds are required',parent=screen)

    else:
        #try:
        currentdate=time.strftime('%d/%m/%Y')
        currenttime=time.strftime('%H:%M:%S')
        query='insert into students values(%s,%s,%s,%s,%s,%s,%s,%s,%s)'
        mycursor.execute(query,(idEntry.get(),nameEntry.get(),phoneEntry.get(),emailEntry.get(),addressEntry.get(),
                                        genderEntry.get(),dobEntry.get(),currentdate, currenttime))
        con.commit()
        result=messagebox.askyesno('Confirm','Data added successfully. Do you want to clean the form?',parent=screen)
        if result:
            idEntry.delete(0,END)
            nameEntry.delete(0,END)
            phoneEntry.delete(0,END)
            emailEntry.delete(0,END)
            addressEntry.delete(0,END)
            genderEntry.delete(0,END)
            dobEntry.delete(0,END)
        else:
            pass
        #except:
            #messagebox.showerror('Error','Id cannot be repeated',parent=screen)
            #return


        query='select *from students'
        mycursor.execute(query)
        fetched_data=mycursor.fetchall()
        bookingTable.delete(*bookingTable.get_children())
        for data in fetched_data:
            bookingTable.insert('',END,values=data)

# STILL IN PROGRESS!!   
def delete_booking():
    indexing=bookingTable.focus()
    print(indexing)
    content=bookingTable.item(indexing)
    content_id=content['values'][0]
    query='delete from students where sin=%s'
    mycursor.execute(query,content_id)
    con.commit()
    messagebox.showinfo('Deleted',f'Id {content_id} is deleted succesfully')
    query='select * from students'
    mycursor.execute(query)
    fetched_data=mycursor.fetchall()
    bookingTable.delete(*bookingTable.get_children())
    for data in fetched_data:
        bookingTable.insert('',END,values=data)

def search_booking():

    
    query='select * from students where sin=%s or name=%s'
    # query='update student set name=%s,mobile=%s,email=%s,address=%s,gender=%s,dob=%s,date=%s,time=%s where id=%s'
    mycursor.execute(query,(idEntry.get(),nameEntry.get()))
    bookingTable.delete(*bookingTable.get_children())
    fetched_data=mycursor.fetchall()
    for data in fetched_data:
        bookingTable.insert('',END,values=data)


# STILL IN PROGRESS!!
def show_booking():
    query = 'select * from students'
    mycursor.execute(query)
    fetched_data = mycursor.fetchall()
    bookingTable.delete(*bookingTable.get_children())
    for data in fetched_data:
        bookingTable.insert('', END, values=data)



# STILL IN PROGRESS!!
def connect_database():
     def connect():
        global mycursor,con
        try:
            #con=pymysql.connect(host=hostEntry.get(),user=usernameEntry.get(),password=passwordEntry.get())
            con=pymysql.connect(host='localhost', user='root', password='Mynameisobiohagwu20')
            mycursor=con.cursor()
        except:
            messagebox.showerror('Error','Invalid Details',parent=connectWindow)
            return

        try:
            query='create database trydatasystem'
            mycursor.execute(query)
            query='use trydatasystem'
            mycursor.execute(query)
            query='create table students(sin int not null primary key, name varchar(30),mobile varchar(10),email varchar(30),' \
                  'address varchar(100),gender varchar(20),dob varchar(20),date varchar(50), time varchar(50))'
            mycursor.execute(query)
        except:
            query='use trydatasystem'
            mycursor.execute(query)
        messagebox.showinfo('Success', 'Database Connection is successful', parent=connectWindow)
        connectWindow.destroy()
        addBookingButton.config(state=NORMAL)
        searchBookingButton.config(state=NORMAL)
        updateBookingButton.config(state=NORMAL)
        showBookingButton.config(state=NORMAL)
        deleteBookingButton.config(state=NORMAL)








     connectWindow=Toplevel()
     connectWindow.grab_set()
     connectWindow.geometry('470x250+730+230')
     connectWindow.title('Database Connection')
     connectWindow.resizable(0,0)

     hostnameLabel=Label(connectWindow,text='Host Name',font=('arial',20,'bold'))
     hostnameLabel.grid(row=0,column=0,padx=20)

     hostEntry=Entry(connectWindow,font=('roman',15,'bold'),bd=2)
     hostEntry.grid(row=0,column=1,padx=40,pady=20)

     usernameLabel = Label(connectWindow, text='User Name', font=('arial', 20, 'bold'))
     usernameLabel.grid(row=1, column=0, padx=20)

     usernameEntry = Entry(connectWindow, font=('roman', 15, 'bold'), bd=2)
     usernameEntry.grid(row=1, column=1, padx=40, pady=20)

     passwordLabel = Label(connectWindow, text='Password', font=('arial', 20, 'bold'))
     passwordLabel.grid(row=2, column=0, padx=20)

     passwordEntry = Entry(connectWindow, font=('roman', 15, 'bold'), bd=2)
     passwordEntry.grid(row=2, column=1, padx=40, pady=20)

     connectButton=ttk.Button(connectWindow,text='CONNECT', command=connect)
     connectButton.grid(row=3,columnspan=2)

    

#==========================================================================GUI================================================================================================
root=ttkthemes.ThemedTk()

root.get_themes()

root.set_theme('radiance')

root.geometry('1174x680+0+0')
root.resizable(False, False)
root.title('Hotel Management System')



connectButton=ttk.Button(root,text='Connect database',command=connect_database)
connectButton.place(x=980,y=0)

leftFrame = Frame(root)
leftFrame.place(x=50, y=80, width=300, height=600)


addBookingButton=ttk.Button(leftFrame,text='Add Booking', width=25, state=DISABLED, command=lambda: toplevel_data('Add Booking', 'Add', add_booking))
addBookingButton.grid(row=2, column=0, pady=20)

searchBookingButton=ttk.Button(leftFrame, text='Search Booking', width=25, state=DISABLED, command=lambda: toplevel_data('Search Booking', 'Search', search_booking))
searchBookingButton.grid(row=3, column=0, pady=20)

updateBookingButton=ttk.Button(leftFrame, text='Update Booking', width=25, state=DISABLED, command=lambda: toplevel_data('Update Booking', 'Update', update_booking))
updateBookingButton.grid(row=4, column=0, pady=20)

deleteBookingButton=ttk.Button(leftFrame, text='Delete Booking', width=25, state=DISABLED, command=delete_booking)
deleteBookingButton.grid(row=5, column=0, pady=20)

showBookingButton=ttk.Button(leftFrame, text='Show Booking', width=25, state=DISABLED, command=show_booking)
showBookingButton.grid(row=6, column=0, pady=20)

exitButton=ttk.Button(leftFrame,text='Exit',width=25,command=iExit)
exitButton.grid(row=7,column=0,pady=20)



#=================================================================RIGHT FRAME=======================================================================================================

rightFrame=Frame(root)
rightFrame.place(x=350,y=80,width=820,height=600)

scrollBarX=Scrollbar(rightFrame,orient=HORIZONTAL)
scrollBarY=Scrollbar(rightFrame,orient=VERTICAL)

bookingTable=ttk.Treeview(rightFrame,columns=('Id','Name','Mobile','Email','Address','Gender',
                                 'D.O.B','Added Date','Added Time'),
                          xscrollcommand=scrollBarX.set,yscrollcommand=scrollBarY.set)

scrollBarX.config(command=bookingTable.xview)
scrollBarY.config(command=bookingTable.yview)

scrollBarX.pack(side=BOTTOM,fill=X)
scrollBarY.pack(side=RIGHT,fill=Y)

bookingTable.pack(expand=1,fill=BOTH)

bookingTable.heading('Id',text='Id')
bookingTable.heading('Name',text='Name')
bookingTable.heading('Mobile',text='Mobile No')
bookingTable.heading('Email',text='Email Address')
bookingTable.heading('Address',text='Address')
bookingTable.heading('Gender',text='Gender')
bookingTable.heading('D.O.B',text='D.O.B')
bookingTable.heading('Added Date',text='Added Date')
bookingTable.heading('Added Time',text='Added Time')

bookingTable.column('Id',width=50,anchor=CENTER)
bookingTable.column('Name',width=200,anchor=CENTER)
bookingTable.column('Email',width=300,anchor=CENTER)
bookingTable.column('Mobile',width=200,anchor=CENTER)
bookingTable.column('Address',width=300,anchor=CENTER)
bookingTable.column('Gender',width=100,anchor=CENTER)
bookingTable.column('D.O.B',width=200,anchor=CENTER)
bookingTable.column('Added Date',width=200,anchor=CENTER)
bookingTable.column('Added Time',width=200,anchor=CENTER)

style=ttk.Style()

style.configure('Treeview', rowheight=40,font=('arial', 12, 'bold'), fieldbackground='white', background='white',)
style.configure('Treeview.Heading',font=('arial', 14, 'bold'),foreground='red')

bookingTable.config(show='headings')






root.mainloop()