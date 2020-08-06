/*
Created		05/08/2020
Modified		05/08/2020
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [LoaiSP]
(
	[MaLoaiSP] Integer NOT NULL,
	[TenLoaiSP] Nvarchar(10) NULL,
Primary Key ([MaLoaiSP])
) 
go

Create table [SanPham]
(
	[MaSP] Integer NOT NULL,
	[TenSP] Nvarchar(20) NULL,
	[Mota] Nvarchar(50) NULL,
	[Gia] Integer NULL,
	[img] Text NULL,
	[MaLoaiSP] Integer NOT NULL,
Primary Key ([MaSP])
) 
go

Create table [NhanVien]
(
	[MaNV] Integer NOT NULL,
	[Hoten] Nvarchar(20) NULL,
	[NamSinh] Datetime NULL,
	[GioiTinh] Nvarchar(5) NULL,
	[DiaChi] Nvarchar(50) NULL,
	[SoDienThoai] Nvarchar(10) NULL,
	[Email] Nvarchar(20) NULL,
Primary Key ([MaNV])
) 
go

Create table [KhachHang]
(
	[MaKH] Integer NOT NULL,
	[HotenKH] Nvarchar(20) NULL,
	[NamSinh] Datetime NULL,
	[GioiTinh] Nvarchar(5) NULL,
	[DiaChi] Nvarchar(50) NULL,
	[SoDienThoai] Nvarchar(10) NULL,
	[Email] Nvarchar(20) NULL,
Primary Key ([MaKH])
) 
go

Create table [HoaDon]
(
	[SoHD] Integer NOT NULL,
	[MaNV] Integer NOT NULL,
	[MaKH] Integer NOT NULL,
	[NgayLap] Datetime NULL,
Primary Key ([SoHD])
) 
go

Create table [PhieuXuat]
(
	[SoPX] Integer NOT NULL,
	[NgayXuat] Datetime NULL,
	[MaNV] Integer NOT NULL,
Primary Key ([SoPX])
) 
go

Create table [PhieuNhap]
(
	[SoPN] Integer NOT NULL,
	[NgayNhap] Datetime NULL,
	[MaNV] Integer NOT NULL,
Primary Key ([SoPN])
) 
go

Create table [CT_HoaDon]
(
	[ID] Integer NOT NULL,
	[SoLuong] Integer NULL,
	[MaSP] Integer NOT NULL,
	[SoHD] Integer NOT NULL,
Primary Key ([ID])
) 
go

Create table [CT_PhieuXuat]
(
	[MaSP] Integer NOT NULL,
	[SoPX] Integer NOT NULL,
	[SoLuong] Integer NULL,
	[DonGiaXuat] Integer NULL,
Primary Key ([MaSP],[SoPX])
) 
go

Create table [CT_PhieuNhap]
(
	[MaSP] Integer NOT NULL,
	[SoPN] Integer NOT NULL,
	[SoLuong] Integer NULL,
	[DonGiaNhap] Integer NULL,
Primary Key ([MaSP],[SoPN])
) 
go

Create table [NguoiDung]
(
	[TenDN] Nvarchar(20) NOT NULL,
	[MatKhau] Nvarchar(20) NULL,
	[LoaiTK] Nvarchar(10) NULL,
Primary Key ([TenDN])
) 
go


Alter table [SanPham] add  foreign key([MaLoaiSP]) references [LoaiSP] ([MaLoaiSP])  on update no action on delete no action 
go
Alter table [CT_PhieuXuat] add  foreign key([MaSP]) references [SanPham] ([MaSP])  on update no action on delete no action 
go
Alter table [CT_PhieuNhap] add  foreign key([MaSP]) references [SanPham] ([MaSP])  on update no action on delete no action 
go
Alter table [CT_HoaDon] add  foreign key([MaSP]) references [SanPham] ([MaSP])  on update no action on delete no action 
go
Alter table [PhieuNhap] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [PhieuXuat] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaKH]) references [KhachHang] ([MaKH])  on update no action on delete no action 
go
Alter table [CT_HoaDon] add  foreign key([SoHD]) references [HoaDon] ([SoHD])  on update no action on delete no action 
go
Alter table [CT_PhieuXuat] add  foreign key([SoPX]) references [PhieuXuat] ([SoPX])  on update no action on delete no action 
go
Alter table [CT_PhieuNhap] add  foreign key([SoPN]) references [PhieuNhap] ([SoPN])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


