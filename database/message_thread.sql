-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2024 at 11:26 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `messageboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `user_id_1` int(10) NOT NULL,
  `user_id_2` int(10) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message_thread`
--

INSERT INTO `message_thread` (`message_thread_id`, `user_id_1`, `user_id_2`, `created`, `updated`, `is_deleted`) VALUES
(1, 4, 3, '2024-06-22 00:47:56', '2024-06-22 00:47:56', 1),
(2, 4, 1, '2024-06-22 00:55:54', '2024-06-22 00:55:54', 1),
(3, 2, 4, '2024-06-22 02:00:12', '2024-06-22 02:00:12', 1),
(4, 2, 1, '2024-06-22 02:26:24', '2024-06-22 02:26:24', 0),
(5, 4, 1, '2024-06-22 05:34:48', '2024-06-22 05:34:48', 1),
(6, 4, 3, '2024-06-22 05:35:00', '2024-06-22 05:35:00', 0),
(7, 4, 1, '2024-06-24 05:13:26', '2024-06-24 05:13:26', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
