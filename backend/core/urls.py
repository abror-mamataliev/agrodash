from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(("apps.api.urls", "api"), namespace="api")),
    path('auth/', include(("apps.authion.urls", "authion"), namespace="authion")),
    path('dashboard/', include(("apps.dashboard.urls", "dashboard"), namespace="dashboard")),
]
