from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
import json

from .models import MonAn
from .models import DoAn
from .models import KichThuocNuocUong
from .models import GioPhucVuDoAn
from .models import NuocUong
from .serializers import MonAnSerializer
from .serializers import DoAnSerializer
from .serializers import KichThuocNuocUongSerializer
from .serializers import GioPhucVuDoAnSerializer


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
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        new_item = MonAn.objects.create(
            ma_mon=data['ma_mon'],
            ten_mon=data['ten_mon'],
            hinh_anh=data['hinh_anh'],
            ma_nhom_id=data['ma_nhom']
        )
        response_data = {
            'ma_mon': new_item.ma_mon,
            'ten_mon': new_item.ten_mon,
            'hinh_anh': new_item.hinh_anh,
            'ma_nhom': new_item.ma_nhom_id
        }
        return JsonResponse(response_data)
    elif request.method == 'POST':
        text = JSONParser().parse(request)
        search_text = text['search_text']
        if search_text:
            results = MonAn.objects.filter(ten_mon__icontains=search_text)
            response_data = [{
                'ma_mon': mon.ma_mon,
                'ten_mon': mon.ten_mon,
                'hinh_anh': mon.hinh_anh,
                'ma_nhom': mon.ma_nhom_id
            } for mon in results]
            return JsonResponse(response_data, safe=False)
        return JsonResponse({'results': []})
    
@csrf_exempt
def nuocuongApi(request):
    if request.method == 'POST':
        data = JSONParser().parse(request)
        monan = MonAn.objects.get(ma_mon=data['ma_mon'])
        new_item = NuocUong.objects.create(
            ma_mon=monan,
        )
        return JsonResponse({'message': "Successfully created"})
       
        
@csrf_exempt
def doanApi(request, pk=None):
    if request.method == 'GET':
        try:
            doan = DoAn.objects.get(pk=pk)
            doan_serializer = DoAnSerializer(doan)
            return JsonResponse(doan_serializer.data, safe=False)
        except DoAn.DoesNotExist:
            return JsonResponse({'message': 'DoAn does not exist'}, status=404)
    elif request.method == 'PUT':
        doan_data = JSONParser().parse(request)
        doan = DoAn.objects.get(ma_mon = doan_data['ma_mon'])
        doan_serializer = DoAnSerializer(doan, data = doan_data)
        if doan_serializer.is_valid():
            doan_serializer.save()
            return JsonResponse("Updated Successfully", safe = False)
        return JsonResponse("Failed to Update")
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        mon_an = MonAn.objects.get(ma_mon=data['ma_mon'])
        new_item = DoAn.objects.create(
            ma_mon=mon_an,
            don_gia=data['don_gia']
        )
        return JsonResponse({"message": "Successfully created"})
        
        
@csrf_exempt
def kichthuocnuocuongApi(request, pk=None):
    if request.method == 'GET':
        kichthuocnuocuong = KichThuocNuocUong.objects.filter(pk=pk)
        kichthuocnuocuong_serializer = KichThuocNuocUongSerializer(kichthuocnuocuong, many=True)
        return JsonResponse(kichthuocnuocuong_serializer.data, safe=False)
    elif request.method == 'PUT':
        kichthuocnuocuong_data = JSONParser().parse(request)
        ma_nuoc_uong = kichthuocnuocuong_data['ma_nuoc_uong']
        size = kichthuocnuocuong_data['size']
        don_gia = kichthuocnuocuong_data['don_gia']

        # Update the KichThuocNuocUong record with the provided ma_nuoc_uong and size
        rows_updated = KichThuocNuocUong.objects.filter(ma_nuoc_uong=ma_nuoc_uong, size=size).update(don_gia=don_gia)

        if rows_updated == 1:
            return JsonResponse({"message": "Updated Successfully"})
        else:
            return JsonResponse({"error": "No record found with the provided ma_nuoc_uong and size"})
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        nuoc_uong = NuocUong.objects.get(ma_mon=data['ma_nuoc_uong'])
        new_item = KichThuocNuocUong.objects.create(
            ma_nuoc_uong=nuoc_uong,
            size=data['size'],
            don_gia=data['don_gia']
        )
        return JsonResponse({"message": "Successfully created"})
    
@csrf_exempt
def giophucvudoanApi(request, pk=None):
    if request.method == 'GET':
        giophucvudoan = GioPhucVuDoAn.objects.filter(pk=pk)
        giophucvudoan_serializer = GioPhucVuDoAnSerializer(giophucvudoan, many=True)
        return JsonResponse(giophucvudoan_serializer.data, safe=False)
    elif request.method == 'PUT':
        giophucvudoan_data = JSONParser().parse(request)
        ma_do_an = giophucvudoan_data['ma_do_an']
        bat_dau = giophucvudoan_data['bat_dau']
        ket_thuc = giophucvudoan_data['ket_thuc']
    
        # Update the KichThuocNuocUong record with the provided ma_nuoc_uong and size
        rows_updated = GioPhucVuDoAn.objects.filter(ma_do_an=ma_do_an, bat_dau=bat_dau).update(ket_thuc=ket_thuc)
    
        if rows_updated == 1:
            return JsonResponse({"message": "Updated Successfully"})
        else:
            return JsonResponse({"error": "No record found with the provided ma_nuoc_uong and size"})
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        do_an = DoAn.objects.get(ma_mon=data['ma_do_an'])
        new_item = GioPhucVuDoAn.objects.create(
            ma_do_an=do_an,
            bat_dau=data['bat_dau'],
            ket_thuc=data['ket_thuc']
        )
        return JsonResponse({"message": "Successfully created"})
