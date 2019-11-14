/*create database QLKS;*/

use QLKS;

create table BOPHAN(
	maBP nvarchar(30) PRIMARY KEY,
	tenBP nvarchar(50) NOT NULL UNIQUE
)

create table DICHVU(
	maDV nvarchar(50) PRIMARY KEY,
	tenDV text NOT NULL,
	gia int NOT NULL
)

create table NHANVIEN(
	username nvarchar(100) PRIMARY KEY,
	pw nvarchar(100) NOT NULL,
	isActive bit NOT NULL,
	isAdmin bit NOT NULL,
	isAllowed bit NOT NULL
)

create table KHUYENMAI(
	maKM nvarchar(100) PRIMARY KEY,
	ngaybatdau DATE NOT NULL,
	ngayketthuc DATE NOT NULL,
	giam int NOT NULL,
)

create table CTNHANVIEN(
	username nvarchar(100) NOT NULL REFERENCES NHANVIEN(username),
	ten nvarchar(100) NOT NULL,
	phai bit NOT NULL,
	ngaysinh date NOT NULL,
	diachi text NOT NULL,
	sdt nvarchar(15) NOT NULL UNIQUE,
	email nvarchar(100) NOT NULL UNIQUE,
	maBP nvarchar(30) NOT NULL REFERENCES BOPHAN(maBP)
)

create table HANGPHONG(
	maHP nvarchar(10) PRIMARY KEY,
	loai nvarchar(50) NOT NULL,
	kieu nvarchar(50) NOT NULL,
	gia int NOT NULL
)

create table PHONG(
	maphong nvarchar(10) PRIMARY KEY,
	trangthai nvarchar(20) NOT NULL,
	maHP nvarchar(10) NOT NULL REFERENCES HANGPHONG(maHP),
	sl_khach_max int NOT NULL
)

create table KHACH(
	cmnd nvarchar(20) PRIMARY KEY,
	ten nvarchar(100) NOT NULL,
	diachi text NOT NULL,
	sdt nvarchar(15) NOT NULL UNIQUE,
	email nvarchar(100) NOT NULL UNIQUE,
	maphong nvarchar(10) REFERENCES PHONG(maphong)
)

create table PHIEUDAT(
	maPD nvarchar(30) PRIMARY KEY,
	cmnd nvarchar(20) NOT NULL REFERENCES KHACH(cmnd),
	ngaybatdau date NOT NULL,
	ngayodukien date NOT NULL
)

create table CTPD(
	maPD nvarchar(30) REFERENCES PHIEUDAT(maPD),
	maHP nvarchar(10) NOT NULL REFERENCES HANGPHONG(maHP),
	sl_dat int NOT NULL
)

create table PHIEUTHUE(
	maPT nvarchar(50) PRIMARY KEY,
	cmnd nvarchar(20) NOT NULL REFERENCES KHACH(cmnd),
	username nvarchar(100) NOT NULL REFERENCES NHANVIEN(username),
	ngayden date NOT NULL,
	isPay bit NOT NULL
)

create table CTPT(
	maPT nvarchar(50) REFERENCES PHIEUTHUE(maPT),
	maphong nvarchar(10) REFERENCES PHONG(maphong),
	maKM nvarchar(100) REFERENCES KHUYENMAI(maKM),
	PRIMARY KEY(maPT,maphong)
)

create table CTPDV(
	maPT nvarchar(50) REFERENCES PHIEUTHUE(maPT),
	maphong nvarchar(10) REFERENCES PHONG(maphong),
	maDV nvarchar(50) NOT NULL REFERENCES DICHVU(maDV),
	ngaydat date NOT NULL,
	giodat time NOT NULL,
	soluong int NOT NULL
)

create table HOADON(
	maHD nvarchar(50) PRIMARY KEY,
	maPT nvarchar(50) NOT NULL REFERENCES PHIEUTHUE(maPT),
	maNV nvarchar(100) NOT NULL REFERENCES NHANVIEN(username),
	ngaylap date NOT NULL,
	giolap time NOT NULL,
	tienphong int NOT NULL,
	tiendv int NOT NULL,
	tiennhan int NOT NULL,
	tienthua int NOT NULL
)