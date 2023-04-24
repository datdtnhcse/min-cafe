CREATE TABLE bang_khu (
  ma_khu CHAR(3) PRIMARY KEY,
  ten_khu VARCHAR(255) NOT NULL UNIQUE,
  CONSTRAINT chk_ma_khu CHECK (ma_khu REGEXP '^K[0-9]{2}$')
);
CREATE TABLE bang_ban (
  ma_khu CHAR(3),
  stt INT,
  so_ghe INT,
  PRIMARY KEY (ma_khu, stt),
  FOREIGN KEY (ma_khu) REFERENCES bang_khu (ma_khu),
  CONSTRAINT chk_so_ghe CHECK (so_ghe BETWEEN 0 AND 10)
);
CREATE TABLE bang_phong_vip (
  ma_phong VARCHAR(10) PRIMARY KEY,
  ma_khu CHAR(3),
  so_khach_toi_thieu INT,
  so_khach_toi_da INT,
  FOREIGN KEY (ma_khu) REFERENCES bang_khu (ma_khu),
  CONSTRAINT chk_ma_phong CHECK (ma_phong REGEXP '^VIP[0-9]+$'),
  CONSTRAINT chk_so_khach_toi_thieu CHECK (so_khach_toi_thieu BETWEEN 1 AND 10),
  CONSTRAINT chk_so_khach_toi_da CHECK (so_khach_toi_da > so_khach_toi_thieu AND so_khach_toi_da < 50)
);
CREATE TABLE bang_nhom (
  ma_nhom INT AUTO_INCREMENT PRIMARY KEY,
  ten_nhom VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE bang_mon_an (
  ma_mon CHAR(6) PRIMARY KEY,
  ten_mon VARCHAR(255) NOT NULL,
  hinh_anh VARCHAR(255),
  ma_nhom INT,
  FOREIGN KEY (ma_nhom) REFERENCES bang_nhom (ma_nhom),
  CONSTRAINT chk_ma_mon CHECK (ma_mon REGEXP '^[D|F][0-9]{4}$')
);

INSERT INTO bang_khu VALUES ('K01','KhuMayLanh'),
						('K02','KhuNgoaiTroi'),
                        ('K03','KhuVuon'),
                        ('K04','KhuThuong');
INSERT INTO bang_ban VALUES ('K01',1,4),
						('K01',2,3),
                        ('K02',1,5),
                        ('K02',2,5),
                        ('K03',1,2),
                        ('K03',2,3),
                        ('K04',1,3),
                        ('K04',2,4);
INSERT INTO bang_phong_vip VALUES ('VIP1', 'K01', 1, 30),
							('VIP2', 'K01', 5, 35),
                            ('VIP3', 'K02', 2, 37),
                            ('VIP4', 'K02', 5, 42),
                            ('VIP5', 'K03', 4, 38),
                            ('VIP6', 'K03', 7, 35),
                            ('VIP7', 'K04', 8, 49),
                            ('VIP8', 'K04', 10, 40);
INSERT INTO bang_nhom VALUES (1,'A'),
						(2,'B'),
                        (3,'C'),
                        (4,'D');
INSERT INTO bang_mon_an VALUES ('D0000','coca','', 4),
						 ('D0001','pepsi','', 4),
                         ('D0002','sting','', 4),
                         ('D0003','vodka','', 3),
                         ('F0000','Thịt bò xào','', 4),
                         ('F0001','Ba rọi chiên','', 3),
                         ('F0002','Tôm nướng','', 2),
                         ('F0003','Tôm hùm hấp','', 1);