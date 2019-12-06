use QLKS;
go 

/*create function [Cau1] (  @CMND NCHAR(10) , @NGAYDAT DATE )
RETURNS TABLE 
as 
 return select * from PHIEUDAT where cmnd = @CMND and ngaybatdau = @NGAYDAT

 select * from Cau1('001','2019-11-18')
 */



/* Cau 2*/

select k.cmnd,k.ten,ctp.maphong 
	from khach k join CTPHONG ctp 
			on k.cmnd = ctp.cmnd 
			where ctp.maphong 
in (select ctpt.maphong from ctpt join PHIEUTHUE
	on ctpt.maPT = PHIEUTHUE.maPT  
	where  phieuthue.ngayden = '2019-11-18' )
							ORDER BY maphong


  
select * from KHACH where cmnd in 
(select cmnd from CTPHONG where maphong in 
(select maphong from CTPT where maPT in (SELECT maPT from PHIEUTHUE WHERE ngayden = '2019-11-18')))
go
/*-------------------------------------------------------*/


/*CAU 3*/



insert into HOADON values()


select * from HOADON

go
/*-------------------------------------------------------*/

/*CAU 4*/


go
/*-------------------------------------------------------*/