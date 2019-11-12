create database QLKS;

use QLKS;

create table BOPHAN(
	maBP varchar(30) PRIMARY KEY,
	tenBP varchar(50) NOT NULL UNIQUE
)

create table NHANVIEN(
	username varchar(100) PRIMARY KEY,
	pw varchar(100) NOT NULL,
	active bit NOT NULL
)

create table CTNHANVIEN(
	username varchar(100) NOT NULL REFERENCES NHANVIEN(username),
	hotdem varchar(50) NOT NULL,
	ten varchar(10) NOT NULL,
	phai bit NOT NULL,
	ngaysinh date NOT NULL,
	diachi text NOT NULL,
	sdt varchar(15) NOT NULL UNIQUE,
	email varchar(100) NOT NULL UNIQUE,
	hinh text,
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
	hotdem varchar(50) NOT NULL,
	ten varchar(10) NOT NULL,
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
	maNV varchar(30) NOT NULL REFERENCES NHANVIEN(maNV),
	ngayden date NOT NULL,
	gioden time
)

create table CTPT(
	maPT varchar(50) REFERENCES PHIEUTHUE(maPT),
	maphong varchar(10) REFERENCES PHONG(maphong),
	maKM varchar(50) REFERENCES KHUYENMAI(maKM),
	PRIMARY KEY(maPT,maphong)
)