use QLKS;

insert into DICHVU values
('BF01','Buffet lau 1',100),
('BK01','Banh kem loai 1',200),
('XH01','Xong hoi',500),
('VT01','Tham quan vuon thu',1000)

insert into KHUYENMAI values
('QWERTY','2019-10-20','2020-10-30',50)

insert into BOPHAN values
('NVTT','Nhan vien tiep tan'),
('NVKT','Nhan vien kiem toan')

insert into NHANVIEN values
('001','Hoang Phan Minh','Duc',1,'1999-10-30','Binh Thanh','0935723714','duc@gmail.com','pic','NVTT'),
('002','Phan','Dai',1,'1999-8-30','Binh Thanh','090909090','dai@yahoo.com','pic','NVKT')


insert into HANGPHONG values
('A1','Thuong','1 Giuong doi',1000),
('A2','Thuong','2 Giuong doi',1500),
('S','VIP','2 Giuong doi + Ruou vang',3000)

insert into PHONG values
('T101','ss','A1',2),
('T102','ss','A1',2),
('T103','ss','A1',2),
('T104','ss','A1',2),
('T105','ss','A1',2),
('T201','ss','A2',4),
('T202','ss','A2',4),
('T203','ss','A2',4),
('T204','ss','A2',4),
('T205','ss','A2',4),
('T301','ss','S',4),
('T302','ss','S',4),
('T303','ss','S',4),
('T304','ss','S',4),
('T305','ss','S',4)

insert into KHACH values
('0259','Nguyen Van','A','Binh Thanh','092358242','ya@gmail.com','00224','T101'),
('0239','Tran Quang','Minh','Dong Nai','092757294','m@gmail.com','23232','T102'),
('0232','Tran','Dan','Dong Nai','092727244','loz@gmail.com','13252','T102'),
('0639','Nguyen Thao','Quynh','Ha Noi','092823424','quynh@gmail.com','21112','T101'),
('0839','Do Ngoc','Thao','Nha Trang','033757294','thao@gmail.com','25532','T102'),
('0139','Nguyen Thao','My','Hue','077757294','my@gmail.com','29232','T102'),
('0094','Do Nhat','Cuong','Ninh Thuan','077857424','thuan@yahoo.com','22226',null)

insert into PHIEUDAT values
('PD1','0259','2019-10-20','2019-10-30')

insert into CTPD values
('PD1','A1',1),
('PD1','A2',1)

insert into PHIEUTHUE values
('PT0001','0259','001','2019-10-20','10:55')

insert into CTPT values
('PT0001','T101',null),
('PT0001','T201','QWERTY')

insert into CTPDV values
('PT0001','T101','XH01','2019-10-25','12:00',1)

