from rest_framework import serializers
from .models import MonAn
from .models import KichThuocNuocUong
from .models import DoAn
from .models import GioPhucVuDoAn
from .models import NuocUong



class MonAnSerializer(serializers.ModelSerializer):
    class Meta:
        model = MonAn
        fields = ('ma_mon', 'ten_mon', 'hinh_anh', 'ma_nhom')
        
class DoAnSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoAn
        fields = ('ma_mon', 'don_gia')
        
class KichThuocNuocUongSerializer(serializers.ModelSerializer):
    class Meta:
        model = KichThuocNuocUong
        fields = ('ma_nuoc_uong', 'size', 'don_gia')
        
class GioPhucVuDoAnSerializer(serializers.ModelSerializer):
    class Meta:
        model = GioPhucVuDoAn
        fields = ['ma_do_an', 'bat_dau', 'ket_thuc']
        
class NuocUongSerializer(serializers.ModelSerializer):
    class Meta:
        model = NuocUong
        fields = ['ma_nuoc_uong']
        
        
# class NuocUongSerializers(serializers.ModelSerializer):
#     class Meta:
#         model = NuocUong
#         fields = 
        
