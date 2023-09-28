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
    global idEntry, customerIdEntry, roomIdEntry, screen #dateEntry, screen
    screen = Toplevel()
    screen.title(title)
    screen.grab_set()
    screen.resizable(False, False)
    idLabel = Label(screen, text='Id', font=('times new roman', 20, 'bold'))
    idLabel.grid(row=0, column=0, padx=30, pady=15, sticky=W)
    idEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    idEntry.grid(row=0, column=1, pady=15, padx=10)

    customerIdLabel = Label(screen, text='Customer ID', font=('times new roman', 20, 'bold'))
    customerIdLabel.grid(row=1, column=0, padx=30, pady=15, sticky=W)
    customerIdEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    customerIdEntry.grid(row=1, column=1, pady=15, padx=10)

    roomIdLabel = Label(screen, text='Room ID', font=('times new roman', 20, 'bold'))
    roomIdLabel.grid(row=2, column=0, padx=30, pady=15, sticky=W)
    roomIdEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    roomIdEntry.grid(row=2, column=1, pady=15, padx=10)







    student_button = ttk.Button(screen, text=button_text, command=command)
    student_button.grid(row=7, columnspan=2, pady=15)
    if title=='Update Booking':
        indexing = bookingTable.focus()

        content = bookingTable.item(indexing)
        listdata = content['values']
        idEntry.insert(0, listdata[0])
        customerIdEntry.insert(0, listdata[1])
        roomIdEntry.insert(0, listdata[2])
        #dateEntry.insert(0, listdata[3])



# STILL IN PROGRESS!!
def add_booking():
    if idEntry.get()=='' or customerIdEntry.get()=='' or roomIdEntry.get()=='':# or dateEntry.get()=='':
        messagebox.showerror('Error','All Feilds are required',parent=screen)

    else:
        #try:
        currentdate=time.strftime('%d/%m/%Y')
        currenttime=time.strftime('%H:%M:%S')
        query='insert into booking values(%s,%s,%s,%s,%s)'
        mycursor.execute(query,(idEntry.get(),customerIdEntry.get(),roomIdEntry.get(), currentdate, currenttime))
        con.commit()
        result=messagebox.askyesno('Confirm','Data added successfully. Do you want to clean the form?',parent=screen)
        if result:
            idEntry.delete(0,END)
            customerIdEntry.delete(0,END)
            roomIdEntry.delete(0,END)
            #dateEntry.delete(0,END)
        else:
            pass
        #except:
            #messagebox.showerror('Error','Id cannot be repeated',parent=screen)
            #return


        query='select *from booking'
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
    query='delete from booking where id=%s'
    mycursor.execute(query,content_id)
    con.commit()
    messagebox.showinfo('Deleted',f'Id {content_id} is deleted succesfully')
    query='select * from booking'
    mycursor.execute(query)
    fetched_data=mycursor.fetchall()
    bookingTable.delete(*bookingTable.get_children())
    for data in fetched_data:
        bookingTable.insert('',END,values=data)



# STILL IN PROGRESS!!
def show_booking():
    query = 'select * from booking'
    mycursor.execute(query)
    fetched_data = mycursor.fetchall()
    bookingTable.delete(*bookingTable.get_children())
    for data in fetched_data:
        bookingTable.insert('', END, values=data)

def search_booking():
    query='select * from booking where id=%s or customer_id=%s'
    # query='update student set name=%s,mobile=%s,email=%s,address=%s,gender=%s,dob=%s,date=%s,time=%s where id=%s'
    mycursor.execute(query,(idEntry.get(),customerIdEntry.get()))
    bookingTable.delete(*bookingTable.get_children())
    fetched_data=mycursor.fetchall()
    for data in fetched_data:
        bookingTable.insert('',END,values=data)
    pass

def update_booking():
    pass



# STILL IN PROGRESS!!
def connect_database():
     def connect():
        global mycursor,con
        try:
            con=pymysql.connect(host=hostEntry.get(),user=usernameEntry.get(),password=passwordEntry.get())
            #con=pymysql.connect(host='localhost', user='root', password='Mynameisobiohagwu20')
            mycursor=con.cursor()
        except:
            messagebox.showerror('Error','Invalid Details',parent=connectWindow)
            return

        try:
            query='create database gera'
            mycursor.execute(query)
            query='use gera'
            mycursor.execute(query)
            query='create table booking(id int not null primary key, customer-id varchar(30),room varchar(10),' \
                                        'date varchar(50), time varchar(50))'
            mycursor.execute(query)
        except:
            query='use gera'
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



#=================================================================RIGHT-FRAME=======================================================================================================

rightFrame=Frame(root)
rightFrame.place(x=350,y=80,width=820,height=600)

scrollBarX=Scrollbar(rightFrame,orient=HORIZONTAL)
scrollBarY=Scrollbar(rightFrame,orient=VERTICAL)

bookingTable=ttk.Treeview(rightFrame,columns=('Id','Customer_id','room_id','Added Date','Added Time'),
                          xscrollcommand=scrollBarX.set,yscrollcommand=scrollBarY.set)

scrollBarX.config(command=bookingTable.xview)
scrollBarY.config(command=bookingTable.yview)

scrollBarX.pack(side=BOTTOM,fill=X)
scrollBarY.pack(side=RIGHT,fill=Y)

bookingTable.pack(expand=1,fill=BOTH)

bookingTable.heading('Id',text='Id')
bookingTable.heading('Customer_id',text='Customer_id')
bookingTable.heading('room_id', text='room_id')
bookingTable.heading('Added Date',text='Added Date')
bookingTable.heading('Added Time',text='Added Time')


bookingTable.column('Id',width=200,anchor=CENTER)
bookingTable.column('Customer_id',width=300,anchor=CENTER)
bookingTable.column('room_id',width=200,anchor=CENTER)
bookingTable.column('Added Date',width=200,anchor=CENTER)
bookingTable.column('Added Time',width=200,anchor=CENTER)

style=ttk.Style()

style.configure('Treeview', rowheight=40,font=('arial', 12, 'bold'), fieldbackground='white', background='white',)
style.configure('Treeview.Heading',font=('arial', 14, 'bold'),foreground='red')

bookingTable.config(show='headings')






root.mainloop()
