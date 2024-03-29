USE [master]
GO
/****** Object:  Database [udql]    Script Date: 12/31/2018 12:41:39 AM ******/
CREATE DATABASE [udql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'udql', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER17\MSSQL\DATA\udql.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'udql_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER17\MSSQL\DATA\udql_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [udql] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [udql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [udql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [udql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [udql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [udql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [udql] SET ARITHABORT OFF 
GO
ALTER DATABASE [udql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [udql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [udql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [udql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [udql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [udql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [udql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [udql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [udql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [udql] SET  ENABLE_BROKER 
GO
ALTER DATABASE [udql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [udql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [udql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [udql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [udql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [udql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [udql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [udql] SET RECOVERY FULL 
GO
ALTER DATABASE [udql] SET  MULTI_USER 
GO
ALTER DATABASE [udql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [udql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [udql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [udql] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [udql] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'udql', N'ON'
GO
ALTER DATABASE [udql] SET QUERY_STORE = OFF
GO
USE [udql]
GO
/****** Object:  Table [dbo].[DSKhamBenh]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSKhamBenh](
	[MaKB] [varchar](10) NOT NULL,
	[MaBenh] [varchar](10) NULL,
	[MaThuoc] [varchar](10) NULL,
	[SoLuong] [int] NULL,
	[MaCD] [varchar](10) NULL,
	[MaBN] [varchar](10) NULL,
	[NgayKham] [date] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_DSKhamBenh] PRIMARY KEY CLUSTERED 
(
	[MaKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[danhsach]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[danhsach]  as
	select ngaykham, sum(thanhtien) thanhtien , count(*) soluong 
	 from udql.dbo.DSKhamBenh where MONTH(NgayKham) = 1 and YEAR(NgayKham) =2018
	group by NgayKham
GO
/****** Object:  Table [dbo].[Benh]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benh](
	[MaBenh] [varchar](10) NOT NULL,
	[TenBenh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Benh] PRIMARY KEY CLUSTERED 
(
	[MaBenh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[thuy]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[thuy] as
	select *
	from udql.dbo.benh
GO
/****** Object:  Table [dbo].[BenhNhan]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhNhan](
	[MaBN] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NamSinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TrieuChung] [nvarchar](50) NULL,
 CONSTRAINT [PK_BenhNhan] PRIMARY KEY CLUSTERED 
(
	[MaBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CachDung]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CachDung](
	[MaCD] [varchar](10) NOT NULL,
	[HuongDan] [nvarchar](50) NULL,
 CONSTRAINT [PK_CachDung] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[MaDonVi] [varchar](10) NOT NULL,
	[TenDonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_DonVi] PRIMARY KEY CLUSTERED 
(
	[MaDonVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Username] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NULL,
	[xoa] [int] NULL,
	[TinhTrang] [varchar](10) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThamSo]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamSo](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ThamSo] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [varchar](10) NOT NULL,
	[TenThuoc] [nvarchar](50) NULL,
	[MaDonVi] [varchar](10) NULL,
	[Gia] [int] NULL,
	[SlTon] [int] NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Benh] ([MaBenh], [TenBenh]) VALUES (N'b1', N'cảm')
INSERT [dbo].[Benh] ([MaBenh], [TenBenh]) VALUES (N'b2', N'sốt xuất huyết')
INSERT [dbo].[Benh] ([MaBenh], [TenBenh]) VALUES (N'b3', N'lùn')
INSERT [dbo].[Benh] ([MaBenh], [TenBenh]) VALUES (N'b4', N'táo bón')
INSERT [dbo].[Benh] ([MaBenh], [TenBenh]) VALUES (N'b5', N'chấn thương')
INSERT [dbo].[BenhNhan] ([MaBN], [HoTen], [GioiTinh], [NamSinh], [DiaChi], [TrieuChung]) VALUES (N'n1', N'ngô thị thu thúy', N'nữ', CAST(N'1998-01-01' AS Date), N'an giang', N'ho nhẹ ')
INSERT [dbo].[BenhNhan] ([MaBN], [HoTen], [GioiTinh], [NamSinh], [DiaChi], [TrieuChung]) VALUES (N'n2', N'phan thành vĩ', N'nam', CAST(N'1997-01-01' AS Date), N'bình dương', N'sốt cao nổi mẩn đỏ')
INSERT [dbo].[BenhNhan] ([MaBN], [HoTen], [GioiTinh], [NamSinh], [DiaChi], [TrieuChung]) VALUES (N'n3', N'nguyễn thị thanh vân', N'nữ', CAST(N'1998-01-01' AS Date), N'bến tre', N'không cao nổi')
INSERT [dbo].[BenhNhan] ([MaBN], [HoTen], [GioiTinh], [NamSinh], [DiaChi], [TrieuChung]) VALUES (N'n4', N'phan văn võ', N'nam', CAST(N'1997-01-01' AS Date), N'an giang', N'ói ỉa')
INSERT [dbo].[BenhNhan] ([MaBN], [HoTen], [GioiTinh], [NamSinh], [DiaChi], [TrieuChung]) VALUES (N'n5', N'', N'', CAST(N'2018-12-13' AS Date), N'', N'')
INSERT [dbo].[CachDung] ([MaCD], [HuongDan]) VALUES (N'c1', N'uống trước khi ăn')
INSERT [dbo].[CachDung] ([MaCD], [HuongDan]) VALUES (N'c2', N'lắc đều trước khi uông')
INSERT [dbo].[CachDung] ([MaCD], [HuongDan]) VALUES (N'c3', N'uống sau bữa ăn 15phut')
INSERT [dbo].[CachDung] ([MaCD], [HuongDan]) VALUES (N'c4', N'mỗi ngày 3 lần mỗi lần 3 viên')
INSERT [dbo].[DonVi] ([MaDonVi], [TenDonVi]) VALUES (N'dv1', N'chai')
INSERT [dbo].[DonVi] ([MaDonVi], [TenDonVi]) VALUES (N'dv2', N'viên')
INSERT [dbo].[DSKhamBenh] ([MaKB], [MaBenh], [MaThuoc], [SoLuong], [MaCD], [MaBN], [NgayKham], [ThanhTien]) VALUES (N'4', N'b1', N't1', 1, N'c1', N'n1', CAST(N'2018-12-13' AS Date), 2)
INSERT [dbo].[DSKhamBenh] ([MaKB], [MaBenh], [MaThuoc], [SoLuong], [MaCD], [MaBN], [NgayKham], [ThanhTien]) VALUES (N'k1', N'b1', N't1', 3, N'c3', N'n2', CAST(N'2018-01-01' AS Date), 234353)
INSERT [dbo].[DSKhamBenh] ([MaKB], [MaBenh], [MaThuoc], [SoLuong], [MaCD], [MaBN], [NgayKham], [ThanhTien]) VALUES (N'k2', N'b1', N't2', 1, N'c2', N'n1', CAST(N'2018-01-02' AS Date), 4234)
INSERT [dbo].[DSKhamBenh] ([MaKB], [MaBenh], [MaThuoc], [SoLuong], [MaCD], [MaBN], [NgayKham], [ThanhTien]) VALUES (N'k3', N'b3', N't3', 4, N'c1', N'n1', CAST(N'2018-01-03' AS Date), 1233)
INSERT [dbo].[DSKhamBenh] ([MaKB], [MaBenh], [MaThuoc], [SoLuong], [MaCD], [MaBN], [NgayKham], [ThanhTien]) VALUES (N'k4', N'b1', N't1', 1, N'c1', N'n1', CAST(N'2018-12-13' AS Date), 123)
INSERT [dbo].[DSKhamBenh] ([MaKB], [MaBenh], [MaThuoc], [SoLuong], [MaCD], [MaBN], [NgayKham], [ThanhTien]) VALUES (N'k5', N'b2', N't1', 5, N'c1', N'n1', CAST(N'2018-01-01' AS Date), 1234)
INSERT [dbo].[TaiKhoan] ([Username], [PassWord], [xoa], [TinhTrang]) VALUES (N'a', N'a', 0, N'logout')
INSERT [dbo].[TaiKhoan] ([Username], [PassWord], [xoa], [TinhTrang]) VALUES (N'b', N'bb', 1, N'logout')
INSERT [dbo].[TaiKhoan] ([Username], [PassWord], [xoa], [TinhTrang]) VALUES (N'c', N'c', 1, N'logout')
INSERT [dbo].[TaiKhoan] ([Username], [PassWord], [xoa], [TinhTrang]) VALUES (N'ngotham', N'ngotham', 1, N'logout')
INSERT [dbo].[TaiKhoan] ([Username], [PassWord], [xoa], [TinhTrang]) VALUES (N'ngothuy', N'ngothuy', 1, N'logout')
INSERT [dbo].[ThamSo] ([MaLoai], [TenLoai], [SoLuong]) VALUES (N'l1', N'số bệnh nhân trong ngày', 1)
INSERT [dbo].[ThamSo] ([MaLoai], [TenLoai], [SoLuong]) VALUES (N'l2', N'số loại thuốc', 2)
INSERT [dbo].[ThamSo] ([MaLoai], [TenLoai], [SoLuong]) VALUES (N'l3', N'số loại đơn vị', 4)
INSERT [dbo].[ThamSo] ([MaLoai], [TenLoai], [SoLuong]) VALUES (N'l4', N'số loại cách dùng', 6)
INSERT [dbo].[ThamSo] ([MaLoai], [TenLoai], [SoLuong]) VALUES (N'l5', N'số tiền khám chuẩn', 5)
INSERT [dbo].[ThamSo] ([MaLoai], [TenLoai], [SoLuong]) VALUES (N'l6', N'số loại bệnh', 3)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't1', N'paratamol', N'dv1', 2, 123)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't10', N'thuốc ngậm', N'dv2', 4222, 322)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't11', N'tan đàm', N'dv1', 1, 331)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't12', N'táo bón', N'dv2', 3553, 313)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't13', N'Kháng sinh', N'dv1', 5234, 3131)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't14', N'Betalactam', N'dv1', 53546, 321)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't15', N'Macrolid', N'dv1', 3643, 311)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't16', N'Lincomycin', N'dv1', 33463, 1313)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't17', N'Corticoid', N'dv2', 363, 3123)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't18', N'Siro ho thảo dược', N'dv2', 3633, 422)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't19', N'Thuốc giản phế quản', N'dv1', 363, 133)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't2', N'canxi', N'dv1', 3456, 323)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't20', N'cúm', N'dv2', 3633, 231)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't21', N'cảm cúm', N'dv1', 3633, 133)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't22', N'Quinolon', N'dv2', 36363, 321)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't23', N'Phenicol', N'dv1', 3632, 313)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't24', N'Tetracyclin', N'dv2', 3632, 332)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't25', N'long đờm', N'dv2', 63332, 3131)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't26', N'Kháng Histamin', N'dv2', 6323, 323)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't27', N'Các thuốc thuộc nhóm giảm đau', N'dv2', 6236, 313)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't28', N'hạ sốt', N'dv2', 3634, 323)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't29', N'chống viêm', N'dv2', 6323, 31)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't3', N'thuốc chống ói', N'dv2', 765, 321)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't30', N'viêm họng hạt', N'dv1', 3623, 242)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't31', N'thuyngo', N'dv2', 123, 1234)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't4', N'vitamia', N'dv1', 245, 4242)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't5', N'vitamin b', N'dv1', 54567, 241)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't6', N'vitamin c', N'dv2', 450, 564)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't7', N'dầu cá', N'dv2', 432, 73)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't8', N'chống lão hóa', N'dv1', 2422, 474)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [MaDonVi], [Gia], [SlTon]) VALUES (N't9', N'thuốc ho', N'dv1', 2442, 43)
ALTER TABLE [dbo].[DSKhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_DSKhamBenh_Benh] FOREIGN KEY([MaBenh])
REFERENCES [dbo].[Benh] ([MaBenh])
GO
ALTER TABLE [dbo].[DSKhamBenh] CHECK CONSTRAINT [FK_DSKhamBenh_Benh]
GO
ALTER TABLE [dbo].[DSKhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_DSKhamBenh_BenhNhan] FOREIGN KEY([MaBN])
REFERENCES [dbo].[BenhNhan] ([MaBN])
GO
ALTER TABLE [dbo].[DSKhamBenh] CHECK CONSTRAINT [FK_DSKhamBenh_BenhNhan]
GO
ALTER TABLE [dbo].[DSKhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_DSKhamBenh_CachDung] FOREIGN KEY([MaCD])
REFERENCES [dbo].[CachDung] ([MaCD])
GO
ALTER TABLE [dbo].[DSKhamBenh] CHECK CONSTRAINT [FK_DSKhamBenh_CachDung]
GO
ALTER TABLE [dbo].[DSKhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_DSKhamBenh_Thuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[DSKhamBenh] CHECK CONSTRAINT [FK_DSKhamBenh_Thuoc]
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_DonVi] FOREIGN KEY([MaDonVi])
REFERENCES [dbo].[DonVi] ([MaDonVi])
GO
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK_Thuoc_DonVi]
GO
/****** Object:  StoredProcedure [dbo].[cau1]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 1 đăng nhâp -- câu 2 đăng xuất
create proc [dbo].[cau1]
@password nvarchar(10),@username nvarchar(10)
as
begin
	if not exists (select * from Taikhoan where Username = @username and PassWord = @password and xoa = 1)
		return 0
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau10]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 10 thay đổi số lượng loại thuốc

create proc [dbo].[cau10]
@soluong int
as
begin
	if not exists (select * from ThamSo where MaLoai = N'l5')
		return 0
	update ThamSo set SoLuong =@soluong where MaLoai = N'l5'
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau11]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 11 thay đổi đơn giá thuốc

create proc [dbo].[cau11]
@mathuoc varchar(10), @soluong int
as
begin
	if not exists (select * from Thuoc where MaThuoc = @mathuoc)
		return 0
	update Thuoc set Gia =@soluong where MaThuoc = @mathuoc
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau12]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- câu 12 thêm thông tin bệnh nhân
CREATE proc [dbo].[cau12]
@mabn varchar(10), @hoten nvarchar(50), @gioitinh nvarchar(10),
 @namsinh date, @diachi nvarchar(5), @chieutrung nvarchar(50)
 as 
 begin
	if exists (select * from BenhNhan where MaBN =@mabn)
		return 0
	insert BenhNhan values(@mabn , @hoten, @gioitinh, @namsinh , @diachi , @chieutrung )
	return 1
 end
GO
/****** Object:  StoredProcedure [dbo].[cau13]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 --13 xem danh sách khám bệnh theo ngày

  create proc [dbo].[cau13]
@ngay date
 as 
 begin
	select * from DSKhamBenh where NgayKham = @ngay
 end
GO
/****** Object:  StoredProcedure [dbo].[cau14]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 --câu 14- thêm bệnh nhân vào danh sách khám
 CREATE proc [dbo].[cau14]
@makb varchar(10), @mabn varchar(50), @mabenh varchar(10), @mathuoc varchar(10),
 @sl int, @macd varchar(10)
 as 
 begin
	if not exists (select * from BenhNhan where MaBN = @mabn)
		return 0
	if  not exists (select * from Benh where MaBenh =@mabenh)
		return 2
	if  not exists (select * from Thuoc where MaThuoc =@mathuoc)
		return 3
	if  not exists (select * from CachDung where MaCD = @macd)
		return 4
	if exists (select * from DSKhamBenh where MaKB =@makb)
		return 5
	if (select COUNT(*) from DSKhamBenh where NgayKham = GETDATE()) = (select SoLuong from ThamSo where MaLoai =N'l1')
		return 6
	declare @tien int
	select @tien = Gia * @sl from Thuoc where MaThuoc= @mathuoc

	select @tien += SoLuong from ThamSo where MaLoai =N'l5'
	insert DSKhamBenh values(@makb , @mabenh , @mathuoc,@sl, @macd, @mabn, GETDATE(), @tien  )
	return 1
 end
GO
/****** Object:  StoredProcedure [dbo].[cau15]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
 --15 xem danh sách bệnh nhân

  create proc [dbo].[cau15]
 as 
 begin
	select * from BenhNhan
 end
GO
/****** Object:  StoredProcedure [dbo].[cau16]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 --16 xem danh sách khám bệnh 

  create proc [dbo].[cau16]
 as 
 begin
	select * from DSKhamBenh
 end
GO
/****** Object:  StoredProcedure [dbo].[cau17]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[cau17]
 @mabn varchar (10)
 as 
 begin
	select d.MaKB, b.TenBenh, t.TenThuoc, d.SoLuong, c.HuongDan, d.MaBN, d.NgayKham, d.ThanhTien from DSKhamBenh d, Benh b, Thuoc t, CachDung c where MaKB = @mabn and d.MaBenh = b.MaBenh and t.MaThuoc = d.MaThuoc and d.MaCD = c.MaCD 
 end
GO
/****** Object:  StoredProcedure [dbo].[cau18]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cau18]
 @thang int, @nam int
 as
 begin
	select ngaykham, sum(thanhtien) thanhtien , count(*) soluong  from DSKhamBenh where MONTH(NgayKham) = @thang and YEAR(NgayKham) = @nam
	group by NgayKham
 end
GO
/****** Object:  StoredProcedure [dbo].[cau19]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[cau19]
 @thang int, @nam int
 as
 begin
	select a.MaThuoc,  t.TenThuoc, d.TenDonVi , a.sl
	from (
			select d.MaThuoc, sum(d.SoLuong) sl
			 from DSKhamBenh d  
			 where MONTH(NgayKham) = @thang and YEAR(NgayKham) = @nam 
				and d.MaThuoc = d.MaThuoc
			group by d.MaThuoc
	) as a, Thuoc t, DonVi d where t.MaDonVi = d.MaDonVi and a.MaThuoc = t.MaThuoc
 end
GO
/****** Object:  StoredProcedure [dbo].[cau20]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cau20]
 as
 begin
	 DECLARE @sql VARCHAR(8000);
	SELECT @sql = 'bcp "SELECT * FROM udql.dbo.BenhNhan" queryout "C:\benhnhan.csv" -c -w -t, -T -S' + @@SERVERNAME;
	exec master..xp_cmdshell @sql;
 end
GO
/****** Object:  StoredProcedure [dbo].[cau21]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[cau21]
 as
 begin
	 DECLARE @sql VARCHAR(8000);
	SELECT @sql = 'bcp "SELECT * FROM udql.dbo.DSKhamBenh" queryout "C:\DSKhamBenh.csv" -w -c -t -T -S' + @@SERVERNAME;
	exec master..xp_cmdshell @sql;
 end
GO
/****** Object:  StoredProcedure [dbo].[cau22]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[cau22]
   @makb nvarchar(10)
 as
 begin

	DECLARE @sql VARCHAR(8000);--, @chuoi varchar(10) = '+@makb+'"';
	
	SET @sql = 'bcp "SELECT * FROM udql.dbo.DSKhamBenh a where MaKB ='+@makb+'" queryout "C:\HoaDon.csv" -w -c -t -T -S' + @@SERVERNAME;

	--SET @sql = 'bcp "select d.MaKB, b.TenBenh, t.TenThuoc, d.SoLuong, c.HuongDan, d.MaBN, d.NgayKham, d.ThanhTien from  udql.dbo.Benh b,udql.dbo.DSKhamBenh d, udql.dbo.Thuoc t, udql.dbo.CachDung c where MaKB = '+@makb+' and d.MaBenh = b.MaBenh and t.MaThuoc = d.MaThuoc and d.MaCD = c.MaCD " queryout "C:\hoadon.csv" -w -c -t, -T -S' + @@SERVERNAME;
	exec master..xp_cmdshell @sql;
 end
GO
/****** Object:  StoredProcedure [dbo].[cau23]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[cau23]
   @thang int, @nam int
 as
 begin
	DECLARE @sql VARCHAR(8000);
	declare @chuoithang nvarchar(2) = cast(@thang as varchar(2)), @chuoinam varchar(4) = cast(@nam as varchar(4))
	SET @sql = 'bcp "SELECT  ngaykham, sum(thanhtien) thanhtien , count(*) soluong  FROM udql.dbo.DSKhamBenh where MONTH(NgayKham) = '+@chuoithang+' and YEAR(NgayKham) ='+@chuoinam+' 	group by NgayKham" queryout "C:\ThongKeDoanhThu.csv" -w -c -t, -T -S' + @@SERVERNAME;
	exec master..xp_cmdshell @sql;
 end
GO
/****** Object:  StoredProcedure [dbo].[cau24]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[cau24]
   @thang int, @nam int
 as
 begin

	DECLARE @sql VARCHAR(8000);
	declare @chuoithang nvarchar(2) = cast(@thang as varchar(2)), @chuoinam varchar(4) = cast(@nam as varchar(4))
	SET @sql = 'bcp "select a.MaThuoc,t.TenThuoc, d.TenDonVi , a.sl
					from (
							select d.MaThuoc, sum(d.SoLuong) sl
							 from udql.dbo.DSKhamBenh d  
							 where MONTH(NgayKham) = '+@chuoithang+' and YEAR(NgayKham) ='+@chuoinam+'
							group by d.MaThuoc
					) as a, udql.dbo.Thuoc t, udql.dbo.DonVi d
					 where t.MaDonVi = d.MaDonVi and a.MaThuoc = t.MaThuoc" queryout "C:\ThongKeThuoc.csv" -c -t -T -S' + @@SERVERNAME;
	exec master..xp_cmdshell @sql;
 end
GO
/****** Object:  StoredProcedure [dbo].[cau25]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cau25]
 @mathuoc varchar(10), @ten nvarchar(100), @donvi nvarchar(10),  @gia int, @sl int
 as
 begin
	declare @slthamso int
	select @slthamso = COUNT(*)  from Thuoc 
	if (select SoLuong from ThamSo where MaLoai = 'l2') >= @slthamso
		return 1
	if exists (select * from Thuoc where MaThuoc = @mathuoc)
		return 2
	insert into Thuoc (MaThuoc, TenThuoc , MaDonVi, Gia, SlTon) values(@mathuoc, @ten, @donvi, @gia, @sl)
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau26]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[cau26]
 @mathuoc varchar(10)
 as
 begin
	
	if not exists (select * from Thuoc where MaThuoc = @mathuoc)
		return 1
	delete Thuoc where MaThuoc = @mathuoc
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau27]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[cau27]
 @mabenh varchar(10), @tenbenh nvarchar(100)
 as
 begin
	declare @slthamso int
	select @slthamso = COUNT(*)  from Thuoc 
	if (select SoLuong from ThamSo where MaLoai = 'l6') >= @slthamso
		return 1
	if exists (select * from Benh where  MaBenh = @mabenh)
		return 2
	insert into Benh (MaBenh, TenBenh) values(@mabenh, @tenbenh)
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau28]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   create proc [dbo].[cau28]
 @mabenh varchar(10)
 as
 begin
	
	if not exists (select * from Benh where MaBenh = @mabenh)
		return 1
	delete Benh where MaBenh = @mabenh
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau29]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[cau29]
 @macd varchar(10), @tencd nvarchar(100)
 as
 begin
	declare @slthamso int
	select @slthamso = COUNT(*)  from Thuoc 
	if (select SoLuong from ThamSo where MaLoai = 'l4') >= @slthamso
		return 1
	if exists (select * from CachDung where  MaCD = @macd)
		return 2
	insert into CachDung(MaCD, HuongDan) values(@macd, @tencd)
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau3]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 3  tạo tài khoản
create proc [dbo].[cau3]
@password nvarchar(10),@username nvarchar(10)
as
begin
	if exists (select * from Taikhoan where Username = @username and PassWord = @password and xoa = 1)
		return 0

	insert TaiKhoan values (@username, @password, 1, N'logout')
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau30]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   create proc [dbo].[cau30]
 @macd varchar(10)
 as
 begin
	
	if not exists (select * from CachDung where MaCD = @macd)
		return 1
	delete CachDung where MaCD = @macd
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau31]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[cau31]
 @madv varchar(10), @tendv nvarchar(100)
 as
 begin
	declare @slthamso int
	select @slthamso = COUNT(*)  from Thuoc 
	if (select SoLuong from ThamSo where MaLoai = 'l3') >= @slthamso
		return 1
	if exists (select * from DonVi where  MaDonVi = @madv)
		return 2
	insert into DonVi(MaDonVi, TenDonVi) values(@madv, @tendv)
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau32]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   create proc [dbo].[cau32]
 @madv varchar(10)
 as
 begin
	
	if not exists (select * from DonVi where MaDonVi = @madv)
		return 1
	delete DonVi where MaDonVi = @madv
	return 0
 end
GO
/****** Object:  StoredProcedure [dbo].[cau4]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 4 xóa tài khoản
create proc [dbo].[cau4]
@password nvarchar(10),@username nvarchar(10)
as
begin
	if not exists (select * from Taikhoan where Username = @username and PassWord = @password and xoa = 1)
		return 0
	update TaiKhoan set xoa = 0 where  Username = @username and PassWord = @password and xoa = 1
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau5]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- câu 5 thay đổi số luong bệnh nhân trong ngày
create proc [dbo].[cau5]
@soluong int
as
begin
	if not exists (select * from ThamSo where MaLoai = N'l1')
		return 0
	update ThamSo set SoLuong =@soluong where MaLoai = N'l1'
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau6]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 6 thay đổi số lượng loại thuốc

create proc [dbo].[cau6]
@soluong int
as
begin
	if not exists (select * from ThamSo where MaLoai = N'l2')
		return 0
	update ThamSo set SoLuong =@soluong where MaLoai = N'l2'
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau7]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 7 thay đổi số lượng loại đơn vị

create proc [dbo].[cau7]
@soluong int
as
begin
	if not exists (select * from ThamSo where MaLoai = N'l3')
		return 0
	update ThamSo set SoLuong =@soluong where MaLoai = N'l3'
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau8]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 8 thay đổi số lượng loại thuốc

create proc [dbo].[cau8]
@soluong int
as
begin
	if not exists (select * from ThamSo where MaLoai = N'l6')
		return 0
	update ThamSo set SoLuong =@soluong where MaLoai = N'l6'
	return 1
end
GO
/****** Object:  StoredProcedure [dbo].[cau9]    Script Date: 12/31/2018 12:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--câu 9 thay đổi số lượng loại thuốc

create proc [dbo].[cau9]
@soluong int
as
begin
	if not exists (select * from ThamSo where MaLoai = N'l4')
		return 0
	update ThamSo set SoLuong =@soluong where MaLoai = N'l4'
	return 1
end
GO
USE [master]
GO
ALTER DATABASE [udql] SET  READ_WRITE 
GO
