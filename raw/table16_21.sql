create table ban_hoa_don (
	ma_hoa_don int not null,
    ma_khu int not null,
    stt int not null,
    CONSTRAINT pk_banhoadon PRIMARY KEY (ma_hoa_don, ma_khu, stt),
    CONSTRAINT fk_banhoadon_hoadon FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    CONSTRAINT fk_banhoadon_ban FOREIGN KEY (ma_khu, stt) REFERENCES ban(ma_khu, stt)
);

create table phong_vip_hoa_don (
	ma_hoa_don int not null,
    ma_phong_vip int not null,
    CONSTRAINT pk_phongviphoadon PRIMARY KEY (ma_hoa_don, ma_phong_vip),
    CONSTRAINT fk_phongviphoadon_hoadon FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    CONSTRAINT fk_phongviphoadon_phongvip FOREIGN KEY (ma_phong_vip) REFERENCES phong_vip(ma_phong)
);

create table nguyen_lieu (
	ma_nguyen_lieu varchar(7) primary key,
    ten varchar(255) not null unique,
    don_vi_tinh enum('gram', 'kilogram', 'lit', 'box', 'can') not null,
    mo_ta varchar(255),
	CONSTRAINT check_manguyenlieu CHECK (ma_nguyen_lieu REGEXP '^NL[0-9]{4}$')
);

create table cung_cap (
	ma_nguyen_lieu varchar(7),
    ma_mon varchar(5),
    ma_ncc varchar(6),
    CONSTRAINT pk_cungcap PRIMARY KEY (ma_nguyen_lieu, ma_mon),
    CONSTRAINT fk_cungcap_nguyenlieu FOREIGN KEY (ma_nguyen_lieu) REFERENCES hoa_don(ma_nguyen_lieu),
    CONSTRAINT fk_cungcap_monan FOREIGN KEY (ma_mon) REFERENCES mon_an(ma_mon),
    CONSTRAINT fk_cungcap_nhacungcap FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);

create table mua_nguyen_lieu (
	ma_nguyen_lieu varchar(7),
    ma_ncc varchar(6),
    don_gia int not null,
    CONSTRAINT pk_muanguyenlieu PRIMARY KEY (ma_nguyen_lieu, ma_ncc),
    CONSTRAINT fk_muanguyenlieu_nguyenlieu FOREIGN KEY (ma_nguyen_lieu) REFERENCES nguyen_lieu(ma_nguyen_lieu),
    CONSTRAINT fk_muanguyenlieu_nhacungcap FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);

create table lan_mua (
	ma_nguyen_lieu varchar(7),
	ma_ncc varchar(6),
    thoi_gian datetime not null,
    so_luong int not null default 1,
    CONSTRAINT pk_lanmua PRIMARY KEY (ma_nguyen_lieu, ma_ncc, thoi_gian),
	CONSTRAINT fk_lanmua_nguyenlieu FOREIGN KEY (ma_nguyen_lieu) REFERENCES nguyen_lieu(ma_nguyen_lieu),
    CONSTRAINT fk_lanmua_nhacungcap FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);