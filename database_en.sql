-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 09, 2023 lúc 12:54 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE IF NOT EXISTS se_final_project DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE se_final_project;
--
-- Cơ sở dữ liệu: `se_final_project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bestseller`
--

CREATE TABLE `bestseller` (
  `ProductID` varchar(64) NOT NULL,
  `TotalQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bestseller`
--

INSERT INTO `bestseller` (`ProductID`, `TotalQuantity`) VALUES
('SP008', 42);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `maKH` int(11) NOT NULL,
  `productId` varchar(64) DEFAULT NULL,
  `productName` text NOT NULL,
  `dongia` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `thanhtien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `MaKH` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `TenKH` varchar(255) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `SoDienThoai` varchar(20) NOT NULL,
  `TaiKhoan` varchar(50) NOT NULL,
  `MatKhau` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `maKH` int(11) NOT NULL,
  `Name` text NOT NULL,
  `NgayGiao` date NOT NULL,
  `NgayNhan` date NOT NULL,
  `status` text DEFAULT NULL,
  `productID` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `exportreceipt` (
  `maPXK` int(11) NOT NULL  AUTO_INCREMENT PRIMARY KEY,
  `maKH` int(11) NOT NULL,
  `ngayXuatKho` date NOT NULL,
  `tongTien` decimal(18,2) NOT NULL,
  `ProductID` varchar(64) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `OriPrice` decimal(18,2) NOT NULL,
  `SalePrice` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `importreceipt`
--

CREATE TABLE `importreceipt` (
  `maPNK` int(11) NOT NULL,
  `ngayNhap` date NOT NULL,
  `tongTien` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `maSP` varchar(64) NOT NULL,
  `tenSP` varchar(64) NOT NULL,
  `nsx` varchar(64) NOT NULL,
  `dongia` int(11) DEFAULT NULL,
  `ngaynhap` date DEFAULT NULL,
  `ngayxuat` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `mota` varchar(64) NOT NULL,
  `sl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`maSP`, `tenSP`, `nsx`, `dongia`, `ngaynhap`, `ngayxuat`, `mota`, `sl`) VALUES
('SP001', 'Samsung Galaxy S21 Ultra 5G', 'Samsung', 25000000, '2022-01-01', '2022-01-07 00:00:00', 'Màn hình 6.8 inch, RAM 12GB, bộ nhớ 256GB, camera 108MP', 53),
('SP002', 'iPhone 13 Pro Max', 'Apple', 29990000, '2022-02-01', '2022-02-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 12MP', 97),
('SP003', 'OnePlus 10 Pro', 'OnePlus', 19990000, '2022-03-01', '2022-03-07 00:00:00', 'Màn hình 6.7 inch, RAM 12GB, bộ nhớ 512GB, camera 64MP', 28),
('SP004', 'Xiaomi 12 Ultra', 'Xiaomi', 17990000, '2022-04-01', '2022-04-07 00:00:00', 'Màn hình 6.81 inch, RAM 12GB, bộ nhớ 256GB, camera 200MP', -15),
('SP005', 'Oppo Find X5 Pro', 'Oppo', 21990000, '2022-05-01', '2022-05-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 108MP', 70),
('SP006', 'Huawei P50 Pro', 'Huawei', 23990000, '2022-06-01', '2022-06-07 00:00:00', 'Màn hình 6.6 inch, RAM 8GB, bộ nhớ 256GB, camera 50MP', 28),
('SP007', 'Google Pixel 6 Pro', 'Google', 26990000, '2022-07-01', '2022-07-07 00:00:00', 'Màn hình 6.7 inch, RAM 12GB, bộ nhớ 512GB, camera 50MP', 17),
('SP008', 'Realme GT 2 Pro', 'Realme', 15990000, '2022-08-01', '2022-08-07 00:00:00', 'Màn hình 6.8 inch, RAM 12GB, bộ nhớ 256GB, camera 64MP', 0),
('SP009', 'Vivo X70 Pro Plus', 'Vivo', 29990000, '2022-09-01', '2022-09-07 00:00:00', 'Màn hình 6.8 inch, RAM 12GB, bộ nhớ 512GB, camera 50MP', 22),
('SP010', 'Sony Xperia 1 III', 'Sony', 25990000, '2022-10-01', '2022-10-07 00:00:00', 'Màn hình 6.5 inch, RAM 12GB, bộ nhớ 256GB, camera 12MP', 38),
('SP011', 'Motorola Edge 20 Pro', 'Motorola', 17990000, '2022-11-01', '2022-11-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 108MP', 50),
('SP012', 'Asus ROG Phone 5S Pro', 'Asus', 21990000, '2022-12-01', '2022-12-07 00:00:00', 'Màn hình 6.78 inch, RAM 16GB, bộ nhớ 512GB, camera 64MP', 11),
('SP013', 'Nokia X100', 'Nokia', 15990000, '2023-01-01', '2023-01-07 00:00:00', 'Màn hình 6.67 inch, RAM 8GB, bộ nhớ 128GB, camera 64MP', 28),
('SP014', 'LG V90 ThinQ', 'LG', 12990000, '2023-02-01', '2023-02-07 00:00:00', 'Màn hình 6.8 inch, RAM 8GB, bộ nhớ 256GB, camera 64MP', 46),
('SP015', 'Lenovo Legion Duel 3', 'Lenovo', 18990000, '2023-03-01', '2023-03-07 00:00:00', 'Màn hình 6.92 inch, RAM 12GB, bộ nhớ 512GB, camera 64MP', 21),
('SP016', 'ZTE Axon 30 Ultra', 'ZTE', 21990000, '2023-04-01', '2023-04-07 00:00:00', 'Màn hình 6.67 inch, RAM 12GB, bộ nhớ 256GB, camera 64MP', 29),
('SP017', 'BlackBerry Key3', 'BlackBerry', 14990000, '2023-05-01', '2023-05-07 00:00:00', 'Bàn phím QWERTY, màn hình 6.2 inch, RAM 6GB, bộ nhớ 128GB, camer', 16),
('SP018', 'Honor 50 Pro Plus', 'Honor', 22990000, '2023-06-01', '2023-06-07 00:00:00', 'Màn hình 6.72 inch, RAM 12GB, bộ nhớ 512GB, camera 50MP', 41),
('SP019', 'CAT S62 Pro', 'CAT', 17990000, '2023-07-01', '2023-07-07 00:00:00', 'Màn hình 5.7 inch, RAM 6GB, bộ nhớ 128GB, camera 12MP', 9),
('SP020', 'TCL 30 Pro 5G', 'TCL', 15990000, '2023-08-01', '2023-08-07 00:00:00', 'Màn hình 6.67 inch, RAM 8GB, bộ nhớ 256GB, camera 64MP', 62);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productout`
--

CREATE TABLE `productout` (
  `maSP` varchar(64) NOT NULL,
  `tenSP` varchar(64) NOT NULL,
  `nsx` varchar(64) NOT NULL,
  `dongia` int(11) DEFAULT NULL,
  `ngaynhap` datetime NOT NULL DEFAULT current_timestamp(),
  `ngayxuat` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `mota` varchar(64) NOT NULL,
  `sl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `productout`
--

INSERT INTO `productout` (`maSP`, `tenSP`, `nsx`, `dongia`, `ngaynhap`, `ngayxuat`, `mota`, `sl`) VALUES
('SP001', 'Samsung Galaxy S21 Ultra 5G', 'Samsung', 27500000, '2022-01-01 00:00:00', '2022-01-07 00:00:00', 'Màn hình 6.8 inch, RAM 12GB, bộ nhớ 256GB, camera 108MP', 53),
('SP002', 'iPhone 13 Pro Max', 'Apple', 32989000, '2022-02-01 00:00:00', '2022-02-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 12MP', 97),
('SP003', 'OnePlus 10 Pro', 'OnePlus', 21989000, '2022-03-01 00:00:00', '2022-03-07 00:00:00', 'Màn hình 6.7 inch, RAM 12GB, bộ nhớ 512GB, camera 64MP', 28),
('SP004', 'Xiaomi 12 Ultra', 'Xiaomi', 19789000, '2022-04-01 00:00:00', '2022-04-07 00:00:00', 'Màn hình 6.81 inch, RAM 12GB, bộ nhớ 256GB, camera 200MP', -15),
('SP005', 'Oppo Find X5 Pro', 'Oppo', 24189000, '2022-05-01 00:00:00', '2022-05-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 108MP', 70),
('SP006', 'Huawei P50 Pro', 'Huawei', 26389000, '2022-06-01 00:00:00', '2022-06-07 00:00:00', 'Màn hình 6.6 inch, RAM 8GB, bộ nhớ 256GB, camera 50MP', 28),
('SP007', 'Google Pixel 6 Pro', 'Google', 29689000, '2022-07-01 00:00:00', '2022-07-07 00:00:00', 'Màn hình 6.7 inch, RAM 12GB, bộ nhớ 512GB, camera 50MP', 17),
('SP008', 'Realme GT 2 Pro', 'Realme', 17589000, '2022-08-01 00:00:00', '2022-08-07 00:00:00', 'Màn hình 6.8 inch, RAM 12GB, bộ nhớ 256GB, camera 64MP', 0),
('SP009', 'Vivo X70 Pro Plus', 'Vivo', 32989000, '2022-09-01 00:00:00', '2022-09-07 00:00:00', 'Màn hình 6.8 inch, RAM 12GB, bộ nhớ 512GB, camera 50MP', 22),
('SP010', 'Sony Xperia 1 III', 'Sony', 28589000, '2022-10-01 00:00:00', '2022-10-07 00:00:00', 'Màn hình 6.5 inch, RAM 12GB, bộ nhớ 256GB, camera 12MP', 38),
('SP011', 'Motorola Edge 20 Pro', 'Motorola', 19789000, '2022-11-01 00:00:00', '2022-11-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 108MP', 50),
('SP012', 'Asus ROG Phone 5S Pro', 'Asus', 24189000, '2022-12-01 00:00:00', '2022-12-07 00:00:00', 'Màn hình 6.78 inch, RAM 16GB, bộ nhớ 512GB, camera 64MP', 11),
('SP013', 'Nokia X100', 'Nokia', 17589000, '2023-01-01 00:00:00', '2023-01-07 00:00:00', 'Màn hình 6.67 inch, RAM 8GB, bộ nhớ 128GB, camera 64MP', 28),
('SP014', 'LG V90 ThinQ', 'LG', 14289000, '2023-02-01 00:00:00', '2023-02-07 00:00:00', 'Màn hình 6.8 inch, RAM 8GB, bộ nhớ 256GB, camera 64MP', 46),
('SP015', 'Lenovo Legion Duel 3', 'Lenovo', 20889000, '2023-03-01 00:00:00', '2023-03-07 00:00:00', 'Màn hình 6.92 inch, RAM 12GB, bộ nhớ 512GB, camera 64MP', 21),
('SP016', 'ZTE Axon 30 Ultra', 'ZTE', 24189000, '2023-04-01 00:00:00', '2023-04-07 00:00:00', 'Màn hình 6.67 inch, RAM 12GB, bộ nhớ 256GB, camera 64MP', 29),
('SP017', 'BlackBerry Key3', 'BlackBerry', 16489000, '2023-05-01 00:00:00', '2023-05-07 00:00:00', 'Bàn phím QWERTY, màn hình 6.2 inch, RAM 6GB, bộ nhớ 128GB, camer', 16),
('SP018', 'Honor 50 Pro Plus', 'Honor', 25289000, '2023-06-01 00:00:00', '2023-06-07 00:00:00', 'Màn hình 6.72 inch, RAM 12GB, bộ nhớ 512GB, camera 50MP', 41),
('SP019', 'CAT S62 Pro', 'CAT', 19789000, '2023-07-01 00:00:00', '2023-07-07 00:00:00', 'Màn hình 5.7 inch, RAM 6GB, bộ nhớ 128GB, camera 12MP', 9),
('SP020', 'TCL 30 Pro 5G', 'TCL', 17589000, '2023-08-01 00:00:00', '2023-08-07 00:00:00', 'Màn hình 6.67 inch, RAM 8GB, bộ nhớ 256GB, camera 64MP', 62);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reset_token`
--

CREATE TABLE `reset_token` (
  `email` varchar(64) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expire_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `sID` varchar(64) NOT NULL,
  `sName` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `phone_number` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `chucvu` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`sID`, `sName`, `username`, `phone_number`, `email`, `password`, `chucvu`) VALUES
('0001', 'Admin', 'admin', '0000000', 'admin@gmail.com', '123456', 'Admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongke`
--

CREATE TABLE `thongke` (
  `ProductID` varchar(64) NOT NULL,
  `TotalSalePrice` int(11) NOT NULL,
  `TotalOriPrice` int(11) DEFAULT NULL,
  `Profit` int(11) DEFAULT NULL,
  `TotalSale` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thongke`
--


--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customer`
--


--
-- Chỉ mục cho bảng `exportreceipt`
--


--
-- Chỉ mục cho bảng `importreceipt`
--
ALTER TABLE `importreceipt`
  ADD PRIMARY KEY (`maPNK`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`maSP`);

--
-- Chỉ mục cho bảng `productout`
--
ALTER TABLE `productout`
  ADD PRIMARY KEY (`maSP`);

--
-- Chỉ mục cho bảng `reset_token`
--
ALTER TABLE `reset_token`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `thongke`
--
ALTER TABLE `thongke`
  ADD UNIQUE KEY `ProductID` (`ProductID`),
  ADD UNIQUE KEY `ProductID_2` (`ProductID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--



--
-- AUTO_INCREMENT cho bảng `importreceipt`
--
ALTER TABLE `importreceipt`
  MODIFY `maPNK` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;