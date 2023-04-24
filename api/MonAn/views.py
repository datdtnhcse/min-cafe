from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from .models import MonAn
from .models import DoAn
from .models import KichThuocNuocUong
from .serializers import MonAnSerializer
from .serializers import DoAnSerializer
from .serializers import KichThuocNuocUongSerializer


# Create your views here.

@csrf_exempt
def monanApi(request, pk = None):
    if request.method == 'GET':
        if pk is not None:
            # Retrieve a single MonAn instance by pk
            try:
                monan = MonAn.objects.get(pk=pk)
                monan_serializer = MonAnSerializer(monan)
                return JsonResponse(monan_serializer.data, safe=False)
            except MonAn.DoesNotExist:
                return JsonResponse({'message': 'MonAn does not exist'}, status=404)
        else:
            # Retrieve all MonAn instances
            monans = MonAn.objects.all()
            monans_serializer = MonAnSerializer(monans, many=True)
            return JsonResponse(monans_serializer.data, safe=False)
        
@csrf_exempt
def doanApi(request, pk=None):
    if request.method == 'GET':
        try:
            doan = DoAn.objects.get(pk=pk)
            doan_serializer = DoAnSerializer(doan)
            return JsonResponse(doan_serializer.data, safe=False)
        except DoAn.DoesNotExist:
            return JsonResponse({'message': 'DoAn does not exist'}, status=404)
        
@csrf_exempt
def kichthuocnuocuongApi(request, pk=None):
    if request.method == 'GET':
        kichthuocnuocuong = KichThuocNuocUong.objects.filter(pk=pk)
        kichthuocnuocuong_serializer = KichThuocNuocUongSerializer(kichthuocnuocuong, many=True)
        return JsonResponse(kichthuocnuocuong_serializer.data, safe=False)

         
