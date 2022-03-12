from django.core.serializers import serialize
from django.http import JsonResponse
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
