from django.shortcuts import render,HttpResponse,redirect

from django.http import HttpResponse
# Create your views here.
import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="altaf", passwd="Altaf@123", database='goldcast')
print('Successfully connected to database')
cur = conn.cursor()

# Create your views here.
def home_screen_view(request):
    return HttpResponse("hi this is home page")

def goldcastlisting(request):
    cur.execute("SELECT * FROM `employee`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return HttpResponse(data)

def goldcastaddItems(request):
    if request.method == 'POST':
        print(request.POST)
        catname = request.POST['txt1']
        cur.execute("INSERT INTO `employee`(`name`) VALUES ('{}')".format(catname))
        conn.commit()
        return HttpResponse("IteamAdded")
    else:
        return HttpResponse("IteamAdded")

def goldcastDeleteItems(request,id):
     
    #id = request.GET['id']
    #id = User.objects.get(id=id)
    print(id)
    cur.execute("delete from `employee` where `id` = {}".format(id))
    conn.commit()
    return HttpResponse("item is deleted") 