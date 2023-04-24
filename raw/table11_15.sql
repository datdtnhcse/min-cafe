create table nha_cung_cap(
	ma_ncc varchar(6),
    ten_ncc varchar(50),
    ma_so_thue varchar(10) unique,
    sdt varchar(10),
    so_nha varchar(15),
    duong varchar(50),
    quan_huyen varchar(50),
    phuong_xa varchar(50),
    tinh_thanh varchar(50),
    diem int,
    CONSTRAINT PK_nha_cung_cap PRIMARY KEY(ma_ncc)
    -- CONSTRAINT Check_ma_ncc CHECK(REGEXP_LIKE(ma_ncc,'NCC[0-9][0-9][0-9]'))
);

create table email_ncc(
	ma_ncc varchar(6),
    email varchar(50),
    CONSTRAINT PK_email_ncc PRIMARY KEY(ma_ncc, email),
    CONSTRAINT FK_email_ncc_ma_ncc FOREIGN KEY(ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);
create table sdt_ncc(
	ma_ncc varchar(6),
    sdt varchar(10),
    CONSTRAINT PK_sdt_ncc PRIMARY KEY(ma_ncc, sdt),
    CONSTRAINT FK_sdt_ncc_ma_ncc FOREIGN KEY(ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);
create table hoa_don(
	ma_hoa_don varchar(17) PRIMARY KEY,
    ngay date,
    sl_khach int,
    gio_vao time,
    gio_ra time,
    sl_mon int,
    tong_tien float not null default 0,
	ma_khach_hang  varchar(12),
    da_thanh_toan enum('Yes', 'No') default 'No',
    CONSTRAINT FK_hoa_don_ma_khach_hang FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    -- CONSTRAINT Check_ma_hoa_don CHECK(ma_hoa_don REGEXP '^HD[0-9]{8}[0-9]{6}$'),
    CONSTRAINT Check_gio_vao CHECK(gio_ra > gio_vao)
);

create table mon_an_hoa_don(
	ma_hoa_don varchar(17),
    ma_mon char(5), 
    so_luong integer unsigned not null default 1,
    CONSTRAINT PK_mon_an_hoa_don PRIMARY KEY(ma_hoa_don, ma_mon),
    CONSTRAINT FK_mon_an_ma_hoa_don FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    CONSTRAINT FK_mon_an_ma_mon FOREIGN KEY (ma_mon) REFERENCES mon_an(ma_mon)
);
INSERT INTO nha_cung_cap VALUES('NCC001','CÔNG TY CP GREENFEED','1100598642','0723632881','72-74',
'Nguyễn Thị Minh Khai','Bến Lức', 'Nhựt Chánh','Long An', 200);
INSERT INTO nha_cung_cap VALUES('NCC002','CÔNG TY CP MASAN MEATLIFE','0311224517','0962563862','17',
'Lê Duẩn','Quận 1', 'Bến Nghé','TP Hồ Chí Minh', 250);
INSERT INTO nha_cung_cap VALUES('NCC003','CÔNG TY CP DAESANG ĐỨC VIỆT','0900214029','0221970229','82',
'Duy Tân','Yên Mỹ', 'Tân Lập','Hưng Yên', 60);
INSERT INTO nha_cung_cap VALUES('NCC004','TẬP ĐOÀN TRUNG NGUYÊN LEGEND','0304324655','0283921845','82-84',
'Bùi Thị Xuân','Quận 1', 'Bến Thành','TP Hồ Chí Minh', 150);
INSERT INTO nha_cung_cap VALUES('NCC005','CÔNG TY CP VINACAFE BIÊN HÒA','3600261626','0253836554','1-6',
'KCN Biên Hòa 1','Bình Đa', 'An Bình','Đồng Nai', 120);
INSERT INTO nha_cung_cap VALUES('NCC006','CÔNG TY CP THỰC PHẨM HỮU NGHỊ','0102109239','8642579','122',
'Định Công','Hoàng Mai', 'Định Công','Hà Nội', 230);
INSERT INTO nha_cung_cap VALUES('NCC007','CÔNG TY CP THỰC PHẨM NUTIFOOD','0301951270','0838267999','281-283',
'Hoàng Diệu','Quận 4', 'Phường 6','TP Hồ Chí Minh', 180);
INSERT INTO nha_cung_cap VALUES('NCC008','CÔNG TY CP ACECOOK VIỆT NAM','0300808687','0238154064','Lô II-3',
'Đường số 11','Tân Phú', 'Tây Thạnh','TP Hồ Chí Minh', 250);


INSERT INTO email_ncc VALUES('NCC008', 'acecookvietnam@vnn.vn');
INSERT INTO email_ncc VALUES('NCC008', 'info@acecookvietnam.com');
INSERT INTO email_ncc VALUES('NCC005', 'vinacafe@vinacafebienhoa.com');
INSERT INTO email_ncc VALUES('NCC004', 'cs@trungnguyenlegend.com');
INSERT INTO email_ncc VALUES('NCC001', 'webinfo@greenfeed.com.vn');
INSERT INTO email_ncc VALUES('NCC007', 'nutifood@nutifood.com.vn');
INSERT INTO email_ncc VALUES('NCC005', 'bienhoacoffee@hcm.vnn.vn');
INSERT INTO email_ncc VALUES('NCC006', 'media@huunghi.com.vn');

INSERT INTO sdt_ncc VALUES('NCC004', '0283978845');
INSERT INTO sdt_ncc VALUES('NCC002', '0267898862');
INSERT INTO sdt_ncc VALUES('NCC003', '0221977569');
INSERT INTO sdt_ncc VALUES('NCC003', '0221974519');
INSERT INTO sdt_ncc VALUES('NCC007', '0274356420');
INSERT INTO sdt_ncc VALUES('NCC001', '0723645881');
INSERT INTO sdt_ncc VALUES('NCC005', '0251383654');
INSERT INTO sdt_ncc VALUES('NCC008', '0838150969');

INSERT INTO hoa_don
VALUES
('HD01042023000001', '2023-04-01', 2, '10:00', '12:00', 2, 150000, '590790797332', 'Yes'),
('HD01042023000002', '2023-04-01', 3, '11:30', '15:00', 4, 340000, '590573812392', 'Yes'),
('HD02042023000001', '2022-04-02', 4, '9:00', '11:30', 6, 590000,  '569840921091', 'Yes'),
('HD10042023000001', '2022-04-10', 10, '09:00', '15:30', 9, 2700000, '469226193031', 'No');

INSERT INTO mon_an_hoa_don
VALUES
('HD01042023000001', 'D0000', 1),
('HD01042023000001', 'F0001', 1),
('HD01042023000002', 'D0003', 2),
('HD01042023000002', 'F0002', 2),
('HD02042023000001', 'D0001', 3),
('HD02042023000001', 'F0003', 2),
('HD02042023000001', 'F0002', 1),
('HD10042023000001', 'D0002', 4),
('HD10042023000001', 'F0000', 1),
('HD10042023000001', 'F0003', 5);
