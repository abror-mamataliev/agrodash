from django.db import models


class UserFarm(models.Model):

    user = models.ForeignKey("auth.User", verbose_name="Foydalanuvchi", on_delete=models.CASCADE)
    farm_id = models.IntegerField("FX raqami")

    class Meta:
        verbose_name = "FX ma'suli "
        verbose_name_plural = "FX ma'sullari"

    def __str__(self):
        return self.user.__str__()
