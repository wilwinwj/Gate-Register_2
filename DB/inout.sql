-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2024 at 03:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libinout`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `borrowernumber` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `categorycode` varchar(255) DEFAULT NULL,
  `programcode` varchar(255) DEFAULT NULL,
  `sort1` varchar(255) DEFAULT NULL,
  `sort2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cardnumber` varchar(255) DEFAULT NULL,
  `dateexpiry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `title`, `name`, `borrowernumber`, `gender`, `categorycode`, `programcode`, `sort1`, `sort2`, `mobile`, `email`, `cardnumber`, `dateexpiry`) VALUES
(1, 'Mr', 'John', 'Doe', 'B12345', 'Male', 'CAT001', 'BRANCH001', 'SortValue1', 'SortValue2', '1234567890', 'john.doe@example.com', 'CARD123', '2024-12-31'),
(2, 'Ms.', 'Alice', 'Smith', 'B987654', 'Female', 'CAT002', 'Branch002', 'SortValue3', 'SortValue4', '+9876543210', 'alice.smith@example.com', 'CARD1234', '2024-10-15'),
(3, 'Mr.', 'Michael', 'Johnson', 'B555555', 'Male', 'CAT001', 'Branch001', 'SortValue5', 'SortValue6', '+5555555555', 'michael.johnson@example.com', '22UDS042', '2025-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `programcode` varchar(10) NOT NULL,
  `branchname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`programcode`, `branchname`) VALUES
('B001', 'BSc CS-DS'),
('B002', 'BCA'),
('B003', 'BBA'),
('B004', 'BSc CS');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorycode` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorycode`, `description`) VALUES
('CAT001', 'Staff'),
('CAT002', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `gender_count`
--

CREATE TABLE `gender_count` (
  `id` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gender_count`
--

INSERT INTO `gender_count` (`id`, `gender`, `count`) VALUES
(1, 'Male', 1),
(2, 'Female', 0);

-- --------------------------------------------------------

--
-- Table structure for table `inout`
--

CREATE TABLE `inout` (
  `sl` int(50) NOT NULL,
  `cardnumber` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `entry` time NOT NULL,
  `exit` time NOT NULL DEFAULT '00:00:00',
  `status` varchar(10) NOT NULL,
  `loc` varchar(30) NOT NULL DEFAULT '',
  `cc` varchar(100) NOT NULL DEFAULT '',
  `branch` varchar(100) NOT NULL DEFAULT '',
  `sort1` varchar(30) NOT NULL DEFAULT '',
  `sort2` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(120) NOT NULL DEFAULT '',
  `mob` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inout`
--

INSERT INTO `inout` (`sl`, `cardnumber`, `name`, `gender`, `date`, `entry`, `exit`, `status`, `loc`, `cc`, `branch`, `sort1`, `sort2`, `email`, `mob`) VALUES
(1, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:08:18', '21:08:34', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(2, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:08:45', '21:11:10', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(3, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:14:05', '21:14:26', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(4, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:27:47', '21:31:29', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(5, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:34:12', '21:36:36', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(6, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:39:25', '21:49:38', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(7, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:50:02', '21:50:23', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(8, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '21:51:56', '21:55:51', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(9, 'CARD123', 'Mr John Doe', 'Male', '2024-01-03', '22:09:41', '22:16:53', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(10, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '13:03:02', '13:03:16', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(11, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '13:03:35', '14:02:20', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(12, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '14:02:34', '14:02:55', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(13, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '14:07:10', '14:07:25', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(14, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '20:05:52', '20:23:45', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(15, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '20:24:06', '20:32:51', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(16, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '20:38:36', '20:38:54', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(17, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '20:41:03', '20:43:16', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(18, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '20:44:52', '20:53:41', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(19, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '21:01:53', '21:05:29', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(20, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '21:05:47', '21:06:04', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(21, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-04', '21:48:24', '21:48:36', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(22, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '22:01:10', '22:01:23', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(23, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '22:25:40', '22:26:12', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(24, 'CARD123', 'Mr John Doe', 'Male', '2024-01-04', '22:26:35', '22:27:12', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(25, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-05', '12:49:28', '12:59:51', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(26, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '12:49:38', '14:31:30', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(27, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-05', '12:50:54', '12:58:03', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(28, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '14:31:42', '14:46:15', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(29, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '14:46:39', '14:46:53', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(30, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '14:47:25', '14:47:41', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(31, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '14:48:09', '14:48:36', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(32, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:01:37', '15:01:52', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(33, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:03:40', '15:03:53', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(34, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-05', '15:04:08', '15:16:34', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(35, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:17:39', '15:17:50', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(36, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-05', '15:18:38', '15:29:06', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(37, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:18:41', '15:28:28', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(38, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:28:47', '15:28:58', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(39, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:29:09', '15:44:02', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(40, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:46:21', '15:48:19', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(41, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-05', '15:48:29', '15:48:58', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(42, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-05', '15:48:36', '15:49:05', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(43, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-05', '15:49:09', '15:49:40', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(44, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:49:12', '15:49:34', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(45, 'CARD123', 'Mr John Doe', 'Male', '2024-01-05', '15:56:08', '15:56:58', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(46, 'CARD123', 'Mr John Doe', 'Male', '2024-01-06', '14:15:45', '14:16:42', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(47, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-06', '14:15:59', '14:16:46', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(48, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-06', '14:16:04', '14:16:50', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(49, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-06', '14:17:10', '15:38:39', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(50, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-06', '14:17:11', '15:38:28', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(51, 'CARD123', 'Mr John Doe', 'Male', '2024-01-06', '14:17:11', '15:38:22', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(52, 'CARD123', 'Mr John Doe', 'Male', '2024-01-08', '08:03:37', '08:04:46', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(53, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-08', '08:03:49', '08:05:00', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(54, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-08', '08:03:59', '08:04:56', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(55, 'CARD123', 'Mr John Doe', 'Male', '2024-01-08', '08:20:28', '08:22:58', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(56, 'CARD123', 'Mr John Doe', 'Male', '2024-01-09', '11:52:19', '11:52:47', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(57, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-09', '11:52:26', '11:52:52', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(58, 'CARD123', 'Mr John Doe', 'Male', '2024-01-10', '14:28:53', '14:30:27', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(59, 'CARD123', 'Mr John Doe', 'Male', '2024-01-10', '15:04:51', '15:05:19', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(60, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-11', '09:16:47', '09:17:01', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(61, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '09:20:11', '09:20:22', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(62, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-11', '09:20:47', '09:21:53', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(63, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '10:05:35', '10:17:33', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(64, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-11', '10:11:45', '11:10:26', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(65, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-11', '10:13:23', '11:29:28', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(66, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '11:14:09', '11:15:40', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(67, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '11:16:48', '11:29:18', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(68, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-11', '11:29:02', '11:29:23', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(69, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '11:45:17', '12:04:10', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(70, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-11', '12:00:29', '12:05:48', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(71, '22UDS042', 'Mr. Michael Johnson', 'Male', '2024-01-11', '12:05:26', '14:27:50', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue5', 'SortValue6', 'michael.johnson@example.com', '+5555555555'),
(72, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '12:08:59', '12:14:13', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(73, 'CARD1234', 'Ms. Alice Smith', 'Female', '2024-01-11', '12:20:11', '12:41:49', 'OUT', 'K.S.R.E.I', 'Student', '', 'SortValue3', 'SortValue4', 'alice.smith@example.com', '+9876543210'),
(74, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '13:53:51', '13:54:44', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(75, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '14:32:08', '14:40:25', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(76, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '14:52:58', '14:59:51', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(77, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '15:11:37', '15:16:17', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(78, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '15:25:26', '15:28:45', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(79, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '15:33:53', '15:34:15', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(80, 'CARD123', 'Mr John Doe', 'Male', '2024-01-11', '15:36:00', '15:40:30', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890'),
(81, 'CARD123', 'Mr John Doe', 'Male', '2024-01-15', '15:57:54', '15:58:11', 'OUT', 'K.S.R.E.I', 'Staff', '', 'SortValue1', 'SortValue2', 'john.doe@example.com', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `loc`
--

CREATE TABLE `loc` (
  `id` int(11) NOT NULL,
  `loc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loc`
--

INSERT INTO `loc` (`id`, `loc`) VALUES
(1, 'K.S.R.E.I');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `usertype` varchar(100) NOT NULL DEFAULT '',
  `userid` varchar(20) NOT NULL,
  `action` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `date`, `time`, `usertype`, `userid`, `action`) VALUES
(1, '2024-01-03', '03:14 PM', 'Master', '1', 'Database Backup Done'),
(2, '2024-01-04', '01:05 PM', 'Master', '1', 'Database Backup Done');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `edate` varchar(20) NOT NULL,
  `nhead` varchar(50) NOT NULL,
  `nbody` varchar(600) NOT NULL,
  `nfoot` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `loc` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `edate`, `nhead`, `nbody`, `nfoot`, `status`, `loc`) VALUES
(1, '2024-01-10', '', 'hai', '', 'No', 'K.S.R.E.I'),
(2, '2024-01-11', 'A', 'it is   a good project and wi', '', 'No', 'K.S.R.E.I'),
(3, '2024-01-11', 'hi wilwinjoseph', '', '', 'No', 'K.S.R.E.I');

-- --------------------------------------------------------

--
-- Table structure for table `patronimage`
--

CREATE TABLE `patronimage` (
  `id` int(100) NOT NULL,
  `borrowernumber` varchar(11) DEFAULT NULL,
  `imagefile` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patronimage`
--

INSERT INTO `patronimage` (`id`, `borrowernumber`, `imagefile`) VALUES
(2, 'CARD123', 0x524946465244000057454250565038204644000070cc019d012aa2032e023f258ebe58ae29b534a55449faa02489636ed4cd9e63ef1bf1b473a0ff2dc5365c7fcad3dabafacbe09786e97abcaaa6a3dae7fc4f330e43f3d84dfc079abfb477e7f527fdb3a6ffaa0e761ddaff5dde8adbe0f9b87997f89daeff65ff77fb9f6cdc6dfc4f869d9dfff2f0f7f7dff6f97dbfd7be9bb3e2169f07d95428e797f8ce89afff3c1ebff68f2274f98052c7f1f225d2b6c023278f912e95b601193c7c8974adb008c9e3e44ba56d804621057a782c2419d3f4ba52050464e44e0ca02a6129f2fdec02d2ccc834c12760e1ddf4519b21bf549eea173f5e1682430c94eed2ad6a08c9c95e66eadab9b30dd6e5bf575644f42b7cadad172acccc6147f5842bc44b180b1dfc945539f45294ba32b884d85345cf4d4d2d8c518f92b6c023278b2a0b79e52b5a5677e44ba56cc42f6712500ed32bcf6e37688a61e0cb7b646ab2ad6a21fb74b5d19dd02c07eec633a21ed30114014a15b274437eeb192593e6fe7d104c2064893768ead11ebdfc712955b5bc20cbb6fa0fff73c623434151ace8c8d35da397404925471f0ef1aa0dbf6b97fbb7c07af4ba3869cae780dc12eddb4b2445348c81fec6b07cca5ded714e30cc6740eb7cadb0054d8bafa9a0ee1b5ec1d2bcd736d69cd514cfe055452ba8666a5048659c227ef9ef6c14c9a3da3707b91f1e81c0deb7b2f3044837cc656f4b7a356da784a6a15e5d77f14f2590e350f33073e489bac3dabf7ceb87416379896dc19e76cbfbb5b45d16d6921f32f89d59c81d2e88905e4e9d1d53adf92afbd4fc9ccb7b9e40fecb554bec701140cb08423610627d21c724549b1f2c72c46fb3dd5501bcd4bdb8c4b13fdd292d906f20ce6d4c2616161ee16c1c91bac6a6dda6e507cced4ae83611257b7a270b880251de7a6058cde8430d5044c6ad7e3a24f1619e30c771ebc25d58baac9516135368423a0e140ade6da49245c976274286bf05aa173792e2c0ff89384574af5356371d9b910d8d9a63ca193f7abdcfb4447dc3658dbef71b8055884569f9a44fbfc32263d9148f898defa0b08a2c647b0eabd149044e447aff01f0bfd5169b9354ee417d22beaa3abc4c78c71cec37f58374f9879bb6762a3a74408383fb33c7dd02c4db7861e97404b214fe2625068e60106eca724c7a9070656e54c19399ffd2187a02dec43e76fbae25b8a904473bfb8917ad462192ec3f3b7ea131b15ba47276ff96887d5c7f01a9df17d619bc3c80fcdd4fd5fb642e3d2d8292c0e7d6d4089841fda4e1c41d3b517e232788e112b2630070376f40c317dc7cb300549a48958138f0fd64c8ee01f00d4c31114e446b17bfe6bbdb0ecfcba4216b96c1adf0361c626b7ed3e928889175bc31b3bb0f0106f35bb65ce63de0cc16facd756ab46b80d500f5d01479a7137918d79080225a10ed932f07c8fe2f8cc9cd8f7f3b50009b8446b19944358fa79913dbc2c5f82475f6975ed8d1a60acf980bec5074b505debf2046e375e0dc6c394305ea655390a98fdec567352e6b88910b714e6c59455001b7c7acc0b5991bb20eec5c67d36a1a7825f25e5d60d988007d968dc8ec995ba06806696f9dee23a8915438f7e573f7ad1fca123d30ef111833dea5af9c76e792ab2721c3e30f712588ccb96c10f754f75c1c4d62d87a26545982e3af4f49c1ddcf40bbfa5906f93c0fd1b05e5a420fb7e61d9b1b8c685497f0a4fc822c42b1afb966c45863697413ba3f37445dce9167c98c6cbf372ab19481f565299d2ccd8f5cf0e150641152da7019b0635ab375da49e93b2be9c1dee59a26d0b46e6f58f3f5287ced4c19fa0d82511379b57b70f91bf8d45362f8e04529c2d0748378ff87bf3698208f098f9a5acc9f21e2e01008dfab1c97ba980a56080a095847e2c9e8019cb200ee7e553ef453c5f8d11a704c67f9c475c237c98b02f3796e656767ae0577d04d5e94efbeb01a4e5e7a0f3c1f413266ec53a7e34c01048d5c1f78d7a3045751f2ac1f381ccff663c98881e44c960c2ef1e8663d724eb530aadf6bbdeda1e3d257977e2a0ea7335167784ce0adc4a993b3eecac0f0a42f8cf4673b2cb7c837893830903c2ebf016ddbf4d8f817b828fe746438923d3cee21ec55d64817703f55fa461c344536fce1e720a655b843b671880323a01303afa33695af4419bcc7d02c52863d8a57b2f816cf5f3a8878ff9ecd6608eb83ca5077010f6d266ac9b46badce28e8e612373543756c8fdd8e1896b565d1eba39c48fb0018ee6e49205bf79eb854d9e5a4635820e2a2d536ef36de4adaae2d58678ded89cb99f074d36c6f10dfd3c3da5dc5a74334937d8ea8b6f6472e6966473a005209935c0668c09d3e84ec869332ac2ae4c5de23a821d6acb827d65f4c609ed56cfc710b2888b50b0045da906551ea97acc0b76f4289b4459f7a55486e02500e6628be30e480da834eb1cf9dd5c345ae2557303d476ce5edcd0e94bd7197a6e27170bb55eba771aacc56a7ae31cc8d2c91b97d860265069da602bc843d4b9fe2eed169df902ab65678af82f11a7d9f358ebc397057f47620e84491f5cf73ae3c995c6d3e48f1fe1be964c4aeae74d696bdc3903cc9b73e29681a53a3600a67994ba93decbbe72185d379437be364bbd23a0640d10c8afbcb55cd71889f7c8ce8c02a1d91d12c6f911166978513a9fd0a8d9f3328c083ad5d6492248953c030484056432e285d22032006621f0d9532fa253f0853e931e85b75ddbacb6d32b547a37d24b36158371d1dcffd73c48fb137f9a4abf3f09cb5bfea387078b9f6102297bdaeaab0e1f8a27fbc60a426a72e10aae017d7560a2ecc20be2290d4da9bd799d64c933fac45112910c61c0e5962cc2a7c81735be43d936f968cc3a618e2fd2e670a76dd985820ccefc7b2127f1c2eeceb5680e235708fda23273eb11866db802b95fc2681a138574183f8ba89443b598e3374a5aa14f7b957c9c832170e2e403037d26732f964fa06515d0675741f8f61b94cdd8150672c65493f8256256cbe5c395f53b8d5ff64fc1f1ced57f45e397ab8aaece5151469246f2f3f3f0176cdce94c2d92c78487a0ee18aa566ec8b6f8e9102ba04c20ea8e684672bd03bad7faaafb6e9f4f3e887ac9d3c72566c5069ea4be747c26648d6485abfc2bc4d0238790e69a4a9392bd8e3b4c1dfe6a771bbc3a0b15666a0d287d20bf4163a060828eff29e6357c238c8f1d7b1f6b72c1479b2ace9760c89bb8a68a230db9fbdcab871eeef7903d60c309eebc4ae865d7bd128dacb42b3855fa3efa2122ca40802daab5c6b056962b51552f0d94dd854c5b515aa1d42713909abca19e7535f05c35f18cd45ca9101c73265c70d51cfac01460713473bf42d9e984c6fcc3b41cf1049315092fecf2862e932b72e4f185f83e5dbacba375b7d46a0892ca838c1c95c22118b20cbe7c95fde6d66330ac486a836407da8bfe06e4afc21004f97cc41b19dd9a88f7d9c8d86aa70dcddd65d1328f1f6d54ff19329593d7933a9a3d11da600cf8fdcefe9e1eb44366875dfc79e33a6451bb72525fd02eafd1a4950558cb77b2abab9edd8579c61477b17cd8a08690bb1a8ffe8930a9bbda312f429396a8455b7e65866cee6632f041676eefab7a5120ad456b589d5ec9f5da4fd6c9494fd272d790f68e114d266531b28530ed32fb43b98b0bda7acf79bf4fb4a7a7cdd9c530c80b84e796abc242e4aa96dd8703cf87b460edb9753aaf0001653ddb9e25502c518de912bee794959f177ff9103fc8281544b6f1bb9a986e64a24b95dab37c8bf3013ba4735a5a24c898bfe59334467606842bccf217f9293763f197b8dc76d457d28593767358f1d240a6c74b16c399d5481404f47ba88e56ffddd340bb2ebb4c6a9bfc2b6c9ab3462e871db84395babb61290fbc7bd0c6b995212ef536860a936c4e2585ac1e9b37888e47e1b48d650b22aac8009f63e0849e49a03841ab3663c482990805656ce400d629fa91b0080dc39343dea3e72b613eab166609659a71f4feb48e2faaffb4a042137a621e3df7c09f5017ca5f7ed364951fcc39fd523a9df51576f7eb36c151778e043f9a92d9327f6da180f74394e7d59ce979987cf6879323ff2cbbdb1ebf4a7aa88268f92a8dfdd295388244f57202e3dbf24837caa955689fa410d9133e6d3aee85d4e3922c776ab5a80b1473291c7aa6b544d525863d1676b808f26e44dd87e501371aea8908f51f0d8de62d8a0212bc9503dac59fbf3830a067ef53842f99018ccf3b83da6225f4153198c59637e30e2460b0fea7d0b82d6c76c9156d9eca14439e5ab785839ff3cc95509e37d228e746959d7ae97fa7f12b0f1b6899d4317caa62309091647bf1f5061e507f4514288f9cc176d6475ec94a3bd4f6785b6b3dc1a2c729b5fa85945cf57d279e11e9f3fffbc965554af5401abf5fb70404adf39380771a12357785afeee8a4d99e485fad84e821d13b9124c10e478aec92b2a1e8954a1ef026a8e27e5545b5405511b5b2d05b5754a18ea08d28d201740203429dc543aed711e63dece76b9d636fa8f3427cb7575a2223f5e38aaf5dabbf24ae8ba000c216a9d1d1ab8c449d3db6ec08914b0e09da54aab3f4fc9cb8e6474ebf011fbe8801c79f8eb0e2c6baef7ab4ae3347d427a8b6c3db25264d5bfcca7a1eb18c2f2396eb26f03f134055bdafe37d9199f2c7b9f5eb043dc31afa453db10dfa536ec3f9c61a8b9125923450447e43607a164268a6d9f229f74560fac0d6b4f843eb889c74d0a4b574eb92038237fc6592602bc0bf3caee2c933335ace46e3c2d5ed6f1857cbc064fb4575dea506b43376318e23cd0b8ba9cb9e193c6cde8b9eb78b7e36d224e3519dd918e4f91be388c0e96ce2ade2bdf142cfae7a95b694b5e97716a6a37ffa0e34e2b7b3a3984b0672a7a782e271688701af6c20ec4af1d1897b221c896139ef86364e8e5cd535aa566ba311892317a11241ae56df430357ea15a8b6df0d187347139d50e868a149f6d9141e5d000b673117cc3a732e017abbcb7140db5fb1116465da2cc439f4a94f90ff6f4bffbbf0c4db824eb107a9198796a7dfc96ccdbee2582b83f6ec054a55203f851444f3582d2b5050e4936fb95db1002247a4999d41b80de05211ff486120f53c49ca033717b2d09354e8232b4a8cbdfee1f80faf1c52f26fdb549c436da68f8a9a30000fed6f44105bfbf4fd27f774cd32bb4e81898acc636d7ad61bcc4e49510f302dee34a555fdc34f70a28453cfcf80809e144348274a17ca7416df509255f49bd1a17d93ab0c68f2b1e09eae4920ff9978d692644fb50677ec87aa69b2800df8e1fcf28807cdfd2a351483e132abcb62124c2ac1cc38c45dd6cd40bed042d98727b9d8aa9c06d6dc6fd515c50b6dc6d3983ea3d2f64221dcd5186b3b0048ea25a5f54f4583a3543113ee502fdbbb504985f249bd821fe480000f934bc2f8171baf4750bd72987510b7fa67a4d25246e1804423284d9baa3e2db2e13744b8a512591542e3932980cf7a5f6d73ee781e61ff599e8894614f4d571a7d58f4be2c50d086bc79790a27345173663a440db0c2df21bfa2b4e7111f8c5cb8b211806e8b3fbaf379f79505288e78f64d8291950cd895787dc56bdf23cda2f8797b8f2c423a85b01f527774ba1024579e7125ce8066ec4e9a20294a867fea2edf966e639230b53554659c75841a46e6db7007feda89e071e91a16e4d46ab71642701132c0e7fed8fb643cdadc841b092f1e6234161c3ccb8a1c33283cd0ff4438f3da6c904a3e80d634b6b94a48adca936b4b5fa2742e4c970621b2fc22ee50afb99a276992ac68b43ddae61468bed7d7bb55c50648123ecf6ea4fbdc9faf2f42911c064291d561031cb03a4a5637f0a6bf58d491a2ecfa5c3a98d6cf26d7537ac3c000016f865e119b34c4eca5609f318374c92f1cf833cb9ea6d09adc6262aa76f4b69b9984ab653663d8fc0463228c68669ded8ffc50557c1c87ea1b125a3afab2b11c9cee47cb8bb7c58fe8f9b4cadfba30eee2457cd84531936141533b0d6d583f596a4b1569a09f8913d8c051727a66684ba1eaa23fe973349cb382d337e2d80c88a055153c418b2f728439979668f6836f2eb7b5aad7bf9a6c64846545877393228d57829842488a85a1e1789eccd5fad77ff09dd0a423f1032b8b14f4258fab0d2cc015940a0e18bcfa6a4e6b7696228c06652343cd042d63f4a392ec5bdb869a01186d9aa15fb3f93cb8534d1c42823e42bbd1abf1b33ad643aa6dd8ae8db78c949f42f1cf40da5fa973a43040928f8b6521082b8677961769b8833227b7082cce9c49f4579410bffc05f3526616c443e14643e71fd2965de39494effd28cc1e09086e60f25c00a198aabfa338707671277f6a8cb4797dceb363200854570d36ce4398a353aeafe1117bc4d7474faa821df6b2a977f606403621fe926a4301d5fcd28e9903c83f5438a30674aba300a8124e2767b3c4aa964105de735499b03a5f7f04a95cb150e5c33eb2aa85548fa96fe845a3bc5ef0ca54f96abe2ab5d1850d8e434f3e44873c0a7ea1c3b94cc461e31b3e486335dc38a7979aa58cd5a471d25d7333a6f9b6e38dc08b755247e9c3c69ef357ca8d3aefe69fa49cad236f32b5fe13ab731466c35fc68ba4111ea80009f1043a2a49e6ecf497f911b1bac733a47024782f93c36c3648c3f74fb0821293cd280bba017ea70f55a728239cdde517112409150c20b8cfc4a319360255ad771c04c54526166d00232ae6ce3143468d0f599048996993926b6c94f2aed83a1ea68865a8dfc3cc80451b10a6e3a8d6301b020aa3ca39070368955c3de1fc48d61d52e806abbf777b95a8ed08fd3bf65e665809a7a9d3060fd9d358b4d28ee13aa3f2c1b6a1ba8bca31641fe14ca2c8563ddad05f35744cf7a14363adf0332448d7dcdb8ac5b874c0b50714c801f6ec812c8521c125d04e8dcec1aaa3deed95d183396f4c7bf8a1d0fcd8311755e69276b7a4f1162a57b4feaa58af2cdd5f8dd8696ae4794eb6f6da2a40c63f099da17ca6f8827fbad2f022113554d53cb94d6eea816d7ee996db657ccb9c359d88f43e79b63d7f763eb3161a8f7109808074bae23e88c3cbd298dd48d7b07ca8964b82deba8701d8ccc881659bc672c5bd53dca0e16c0ab25eb77065c55e31e8ba0de6f29fd71a30f5fee61c846a39585c834caea694e50684bed291c2c44cebc1c367656e1511b647ae8788a9ab915bb48a7ddbdc78e1de095a6ef5be8aba8a529ce5fee27180000008a8f18a36e6ce1739bb6ad53396db7b6fba3958727ded8cd81a382b5f96adf4c883a301ef7eac1b8790924b9624aed20ad01b246ae349f0825b5475cc04e8dbd839fa244cc3323a2c4b0ef588d4ebdd6b6b3c88d0c3bf43b2289b4180c6f43d3cb75cafb9aacbe872b7a2eb8f98c8b72280a357aa4727500a345ca500f89ebf9b397910010863f1e33fd6251b12256f1dca1888e9ec6ee2e59833c0fd9f62a92cd50e95c98c68b4e3e13657b562978e24a4c94a00000605bf3cecdfe63320419526b6a42bd9184f98b179a6c5da273b0d1d9fc46ac8f42046824e19d1e8776a064233d094674bda7a9cdaa6f352b158f7a3b0c932af3bda679a653f016f86ce2ac5103fadec34369248874441dbac0199fd2bf5f92f5cce21634c3fec0b121533e76ba6081ae35581caeeba295b9477d72dab5e577696e9e3f24c3eb161bdc11b9bef74ebdb6d63b174d9723389dcad1e2115ec6c0f20eb089feb34afdd00b40d451ec48c0e318d3b75711c72f23c0dbe0893332a261b6e9f4d077f12cdbdd526f7f9d438ecd4cac1faa7b31e43e7da2099f600f9963620ae9064c20b0fbc530f8ba6362a96826a6c98c87bdb1cab18d608c04cc1ceeff0476dd5a62008b1b9d64bbfe6fda66c685ef833bcd5e3bae94c63b05405744493fd194fd1de30e1595c5aae3a9b6e445090103e6dd2f70e44609013b4dd4b261039c84f67e3e9966d6883c1147e3e4587ccca1a49eb74be4fd9466daf52bc1833deebe32376b3346d50b6046086341023f012e0fb7806e95cc4105246b16f16252e9abc42efd40a580fc46f4357e74bf6518c809922814cdbbae10b270e3b9be7930259aea55a0ba855405ae245dd5ca3de2089370983555c0ec00667c90016cb84223b9389e5342648502cc6bd25ec19c17e84bdb275835e97db14a457e416a5a6915d948b3ed2dcd70077103492f9ca174fa203a2fd4a5a67f450501c333da46c023cc33c50d88e678a1f0745e3211cdb72c1d9da148073ea4d263273ffdc82e67abf2b2350608add3a54053bd3028b6b597a8422ea2d27ff7a58002eca8772549a6d4038439325d20f0ffe2965195263ca6278df6f15866b70140db430b884d44eeac44cd633fd81a5fd52fa8592fefcd20138ad8da31d5c3d0099f0824e1ef47eb45be85e0991881bc0da0af76e56d1ae08f8bbc9d3cf3a062c62360f0a2e549f5a2d66d3fd95bc97ef9f9846f15b7504baba2ecbdf6d101925e7165319b0031f602f09cc5bdb3c6ccb371ca025b9ac4ad62443a7f78601da6046dad0091cc16c26d45d49d11696e85e6d5741b47261268b39ee27e4173fb046b3d6f944fcff75ed689f855bb6db2c1d3a8588bd3ab51e16be7f0ac0e11bd1402f12aaf52bfdd0de9d2ccba04501ddec83b0c119008ebed0aed366daf4aceff59132eb3929f0e4643b927d24eaeef141f425d0dd174a9115f02e7756fe7660674c8f9134a6fc67cea842a203250b774de93b6ad4a940c3976dfef881c48b0717648078cafa946757f6103f79dd6903c8093ce5ea2e8d2dccdaa1fbd7e1e1ff2f3b898d9ca6106f16f7a0d96619aec462bf7dec86f0c199b791b4058f4b621e0c0130012c46cc4eb04e4af3744107f5dd8fc0f80f82a5b4036f39ae36ac9175e93e60fdd86357a0e3c5801b161d2ebb18259c60e0c09fb77fa488ec56519fa08db15dd6e50a55da7bb961dd58346bb90166a9505e519dc2721433bf23dd660e0c004eef179277d0af4af5c0378ffa79a56c87513dcb1ee71d7a50057c3b9d4fb6043e67160eddf26adeac9da431876cf2506cf9bff3fe31e7464e308cca83418c801cf5deec51fdaa79af5760b9d4640d357faded66239431269b348d1b503516510a7442ae7eed45585ac3fe75e42d2d6c4fd036e80d47561f820e02fcebb936152d76e5eb3c084a88beef557b2777b8ff69418ee3641c7308c369875400416371ef5d852848e912fa614ac551be2e91351eb35b33e730b4b3a11df3b6676cc28517fc68997cfa059aa7013224f884cb33f3f00fb88e2716e7c959782846f2140b2257f12ce91c2677a0b8ffe407d6ded1774c6cfe33ff75ee0ef6fa17fde5deeab646d97e8f1f3620b8e11693b4536939b2d46696a95f5e65f9a61afcf121ffb52b8cdedd820b3c92e4151a923b5a1065ccdb858751bcec209d4ebd6f723d32183f82f49a1261347d9907d6b12b02629e002817dc7a2bc821d12d6f77a7a698ac476b46ee4d156d6b1e0108ccb1a7da5c08a8d01b66c33597ef3a999d45506b9cba07fdc3b533414f09d7833c8901e5c6d904942afc8039fc709cb37657a43f3f987aac3f95ceca11c80b5f9782262f078f6adc3406c22c992c5a26d372ff6ced920310fb638abf84d2de8f938280b9f912a6b04d494af670bf04729738cfc1e1b99e5fa9677bce1e0bea4ac34f347ac36bee62f083beebd32ace9db160f5073c1c939254e102d1c690eeefd0190ef3d552aa9043f277f460d55bbd0f2a11646aab981192f4f59ecf85c8a3a9d1d74ef8cfdc869f4add54c60ed85c2c54d636d17d0b0e9de9a341efbdda5b793c20cf3ca3f11767a7d825e32131f567df4a710d21fd80bc5be064a7cfeec4a55f117c5a23622547a84555c5f8e4e129b29f51731d78131b584bc567bdd9f86ce6fb4bb143dad74f2a301a0c2b2015518d7558568da6eed131f13cca20eaebb94c3903e35cee39d944d71b7dab6dcb867bcdafd28740de1e229253b37688ab5516d15e2f1ed1e267d4e5421574505f8ea2d5ed73f3580fdf03a476d998c419d1fa4353f57feed4a25045b89ce9285172f9a7ae828edb58efb9cfdd69893371e7d0eebe875e18c157d874ae4afbf804106579a158bbcb83df21ec2cc98ecbbdc15b49b763223b123cdad932d7ba52563119dd77f075eed1cf7c2db7b333d91d6bbf98ea4c674a8c9328260ee16d6a70683231309efd7dae7b63b601c6f42ed39c24d8861be1e3e77e08df7b013f2e4c19e03aed2ce5c35936dc3a67a1494e1b262e857a4b4423b2a190ed3dd8ac8eed630f87bdf1d42d76976bddd0734172085cec3e6315308bf724360039a3416176c37617999f2c2e178fe0d01633f903e7e8c614cc50bccdc80e4bf9cfa436cb5d415080581dbc54f73fe932d06e50c9fb885c80bf71baa7c8dacbd2ddb4f79cd26cdac674ded4930d733b5c1f2baac35ddf4d67db8920f1f70e564b543fd5e5c79e18c02b18840b90017448883ef21ec5f8fad93e0cef71de8eb4aae24500d66c10de5fa51ee6bd88acfea408bc8e00f26c5ff2875496376b642d6d474dfcd7ec26d107f9f5c536e5092033933acf5c80e6cb88f93b0a172db3f09a23315fdae3a53844ea61c1f9fc76c42efeaced8d8596e5960751a344beeefd799b436599bdc9b08f277ddd24e2236ebdbc62d853234fd106d777349f7171ae1ee6b6217fc5786ff86b5ece72e8d4d5b46f192b709b1ecbf916d52a2c2a70ade0bf8244553a6a7b37fe5b693b70188b50681753d662c6313d33c39b0443b3e9914e0ae3d8bfba25330207c47ec055b43a4dd324bc84fbe4dad8bc787aaad35edf64a80042167b546bf2d6bb2a61e6b1966ffb8b46fee4de626b37585f84c41c16e035e72a140a252e2d94b77d23da6624e8832a060f1804957da49ba96d1b2bef7d69700cf16cfa0fd6b7324cf8f18fced369d5dba0cf595e873b24d250fdb3447f82a16555f30c03e2bf29bc4f2a7d82b9bb3f5e273d152af155240eaaa61319268a9658d08fea69927f5c8d1c74b728e90c68de9db9230df18c456f764b21e114c650c16dffc91458a0cdb8209819570ba30ac988abee8bf534bd7667828103a44a30444745e17a460bccc68a8140a8ec89a6068385400b51e0ff9f8880445df279150b5a227042266a209c9d18a53f344af8667250751e96d05458373a23cdbae1a6bf04e0dfbc274d8ca911ae7e4998b3044b2ff37aca658933ad4d2426e017a815fb4d92ff4901caee565b72b6f25694032b536debb08a3ae2d6e75ac55e460f86b6312a6618387f19fd0d25030d8db95961f1f44388a48d84d83c75bd82ba74689152e79de4e1100cd22ca52fb0c1b6f18dee54b58118dd4d95886e65a07eb37d3267cc4264da978a4c75f553b7137e818702d15712ea75b5fe364623c94c48772f8a8ef918a63acf162e0881e0a2e2a442c93a467c60e2fc9696a91f673d311b57d88453bbdd3d7a0c840fc91d83c23be6c2285fe8cf833491901ecd579b3a0292a0133bd9aee78e639ce651fd482e55dc21ec1e2bb9e9ba1ba938354f0c21e280771a60d2dad12bf508566a1783b7c14ddc0a5764694ead2780ae9acd250dac14020b69cb9da19e525cbe54ea134a31855ab5ab8cd7a5fc648317ea89a180aae2a5f5bf1755d02eec7df98f53002bcfa9d44d508877a7cceee4670cbd357de61236fabace0628bde2fb92e0a5f40393c83f06b79cee5a08a9e9936789c7b105389c3b45babe0c9ef3d54eb349229588f1e952fd6130df4344d7e3a32fa15e9aff652b69a98140eba9ac80b292e32f8d384e5380c414cd29c2fe2338768e343350dbbd8a0ae56c545e437a4dcf293f8d4b41eea887d10d84f490022fad4594c3f4b3cd202056156e08fbd1f754e51c5c090a9cf31203e50be998e313137a6d9ff48f674b8843d2327cb7735d6c743b0e8df45c3d2f0d352afa332b5aa59692a191ff7f205628a288466b7d6cbc07aa4eb006d349995a648ec3f1a5a237b6da9a115fee7535cbcb87e98f479c2a4ccc9cd2a20da1efdf9f0d2e80ef271e65ccf58351afa6f8178b82fac9f2be12e481af56962d118f28dcbf6963050a63fd0f80195e93d5cf498e428f30181b96c1c20d7e4e9e65c2f5d20136fb5c8cf682c84ed42935198274df638a65b9969e09b11ccfbd27a438d8d1d1bccf337c2f07e223bbe52d0c940c06db9adbb94601c92600cd51572819cf5290f161e269053c4b243e769cf499a42399d6a0d8f46f32c1282e00231bdd988eb8269e0fb3ef7f138d225a688fc27d4ac52d543f05a832f386a5e5a40f3e9a923f148c66bd07aa01b135fa61e351027ecf7917dae693ed111180420b950133a99f6d522db40544df109fe7851887f2caa627cf8333a0969cfa90720e95053f3c4485fe4c94ad072fa9c8a3f3e63023a5cf0a5150e63b1f50c136a7626cee7cd1e82686cbcbfee4bf4883f0c24a90c21f8c1853d0f861f5cb2a1eba5c83b48a96489ae1c6e389503ff6bc85f8d36052a6435452461213995151a3fd3ef1996cb73a0eb8f656722aaa263bbff1f65669fbe69c85b16961b8b36e517342cc647234826088419777b54a1b2ba17a2da4adec78dbafc4c554173a78fd38ccce095cbaea7006b01f1fc3e6f5d32a8152d43ef7f69647ab369eda80132b7f976e57232c993da2686e372e4e2d5004db69bcf898ab4865d4f7af61d7d61375d2eca926b25b1c7ce829dbb1892b50f4af1e267217a3d679bc672013e67e782c5c1e9f7234176d5fd111971b627e99bf8ddf6b048e86d8d59e48675a297b0851277f7dbdaa8de82a3fa34c6090885a227f80b38ffc703e1586aafaddc5cb714569c28d0f9d0690d3a022bc6afebbf1b888c1cb1765414c4d652f1a63849050255753689483d9f348bccb63621891fc72e64ec4bf36d510b57b5ad79344a7f95dd1481a6a5ae4ee188bc4ac7038acca465ddcc58b6c2550c262a19f625bbf6e21cd7b32ade6075c2259a6c2e084fef1bf4fb8560c9e25bfd72ac0e1d1c87129697ca1745e876a278b290e72ee78e814cd93a7f0ec29587cf4011148c5331b6e452460bbf83ad25aed3ca2f0b94a0ff034c5fd9ef1f3d72fb68d87dbddf3b7a6d3bbecc294b829234dd03399cf83f163131a558b7a185f841aa69bb338fda4814918111730f9d8200d04c2ce2aa3d6a8311e83a1831a80a3b16bd3c24220a9688357aeb21ca9ef4a1c7ac00e047ebf1a938c2d37067529d176ab36e291c64fe9406f81be2d4dee7d755ef25e14cafe0750be11f8317bff3c28786a6c6f12ba3a3cc62211f28408e7d3a652bb6bde7d3b8e6f6626a13cc5483783e43e90e50f67c67365ee156bbe3342f1abb75929f08c0b17708808b359b370d498495f86940788d306d1a2b65d191433a812287fd74d3d119c6068ebeb9ff88bc5548e9ad7bea6c0f86f4bcfc51f2952987eea705b1b3e94334f99c0dd516aae4e45a60a4cf59ca4d2d108ea0aa9a157a867230102d66a90641411289323dbf73b1a636faac49edca4bc54fa0999ce448d77eecc2c65424c4130ee1e1866717c426409775a9f2102305bb000b9e1d164516781b392e8570e7342fc1dd2384d4f5bc6fe4271a7118b992a9a474e785f61b77fab43c149c692348639abc74cbad7a4d40b2c988e1d5af3c0d076cab9d797c4cd1229aaf1de9a5f8cb4dbfb2c2ab9b9123692bc1f724cf314f32738a629bc91403acf297cc1f8b4fe630c5369f9a7a225ba8941b1dfa9f3d325f69fd0745d09f57bd8561b59b2d4c004a9827209053e166a3ad973ac3aa4b23867d2e1f07f9ff7aa1fa2a5d574300773499bf3974b01d555c4b642b62861ef5f84ae48c3968d520278853a0c86fe49627470334a716c31f71eda5e9749fd31d8928fc5fb4348702fb592c933af41339e877aa4890415d5516a3aacb4926f9ccebd62437d7021a60793461aed96b7a905b224af17475698d08f30ad3cfde8906a3951dcf6a52b40e6ef0ab39b2df791778d1bd4959799eb62c49ebe9b25059606b9802c98d475c851858ee170de53ba5b06783e8a2bd49c237b95e3b9a90148a72633caf031e7c83a1b49e7da3452018d91df9af71dfd4c6937a78b20018d46a967c029db2c67c9a5c9210f0e33b47773eda12943f10b63b0096ded2d9069ac53306eda0895b277887cd7d38b15a8cd0c888f0dbefa4a62b7ba64fb354328eb537dbc9347624c4323a2b61c551f4b6c02011dc46a0e958406e62528232140e30cf00b4282db836ef5a9b060cb57e94609499e5c50266f5dd6ccdbc56f6b042b300304eb76019275b6be76ab3ad92a32cc0963b36f69fe4f7e90ca099fe458ec44cc9287356af991ec481419688ad996734ec525a3694c46c4caf7f5da20a853badce7062462ad58871c74a61b0e42a1161922909bf196a90f46a3011e3070aa95312eab0a122cdfe2227b85a11bd3f9227d3f4c4967fb015f38352b621b6ddd57d3f54c6737390ad69b4c06d602222560c60ce5d5c94c8c295e707f3731593a4e7cd7e2349a79238c59c4d60f5ceee6914d9b126ce9af2765d8731c5c1272a5e2c2422eae9fe2b1444834827a02b378b7976686c5c60edaf203c2b1bab5f49a79a54d826c243fa52bde0bc0c236b45eec00abbf1714e2531d4aa7eac6d25c7cf0e8fd5bd2ec340b8b34a9357ceeabe34c47262251506f0586e3bb2160dceeb8602f21dfcaac26ee2f5ac971c5321879227c4ce29989b54b52aedfefe1ed52cd65398aefd59be9fd9a01acde9b21ec9a263cadc9e18ceae0c56dd332fc1c9e5e27f2733c1b79687e89af27d96a5b7410705d5fb65fff36f548279b60c5963f2cf57e18f0da604d4f45f632db32681bbb4161f05a6f967c1fca0704bc7d39498cc3c533766f051ca4fdf0aed76653f4684bdcc54ed76360ad2fe440a655aa43ce253e546cc1f9d2a86e43365673a68aadd406088114501c55392c80be83641d71458e23acf5e82fc35cb82b1a607c55e892a3275415dfe1e1d37cfa6bef94b9ccf6f26bc8df2d37a91d887e02edf2a5c3b3b9711d66c23fb00bbb16ff653e8f64a6e2cf699e6d0447f276c023e1ead9d8dcb719de0ea0e7fe5536bc1352662998106a821032decf0015a965c0d36787236db85ca1851e2f247c026e0ce4a67cad884f5f36462cb5b98b2a4686aa87aad759aea604d07b6ed1a6bb375c6ae219c68e1e524f38772ee48b043e1d6d67f0b72162b870603779344653016f9d1270c93c97b5c2f71ccfb949cef8988c28e77bed69469514a7c7ce5b4a826881327559541ef8923268e615371441f8dd093d909ba483e5669cdcc699a26b0dfc2a7253c45642508e21185eca7138300011992c1f9536cf7b253ff965a85878ee63d7ac7bc194b18f1648c8591fdcfd6cfd577446935473a302822c9deaffab468e9590aae9b92cb58f83d527883549fa26cf837aef761c507c037c5330edb61a3236328ac3a897a1427487f4cff195e58e65d15b6bd4b4fa0998c6de30a79d3c64601181791d2f2e62ad248024dcfc2dfa81ff8f1016525cadfa8f567dd5af96364794241080ce8e822fc72b405755e4d675f5d27a389c3c5de06f177934b2ccc2f436ba9a23163c22f2b817de2fdcc9288596c85a743882b676b3acfb84132a7dc923a4c45cbe29200dfcb05b1690b356c59d5e3334783896bfe14f963f9807144eeb0c26f554bae6c7c144d08ec5bd121ed2e80a4c1aa4c856512902f3766a5d84050a4d4ff2c17509d4306ecd47963147de483bfe189182fd1446e873dec22a2b46d35b8b7bbc897e27f00750e9d03c5990f47920f4a33e5fe4e0b5f878167dd0190cbcb22572b146425a04334d0fada40932a4ccd177c460b5044e8cfd5a63997d668b69910bbc22bb91a574c370b766920929ba2de21015044ca67e2a466fd2324e7f31c02b0de60e5b5c7021804c0a773e05d481838567548207a2e5cb0f49feb0aa275e5ffc7d474557124bb6027177fdd2eae9b5fcecfb5b785bb02a313e89723c199ee3eb81b715e38dca180cf8a0d2aa26b888f0d87ffdf0518071490afdcb28690b12a1cd74da6c10f11ede2642a90542037f7f2b4c129214ea400c6e030cb258b52afa8925fc067be420dd2353229c38a3e981a683390bfd002477ccbb0426c99afa8042dede020f388c4f4b8bee60a58f11fab107492bbf25e7474a6354e60582e6b00161568e0295bbe682c1f4f769acd68cb8853b846d08fd5f6a7519341b0185ddda0c8de5e2a701c26b42386fa885534493874756a7f63ba8fb8bc3cba48807d56d1fd6e0a2036d9386fd5428a69bb8a2a15ff4301015edc02f47180271ce12631aaff1b56d9f4537e516f669800a07e89efe6aea1a496b14097400ad4f86596ee7c1a3185c55f1bf35556efce3178b2c8ae924e9a950a2a454d1be4aa9e05a0ae29c4302ec54eead7fa6ac14bd89a2e5d500ff381130b06e67efc3cbfd8ddf0efc9122ec48fccf50c92d28e785a0e7ac63303f4e491dd003a2c5cb928a366158f3ae7f3219d1dc4d94d6e64cb48e130106da4e6f6f8a7b04b16f25e3aa121eba891ddd6b1e1dae3523b899e835eedd6b2518c28e993834e384bc4aea03ed196c0ef9ba81ad0becc0775dcaa87513ea4c7f94888a6f66188f3f7a7eba7cc3767cc191c0d38a3b9503ee7249bc15b59e5329e00d7d67ecf42ccc7502e68ea172b41a3c4f6a1ebd44232d4062962b4a014d3c268c88dd746a7d403c9b1cc13d51be1e81948acaaafd3040e9b4f6c657bcc756a65733f845ba39fb67e5b15528d4196a2491410cb1ae946a9afe355abd750f4e49a2919bbce70f59428699925133adbda0100b6891bba652ff84e8dbe2b2f5e6f22fce876e3393596eca710dec53b7fa4e9b0e71e463a0b3b6683bb90e9c1d264ee84e056c94eb30a0cdc599b797627121979de74ed3a27b0811854b1eb0ab14f554225cdd99378d3e6a5b6ee9adb630408311c70a5d9e2c0797a72801959bbac18a1d916935c382b3017d96ea098898d33968046c4e4e09d2038f2c0fdd4787ea5e40dd72c1ee139300d6d8849b56c547c37b535913cb5a51a11a51d6e96ceaac6ed271aef41c7319a28cbfc716b20c0f26dee052df611f01d1fd32ea54f0f42da437e783437058fa25b28e899b36fc7c2c71572b5ac7ad38f794fe2093b3e516d0c89a54eaebe0969feae89258a4b615822a924ad1c4e13cf65346cf9a48e68694238420020b10057dc06e40494105ef2359fbf58b52910479e132b562711bbbc8b2c1083820ffc4c7d9ce253bafbc3c1c45c7048b27146fd467faeba51c9b0849964cd4fff62602278d460408c6e3b25569c9c776cf65dde3a6e9b6aff79fccbe726e14114072449c127dd1bef8276c68be6103e139b13ff1d44f4a0d7a5d4ee26d4eb4a5b3c76afa59dcf08218c9a50181072d2b33d5bd3cd14e7a5f1a39644802716a2e892b81a50910e89d9676a058350f5246240605342cc871652ae0aed89ceab5145f231b7dca699d42748f63d7885add3eeb56c582e40b9dee38f8cdb3cda3321d1c2e2393db5674293455d9dabc63e59b982bc9a0fb9cae3a3e2690ce92b760077695edcdfc2c60fb98fd8f0c521424da1d180da8e18a2d8f53fe19d293f7ced596f19c5e0da5c3955427622f373c596cf8d4f0b9afe3c9a607f31848639487dfb2c00dbea363291448a99bceb3a315dcb20e34c545149157b1a66c273807861909ad78ae9671386dc4c0dbaac72414aed836c403efd9fa252ff1e269a3a48c5a2fdc056d2b060ef9436121d4d3070c4ffdc4a60b288509edd7866f287a8b2ff879c977a3d8564a3f7522106e403678d4243e542d2915337b3ced8e4a22ca1a3a61c96a5feb503d84293cf1bbb5c58e6c1e5b398fe6308600c70655ff64f96629e6c4a5979160ef490427f32731206bb4095dc3f9c455e491b9c5f24d830264d76c9fcdfe659a352ec933d14e764a5629b85b3536556d80f9460dc7404dc13f0632956148e92f3f5730078a6c3f820b36c951b9ba5a68f3613e128f6d94ccaaec716d581aca8f283176d6a58876d35b7f279708b5c9c36ce2d76b921bf4a0b4a0427b8ac5253a86c8c73ce46143a597be385279abd9a385ce0e3755017e750b07076919d624ac91ab935faebc032f5cadd7deb5b814df70df279d0f59fdfd965b3b5eecef228f82ebe70f05b917216b32cef0fe274a5b1b7210fa9d59dc5fd1afeb4130f95d314e67b1ef84603270b70e19e04c130f06ad81213faae3418dbd2a33b207dd2e72d4742cd18241bc5f0d2c70d7f483e48e1fe5d5aabd33f9ddbf1cb2b447a514b5c29bfab7b8b35e5992862309194a5dfd67274c1f3e9d2e047c0d3e3125f68c485e355e8f97e6bb01ffb0370b3497bb04312bf0842486cce19d9e5e73e4d15afc8cb2eed4a5b5b0c17eeaa23700b43945a01be891004cf1ebd879b50361a7b45fe5a1260c499a142bcaad750bf3f96a3c51a104ff10613d6c129254d6259e30ad63cddcff6816582f5919489a93b7d3f0aba2efdb3118ff25f314db58437c44e8029c662214e55e47b240f14f976723ef19f464b9e06a929b2cce6219f452ff071762accb2eca9ccb905345908806e881ca26c2cb9ff9424fa5cb2a24bb66dd4f9e1ab0bc01b442fdb9cfcb9a36cda381080f3a24a40c696a5ed9b6e66af19ae53f8c6dc6205595abd1b128c2fe7685404336568a4830c00588066468b176fd84a1b670cf7c9dc561026a0fdf9a5301a2008ace58b54297a9f029bd8859e527611390de72be3391b08d7f82648830661742059f7e5e53d5ac1f83227fa40a5f27aa487cf16ed827344a2f298a753a9a81530f4fbb52b9542cd11ed3d956afdb6689191388091ef093e30eceb0248bbfbdd7ef5a6df3ab3cad514f40010b2722fdcc7bf17dfcf83a1e0f45ee398f703ce9da882e3adb3aa6da768647cffe6a5ebf3e4683605fb91db1ef6a9a87da3b67b12d074054ab3342de1aeb3e5233adcc06dc1334ecf7dac3bdbe3a7b9a3bbdb85345d6777b4df87d720ae2941d6093c9c897a6daabc93d1c8ae343e1f12874f69521455564f94dc3ea2ef0bf99ee322c85aa69df6e3a62b7c2bf83a1327444e84790bb4826f41bec2d15c85c3a93c127516e95df5a53204a7c7f21eed1acb8470e7579daaf4f6ca14011849e0026b10fb8656cfb5aed2a68a9eeb4933793bc674831d713d5daace7108fc678516f20db53f8ace90a5630b4e4bd33d5fe97c404016d31d46024fa976e36baa745f576eda87c76cb99ef352bf8f994bb714989dc15ed272cf0393de44eb32202915510745861ddd2ada1d56563a4833a704c0c610b97c1b1853b36c4ac2ec231631cca21cc69bcc118b6da358eb0811349b939f8ecea5f1e4f616d716974e5f23ed41ba53d73c28c086861770e20f5c6f24c57e7c75d8fc4398cf4293e68104a2879ba99edcef044089da7f726852a49ef434b11704b00404cabbc50bbd86eb95c6ab4b3ccb8441fd24d0b47bab4665266a2c8b432384e9590aed4e8b0d98bd9778a8789162071bf6cf60e2cd9b7116863048cee1bf632aae112d4884a963be429f464364c7ea1a6be877d77e12f2eca9e8edaa6d9a06b7d7f004ee24840744482f287f8b19a48ffa0aaf21af5272551bf79beb6776bcd23b9886d0af4b46280d97f68b407ad45793f1b6f651e207c8ddeab22de0456da79077d25cd19cb2249f63b476e7eecca593696130d68729495fc3dc35d3b5a3c208e956e36be9b49c544adac5a1fe94d3a9bbf641b09fe00e3db0dede1311422a9193c0e304339894681cad972cc9eaa114b28ed57e09231652de147c5635dd66343ee91dab1bb3f9be36b81c9e6cca1eb8c7a1224156786461c43654b2f41f4e7db91135fd57d00bab8cccaa58e0840ede1b3c5377c3cf9edd04f7d0001895efefd07b8873e806201397c1171d64b5da1c9f270402e7659f9c9c9fb382d73d9ff7b860d40210bb9a0e6129108372bb8d654beeefab49e86fb781c6e53505e10882f6e52167ee3e9e4fef15915ae861ee2b3804def2e540418cfd937b68dc034731fac355a499966a0849a0fdf88a9b2a8b22832efa569352289b7b499c1989d23324620ea89be0932a32d5a72545da04afb696dbe4bd12b5333ba79dca4a0497f35bd9292bf998c2e475cf130a3c8632840ccd568f71f1b0bebf0585da16dbbfe2ab16cef1d17998f79e5eadbc37117f48b81aa4eaa0d9b80bd7ede68a1a5ec90f0e3dce7180f83e3af5b3d4fd8c1e8f9ad2c2d09c5ca219fb48932f938805493eb6bce8dfe4da403d58554aa9a2eed4f97c732fcdf1c41abf03603716e69421c38b9e313e8195cf704563a7fdea04142e98bce723737d3ee2a5c6f7a12566bf62792996b8d21354cc481811864e6801a03558ad7a3374c7c006ac99a6635cdb6f6450ca64f72b55e2d812bb9c924b7fe6f10c19cc42e987238dd1fc33ad095d2fcf5284eeb2947cfa18e4ff15ae09350968f73f0822edc65b37c59a0fd8b1b6596173f7e0661f30d4d61f3229483f8425256dd507b0ed2f86d582557459bb72c1f44d8ed242e2fc5b87445bf5ef3150032ec6537fd1f91dd9e3b0e04ec2ca2321199bcbace7389406e7e9540a617b8346be31e2e32b0f1f171b26042179250ecc304967b8c8b10f54b8622045a6e51d1f7dcaa687a4248114b0741dfc371dd3353faf75c72ccc77545b121a2c1528857db5a01ac0bda25f323c127b60ea27d965ee3271660c20119662dd05b713e06f542b8c9cd5afead2e5fefca1c26f2c255fa2ec05766137a7788f1593c54bbab70288989068b2cecd45c01306b6f9d95d0883f585d95cf6ba37b2428d918866cff19af193e830211fdde133e5eaad5faa184d021ab2614802dc54831bda2196beb8057c1717365f05e7cb61aa2889914e71a3ba93723bbb58a7d3770d831c0b1b0063dce07a395e68eae4634117f1152a53cd540f162d5affeb92d33e40cb1bac7b162b9d7cae15ec3bed1c42e8856bc70eaa17088ec7481631391f45798645cf95df7b4019257525a99447a26e34b374c21a4fa8b295e2afd0573becc4322d9dc863530a1977fa078c5c5063a49935529846877c75a7dd64202008d7f6273c0a51272b4a82c13712ff9497c19d78c726bf0016dd9aef9dfba6909cd71a836d4813dacf374bd4aef916ad111febd62cdb7a30c53fcd6f18285edc82c9a7312f0424c7d340ffb19aabac40d83e9430a57c17462a8ce09dd2b2e75ed5e167786a68b90df8bf1016963c4690e53980e1e2b01f95979eeea24ad46033d7b71b3892bfb65a92681a6604cc779f37c104019cc456e107d1987510301385e42398ef566f14f9e8576162337c070be60a350ab7f10f42fa3a23dc53515ccc29321359d85683eb801e616821fd7a8c4ffdf02b01fbdc7a6c36db79f2a591b14f9f4c3985018eb4734d779c5c39a86f1b364783322e1091f58ff9404a73a4b6f078a29a1597ae805a48175d8eb9b2b9e2d47994a3e4b52ff409c9beaa9d72e2af33c1704e2498b106bc77e72e7c0bfe72c390e0ee2bb623353704c007155308a2581f8457fd3351a9dc3d890bd1021a369c3c0eea5032ef6599610f59ace983c14ba958cae5b86e69409edc99b3059e2d21d1a8789e1898d7a3ecbd5f63a654f9bda935d4d5c6320fcbd4e7fd2d3f02f153ea1e1f00d2739e7a27637037502b95a933f88df0e46206294ddeadb57394ce50918625036e4ff0f746af766fa84c247b8164b1ddc78be7a045f81620fc5bc574767b8a7135913a3888bfaea3b7b8bcac12fde014549cd623aa52a8c39c473a80aaf98b58379e6fd4eb4828aeac9f8c4bc0eec1c499e5d25833e9740272aa3f77824ef9e2be846e6e7c70591fbdc89c9e84c53766ebd6da645fb352db3f0b91943ea61d84e729f2907737ef951fbfa83ed3767c4bed54144bae99faf5843e8eb8dc6e60e1a07434161df10aa41aa39aa9579b3693d4b0f1dbc399151b12eb957052270abb866d6c8fdbf844b8584cdce82c924ad181d9834a2635ad1810885236deba7baa209cc9dfb5d4c4d0d31e99c5b7982af45e94d8c8ee303ef55c7875dc90bfbae5d9926849e652efcb0dea75f2012b0ce1850d3d48a508cf2cf6d4a95b58a8a16a1ae45315d597951ccf2b29174c52e9066bf778696b7dbd645e8e1467a00caf9d244f554a66ce23046ff7ecec0765b0a49e83c0a01ee08fd937f150b9e52b4e1af96e89009f58861cf3906ea07a97ffa28a7b268746c994112e0ac08b78365bed30e00e54f09a5254ba439049b3a94960ec86159cd7793162b22c8142aaa410a497bab9a9a49d613aa4ae852b34cc141dc67836345a82b507a2be99b78d93fe2c508872dffb9f45c133a48a1a632e14f3bc17c94b06f2563973ced4aeb3943f7bb2f91477c836a845a788a6ab1a2ae57f34712fffc180f3880ec4d98de0f90eecdbf699c9de9277e16b66b1d03ac59dfc9828ebee5b4ae00ded7db560a14d605adac8b45db7b4a6657d8b17fc35b6c6cbc6c8e6a96b1c3d8ec2d349052c9506bad5857174ca7cc60a7425cad4464893c3d8fae33a93ab22d68470446046ff1a7dda63f4b0748d2e0f08f7dd2e7134ed619b26950641fe60483252045cef4d10333a8f0af9dec7e6ffd1bc54cf2e375fbdf5fb949d979de4d5f5a4f511ccd96c389135f4f0ec5adcafff249d629a552401352a0d988a27c77a2fb462f7ba7157854e4fe8e33a6d695868754fc85c9acafdc4a67dd294e2638b92f1e38845a0158ed4b42391f4d461c2dcfb0ba6eb8f195c26c9d0d0f161e44f376e22a44db2b0cad830415e3aeb0eec00d0b6e9dc614c14873bdf7b95f80bbbc58345e9e306399fbc39781a0a91e6b82e7311cddf7d2911e7bcaf5f0ba56f9e91473689f89da49b62d52d3573d1ec24a3d53a464fd77c923969e2a840c9740c6f3d1d861ef97dae08b61a5b1e3d72de59f28a12310343eebe9e482b17db0820fd98dfc57a4b6c0481a2476084c36becdee323ed5e862b4d9dd57fe636aaffea380ad2b84ba5fb3f91eb6ea04a59f7a12d99f433516bde92c6baa434600e786d4610c45703e0479f3f1b01f8b599e90adffd539c062003e05baa5698dd6669201ff4171ca0ba464ec0249c1da1ba243e00f7040d95261dec6eea9bfe1b2e6ac5d1beef15db151371e9bf69176c024dd0e6d6bb0edb57c3eaadd61ebb13635a60552c782dbd7df766833283e00b956d1b6065d740c4e8b294f204c6b49d18f08d1a42e1262caa8b33bc8f696dbabb455bac92ecbd89a5fc9d51f88fcdb1c1ea0b3ee3bcf4fb7ec7f33234eb5705755aac0a7f881bf3ceb63846fd5655db5f8a1bf6726f3917c13420afe4bf83f38dc7953b66fa2b3d92f4075a4420a4daf37317842bbc205eb0d98bbc57a109824a6c9644f1c6f9f9c45c5bdf0fe9f5240b0bbc59aafc3b9309b29f6437464928b0a49f3828421d9fd15753452c13eba5019be56183992ed2b0cdb9f1f4511ff735ad19ef4f924d8a82b5f69806ee0887aeffa1d39cd71c73d5746ebaba3ae03de9027a48260c30643527190e8b1dffe4df1bb980ca12ad544a8a6b3560ed6c7b2562b53a1850f667c6e683310a8bd793ae043df96b8350015ade1393328b8da50257213e68d1ba835a324131cbf8b7d1faed957627806a5d4d8d03c920afaadc337223619d1796a3231727a06d00dec1eb18743d4b3090c4a924796a7908985d50585954503f716838b3ce6afba2357e10f75058e91dde3ff5633114c7ee8e06943467dc13497f515bcb7154487546a3d468918e622d9735aad1d604ac2870bf7b43d882b6a8ccc8f35963dce56ad7edb6f7c9b65b8aa680c851362c2389f152bdc0a876ce35fe65b72b806a6be4b91263bc7ba3aea20c9e6ddb04919d9a4914249c013cd6f22c1ded1f945912b1753dbcc0469411d40a84ab645c56366fc1ef768e0ea03f22a40da0ca87141456e4b3b1cc7fc4d183baced882b081362b216cdf519794d3ce68a3167b67f83cb58c09b6b592c85fbf9f09c495f1047ada5760f8fb553952d6305d68116c3736df3874f844e8847803816c51505106e8c400ce2d884f5abda1fd3a1c889bcd50c2220aecb92125f469c4a9e8af5d2f6cc5a21dc666288e9fb4d24eea5f4564bb70b0090abd43f98286006497ea14a67958e06bb7a51fcf698718ec80cb763b176ce0cc53e8f8e64641e6d53f300d9f2590487ee0b5003f962eaf7b597d16b9d5ff4383194a81e77bb8421d476d12d1f4293b96a10f2b014735508d530587db2d247aab0f0720b769ce0ef69b2a28269c9d052f3499b59b35739b6977f4b4d5fffa19cd34380515ded065b9ad2a821d3ed3242169805007cffbf152deeb2fd028f391b250c695e77e145062a298996b05d02024857d8693d8a605eafbf3998555e944860eadd9987d63d11e35b33882cb582fb3c61bc8487c5eb05ce2838008914acef6a21c1619890795600806f9f24a048a63e197c8d68666c9e6ca208422565a4acf5a1e0c243e5ff66e0beab4b4b526f975906457578d5925fa83d8c23d09ed98e8d143a4b20c7a512022c25270a7e5ac8cf3c5421a3075c133b56bd47f01c1044e20e0306e000000);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) NOT NULL,
  `rname` varchar(30) NOT NULL,
  `rdesc` varchar(100) NOT NULL,
  `acc_code` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `rname`, `rdesc`, `acc_code`) VALUES
(1, 'Master', 'Superuser', 'INDEX;S01;A02;R01;N01;R01;'),
(2, 'User', 'User Dashboard', 'U02;'),
(3, 'Admin', 'Admin ', 'INDEX;R01;U02;U03;');

-- --------------------------------------------------------

--
-- Table structure for table `setup`
--

CREATE TABLE `setup` (
  `var` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `setup`
--

INSERT INTO `setup` (`var`, `value`) VALUES
('cname', 'K.S.R.CAS'),
('libtime', '17:00:00'),
('noname', 'No'),
('sessiontime', '7200'),
('banner', 'false'),
('activedash', 'quote');

-- --------------------------------------------------------

--
-- Table structure for table `tmp1`
--

CREATE TABLE `tmp1` (
  `date` date NOT NULL,
  `secs` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp2`
--

CREATE TABLE `tmp2` (
  `usn` varchar(30) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp3`
--

CREATE TABLE `tmp3` (
  `date` varchar(30) NOT NULL DEFAULT '',
  `day` varchar(30) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `loc` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `num` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `role` int(10) NOT NULL,
  `active` int(2) NOT NULL,
  `llogin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fname`, `pass`, `role`, `active`, `llogin`) VALUES
(1, 'master', 'superuser', '8e67bb26b358e2ed20fe552ed6fb832f397a507d', 1, 1, '18/10/2018 09:10 AM'),
(2, 'admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 3, 1, '18/10/2018 09:10 AM'),
(3, 'Wilwin', 'Wilwin', '4166d99128a8d47b53c25d23b48560e83b0d9976', 2, 1, '07/09/2019 23:09 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`pro`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorycode`);

--
-- Indexes for table `gender_count`
--
ALTER TABLE `gender_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inout`
--
ALTER TABLE `inout`
  ADD PRIMARY KEY (`sl`);

--
-- Indexes for table `loc`
--
ALTER TABLE `loc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patronimage`
--
ALTER TABLE `patronimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rname` (`rname`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gender_count`
--
ALTER TABLE `gender_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loc`
--
ALTER TABLE `loc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patronimage`
--
ALTER TABLE `patronimage`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
