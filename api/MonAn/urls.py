from django.urls import path
from . import views

urlpatterns = [
    path('monan/', views.monanApi),
    path('monan/<str:pk>/', views.monanApi),
    path('doan/<str:pk>/', views.doanApi),
    path('nuocuong/<str:pk>/', views.kichthuocnuocuongApi),
    # path('nuocuong/', views.kichthuocnuocuongApi),
]