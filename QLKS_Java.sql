create database QLKS;

use QLKS;

create table BOPHAN(
	maBP varchar(30) PRIMARY KEY,
	tenBP varchar(50) NOT NULL UNIQUE
)

create table DICHVU(
	maDV varchar(50) PRIMARY KEY,
	tenDV text NOT NULL,
	gia int NOT NULL
)

create table NHANVIEN(
	username varchar(100) PRIMARY KEY,
	pw varchar(100) NOT NULL,
	isActive bit NOT NULL,
	isAdmin bit NOT NULL,
	isAllowed bit NOT NULL
)

create table CTNHANVIEN(
	username varchar(100) NOT NULL REFERENCES NHANVIEN(username),
	ten varchar(100) NOT NULL,
	phai bit NOT NULL,
	ngaysinh date NOT NULL,
	diachi text NOT NULL,
	sdt varchar(15) NOT NULL UNIQUE,
	email varchar(100) NOT NULL UNIQUE,
	maBP varchar(30) NOT NULL REFERENCES BOPHAN(maBP)
)

create table HANGPHONG(
	maHP varchar(10) PRIMARY KEY,
	loai varchar(50) NOT NULL,
	kieu varchar(50) NOT NULL,
	gia int NOT NULL
)

create table PHONG(
	maphong varchar(10) PRIMARY KEY,
	trangthai varchar(20) NOT NULL,
	maHP varchar(10) NOT NULL REFERENCES HANGPHONG(maHP),
	sl_khach_max int NOT NULL
)

create table KHACH(
	cmnd varchar(20) PRIMARY KEY,
	ten varchar(100) NOT NULL,
	diachi text NOT NULL,
	sdt varchar(15) NOT NULL UNIQUE,
	email varchar(100) NOT NULL UNIQUE,
	maphong varchar(10) REFERENCES PHONG(maphong)
)

create table PHIEUDAT(
	maPD varchar(30) PRIMARY KEY,
	cmnd varchar(20) NOT NULL REFERENCES KHACH(cmnd),
	ngaybatdau date NOT NULL,
	ngayodukien date NOT NULL
)

create table CTPD(
	maPD varchar(30) REFERENCES PHIEUDAT(maPD),
	maHP varchar(10) NOT NULL REFERENCES HANGPHONG(maHP),
	sl_dat int NOT NULL
)

create table PHIEUTHUE(
	maPT varchar(50) PRIMARY KEY,
	cmnd varchar(20) NOT NULL REFERENCES KHACH(cmnd),
	username varchar(100) NOT NULL REFERENCES NHANVIEN(username),
	ngayden date NOT NULL,
	isPay bit NOT NULL
)

create table CTPT(
	maPT varchar(50) REFERENCES PHIEUTHUE(maPT),
	maphong varchar(10) REFERENCES PHONG(maphong),
	PRIMARY KEY(maPT,maphong)
)

create table CTPDV(
	maPT varchar(50) REFERENCES PHIEUTHUE(maPT),
	maphong varchar(10) REFERENCES PHONG(maphong),
	maDV varchar(50) NOT NULL REFERENCES DICHVU(maDV),
	ngaydat date NOT NULL,
	giodat time NOT NULL,
	soluong int NOT NULL
)

create table HOADON(
	maHD varchar(50) PRIMARY KEY,
	maPT varchar(50) NOT NULL REFERENCES PHIEUTHUE(maPT),
	maNV varchar(100) NOT NULL REFERENCES NHANVIEN(username),
	ngaylap date NOT NULL,
	giolap time NOT NULL,
	tienphong int NOT NULL,
	tiendv int NOT NULL,
	tiennhan int NOT NULL,
	tienthua int NOT NULL
)