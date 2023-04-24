create table nuoc_uong (
	ma_mon varchar(5) primary key,
    constraint fk_maMon foreign key (ma_mon)
    references mon_an(ma_mon),
    -- constraint check_maMon check (ma_mon regexp '^D[0-9]{4}$')
);

create table don_gia_nuoc_uong (
	ma_nuoc_uong varchar(5),
    size char check(size in ('S','M','L')),
    don_gia int,
    primary key (ma_nuoc_uong, size),
    constraint fk_ma_nuoc_uong foreign key (ma_nuoc_uong)
    references nuoc_uong(ma_mon),
    -- constraint check_ma_nuoc_uong check (ma_nuoc_uong regexp '^D[0-9]{4}$')
);

create table do_an (
	ma_mon varchar(5) primary key,
    don_gia int,
    constraint fk_ma_mon foreign key (ma_mon)   
    references mon_an(ma_mon),
    -- constraint check_ma_mon check (ma_mon regexp '^F[0-9]{4}$')
);

create table gio_phuc_vu_do_an (
	ma_do_an varchar(5),
    constraint fk_ma_do_an foreign key (ma_do_an)
    references do_an(ma_mon),
    -- constraint check_ma_do_an check (ma_do_an regexp '^F[0-9]{4}$'),
    bat_dau time,
    ket_thuc time,
    CONSTRAINT check_ngay CHECK (STR_TO_DATE(bat_dau, '%H:%i') < STR_TO_DATE(ket_thuc, '%H:%i')),
    primary key (ma_do_an, bat_dau)
);

create table khach_hang (
	CMND varchar(12) primary key,
    ho_ten varchar(50),
    gioi_tinh char check(gioiTinh in ('M','F')),
    ngay_sinh date,
    so_dien_thoai varchar(10),
    so_nha int,
    duong varchar(150),
    quan varchar(150),
    phuong varchar(150),
    tinh varchar(150),
    diem int unsigned not null default 0
);