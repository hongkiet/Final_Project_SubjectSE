SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `se_final_project` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `se_final_project`;

CREATE TABLE `account` (
  `maNV` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tenNV` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `taikhoan` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chucvu` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `account` (`maNV` ,`tenNV`,`taikhoan`, `phone_number`, `email`, `matkhau`, `chucvu`) VALUES
('0001', 'Chu server','admin', '0000000',  'admin@gmail.com', '123456','Quan tri');

CREATE TABLE `sanpham` (
  `maSP` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tenSP` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nsx` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dongia` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngaynhap` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngayxuat` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `mota` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`maSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


 
INSERT INTO `sanpham` (`maSP`, `tenSP`, `nsx`, `dongia`,  `ngaynhap`, `ngayxuat`, `mota`) VALUES ('SP001', 'Samsung Galaxy S21 Ultra 5G', 'Samsung', '25000000', '2022-01-01 00:00:00', '2022-01-07 00:00:00', 'Màn hình 6.8 inch, RAM 12GB, bộ nhớ 256GB, camera 108MP'),
('SP002', 'iPhone 13 Pro Max', 'Apple', '29990000',  '2022-02-01 00:00:00', '2022-02-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 12MP'),
('SP003', 'OnePlus 10 Pro', 'OnePlus', '19990000',  '2022-03-01 00:00:00', '2022-03-07 00:00:00', 'Màn hình 6.7 inch, RAM 12GB, bộ nhớ 512GB, camera 64MP'),
('SP004', 'Xiaomi 12 Ultra', 'Xiaomi', '17990000',  '2022-04-01 00:00:00', '2022-04-07 00:00:00', 'Màn hình 6.81 inch, RAM 12GB, bộ nhớ 256GB, camera 200MP'),
('SP005', 'Oppo Find X5 Pro', 'Oppo', '21990000',  '2022-05-01 00:00:00', '2022-05-07 00:00:00', 'Màn hình 6.7 inch, RAM 8GB, bộ nhớ 128GB, camera 108MP')