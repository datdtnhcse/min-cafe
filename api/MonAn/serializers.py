from rest_framework import serializers
from .models import MonAn
from .models import KichThuocNuocUong
from .models import DoAn



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
        fields = ['ma_nuoc_uong', 'size', 'don_gia']
        
# class NuocUongSerializers(serializers.ModelSerializer):
#     class Meta:
#         model = NuocUong
#         fields = 
        
