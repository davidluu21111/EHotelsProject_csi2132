import tkinter as tk
from tkinter import *
import time
import ttkthemes
from tkinter import ttk,messagebox,filedialog
import pymysql
import pandas


def toplevel_data(title,button_text,command):
    global idEntry,nameEntry,addressEntry,roomnumEntry,emailEntry,phoneEntry, screen
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


    addressLabel = Label(screen, text='Address', font=('times new roman', 20, 'bold'))
    addressLabel.grid(row=4, column=0, padx=30, pady=15, sticky=W)
    addressEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    addressEntry.grid(row=4, column=1, pady=15, padx=10)

    roomnumLabel = Label(screen, text='# of rooms', font=('times new roman', 20, 'bold'))
    roomnumLabel.grid(row=5, column=0, padx=30, pady=15, sticky=W)
    roomnumEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    roomnumEntry.grid(row=5, column=1, pady=15, padx=10)

    emailLabel = Label(screen, text='Email', font=('times new roman', 20, 'bold'))
    emailLabel.grid(row=3, column=0, padx=30, pady=15, sticky=W)
    emailEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    emailEntry.grid(row=3, column=1, pady=15, padx=10)

    phoneLabel = Label(screen, text='Phone', font=('times new roman', 20, 'bold'))
    phoneLabel.grid(row=2, column=0, padx=30, pady=15, sticky=W)
    phoneEntry = Entry(screen, font=('roman', 15, 'bold'), width=24)
    phoneEntry.grid(row=2, column=1, pady=15, padx=10)


def add_hotel():
    if idEntry.get()=='' or nameEntry.get()=='' or addressEntry.get()=='' or roomnumEntry.get()=='' or emailEntry.get()=='' or phoneEntry.get()=='':# or dateEntry.get()=='':
        messagebox.showerror('Error','All Feilds are required',parent=screen)

    else:
        #try:
        currentdate=time.strftime('%d/%m/%Y')
        currenttime=time.strftime('%H:%M:%S')
        query='insert into booking values(%s,%s,%s,%s,%s,%s)'
        mycursor.execute(query,(idEntry.get(),nameEntry.get(),addressEntry.get(), roomnumEntry.get(), emailEntry.get(), phoneEntry.get()))
        con.commit()
        result=messagebox.askyesno('Confirm','Data added successfully. Do you want to clean the form?',parent=screen)
        if result:
            idEntry.delete(0,END)
            nameEntry.delete(0,END)
            addressEntry.delete(0,END)
            roomnumEntry.delete(0,END)
            emailEntry.delete(0,END)
            phoneEntry.delete(0,END)
        else:
            pass
        #except:
            #messagebox.showerror('Error','Id cannot be repeated',parent=screen)
            #return


        query='select *from booking'
        mycursor.execute(query)
        fetched_data=mycursor.fetchall()
        hotelTable.delete(*hotelTable.get_children())
        for data in fetched_data:
            hotelTable.insert('',END,values=data)
def delete_hotel():
    indexing=hotelTable.focus()
    print(indexing)
    content=hotelTable.item(indexing)
    content_id=content['values'][0]
    query='delete from hotel_chain where id=%s'
    mycursor.execute(query,content_id)
    con.commit()
    messagebox.showinfo('Deleted',f'Id {content_id} is deleted succesfully')
    query='select * from hotel_chain'
    mycursor.execute(query)
    fetched_data=mycursor.fetchall()
    hotelTable.delete(*hotelTable.get_children())
    for data in fetched_data:
        hotelTable.insert('',END,values=data)
    pass
def update_hotel():
    pass

def show_hotel():
    query = 'select * from hotel_chain'
    mycursor.execute(query)
    fetched_data = mycursor.fetchall()
    hotelTable.delete(*hotelTable.get_children())
    for data in fetched_data:
        hotelTable.insert('', END, values=data)
    pass

def search_hotel():
    query='select * from hotel_chain where id=%s or name=%s'
    # query='update student set name=%s,mobile=%s,email=%s,address=%s,gender=%s,dob=%s,date=%s,time=%s where id=%s'
    mycursor.execute(query,(idEntry.get(),nameEntry.get()))
    hotelTable.delete(*hotelTable.get_children())
    fetched_data=mycursor.fetchall()
    for data in fetched_data:
        hotelTable.insert('',END,values=data)

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
            query='create table booking(id int(11) not null primary key, name varchar(225),central_office_address varchar(225),num_hotels int(11) not null' \
                                        'contact_email varchar(255), contact_phone varchar(20))'
            mycursor.execute(query)
        except:
            query='use gera'
            mycursor.execute(query)
        messagebox.showinfo('Success', 'Database Connection is successful', parent=connectWindow)
        connectWindow.destroy()
        addHotelButton.config(state=NORMAL)
        searchHotelButton.config(state=NORMAL)
        updateHotelButton.config(state=NORMAL)
        showHotelButton.config(state=NORMAL)
        deleteHotelButton.config(state=NORMAL)








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

#==========================================================================================
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


addHotelButton=ttk.Button(leftFrame,text='Add Hotel', width=25, state=DISABLED, command=lambda: toplevel_data('Add Hotel', 'Add', add_hotel))
addHotelButton.grid(row=2, column=0, pady=20)

searchHotelButton=ttk.Button(leftFrame, text='Search Hotel', width=25, state=DISABLED, command=lambda: toplevel_data('Search Booking', 'Search', search_hotel))
searchHotelButton.grid(row=3, column=0, pady=20)

updateHotelButton=ttk.Button(leftFrame, text='Update Hotel', width=25, state=DISABLED, command=lambda: toplevel_data('Update Booking', 'Update', update_hotel))
updateHotelButton.grid(row=4, column=0, pady=20)

deleteHotelButton=ttk.Button(leftFrame, text='Delete Hotel', width=25, state=DISABLED, command=delete_hotel)
deleteHotelButton.grid(row=5, column=0, pady=20)

showHotelButton=ttk.Button(leftFrame, text='Show Hotel', width=25, state=DISABLED, command=show_hotel)
showHotelButton.grid(row=6, column=0, pady=20)



#=================================================================RIGHT FRAME=======================================================================================================

rightFrame=Frame(root)
rightFrame.place(x=350,y=80,width=820,height=600)

scrollBarX=Scrollbar(rightFrame,orient=HORIZONTAL)
scrollBarY=Scrollbar(rightFrame,orient=VERTICAL)

hotelTable=ttk.Treeview(rightFrame,columns=('ID','Name','address','num-hotels','email','phone'),
                          xscrollcommand=scrollBarX.set,yscrollcommand=scrollBarY.set)

scrollBarX.config(command=hotelTable.xview)
scrollBarY.config(command=hotelTable.yview)

scrollBarX.pack(side=BOTTOM,fill=X)
scrollBarY.pack(side=RIGHT,fill=Y)

hotelTable.pack(expand=1,fill=BOTH)

hotelTable.heading('ID',text='Hotel-ID')
hotelTable.heading('Name',text='HotelName')
hotelTable.heading('address',text='address')
hotelTable.heading('num-hotels',text='num-hotels')
hotelTable.heading('email',text='email')
hotelTable.heading('phone',text='phone')



hotelTable.column('ID ',width=50,anchor=CENTER)
hotelTable.column('Name',width=200,anchor=CENTER)
hotelTable.column('address',width=200,anchor=CENTER)
hotelTable.column('num-hotels',width=300,anchor=CENTER)
hotelTable.column('email',width=300,anchor=CENTER)
hotelTable.heading('phone',width=300,anchor=CENTER)


style=ttk.Style()

style.configure('Treeview', rowheight=40,font=('arial', 12, 'bold'), fieldbackground='white', background='white',)
style.configure('Treeview.Heading',font=('arial', 14, 'bold'),foreground='red')

hotelTable.config(show='headings')





root.mainloop()
