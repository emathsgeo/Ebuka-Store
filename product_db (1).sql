-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2026 at 03:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `production_brand`
--

CREATE TABLE `production_brand` (
  `Brand_Id` int(11) NOT NULL,
  `Brand_Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_brand`
--

INSERT INTO `production_brand` (`Brand_Id`, `Brand_Name`) VALUES
(1, 'SamSung'),
(2, 'Iphone'),
(3, 'Infinix');

-- --------------------------------------------------------

--
-- Table structure for table `production_category`
--

CREATE TABLE `production_category` (
  `Category_Id` int(11) NOT NULL,
  `Category_Name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_category`
--

INSERT INTO `production_category` (`Category_Id`, `Category_Name`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3');

-- --------------------------------------------------------

--
-- Table structure for table `production_product`
--

CREATE TABLE `production_product` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(30) NOT NULL,
  `Brand_ID` int(11) NOT NULL,
  `Category_Id` int(11) DEFAULT NULL,
  `Model_Year` smallint(6) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_product`
--

INSERT INTO `production_product` (`Product_Id`, `Product_Name`, `Brand_ID`, `Category_Id`, `Model_Year`, `Price`) VALUES
(1, 'EB', 1, 1, 2023, 108.56),
(2, 'ELO', 2, 2, 2024, 126.34),
(3, 'EB', 1, 1, 2025, 143.75);

-- --------------------------------------------------------

--
-- Table structure for table `product_stock`
--

CREATE TABLE `product_stock` (
  `Store_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_stock`
--

INSERT INTO `product_stock` (`Store_Id`, `Product_Id`, `Qty`) VALUES
(1, 1, 20),
(1, 2, 10),
(2, 3, 30);

-- --------------------------------------------------------

--
-- Table structure for table `sales_customer`
--

CREATE TABLE `sales_customer` (
  `Customer_Id` int(11) NOT NULL,
  `First_Name` varchar(25) NOT NULL,
  `Last_Name` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Zip` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_customer`
--

INSERT INTO `sales_customer` (`Customer_Id`, `First_Name`, `Last_Name`, `email`, `Street`, `City`, `State`, `Zip`) VALUES
(1, 'Ebuka', 'Ojiakor', 'ebukapojikaor@gmail.com', '5 Iboku street New Market Road', 'Onitsha', 'Anambra', '415647'),
(2, 'Elochukwu', 'Muokwe', 'elochukwumuokwe@gmail.com', '34 Yaba street Old Road', 'Aba', 'Abia', '217847'),
(3, 'Chinwe', 'Oranebo', 'chinweoranebo@gmail.com', '93 ofuba street', 'Enugu', 'Anambra', '901476');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `Order_Id` int(11) NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  `Order_status` tinyint(4) NOT NULL,
  `Required_Date` varchar(25) DEFAULT NULL,
  `Shipped_Date` varchar(25) DEFAULT NULL,
  `Store_Id` int(11) NOT NULL,
  `Staff_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`Order_Id`, `Customer_Id`, `Order_status`, `Required_Date`, `Shipped_Date`, `Store_Id`, `Staff_Id`) VALUES
(1, 1, 1, '20-04-2026', '03-06-2026', 1, 2),
(2, 2, 1, '22-05-2026', '10-06-2026', 2, 3),
(3, 3, 1, '28-05-2026', '29-06-2026', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_item`
--

CREATE TABLE `sales_order_item` (
  `Order_Id` int(11) NOT NULL,
  `Item_Id` int(11) NOT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  `Discount` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_order_item`
--

INSERT INTO `sales_order_item` (`Order_Id`, `Item_Id`, `Product_Id`, `Qty`, `Price`, `Discount`) VALUES
(1, 1, 2, 20, 300.02, 1.01),
(1, 2, 3, 50, 400.98, 2.03),
(2, 1, 2, 60, 999.99, 5.03);

-- --------------------------------------------------------

--
-- Table structure for table `sales_staff`
--

CREATE TABLE `sales_staff` (
  `Staff_Id` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Active` tinyint(4) DEFAULT NULL,
  `Store_Id` int(11) DEFAULT NULL,
  `Manager_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_staff`
--

INSERT INTO `sales_staff` (`Staff_Id`, `First_Name`, `Last_Name`, `email`, `Phone`, `Active`, `Store_Id`, `Manager_Id`) VALUES
(1, 'Uzochukwu', 'Ekwunife', 'uzochukwuekwunife@gmail.com', '08105763052', 1, NULL, NULL),
(2, 'Ugochukwu', 'Madu', 'ugochukwumadu@gmail.com', '09006433052', 1, NULL, 1),
(3, 'Nnaemeka', 'Oranebo', 'nnaemekaoranebo@gmail.com', '07034569027', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_store`
--

CREATE TABLE `sales_store` (
  `Store_Id` int(11) NOT NULL,
  `Store_Name` varchar(30) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `Street` varchar(30) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Zip` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_store`
--

INSERT INTO `sales_store` (`Store_Id`, `Store_Name`, `Phone_Number`, `email`, `Street`, `State`, `Zip`) VALUES
(1, 'Fab store', '08105763052', 'ebukaojiakor@gmail.com', '10 ibo street fegge onitsha', 'Anambra', '456798'),
(2, 'Ayo store', '07005763852', 'elochukwuokafor@gmail.com', '20 Njubigbo street Awada onits', 'Anambra', '976705'),
(3, 'Ileagu store', '0900436302', 'adaolisa@gmail.com', '7 Abajue street ozomagala onit', 'Imo', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `production_brand`
--
ALTER TABLE `production_brand`
  ADD PRIMARY KEY (`Brand_Id`);

--
-- Indexes for table `production_category`
--
ALTER TABLE `production_category`
  ADD PRIMARY KEY (`Category_Id`);

--
-- Indexes for table `production_product`
--
ALTER TABLE `production_product`
  ADD PRIMARY KEY (`Product_Id`),
  ADD KEY `FK_Product_Category` (`Category_Id`),
  ADD KEY `FK_Product_Brand` (`Brand_ID`);

--
-- Indexes for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD PRIMARY KEY (`Store_Id`,`Product_Id`),
  ADD KEY `FK_stock_Product_Id` (`Product_Id`);

--
-- Indexes for table `sales_customer`
--
ALTER TABLE `sales_customer`
  ADD PRIMARY KEY (`Customer_Id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`Order_Id`),
  ADD KEY `FK_Order_Store_Id` (`Store_Id`),
  ADD KEY `FK_Order_Staff_Id` (`Staff_Id`),
  ADD KEY `FK_Order_Customer_Id` (`Customer_Id`);

--
-- Indexes for table `sales_order_item`
--
ALTER TABLE `sales_order_item`
  ADD PRIMARY KEY (`Order_Id`,`Item_Id`),
  ADD KEY `FK_OrderItem_Product` (`Product_Id`);

--
-- Indexes for table `sales_staff`
--
ALTER TABLE `sales_staff`
  ADD PRIMARY KEY (`Staff_Id`),
  ADD KEY `FK_staff_Store_Id` (`Store_Id`),
  ADD KEY `FK_Staff_ManagerId` (`Manager_Id`);

--
-- Indexes for table `sales_store`
--
ALTER TABLE `sales_store`
  ADD PRIMARY KEY (`Store_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `production_brand`
--
ALTER TABLE `production_brand`
  MODIFY `Brand_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `production_category`
--
ALTER TABLE `production_category`
  MODIFY `Category_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `production_product`
--
ALTER TABLE `production_product`
  MODIFY `Product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_stock`
--
ALTER TABLE `product_stock`
  MODIFY `Store_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `Order_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_staff`
--
ALTER TABLE `sales_staff`
  MODIFY `Staff_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_store`
--
ALTER TABLE `sales_store`
  MODIFY `Store_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `production_product`
--
ALTER TABLE `production_product`
  ADD CONSTRAINT `FK_Product_Brand` FOREIGN KEY (`Brand_ID`) REFERENCES `production_brand` (`Brand_Id`),
  ADD CONSTRAINT `FK_Product_Category` FOREIGN KEY (`Category_Id`) REFERENCES `production_category` (`Category_Id`);

--
-- Constraints for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD CONSTRAINT `FK_stock_Product_Id` FOREIGN KEY (`Product_Id`) REFERENCES `production_product` (`Product_Id`),
  ADD CONSTRAINT `FK_stock_Store_Id` FOREIGN KEY (`Store_Id`) REFERENCES `sales_store` (`Store_Id`);

--
-- Constraints for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `FK_Order_Customer_Id` FOREIGN KEY (`Customer_Id`) REFERENCES `sales_customer` (`Customer_Id`),
  ADD CONSTRAINT `FK_Order_Staff_Id` FOREIGN KEY (`Staff_Id`) REFERENCES `sales_staff` (`Staff_Id`),
  ADD CONSTRAINT `FK_Order_Store_Id` FOREIGN KEY (`Store_Id`) REFERENCES `sales_store` (`Store_Id`);

--
-- Constraints for table `sales_order_item`
--
ALTER TABLE `sales_order_item`
  ADD CONSTRAINT `FK_OrderItem_Order` FOREIGN KEY (`Order_Id`) REFERENCES `sales_order` (`Order_Id`),
  ADD CONSTRAINT `FK_OrderItem_Product` FOREIGN KEY (`Product_Id`) REFERENCES `production_product` (`Product_Id`);

--
-- Constraints for table `sales_staff`
--
ALTER TABLE `sales_staff`
  ADD CONSTRAINT `FK_Staff_ManagerId` FOREIGN KEY (`Manager_Id`) REFERENCES `sales_staff` (`Staff_Id`),
  ADD CONSTRAINT `FK_staff_Store_Id` FOREIGN KEY (`Store_Id`) REFERENCES `sales_store` (`Store_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
