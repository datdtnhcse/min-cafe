from django.urls import path
from . import views

urlpatterns = [
    path('monan/', views.monanApi),
    path('monan/<str:pk>/', views.monanApi),
    path('doan/', views.doanApi),
    path('doan/<str:pk>/', views.doanApi),
    path('nuocuong/', views.kichthuocnuocuongApi),
    path('nuocuong/<str:pk>/', views.kichthuocnuocuongApi),
    path('giophucvudoan/', views.giophucvudoanApi),
    path('giophucvudoan/<str:pk>/', views.giophucvudoanApi),
]