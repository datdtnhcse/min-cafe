drop database mincoffee;

create database mincoffee;

use mincoffee;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE khu (
    ma_khu VARCHAR(3) PRIMARY KEY,
    ten_khu VARCHAR(255) NOT NULL UNIQUE -- CONSTRAINT chk_ma_khu CHECK (ma_khu REGEXP '^K[0-9]{2}$')
);

CREATE TABLE ban (
    ma_khu VARCHAR(3),
    stt INT,
    so_ghe INT,
    PRIMARY KEY (ma_khu, stt),
    FOREIGN KEY (ma_khu) REFERENCES khu (ma_khu),
    CONSTRAINT chk_so_ghe CHECK (
        so_ghe BETWEEN 0
        AND 10
    )
);

CREATE TABLE phong_vip (
    ma_phong VARCHAR(10) PRIMARY KEY,
    ma_khu VARCHAR(3),
    so_khach_toi_thieu INT,
    so_khach_toi_da INT,
    FOREIGN KEY (ma_khu) REFERENCES khu (ma_khu),
    -- CONSTRAINT chk_ma_phong CHECK (ma_phong REGEXP '^VIP[0-9]+$'),
    CONSTRAINT chk_so_khach_toi_thieu CHECK (
        so_khach_toi_thieu BETWEEN 1
        AND 10
    ),
    CONSTRAINT chk_so_khach_toi_da CHECK (
        so_khach_toi_da > so_khach_toi_thieu
        AND so_khach_toi_da < 50
    )
);

CREATE TABLE nhom (
    ma_nhom INT AUTO_INCREMENT PRIMARY KEY,
    ten_nhom VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE mon_an (
    ma_mon VARCHAR(5) PRIMARY KEY,
    ten_mon VARCHAR(255) NOT NULL,
    hinh_anh VARCHAR(255),
    ma_nhom INT,
    FOREIGN KEY (ma_nhom) REFERENCES nhom (ma_nhom) -- CONSTRAINT chk_ma_mon CHECK (ma_mon REGEXP '^[D|F][0-9]{4}$')
);

INSERT INTO
    khu
VALUES
    ('K01', 'KhuMayLanh'),
    ('K02', 'KhuNgoaiTroi'),
    ('K03', 'KhuVuon'),
    ('K04', 'KhuThuong');

INSERT INTO
    ban
VALUES
    ('K01', 1, 4),
    ('K01', 2, 3),
    ('K02', 1, 5),
    ('K02', 2, 5),
    ('K03', 1, 2),
    ('K03', 2, 3),
    ('K04', 1, 3),
    ('K04', 2, 4);

INSERT INTO
    phong_vip
VALUES
    ('VIP1', 'K01', 1, 30),
    ('VIP2', 'K01', 5, 35),
    ('VIP3', 'K02', 2, 37),
    ('VIP4', 'K02', 5, 42),
    ('VIP5', 'K03', 4, 38),
    ('VIP6', 'K03', 7, 35),
    ('VIP7', 'K04', 8, 49),
    ('VIP8', 'K04', 10, 40);

INSERT INTO
    nhom
VALUES
    (1, 'A'),
    (2, 'B'),
    (3, 'C'),
    (4, 'D');

INSERT INTO
    mon_an
VALUES
    ('D0000', 'coca', '', 4),
    ('D0001', 'pepsi', '', 4),
    ('D0002', 'sting', '', 4),
    ('D0003', 'vodka', '', 3),
    ('F0000', 'Thịt bò xào', '', 4),
    ('F0001', 'Ba rọi chiên', '', 3),
    ('F0002', 'Tôm nướng', '', 2),
    ('F0003', 'Tôm hùm hấp', '', 1);

-- 
--
--
create table nuoc_uong (
    ma_mon varchar(5) primary key,
    constraint fk_maMon foreign key (ma_mon) references mon_an(ma_mon) -- constraint check_maMon check (ma_mon regexp '^D[0-9]{4}$')
);

create table kich_thuoc_nuoc_uong (
    ma_nuoc_uong varchar(5),
    size enum ('S', 'M', 'L'),
    don_gia int,
    primary key (ma_nuoc_uong, size),
    constraint fk_ma_nuoc_uong foreign key (ma_nuoc_uong) references nuoc_uong(ma_mon) -- constraint check_ma_nuoc_uong check (ma_nuoc_uong regexp '^D[0-9]{4}$')
);

create table do_an (
    ma_mon varchar(5) primary key,
    don_gia int,
    constraint fk_ma_mon foreign key (ma_mon) references mon_an(ma_mon) -- constraint check_ma_mon check (ma_mon regexp '^F[0-9]{4}$')
);

create table gio_phuc_vu_do_an (
    ma_do_an varchar(5),
    constraint fk_ma_do_an foreign key (ma_do_an) references do_an(ma_mon),
    -- constraint check_ma_do_an check (ma_do_an regexp '^F[0-9]{4}$'),
    bat_dau time,
    ket_thuc time,
    CONSTRAINT check_ngay CHECK (
        STR_TO_DATE(bat_dau, '%H:%i') < STR_TO_DATE(ket_thuc, '%H:%i')
    ),
    primary key (ma_do_an, bat_dau)
);

create table khach_hang (
    CMND varchar(12) primary key,
    ho_ten varchar(50),
    gioi_tinh enum('M', 'F'),
    ngay_sinh date,
    so_dien_thoai varchar(10),
    so_nha int,
    duong varchar(150),
    quan varchar(150),
    phuong varchar(150),
    tinh varchar(150),
    diem int unsigned not null default 0
);

--
--
--
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
    CONSTRAINT PK_nha_cung_cap PRIMARY KEY(ma_ncc) -- CONSTRAINT Check_ma_ncc CHECK(REGEXP_LIKE(ma_ncc,'NCC[0-9][0-9][0-9]'))
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
    ma_khach_hang varchar(12),
    da_thanh_toan enum('Yes', 'No') default 'No',
    CONSTRAINT FK_hoa_don_ma_khach_hang FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(cmnd),
    -- CONSTRAINT Check_ma_hoa_don CHECK(ma_hoa_don REGEXP '^HD[0-9]{8}[0-9]{6}$'),
    CONSTRAINT Check_gio_vao CHECK(gio_ra > gio_vao)
);

create table hoa_don_gom_nuoc_uong(
    ma_hoa_don varchar(17),
    ma_nuoc_uong varchar(5),
    size enum('S', 'M', 'L'),
    so_luong integer unsigned not null default 1,
    CONSTRAINT PK_nuoc_uong_hoa_don PRIMARY KEY(ma_hoa_don, ma_nuoc_uong, size),
    CONSTRAINT FK_nuoc_uong_ma_hoa_don FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    CONSTRAINT FK_nuoc_uong_ma_mon FOREIGN KEY (ma_nuoc_uong, size) REFERENCES kich_thuoc_nuoc_uong(ma_nuoc_uong, size)
);

create table hoa_don_gom_do_an(
    ma_hoa_don varchar(17),
    ma_mon char(5),
    so_luong integer unsigned not null default 1,
    CONSTRAINT PK_do_an_hoa_don PRIMARY KEY(ma_hoa_don, ma_mon),
    CONSTRAINT FK_do_an_ma_hoa_don FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    CONSTRAINT FK_do_an_ma_mon FOREIGN KEY (ma_mon) REFERENCES do_an(ma_mon)
);

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC001',
        'CÔNG TY CP GREENFEED',
        '1100598642',
        '0723632881',
        '72-74',
        'Nguyễn Thị Minh Khai',
        'Bến Lức',
        'Nhựt Chánh',
        'Long An',
        200
    );

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC002',
        'CÔNG TY CP MASAN MEATLIFE',
        '0311224517',
        '0962563862',
        '17',
        'Lê Duẩn',
        'Quận 1',
        'Bến Nghé',
        'TP Hồ Chí Minh',
        250
    );

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC003',
        'CÔNG TY CP DAESANG ĐỨC VIỆT',
        '0900214029',
        '0221970229',
        '82',
        'Duy Tân',
        'Yên Mỹ',
        'Tân Lập',
        'Hưng Yên',
        60
    );

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC004',
        'TẬP ĐOÀN TRUNG NGUYÊN LEGEND',
        '0304324655',
        '0283921845',
        '82-84',
        'Bùi Thị Xuân',
        'Quận 1',
        'Bến Thành',
        'TP Hồ Chí Minh',
        150
    );

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC005',
        'CÔNG TY CP VINACAFE BIÊN HÒA',
        '3600261626',
        '0253836554',
        '1-6',
        'KCN Biên Hòa 1',
        'Bình Đa',
        'An Bình',
        'Đồng Nai',
        120
    );

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC006',
        'CÔNG TY CP THỰC PHẨM HỮU NGHỊ',
        '0102109239',
        '8642579',
        '122',
        'Định Công',
        'Hoàng Mai',
        'Định Công',
        'Hà Nội',
        230
    );

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC007',
        'CÔNG TY CP THỰC PHẨM NUTIFOOD',
        '0301951270',
        '0838267999',
        '281-283',
        'Hoàng Diệu',
        'Quận 4',
        'Phường 6',
        'TP Hồ Chí Minh',
        180
    );

INSERT INTO
    nha_cung_cap
VALUES
(
        'NCC008',
        'CÔNG TY CP ACECOOK VIỆT NAM',
        '0300808687',
        '0238154064',
        'Lô II-3',
        'Đường số 11',
        'Tân Phú',
        'Tây Thạnh',
        'TP Hồ Chí Minh',
        250
    );

INSERT INTO
    email_ncc
VALUES
('NCC008', 'acecookvietnam@vnn.vn');

INSERT INTO
    email_ncc
VALUES
('NCC008', 'info@acecookvietnam.com');

INSERT INTO
    email_ncc
VALUES
('NCC005', 'vinacafe@vinacafebienhoa.com');

INSERT INTO
    email_ncc
VALUES
('NCC004', 'cs@trungnguyenlegend.com');

INSERT INTO
    email_ncc
VALUES
('NCC001', 'webinfo@greenfeed.com.vn');

INSERT INTO
    email_ncc
VALUES
('NCC007', 'nutifood@nutifood.com.vn');

INSERT INTO
    email_ncc
VALUES
('NCC005', 'bienhoacoffee@hcm.vnn.vn');

INSERT INTO
    email_ncc
VALUES
('NCC006', 'media@huunghi.com.vn');

INSERT INTO
    sdt_ncc
VALUES
('NCC004', '0283978845');

INSERT INTO
    sdt_ncc
VALUES
('NCC002', '0267898862');

INSERT INTO
    sdt_ncc
VALUES
('NCC003', '0221977569');

INSERT INTO
    sdt_ncc
VALUES
('NCC003', '0221974519');

INSERT INTO
    sdt_ncc
VALUES
('NCC007', '0274356420');

INSERT INTO
    sdt_ncc
VALUES
('NCC001', '0723645881');

INSERT INTO
    sdt_ncc
VALUES
('NCC005', '0251383654');

INSERT INTO
    sdt_ncc
VALUES
('NCC008', '0838150969');

INSERT INTO
    hoa_don
VALUES
    (
        'HD01042023000001',
        '2023-04-01',
        2,
        '10:00',
        '12:00',
        2,
        150000,
        '590790797332',
        'Yes'
    ),
    (
        'HD01042023000002',
        '2023-04-01',
        3,
        '11:30',
        '15:00',
        4,
        340000,
        '590573812392',
        'Yes'
    ),
    (
        'HD02042023000001',
        '2022-04-02',
        4,
        '9:00',
        '11:30',
        6,
        590000,
        '569840921091',
        'Yes'
    ),
    (
        'HD10042023000001',
        '2022-04-10',
        10,
        '09:00',
        '15:30',
        9,
        2700000,
        '469226193031',
        'No'
    );

INSERT INTO
    hoa_don_gom_nuoc_uong
VALUES
    ('HD01042023000001', 'D0000', 'S', 1),
    ('HD01042023000001', 'F0001', 'L', 1),
    ('HD01042023000002', 'D0003', 'M', 2),
    ('HD01042023000002', 'F0002', 'L', 2),
    ('HD02042023000001', 'D0001', 'L', 3),
    ('HD02042023000001', 'F0003', 'S', 2),
    ('HD02042023000001', 'F0002', 'S', 1),
    ('HD10042023000001', 'D0002', 'M', 4),
    ('HD10042023000001', 'F0000', 'M', 1),
    ('HD10042023000001', 'F0003', 'L', 5);

INSERT INTO
    hoa_don_gom_do_an
VALUES
    ('HD01042023000001', 'F0001', 1),
    ('HD01042023000002', 'F0002', 2),
    ('HD02042023000001', 'F0003', 2),
    ('HD02042023000001', 'F0002', 1),
    ('HD10042023000001', 'F0000', 1),
    ('HD10042023000001', 'F0003', 5);

--
--
--
create table ban_hoa_don (
    ma_hoa_don varchar(17) not null,
    ma_khu varchar(3) not null,
    stt int not null,
    CONSTRAINT pk_banhoadon PRIMARY KEY (ma_hoa_don, ma_khu, stt),
    CONSTRAINT fk_banhoadon_hoadon FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    CONSTRAINT fk_banhoadon_ban FOREIGN KEY (ma_khu, stt) REFERENCES ban(ma_khu, stt)
);

INSERT INTO
    ban_hoa_don
VALUES
    ('HD10042023000001', 'K01', 1),
    ('HD02042023000001', 'K01', 2),
    ('HD01042023000002', 'K02', 2),
    ('HD01042023000001', 'K01', 1),
    ('HD01042023000001', 'K03', 1),
    ('HD01042023000002', 'K03', 5);

create table phong_vip_hoa_don (
    ma_hoa_don varchar(17) not null,
    ma_phong_vip varchar(10) not null,
    CONSTRAINT pk_phongviphoadon PRIMARY KEY (ma_hoa_don, ma_phong_vip),
    CONSTRAINT fk_phongviphoadon_hoadon FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    CONSTRAINT fk_phongviphoadon_phongvip FOREIGN KEY (ma_phong_vip) REFERENCES phong_vip(ma_phong)
);

INSERT INTO
    phong_vip_hoa_don
VALUES
    ('HD10042023000001', 'VIP1'),
    ('HD02042023000001', 'VIP2'),
    ('HD01042023000002', 'VIP3'),
    ('HD01042023000001', 'VIP3'),
    ('HD01042023000001', 'VIP5'),
    ('HD01042023000002', 'VIP6');

create table nguyen_lieu (
    ma_nguyen_lieu varchar(6) primary key,
    ten varchar(255) not null unique,
    don_vi_tinh enum('g', 'kg', 'lít', 'thùng', 'lon') not null,
    mo_ta varchar(1000) -- CONSTRAINT check_manguyenlieu CHECK (ma_nguyen_lieu REGEXP '^NL[0-9]{4}$')
);

INSERT INTO
    nguyen_lieu
VALUES
    (
        'NL0001',
        'Thịt bò',
        'kg',
        'Thịt được lấy từ con bò'
    ),
    (
        'NL0002',
        'Hành lá',
        'g',
        'Hành lá hay còn được gọi là hành hương, hành hoa hoặc hành ta. Tại một số nước, hành lá có các tên Tiếng Anh khác nhau như Green onion hoặc Welsh onion. Tuy nhiên nhiều người thường dễ bị nhầm lẫn chúng với những loại hành khác, chẳng hạn như hành tây cho nên những tên gọi này thường ít khi được sử dụng.'
    ),
    (
        'NL0003',
        'Ngò',
        'g',
        'Rau mùi hay còn gọi là ngò, ngò rí, ngò suôn, hồ tuy, mùi tui, mùi ta, nguyên tuy, hương tuy, là loài cây thân thảo sống hằng năm thuộc họ Hoa tán, có nguồn gốc bản địa từ Tây Nam Á về phía tây đến tận châu Phi.'
    ),
    (
        'NL0004',
        'Tiêu',
        'g',
        'Hồ tiêu còn gọi là tiêu ăn, cổ nguyệt, hắc cổ nguyệt, bạch cổ nguyệt là một loài cây leo có hoa thuộc họ Hồ tiêu, trồng chủ yếu để lấy quả và hạt, thường dùng làm gia vị dưới dạng khô hoặc tươi. Hoa hồ tiêu là quốc hoa của đất nước Liberia.'
    ),
    (
        'NL0005',
        'Đường',
        'g',
        'Đường hay chính xác hơn là đường ăn là tên gọi chung của những hợp chất hóa học ở dạng tinh thể thuộc nhóm phân tử cacbohydrat. Đường, đường hạt, hoặc đường thông thường, đề cập đến saccarose, một disaccharide bao gồm glucose và fructose.'
    ),
    (
        'NL0006',
        'Tỏi',
        'g',
        'Tỏi là một loài thực vật thuộc họ Hành, nghĩa là có họ hàng với hành tây, hành ta, hành tím, tỏi tây, v.v... và cũng được con người sử dụng làm gia vị, thuốc, rau như những loài họ hàng của nó. '
    );

create table cung_cap (
    ma_nguyen_lieu varchar(7),
    ma_mon varchar(5),
    ma_ncc varchar(6),
    CONSTRAINT pk_cungcap PRIMARY KEY (ma_nguyen_lieu, ma_mon),
    CONSTRAINT fk_cungcap_nguyenlieu FOREIGN KEY (ma_nguyen_lieu) REFERENCES nguyen_lieu(ma_nguyen_lieu),
    CONSTRAINT fk_cungcap_monan FOREIGN KEY (ma_mon) REFERENCES mon_an(ma_mon),
    CONSTRAINT fk_cungcap_nhacungcap FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);

INSERT INTO
    cung_cap
VALUES
    ('NL0001', 'D0000', 'NCC001'),
    ('NL0002', 'D0005', 'NCC002'),
    ('NL0003', 'D0003', 'NCC003'),
    ('NL0004', 'D0002', 'NCC004'),
    ('NL0005', 'D0003', 'NCC005');

create table mua_nguyen_lieu (
    ma_nguyen_lieu varchar(7),
    ma_ncc varchar(6),
    don_gia int not null,
    CONSTRAINT pk_muanguyenlieu PRIMARY KEY (ma_nguyen_lieu, ma_ncc),
    CONSTRAINT fk_muanguyenlieu_nguyenlieu FOREIGN KEY (ma_nguyen_lieu) REFERENCES nguyen_lieu(ma_nguyen_lieu),
    CONSTRAINT fk_muanguyenlieu_nhacungcap FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);

INSERT INTO
    mua_nguyen_lieu
VALUES
    ('NL0001', 'NCC001', '10000'),
    ('NL0002', 'NCC002', '4000'),
    ('NL0003', 'NCC003', '6000'),
    ('NL0004', 'NCC004', '7000'),
    ('NL0005', 'NCC005', '80000');

create table lan_mua (
    ma_nguyen_lieu varchar(7),
    ma_ncc varchar(6),
    thoi_gian datetime not null,
    so_luong int not null default 1,
    CONSTRAINT pk_lanmua PRIMARY KEY (ma_nguyen_lieu, ma_ncc, thoi_gian),
    CONSTRAINT fk_lanmua_nguyenlieu FOREIGN KEY (ma_nguyen_lieu) REFERENCES nguyen_lieu(ma_nguyen_lieu),
    CONSTRAINT fk_lanmua_nhacungcap FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);

INSERT INTO
    lan_mua
VALUES
    ('NL0001', 'NCC001', '2023-01-23 12:45:56', 54),
    ('NL0002', 'NCC002', '2023-02-25 11:26:52', 233),
    ('NL0003', 'NCC003', '2023-03-11 05:42:56', 121),
    ('NL0004', 'NCC004', '2023-04-01 08:20:23', 123),
    ('NL0005', 'NCC005', '2023-01-21 12:45:56', 123);