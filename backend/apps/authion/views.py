from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages


def signin(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(
            request,
            username=username,
            password=password
        )
        if user is not None:
            login(request, user)
            return redirect("dashboard:index")
        else:
            messages.error(request, "Noto'g'ri username yoki parol")
            return render(request, "authion/login.html")
    else:
        return render(request, "authion/login.html")


def signout(request):
    logout(request)
    return redirect("authion:login")
