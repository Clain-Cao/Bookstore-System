"""BookStore URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from app import views
urlpatterns = [
        ##   跳转页面类函数
        path('fail/',views.failpage),
        path('manage/',views.manage),
        path('login/',views.login),
        path('register/',views.register),
        path('error/',views.page_error),
        path('logout/',views.userlogout),
        path('AddBookPage/',views.Go_Add_Book),
        path('ResetError/',views.after_edit),
        path('SignUp/',views.adduser),
        path('bookstore/',views.bookstore),
        path('shopcart/',views.Go_Shop_cart),

        ##   管理员类函数
        path('home/',views.userlogin),
        path('verify/',views.verify),
        path('query/',views.show_all_books),
        path('search/',views.search_book),
        path('edituser/',views.edit_user_page),
        path('edit/',views.edit_user),
        path('edit_book/',views.edit_book),
        path('delete_book/',views.delete_book),
        path('book_id_verify/',views.book_id_verify),
        path('add_book/',views.add_book),

        ##   用户类函数
        path('store_show_all/',views.store_show_all_books),
        path('store_search/',views.store_search_book),
        path('add_in_shopcart/',views.add_in_shopcart),


        ##   购物车类函数
        path("search_cart/",views.store_search_cart),
        path("delete_cart/",views.delete_cart),
        path("buy_all_shopcart/",views.buy_all_shopcart),
]
