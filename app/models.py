from django.db import models
from django.contrib import admin
from django.contrib.auth.models import AbstractUser
# Create your models here.
class Books(models.Model):
    id = models.CharField('编号',max_length=20,primary_key=True)
    name = models.CharField('姓名',max_length=20)
    price = models.FloatField('价格')
    original = models.CharField('出处',max_length = 20)
    image = models.CharField('路径',max_length = 75)
    author = models.CharField('作者',max_length = 20)

    class Meta:
        db_table = 'books'

class Users(models.Model):
    username = models.CharField(name = '账号',max_length=20,primary_key=True)
    password = models.CharField(name = '密码',max_length=20)
    class Meta:
        db_table = 'app_users'

class ShopCart(models.Model):
    data_id = models.CharField(name = 'data_id',max_length=20,primary_key=True)
    id = models.CharField('编号',name='book_id',max_length=20)
    name = models.CharField('姓名',max_length=20)
    price = models.FloatField('价格')
    original = models.CharField('出处',max_length = 20)
    image = models.CharField('路径',max_length = 75)
    author = models.CharField('作者',max_length = 20)
    username = models.CharField(name = 'username',max_length=20)
    class Meta:
        db_table = 'shop_cart'
