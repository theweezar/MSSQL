use QLKS;

create table DICHVU(
	maDV varchar(50) PRIMARY KEY,
	tenDV text NOT NULL,
	gia int NOT NULL
)

create table KHUYENMAI(
	maKM varchar(50) PRIMARY KEY,
	ngaybatdau date NOT NULL,
	ngayketthuc date NOT NULL,
	giam int NOT NULL
)

create table BOPHAN(
	maBP varchar(30) PRIMARY KEY,
	tenBP varchar(50) NOT NULL UNIQUE
)

create table NHANVIEN(
	maNV varchar(30) PRIMARY KEY,
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
	msthue varchar(30) NOT NULL UNIQUE,
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
	maNV varchar(30) NOT NULL REFERENCES NHANVIEN(maNV),
	ngaylap date NOT NULL,
	giolap time NOT NULL,
	tienphong int NOT NULL,
	tiendv int NOT NULL,
	tiennhan int NOT NULL,
	tienthua int NOT NULL,
)

create table BCTNGAY(
	maBCTNgay varchar(30) PRIMARY KEY,
	maNV varchar(30) NOT NULL REFERENCES NHANVIEN(maNV),
	doanhthu int NOT NULL,
	ngaylap date NOT NULL
)

create table CHITIETBCTNGAY(
	maBCTNgay varchar(30) NOT NULL REFERENCES BCTNGAY(maBCTNgay),
	maHD varchar(50) NOT NULL UNIQUE REFERENCES HOADON(maHD)
)

create table BCTTHANG(
	maBCTThang varchar(30) PRIMARY KEY,
	maNV varchar(30) NOT NULL REFERENCES NHANVIEN(maNV),
	doanhthu int NOT NULL,
	ngaylap date NOT NULL
)

create table CHITIETBCTTHANG(
	maBCTThang varchar(30) NOT NULL REFERENCES BCTTHANG(maBCTThang),
	maBCTNgay varchar(30) NOT NULL UNIQUE REFERENCES BCTNGAY(maBCTNgay)
)

create table BCTNAM(
	maBCTNam varchar(30) PRIMARY KEY,
	maNV varchar(30) NOT NULL REFERENCES NHANVIEN(maNV),
	doanhthu int NOT NULL,
	ngaylap date NOT NULL
)

create table CHITIETBCTNAM(
	maBCTNam varchar(30) NOT NULL REFERENCES BCTNAM(maBCTNam),
	maBCTThang varchar(30) NOT NULL UNIQUE REFERENCES BCTTHANG(maBCTThang)
)