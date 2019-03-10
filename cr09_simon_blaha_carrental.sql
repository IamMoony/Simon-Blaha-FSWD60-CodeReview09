-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2019 at 12:37 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_simon_blaha_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `Address` text,
  `City` text,
  `ZIP_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `Address`, `City`, `ZIP_Code`) VALUES
(4, 'Franz-Gasse 16', 'Vienna', 1140),
(5, 'Fritz-Gasse 20', 'Vienna', 1220),
(6, 'Friedrich-Gasse 1', 'Vienna', 1010);

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `Agency_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `fk_Address_ID` int(11) NOT NULL,
  `fk_inovice_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`Agency_ID`, `Name`, `fk_Address_ID`, `fk_inovice_ID`) VALUES
(1, 'Rent-a-Car', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `fk_Address_ID` int(11) NOT NULL,
  `fk_Rsv_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Name`, `fk_Address_ID`, `fk_Rsv_ID`) VALUES
(1, 'Max Bauer', 6, 1),
(2, 'Goran Gustav', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_ID` int(11) NOT NULL,
  `Invoice_Nr` int(11) NOT NULL,
  `Payment_Options` text NOT NULL,
  `Total_Amount` int(11) NOT NULL,
  `fk_Rsv_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Invoice_ID`, `Invoice_Nr`, `Payment_Options`, `Total_Amount`, `fk_Rsv_ID`) VALUES
(1, 1423, 'Credit Card', 200, 1),
(2, 1234, 'Cash', 500, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Rsv_ID` int(11) NOT NULL,
  `Rsv_Number` int(11) NOT NULL,
  `fk_Vehicle_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Rsv_ID`, `Rsv_Number`, `fk_Vehicle_ID`) VALUES
(1, 12345678, 0),
(2, 14231423, 2);

-- --------------------------------------------------------

--
-- Table structure for table `return_location`
--

CREATE TABLE `return_location` (
  `Return_ID` int(11) NOT NULL,
  `Name` text,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Car_Condition` text,
  `fk_Address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_location`
--

INSERT INTO `return_location` (`Return_ID`, `Name`, `Date`, `Time`, `Car_Condition`, `fk_Address_ID`) VALUES
(1, 'G3 Shopping Resort', '2019-03-13', '09:00:00', 'GOOD', 5),
(2, 'Karslplatz', '2019-03-13', '12:00:00', 'BAD', 5);

-- --------------------------------------------------------

--
-- Table structure for table `return_location_address`
--

CREATE TABLE `return_location_address` (
  `Return_Loc_ID` int(11) NOT NULL,
  `fk_Return_ID` int(11) NOT NULL,
  `fk_Address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `start_location`
--

CREATE TABLE `start_location` (
  `Start_ID` int(11) NOT NULL,
  `Name` text,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `fk_Address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `start_location`
--

INSERT INTO `start_location` (`Start_ID`, `Name`, `Date`, `Time`, `fk_Address_ID`) VALUES
(3, 'Donauzentrum', '2019-03-12', '19:00:00', 5),
(4, 'Stephansplatz', '2019-03-15', '10:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `start_location_address`
--

CREATE TABLE `start_location_address` (
  `Start_Loc_ID` int(11) NOT NULL,
  `fk_Start_ID` int(11) NOT NULL,
  `fk_Address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Vehicle_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Type` text NOT NULL,
  `Brand` text NOT NULL,
  `Price` int(11) NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  `fk_Start_ID` int(11) NOT NULL,
  `fk_Return_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_ID`, `Name`, `Type`, `Brand`, `Price`, `Availability`, `fk_Start_ID`, `fk_Return_ID`) VALUES
(0, 'Peugeot 307', 'Gas', 'Peugeot', 50, 1, 3, 1),
(2, 'BWM M3', 'Gas', 'BMW', 100, 0, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`Agency_ID`),
  ADD KEY `fk_Address_ID` (`fk_Address_ID`),
  ADD KEY `fk_inovice_ID` (`fk_inovice_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `fk_Address_ID` (`fk_Address_ID`),
  ADD KEY `fk_Rsv_ID` (`fk_Rsv_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `fk_Rsv_ID` (`fk_Rsv_ID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Rsv_ID`),
  ADD KEY `fk_Vehicle_ID` (`fk_Vehicle_ID`);

--
-- Indexes for table `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`Return_ID`),
  ADD KEY `fk_Address_ID` (`fk_Address_ID`);

--
-- Indexes for table `return_location_address`
--
ALTER TABLE `return_location_address`
  ADD PRIMARY KEY (`Return_Loc_ID`),
  ADD KEY `fk_Return_ID` (`fk_Return_ID`),
  ADD KEY `fk_Address_ID` (`fk_Address_ID`);

--
-- Indexes for table `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`Start_ID`),
  ADD KEY `fk_Address_ID` (`fk_Address_ID`);

--
-- Indexes for table `start_location_address`
--
ALTER TABLE `start_location_address`
  ADD PRIMARY KEY (`Start_Loc_ID`),
  ADD KEY `fk_Start_ID` (`fk_Start_ID`),
  ADD KEY `fk_Address_ID` (`fk_Address_ID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_ID`),
  ADD KEY `fk_Start_ID` (`fk_Start_ID`),
  ADD KEY `fk_Return_ID` (`fk_Return_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `Agency_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Invoice_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Rsv_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `return_location`
--
ALTER TABLE `return_location`
  MODIFY `Return_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `return_location_address`
--
ALTER TABLE `return_location_address`
  MODIFY `Return_Loc_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `start_location`
--
ALTER TABLE `start_location`
  MODIFY `Start_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `start_location_address`
--
ALTER TABLE `start_location_address`
  MODIFY `Start_Loc_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_Address_ID`) REFERENCES `address` (`Address_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`fk_inovice_ID`) REFERENCES `invoice` (`Invoice_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_Address_ID`) REFERENCES `address` (`Address_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_Rsv_ID`) REFERENCES `reservation` (`Rsv_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_Rsv_ID`) REFERENCES `reservation` (`Rsv_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `return_location`
--
ALTER TABLE `return_location`
  ADD CONSTRAINT `return_location_ibfk_1` FOREIGN KEY (`fk_Address_ID`) REFERENCES `address` (`Address_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `return_location_address`
--
ALTER TABLE `return_location_address`
  ADD CONSTRAINT `return_location_address_ibfk_1` FOREIGN KEY (`fk_Return_ID`) REFERENCES `return_location` (`Return_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `return_location_address_ibfk_2` FOREIGN KEY (`fk_Address_ID`) REFERENCES `address` (`Address_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `start_location`
--
ALTER TABLE `start_location`
  ADD CONSTRAINT `start_location_ibfk_2` FOREIGN KEY (`fk_Address_ID`) REFERENCES `address` (`Address_ID`);

--
-- Constraints for table `start_location_address`
--
ALTER TABLE `start_location_address`
  ADD CONSTRAINT `start_location_address_ibfk_1` FOREIGN KEY (`fk_Start_ID`) REFERENCES `start_location` (`Start_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `start_location_address_ibfk_2` FOREIGN KEY (`fk_Address_ID`) REFERENCES `address` (`Address_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`fk_Start_ID`) REFERENCES `start_location` (`Start_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`fk_Return_ID`) REFERENCES `return_location` (`Return_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
