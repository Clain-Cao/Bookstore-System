from django.shortcuts import render , redirect
from app import models
from app.models import Books , Users , ShopCart #自己创建的数据类
from datetime import datetime  #python 普通时间类
from django.http import HttpResponse #请求响应函数
from django.contrib.auth import authenticate , logout # {登录  验证  注销} 函数
from django.contrib.auth.models import User # import 一个 user类
from django.contrib.auth.decorators import login_required #装饰器，登录成功后才能访问页面
from django.contrib import auth , admin
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger   # 分页
# Create your views here.


'''

########################################################################
##                                                                    ##
##                           页面跳转函数                              ##
##                                                                    ##
########################################################################

'''



@login_required
def bookstore(request):
    # return render(request,"html/bookstore.html");
    return store_show_all_books(request)

def page_error(request):
    return render(request,"html/page404.html");

def failpage(request):
    return render(request,"html/FailLogin.html")

def login(request):
    return render(request,"html/login.html")

def register(request):
    return render(request,"html/register.html")

def after_edit(request):
    return render(request,"html/resetPasswordPage.html")

@login_required
def Go_Add_Book(request):
    return render(request,"html/add_book.html")

@login_required
def Go_Shop_cart(request):
    carts = ShopCart.objects.filter(username = str(request.user))
    total_price = 0
    for var in carts:
        total_price += var.price
    total_price = round(total_price,2)
    print("total price :" , total_price)
    print(carts)
    paginator = Paginator(carts,4)
    page = request.GET.get('page')
    # print(carts)
    try:
        carts = paginator.page(page)
    except PageNotAnInteger:
        carts = paginator.page(1)
    except EmptyPage:
        carts = paginator.page(paginator.num_pages)
    return render(request,"html/shopcart.html",{"cart_list":carts , "cur_page":page , "paginator":paginator , "total_price":total_price})

@login_required
def edit_user_page(request):   # 转到用户编辑页面
    current_user = request.user
    user_info = User.objects.get(username = current_user)
    print( user_info.username , user_info.first_name ,   user_info.last_name  ,user_info.email ,user_info.password)
    print(type(current_user))
    print(type(user_info))
    return render(request,"html/edit_user.html" ,{"user_info":user_info})

@login_required
def manage(request):
    return render(request,"html/manage.html")

def verify(request):
    data = 0
    try:
        user = User.objects.get(username=username)
        data = 1
    except User.DoesNotExist:
        pass
    # print(data)
    return HttpResponse(data)



'''

########################################################################
##                                                                    ##
##                           管理员类函数                              ##
##                                                                    ##
########################################################################

'''

def adduser(request):
    print ("study_login访问时间点：%s" %datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f"))
    username = request.POST["username"]
    password = request.POST["password"]
    email = request.POST["email"]
    user = User.objects.create_user(username=username,password=password,email=email)
    return render(request,"html/login.html")

def userlogin(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request=request,username=username, password=password)
        if user is not None:
            print ("study_login访问时间点：%s" %datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f"))
            print(" is super user ? :  ",user.is_superuser)
            if user.is_superuser:  # pass authtencation
                auth.login(request=request,user=user)
                return render(request,"html/manage.html")
            else:
                auth.login(request=request,user=user)
                return render(request,"html/bookstore.html")
        else:
            return failpage(request)
    else:
        return page_error(request)


@login_required
def userlogout(request):
    logout(request)
    # print(1)
    return redirect("../login/")


# @login_required
# def show_all_user():
#     users = User.objects.all()
#     paginator = Paginator(books,4)
#     page = request.GET.get('page')
#     # print(books)
#     try:
#         books = paginator.page(page)
#     except PageNotAnInteger:
#         books = paginator.page(1)
#     except EmptyPage:
#         books = paginator.page(paginator.num_pages)
#     return render(request,"html/manage.html",{"books_list":books , "cur_page":page , "paginator":paginator})

@login_required
def edit_user(request):
    username = request.user
    print(username)
    password = request.POST["password"]
    user = User.objects.get(username=username)
    user.set_password(password)
    user.first_name = request.POST["first_name"]
    user.last_name = request.POST["last_name"]
    user.email = request.POST["email"]
    user.save()
    print(1)
    logout(request)
    # print(1)
    return redirect("../ResetError/")


'''

########################################################################
##                                                                    ##
##                          商品管理类函数                             ##
##                                                                    ##
########################################################################

'''

@login_required
def edit_book(request):
    book_id = request.POST['id']
    name = request.POST['name']
    ori = request.POST['original']
    author = request.POST['author']
    price = request.POST['price']
    print(book_id + name  , name , ori , author , price)
    try :
        book = Books.objects.get(id=book_id)
        book.name = name
        book.original = ori
        book.author = author
        book.price = price
        book.save()
        print("ok")
        return HttpResponse(content="ok")
    except:
        return HttpResponse(content=None)

@login_required
def delete_book(request):
    # print("come in ")
    book_id = request.POST['id']
    # print(book_id)
    try :
        book = Books.objects.get(id=book_id)
        book.delete()
        return HttpResponse(content="ok")
    except:
        return HttpResponse(content=None)

@login_required
def book_id_verify(request):
    if request.method == 'POST':
        id = request.POST['id']
        result = 0
        try:
            book = Books.objects.get(id=id)
            print("book : ",book)
            result = 1
        except Books.DoesNotExist:
            pass
        return HttpResponse(result)
    else:
        return login(request)

@login_required
def add_book(request):
    if request.method == "POST":
        id = request.POST['book_id']
        name = request.POST['book_name']
        image_path = request.POST['book_path']
        author = request.POST['author']
        original = request.POST['original']
        price = request.POST['book_price']
        book = Books(id = id ,name = name , image = image_path ,
                    author = author , original = original , price = price)
        print(id , name , image_path , author , original , price)
        print(book.name , book.id , book.image , book.author)
        book.save()
        return render(request,"html/manage.html")
    else:
        return page_error(request)

@login_required
def search_book(request):
    if  not request.user.is_superuser:
        logout(request)
        return redirect("html/page404.html")
    option = request.GET.get("Method")
    # print(option)
    key = request.GET.get("SearchKey")
    if option == "Number Search":
        books = Books.objects.filter(id__contains = key)
    elif option == "Book Search":
        books = Books.objects.filter(name__contains = key)
    elif option == "Author Search":
        books = Books.objects.filter(author__contains = key)
    elif option == "Original Search":
        books = Books.objects.filter(original__contains = key)
    paginator = Paginator(books,4)
    page = request.GET.get('page')
    try:
        books = paginator.page(page)
    except PageNotAnInteger:
        books = paginator.page(1)
    except EmptyPage:
        books = paginator.page(paginator.num_pages)
    return render(request,"html/manage.html",{"books_list":books , "cur_page":page , "paginator":paginator})

@login_required
def show_all_books(request):
    if  not request.user.is_superuser:
        logout(request)
        return redirect("html/page404.html")
    books = Books.objects.all()
    # print(books)
    paginator = Paginator(books,4)
    page = request.GET.get('page')
    print(books)
    try:
        books = paginator.page(page)
    except PageNotAnInteger:
        books = paginator.page(1)
    except EmptyPage:
        books = paginator.page(paginator.num_pages)
    return render(request,"html/manage.html",{"books_list":books , "cur_page":page , "paginator":paginator})


'''

########################################################################
##                                                                    ##
##                           普通用户类函数                            ##
##                                                                    ##
########################################################################

'''
@login_required
def store_show_all_books(request):
    books = Books.objects.all()
    # print(books)
    paginator = Paginator(books,4)
    page = request.GET.get('page')
    print(books)
    try:
        books = paginator.page(page)
    except PageNotAnInteger:
        books = paginator.page(1)
    except EmptyPage:
        books = paginator.page(paginator.num_pages)
    return render(request,"html/bookstore.html",{"books_list":books , "cur_page":page , "paginator":paginator})

@login_required
def store_search_book(request):
    option = request.GET.get("Method")
    # print(option)
    key = request.GET.get("SearchKey")
    if option == "Number Search":
        books = Books.objects.filter(id__contains = key)
    elif option == "Book Search":
        books = Books.objects.filter(name__contains = key)
    elif option == "Author Search":
        books = Books.objects.filter(author__contains = key)
    elif option == "Original Search":
        books = Books.objects.filter(original__contains = key)
    paginator = Paginator(books,4)
    page = request.GET.get('page')
    try:
        books = paginator.page(page)
    except PageNotAnInteger:
        books = paginator.page(1)
    except EmptyPage:
        books = paginator.page(paginator.num_pages)
    return render(request,"html/bookstore.html",{"books_list":books , "cur_page":page , "paginator":paginator})


'''

########################################################################
##                                                                    ##
##                            购物车类函数                             ##
##                                                                    ##
########################################################################

'''

@login_required
def add_in_shopcart(request):
    if request.method == "POST":
        book_id = request.POST['book_id']
        book = Books.objects.get(id = book_id)
        print("name : " , str(request.user) + "_" + book_id)
        print("type : " , type(str(request.user) + "_" + book_id))
        data_id = str(request.user) + "_" + book_id
        try :
            cart = ShopCart.objects.get(data_id = data_id)
            print(cart)
            return HttpResponse('exist')
        except ShopCart.DoesNotExist:
            cart = ShopCart(data_id = data_id ,book_id = book.id ,name = book.name , image = book.image ,
                        author = book.author , original = book.original , price = book.price , username=str(request.user))
            # print(id , name , image_path , author , original , price)
            cart.save()
            return HttpResponse("ok")
    else:
        page_error(request)


@login_required
def store_search_cart(request):
    option = request.GET.get("Method")
    # print(option)
    key = request.GET.get("SearchKey")
    if option == "Number Search":
        carts = ShopCart.objects.filter(book_id__contains = key)
    elif option == "Book Search":
        carts = ShopCart.objects.filter(name__contains = key)
    elif option == "Author Search":
        carts = ShopCart.objects.filter(author__contains = key)
    elif option == "Original Search":
        carts = ShopCart.objects.filter(original__contains = key)
    paginator = Paginator(carts,4)
    page = request.GET.get('page')
    try:
        carts = paginator.page(page)
    except PageNotAnInteger:
        carts = paginator.page(1)
    except EmptyPage:
        carts = paginator.page(paginator.num_pages)
    return render(request,"html/shopcart.html",{"cart_list":carts , "cur_page":page , "paginator":paginator})

@login_required
def delete_cart(request):

    book_id = request.POST['id']
    data_id = str(request.user) + "_" + book_id
    # print(book_id)
    try :
        shopcart = ShopCart.objects.get(data_id=data_id)
        print(shopcart)
        shopcart.delete()
        return HttpResponse(content="ok")
    except:
        return HttpResponse(content=None)

def buy_all_shopcart(request):
    data_id = str(request.user) + "_"
    try :
        shopcart_list = ShopCart.objects.filter(data_id__contains=data_id)
        print("all shopping : " , shopcart_list)
        shopcart_list.delete()
        return HttpResponse(content="ok")
    except:
        return HttpResponse(content=None)
