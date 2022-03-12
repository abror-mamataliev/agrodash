from django.contrib.gis.db import models


class Contour(models.Model):

    contour_id = models.IntegerField("Kontur raqami")
    area = models.FloatField("Maydoni", blank=True, null=True)
    crop = models.CharField("Ekin turi", max_length=255, blank=True, null=True)
    crop_plan = models.FloatField("Rejadagi ekin maydoni", blank=True, null=True)
    crop_real = models.FloatField("Amaldagi ekin maydoni", blank=True, null=True)
    farm_name = models.CharField("FX nomi", max_length=255)
    farm_id = models.IntegerField("FX raqami")
    geometry = models.PolygonField("Geometry", srid=3857)

    class Meta:
        verbose_name = "Kontur "
        verbose_name_plural = "Konturlar"
    
    def __str__(self):
        return "%(farm_name)s - %(contour_id)d" % {
            'farm_name': self.farm_name,
            'contour_id': self.contour_id
        }
