# # This is an auto-generated Django model module.
# # You'll have to do the following manually to clean this up:
# #   * Rearrange models' order
# #   * Make sure each model has one field with primary_key=True
# #   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
# #   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# # Feel free to rename the models, but don't rename db_table values or field names.
# from django.db import models


# class AuthGroup(models.Model):
#     name = models.CharField(unique=True, max_length=150)

#     class Meta:
#         managed = False
#         db_table = 'auth_group'


# class AuthGroupPermissions(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
#     permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'auth_group_permissions'
#         unique_together = (('group', 'permission'),)


# class AuthPermission(models.Model):
#     name = models.CharField(max_length=255)
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
#     codename = models.CharField(max_length=100)

#     class Meta:
#         managed = False
#         db_table = 'auth_permission'
#         unique_together = (('content_type', 'codename'),)


# class AuthUser(models.Model):
#     password = models.CharField(max_length=128)
#     last_login = models.DateTimeField(blank=True, null=True)
#     is_superuser = models.IntegerField()
#     username = models.CharField(unique=True, max_length=150)
#     first_name = models.CharField(max_length=150)
#     last_name = models.CharField(max_length=150)
#     email = models.CharField(max_length=254)
#     is_staff = models.IntegerField()
#     is_active = models.IntegerField()
#     date_joined = models.DateTimeField()

#     class Meta:
#         managed = False
#         db_table = 'auth_user'


# class AuthUserGroups(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'auth_user_groups'
#         unique_together = (('user', 'group'),)


# class AuthUserUserPermissions(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'auth_user_user_permissions'
#         unique_together = (('user', 'permission'),)


# class Ban(models.Model):
#     ma_khu = models.OneToOneField('Khu', models.DO_NOTHING, db_column='ma_khu', primary_key=True)
#     stt = models.IntegerField()
#     so_ghe = models.IntegerField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'ban'
#         unique_together = (('ma_khu', 'stt'),)


# class BanHoaDon(models.Model):
#     ma_hoa_don = models.OneToOneField('HoaDon', models.DO_NOTHING, db_column='ma_hoa_don', primary_key=True)
#     ma_khu = models.ForeignKey(Ban, models.DO_NOTHING, db_column='ma_khu')
#     stt = models.ForeignKey(Ban, models.DO_NOTHING, db_column='stt', to_field='stt')

#     class Meta:
#         managed = False
#         db_table = 'ban_hoa_don'
#         unique_together = (('ma_hoa_don', 'ma_khu', 'stt'),)


# class CungCap(models.Model):
#     ma_nguyen_lieu = models.OneToOneField('NguyenLieu', models.DO_NOTHING, db_column='ma_nguyen_lieu', primary_key=True)
#     ma_mon = models.ForeignKey('MonAn', models.DO_NOTHING, db_column='ma_mon')
#     ma_ncc = models.ForeignKey('NhaCungCap', models.DO_NOTHING, db_column='ma_ncc', blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'cung_cap'
#         unique_together = (('ma_nguyen_lieu', 'ma_mon'),)


# class DjangoAdminLog(models.Model):
#     action_time = models.DateTimeField()
#     object_id = models.TextField(blank=True, null=True)
#     object_repr = models.CharField(max_length=200)
#     action_flag = models.PositiveSmallIntegerField()
#     change_message = models.TextField()
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'django_admin_log'


# class DjangoContentType(models.Model):
#     app_label = models.CharField(max_length=100)
#     model = models.CharField(max_length=100)

#     class Meta:
#         managed = False
#         db_table = 'django_content_type'
#         unique_together = (('app_label', 'model'),)


# class DjangoMigrations(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     app = models.CharField(max_length=255)
#     name = models.CharField(max_length=255)
#     applied = models.DateTimeField()

#     class Meta:
#         managed = False
#         db_table = 'django_migrations'


# class DjangoSession(models.Model):
#     session_key = models.CharField(primary_key=True, max_length=40)
#     session_data = models.TextField()
#     expire_date = models.DateTimeField()

#     class Meta:
#         managed = False
#         db_table = 'django_session'


# class DoAn(models.Model):
#     ma_mon = models.OneToOneField('MonAn', models.DO_NOTHING, db_column='ma_mon', primary_key=True)
#     don_gia = models.IntegerField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'do_an'


# class EmailNcc(models.Model):
#     ma_ncc = models.OneToOneField('NhaCungCap', models.DO_NOTHING, db_column='ma_ncc', primary_key=True)
#     email = models.CharField(max_length=50)

#     class Meta:
#         managed = False
#         db_table = 'email_ncc'
#         unique_together = (('ma_ncc', 'email'),)


# class GioPhucVuDoAn(models.Model):
#     ma_do_an = models.OneToOneField(DoAn, models.DO_NOTHING, db_column='ma_do_an', primary_key=True)
#     bat_dau = models.TimeField()
#     ket_thuc = models.TimeField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'gio_phuc_vu_do_an'
#         unique_together = (('ma_do_an', 'bat_dau'),)


# class HoaDon(models.Model):
#     ma_hoa_don = models.CharField(primary_key=True, max_length=17)
#     ngay = models.DateField(blank=True, null=True)
#     sl_khach = models.IntegerField(blank=True, null=True)
#     gio_vao = models.TimeField(blank=True, null=True)
#     gio_ra = models.TimeField(blank=True, null=True)
#     sl_mon = models.IntegerField(blank=True, null=True)
#     tong_tien = models.FloatField()
#     ma_khach_hang = models.ForeignKey('KhachHang', models.DO_NOTHING, db_column='ma_khach_hang', blank=True, null=True)
#     da_thanh_toan = models.CharField(max_length=3, blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'hoa_don'


# class HoaDonGomDoAn(models.Model):
#     ma_hoa_don = models.OneToOneField(HoaDon, models.DO_NOTHING, db_column='ma_hoa_don', primary_key=True)
#     ma_mon = models.ForeignKey(DoAn, models.DO_NOTHING, db_column='ma_mon')
#     so_luong = models.PositiveIntegerField()

#     class Meta:
#         managed = False
#         db_table = 'hoa_don_gom_do_an'
#         unique_together = (('ma_hoa_don', 'ma_mon'),)


# class HoaDonGomNuocUong(models.Model):
#     ma_hoa_don = models.OneToOneField(HoaDon, models.DO_NOTHING, db_column='ma_hoa_don', primary_key=True)
#     ma_nuoc_uong = models.ForeignKey('KichThuocNuocUong', models.DO_NOTHING, db_column='ma_nuoc_uong')
#     size = models.ForeignKey('KichThuocNuocUong', models.DO_NOTHING, db_column='size', to_field='size')
#     so_luong = models.PositiveIntegerField()

#     class Meta:
#         managed = False
#         db_table = 'hoa_don_gom_nuoc_uong'
#         unique_together = (('ma_hoa_don', 'ma_nuoc_uong', 'size'),)


# class KhachHang(models.Model):
#     cmnd = models.CharField(db_column='CMND', primary_key=True, max_length=12)  # Field name made lowercase.
#     ho_ten = models.CharField(max_length=50, blank=True, null=True)
#     gioi_tinh = models.CharField(max_length=1, blank=True, null=True)
#     ngay_sinh = models.DateField(blank=True, null=True)
#     so_dien_thoai = models.CharField(max_length=10, blank=True, null=True)
#     so_nha = models.IntegerField(blank=True, null=True)
#     duong = models.CharField(max_length=150, blank=True, null=True)
#     quan = models.CharField(max_length=150, blank=True, null=True)
#     phuong = models.CharField(max_length=150, blank=True, null=True)
#     tinh = models.CharField(max_length=150, blank=True, null=True)
#     diem = models.PositiveIntegerField()

#     class Meta:
#         managed = False
#         db_table = 'khach_hang'


# class Khu(models.Model):
#     ma_khu = models.CharField(primary_key=True, max_length=3)
#     ten_khu = models.CharField(unique=True, max_length=255)

#     class Meta:
#         managed = False
#         db_table = 'khu'


# class KichThuocNuocUong(models.Model):
#     ma_nuoc_uong = models.OneToOneField('NuocUong', models.DO_NOTHING, db_column='ma_nuoc_uong', primary_key=True)
#     size = models.CharField(max_length=1)
#     don_gia = models.IntegerField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'kich_thuoc_nuoc_uong'
#         unique_together = (('ma_nuoc_uong', 'size'),)


# class LanMua(models.Model):
#     ma_nguyen_lieu = models.OneToOneField('NguyenLieu', models.DO_NOTHING, db_column='ma_nguyen_lieu', primary_key=True)
#     ma_ncc = models.ForeignKey('NhaCungCap', models.DO_NOTHING, db_column='ma_ncc')
#     thoi_gian = models.DateTimeField()
#     so_luong = models.IntegerField()

#     class Meta:
#         managed = False
#         db_table = 'lan_mua'
#         unique_together = (('ma_nguyen_lieu', 'ma_ncc', 'thoi_gian'),)


# class MonAn(models.Model):
#     ma_mon = models.CharField(primary_key=True, max_length=5)
#     ten_mon = models.CharField(max_length=255)
#     hinh_anh = models.CharField(max_length=255, blank=True, null=True)
#     ma_nhom = models.ForeignKey('Nhom', models.DO_NOTHING, db_column='ma_nhom', blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'mon_an'


# class MuaNguyenLieu(models.Model):
#     ma_nguyen_lieu = models.OneToOneField('NguyenLieu', models.DO_NOTHING, db_column='ma_nguyen_lieu', primary_key=True)
#     ma_ncc = models.ForeignKey('NhaCungCap', models.DO_NOTHING, db_column='ma_ncc')
#     don_gia = models.IntegerField()

#     class Meta:
#         managed = False
#         db_table = 'mua_nguyen_lieu'
#         unique_together = (('ma_nguyen_lieu', 'ma_ncc'),)


# class NguyenLieu(models.Model):
#     ma_nguyen_lieu = models.CharField(primary_key=True, max_length=6)
#     ten = models.CharField(unique=True, max_length=255)
#     don_vi_tinh = models.CharField(max_length=5)
#     mo_ta = models.CharField(max_length=1000, blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'nguyen_lieu'


# class NhaCungCap(models.Model):
#     ma_ncc = models.CharField(primary_key=True, max_length=6)
#     ten_ncc = models.CharField(max_length=50, blank=True, null=True)
#     ma_so_thue = models.CharField(unique=True, max_length=10, blank=True, null=True)
#     sdt = models.CharField(max_length=10, blank=True, null=True)
#     so_nha = models.CharField(max_length=15, blank=True, null=True)
#     duong = models.CharField(max_length=50, blank=True, null=True)
#     quan_huyen = models.CharField(max_length=50, blank=True, null=True)
#     phuong_xa = models.CharField(max_length=50, blank=True, null=True)
#     tinh_thanh = models.CharField(max_length=50, blank=True, null=True)
#     diem = models.IntegerField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'nha_cung_cap'


# class Nhom(models.Model):
#     ma_nhom = models.AutoField(primary_key=True)
#     ten_nhom = models.CharField(unique=True, max_length=255)

#     class Meta:
#         managed = False
#         db_table = 'nhom'


# class NuocUong(models.Model):
#     ma_mon = models.OneToOneField(MonAn, models.DO_NOTHING, db_column='ma_mon', primary_key=True)

#     class Meta:
#         managed = False
#         db_table = 'nuoc_uong'


# class PhongVip(models.Model):
#     ma_phong = models.CharField(primary_key=True, max_length=10)
#     ma_khu = models.ForeignKey(Khu, models.DO_NOTHING, db_column='ma_khu', blank=True, null=True)
#     so_khach_toi_thieu = models.IntegerField(blank=True, null=True)
#     so_khach_toi_da = models.IntegerField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'phong_vip'


# class PhongVipHoaDon(models.Model):
#     ma_hoa_don = models.OneToOneField(HoaDon, models.DO_NOTHING, db_column='ma_hoa_don', primary_key=True)
#     ma_phong_vip = models.ForeignKey(PhongVip, models.DO_NOTHING, db_column='ma_phong_vip')

#     class Meta:
#         managed = False
#         db_table = 'phong_vip_hoa_don'
#         unique_together = (('ma_hoa_don', 'ma_phong_vip'),)


# class SdtNcc(models.Model):
#     ma_ncc = models.OneToOneField(NhaCungCap, models.DO_NOTHING, db_column='ma_ncc', primary_key=True)
#     sdt = models.CharField(max_length=10)

#     class Meta:
#         managed = False
#         db_table = 'sdt_ncc'
#         unique_together = (('ma_ncc', 'sdt'),)
