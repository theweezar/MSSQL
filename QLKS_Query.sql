use QLKS;
go 

/*Câu 1: Liệt kê thông tin về 1 phiếu đặt phòng dựa vào số CMND người đặt, ngày đặt
(số phiếu đặt, hạng phòng, số lượng phòng,  giá, trạng thái (đang đặt, đang check in, đã check out)*/

/*create function [Cau1] (@CMND NVARCHAR(10) ,@NGAYDAT DATE )
RETURNS TABLE 
as 
 return select * from PHIEUDAT where cmnd = @CMND and ngaybatdau = @NGAYDAT

 select * from Cau1('001','2019-11-18')
 */


/* Câu 2: Liệt kê các khách sẽ đến trong ngày
(Số phiếu đặt, CMND người đặt, ngày đặt, hạng phòng, số lượng phòng,  giá)*/

select * from KHACH join CTPHONG on KHACH.cmnd = CTPHONG.cmnd 
where CTPHONG.maphong in
(select maphong from CTPT join PHIEUTHUE 
on PHIEUTHUE.maPT = CTPT.maPT where PHIEUTHUE.ngayden = '2019-11-18')


select * from KHACH where cmnd in 
(select cmnd from CTPHONG where maphong in (
select maphong from CTPT where maPT in (
SELECT maPT from PHIEUTHUE WHERE ngayden = '2019-11-18')))
go

/*2 cách trên là liệt kê khách đã đến và thuê trong 1 ngày*/

/*-------------------------------------------------------*/


/*CAU 3*/



insert into HOADON values()


select * from HOADON

go
/*-------------------------------------------------------*/

/*CAU 4*/


go
/*-------------------------------------------------------*/