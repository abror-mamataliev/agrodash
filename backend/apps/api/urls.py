from django.urls import path
from . import views


urlpatterns = [
    path('dashboard/', views.dashboard, name='dashboard'),
    path('dashboard/layer/', views.dashboard_layer, name='dashboard_layer'),
    path('farm/', views.farm_exists, name='farm_exists'),
    path('register/', views.register, name='register')
]
