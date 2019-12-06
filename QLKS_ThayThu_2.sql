/*create database QLKS*/

use QLKS

/* Phần tạo table - chưa có liên kết khóa ngoại */

create table BOPHAN(
	maBP INT PRIMARY KEY IDENTITY(1,1),
	tenBP NVARCHAR(50) NOT NULL UNIQUE
)

create table NHANVIEN(
	maNV INT PRIMARY KEY IDENTITY(1,1),
	hotdem NVARCHAR(50) NOT NULL,
	ten NVARCHAR(10) NOT NULL,
	phai bit NOT NULL,
	/*ngaysinh DATE NOT NULL,
	diachi text NOT NULL,*/
	sdt NVARCHAR(15) NOT NULL UNIQUE,
	email NVARCHAR(100) NOT NULL UNIQUE,
	/*hinh text,*/
	maBP INT NOT NULL
)

create table HANGPHONG(
	maHP INT PRIMARY KEY IDENTITY(1,1),
	loai NVARCHAR(50) NOT NULL,
	kieu NVARCHAR(50) NOT NULL,
	gia INT NOT NULL
)

create table PHONG(
	maphong INT PRIMARY KEY IDENTITY(1,1),
	trangthai INT NOT NULL,
	maHP INT NOT NULL ,
	sl_khach_max INT NOT NULL
)

/*
Bảng trạng thái:
- 1: là phòng trống và sẵn sàng
- 2: là phòng đã có người ở 
- 3: là phòng đã bị đặt trước
*/

create table CTPHONG(
	maphong INT NOT NULL,
	cmnd NVARCHAR(20) NOT NULL
)

create table KHACH(
	cmnd NVARCHAR(20) PRIMARY KEY,
	hotdem NVARCHAR(50) NOT NULL,
	ten NVARCHAR(10) NOT NULL,
	/*diachi text NOT NULL,*/
	sdt NVARCHAR(15) NOT NULL UNIQUE,
	email NVARCHAR(100) NOT NULL UNIQUE,
	/*msthue NVARCHAR(30) NOT NULL UNIQUE,*/
)

create table PHIEUDAT(
	maPD INT PRIMARY KEY IDENTITY(1,1),
	cmnd NVARCHAR(20),
	ngaybatdau DATE NOT NULL,
	ngayodukien DATE NOT NULL
)

create table CTPD(
	maPD INT NOT NULL,
	maHP INT NOT NULL,
	sl_dat INT NOT NULL
)

create table PHIEUTHUE(
	maPT INT PRIMARY KEY IDENTITY(1,1),
	cmnd NVARCHAR(20) NOT NULL,
	maNV INT NOT NULL,
	ngayden DATE NOT NULL,
	/*gioden TIME*/
)

create table CTPT(
	maPT INT NOT NULL,
	maphong INT NOT NULL,
	maKM NVARCHAR(50)
)

create table DICHVU(
	maDV INT PRIMARY KEY IDENTITY(1,1),
	tenDV NVARCHAR(100) NOT NULL,
	gia INT NOT NULL
)

create table CTPDV(
	maPT INT NOT NULL,
	maphong INT NOT NULL,
	maDV INT NOT NULL,
	ngaydat DATE NOT NULL,
	giodat TIME NOT NULL,
	soluong INT NOT NULL
)

create table KHUYENMAI(
	maKM NVARCHAR(50) PRIMARY KEY,
	/*ngaybatdau DATE NOT NULL,
	ngayketthuc DATE NOT NULL,*/
	giam INT NOT NULL
)

create table HOADON(
	maHD INT PRIMARY KEY IDENTITY(1,1),
	maPT INT NOT NULL,
	maNV INT NOT NULL ,
	ngaylap DATE NOT NULL,
	giolap TIME NOT NULL,
	tienphong INT NOT NULL,
	tiendv INT NOT NULL,
	tiennhan INT NOT NULL,
	tienthua INT NOT NULL,
)

/*create table BCTNGAY(
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
)*/

/* Tạo mối liên kết khóa ngoại */

ALTER TABLE NHANVIEN ADD FOREIGN KEY (maBP) REFERENCES BOPHAN(maBP)

ALTER TABLE PHONG ADD FOREIGN KEY (maHP) REFERENCES HANGPHONG(maHP)

ALTER TABLE CTPHONG ADD FOREIGN KEY (maphong) REFERENCES PHONG(maphong)

ALTER TABLE CTPHONG ADD FOREIGN KEY (cmnd) REFERENCES KHACH(cmnd)

ALTER TABLE PHIEUDAT ADD FOREIGN KEY (cmnd) REFERENCES KHACH(cmnd)

ALTER TABLE CTPD ADD FOREIGN KEY (maPD) REFERENCES PHIEUDAT(maPD)

ALTER TABLE CTPD ADD FOREIGN KEY (maHP) REFERENCES HANGPHONG(maHP)

ALTER TABLE PHIEUTHUE ADD FOREIGN KEY (cmnd) REFERENCES KHACH(cmnd)

ALTER TABLE PHIEUTHUE ADD FOREIGN KEY (maNV) REFERENCES NHANVIEN(maNV)

ALTER TABLE CTPT ADD FOREIGN KEY (maPT) REFERENCES PHIEUTHUE(maPT)

ALTER TABLE CTPT ADD FOREIGN KEY (maphong) REFERENCES PHONG(maphong)

ALTER TABLE CTPT ADD FOREIGN KEY (maKM) REFERENCES KHUYENMAI(maKM)

ALTER TABLE CTPDV ADD FOREIGN KEY (maPT) REFERENCES PHIEUTHUE(maPT)

ALTER TABLE CTPDV ADD FOREIGN KEY (maphong) REFERENCES PHONG(maphong)

ALTER TABLE CTPDV ADD FOREIGN KEY (maDV) REFERENCES DICHVU(maDV)

ALTER TABLE HOADON ADD FOREIGN KEY (maPT) REFERENCES PHIEUTHUE(maPT)

ALTER TABLE HOADON ADD FOREIGN KEY (maNV) REFERENCES NHANVIEN(maNV)

/* Insert Data cho CSDL*/

INSERT INTO BOPHAN VALUES
(N'Nhân viên tiếp tân'),
(N'Nhân viên kết toán')

INSERT INTO NHANVIEN VALUES
(N'Hoàng Phan Minh',N'Đức',1,'0935723714','hpmd@gmail.com',1),
(N'Phan',N'Đại',1,'090909090','dai@gmail.com',1),
(N'Dương Trực',N'Đông',1,'090808090','dong@gmail.com',2)

INSERT INTO HANGPHONG VALUES
('Normal',N'1 giường đôi',1000),
('Normal',N'2 giường đôi',2000),
('VIP',N'2 giường đôi + 1 TV 50 inc',2500),
('SUPER VIP',N'2 giường đôi + Tầng cao nhất',10000)

INSERT INTO PHONG VALUES /* gồm 21 phòng (6 phòng thuộc hạng 1,2,3 - 3 phòng thuộc hạng 4)*/
(1,1,2),
(1,1,2),
(1,1,2),
(1,1,2),
(1,1,2),
(1,1,2),
(1,2,4),
(1,2,4),
(1,2,4),
(1,2,4),
(1,2,4),
(1,2,4),
(1,3,4),
(1,3,4),
(1,3,4),
(1,3,4),
(1,3,4),
(1,3,4),
(1,4,4),
(1,4,4),
(1,4,4)

INSERT INTO KHACH VALUES
('001',N'Nhật',N'Anh','010','Anh@gmail.com'),
('002',N'Minh',N'Nhật','022','nhat@gmail.com'),
('003',N'Đức',N'Minh','033','minh@gmail.com'),
('004',N'Cường',N'Dollar','044','dollar@gmail.com'),
('005',N'Tim',N'Cook','055','cook@gmail.com'),
('006',N'Steve',N'Job','066','job@gmail.com'),
('007',N'Donald',N'Trump','077','trump@gmail.com'),
('008',N'Maria',N'Ozawa','088','jav@gmail.com'),
('009',N'Bill',N'Gate','099','gate@gmail.com'),
('010',N'Nhật',N'Cường','012','cuong@gmail.com'),
('011',N'Dore',N'Mon','016','mon@gmail.com'),
('012',N'Hồ Ngọc',N'Hà','091','ha@gmail.com')

INSERT INTO PHIEUDAT VALUES
('001','2019-11-18','2019-11-25'),
('003','2019-11-25','2019-12-10')

INSERT INTO CTPD VALUES
('1',1,1),
('2',2,1)

INSERT INTO PHIEUTHUE VALUES
('001',1,'2019-11-18'),
('004',1,'2019-11-18')

INSERT INTO CTPT VALUES
(1,1,null),
(2,2,null),
(2,3,null),
(2,20,null)

INSERT INTO DICHVU VALUES
(N'Spa',2500),
(N'Cà phê đen',250),
(N'Cà phê sữa',300),
(N'Rượu Vang',1500)

INSERT INTO CTPDV VALUES
(1,1,2,'2019-11-18','19:55',2),
(2,20,4,'2019-11-19','19:00',2)


INSERT INTO KHUYENMAI VALUES
('QWERTY',10)

INSERT INTO CTPHONG VALUES
(1,'001'),
(1,'002'),
(2,'004'),
(2,'005'),
(3,'003'),
(3,'012'),
(20,'006'),
(20,'007'),
(20,'008')

/*Tạo hóa đơn*/
/* Cho trước 1 cmnd của khách muốn checkout và 1 ngày khách checkout */
go
declare @cmndCheckout NVARCHAR(100) = '004'
declare @checkoutDay DATE = '2019-11-20'

/* Truy xuất giá tiền phòng */
select * from PHONG join HANGPHONG on PHONG.maHP = HANGPHONG.maHP where PHONG.maphong in 
(select maphong from CTPT join PHIEUTHUE on CTPT.maPT = PHIEUTHUE.maPT
where PHIEUTHUE.cmnd = '004')

/* Truy xuất giá tiền dịch vụ */
select gia * soluong from DICHVU join CTPDV on DICHVU.maDV = CTPDV.maDV where CTPDV.maPT in(
select maPT from PHIEUTHUE where PHIEUTHUE.cmnd = '004')
