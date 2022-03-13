from django.contrib.auth.models import User
from django.core.serializers import serialize
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from apps.authion.models import UserFarm
from apps.dashboard.models import Contour
from apps.decorators import login_required


@login_required
def dashboard(request):
    name = "%(first_name)s %(last_name)s" % {
        'first_name': request.user.first_name,
        'last_name': request.user.last_name,
    }
    farm_id = UserFarm.objects.filter(user=request.user).first()
    if farm_id:
        farm_id = farm_id.farm_id
        farm_name = Contour.objects.filter(farm_id=farm_id).first()
        if farm_name:
            farm_name = farm_name.farm_name
        else:
            farm_name = None
    else:
        farm_name = None
    return JsonResponse({
        'name': name,
        'farm_name': farm_name
    })


@login_required
def dashboard_layer(request):
    farm_id = UserFarm.objects.filter(user=request.user).first()
    if farm_id:
        farm_id = farm_id.farm_id
        contours = Contour.objects.filter(farm_id=farm_id)
        result = serialize("geojson", contours)
        return JsonResponse(result, safe=False)
    else:
        return JsonResponse({}, safe=False)


def farm_exists(request):
    if 'farm_id' in request.GET:
        farm = UserFarm.objects.filter(farm_id=request.GET['farm_id']).first()
        return JsonResponse({
            'exists': True if farm else False
        })

@csrf_exempt
def register(request):
    if request.method == "POST":
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        farm_id = request.POST.get('farm_id')
        if first_name and last_name and username:
            user = User.objects.create(
                first_name=first_name,
                last_name=last_name,
                username=username
            )
            user.set_password("password")
            user.save()
            userfarm = UserFarm.objects.create(
                user=user,
                farm_id=farm_id
            )
            return JsonResponse({
                'success': True
            })
        else:
            return JsonResponse({
                'success': False
            })
    else:
        return JsonResponse({
            'success': False
        })
