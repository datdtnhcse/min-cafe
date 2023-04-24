from django.db import models

# Create your models here.

class MonAn(models.Model):
    ma_mon = models.CharField(primary_key=True, max_length=5)
    ten_mon = models.CharField(max_length=255)
    hinh_anh = models.CharField(max_length=255, blank=True, null=True)
    ma_nhom = models.ForeignKey('Nhom', models.DO_NOTHING, db_column='ma_nhom', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mon_an'
        
class DoAn(models.Model):
    ma_mon = models.OneToOneField('MonAn', models.DO_NOTHING, db_column='ma_mon', primary_key=True)
    don_gia = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'do_an'
        
class NuocUong(models.Model):
    ma_mon = models.OneToOneField(MonAn, models.DO_NOTHING, db_column='ma_mon', primary_key=True)

    class Meta:
        managed = False
        db_table = 'nuoc_uong'
        
class GioPhucVuDoAn(models.Model):
    ma_do_an = models.OneToOneField(DoAn, models.DO_NOTHING, db_column='ma_do_an', primary_key=True)
    bat_dau = models.TimeField()
    ket_thuc = models.TimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gio_phuc_vu_do_an'
        unique_together = (('ma_do_an', 'bat_dau'),)
        
class KichThuocNuocUong(models.Model):
    ma_nuoc_uong = models.OneToOneField('NuocUong', models.DO_NOTHING, db_column='ma_nuoc_uong', primary_key=True)
    size = models.CharField(max_length=1)
    don_gia = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'kich_thuoc_nuoc_uong'
        unique_together = (('ma_nuoc_uong', 'size'),)
        
class Nhom(models.Model):
    ma_nhom = models.AutoField(primary_key=True)
    ten_nhom = models.CharField(unique=True, max_length=255)

    class Meta:
        managed = False
        db_table = 'nhom'