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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `message_thread_id` int(10) NOT NULL,
  `sender_id` int(10) NOT NULL,
  `receiver_id` int(10) NOT NULL,
  `reply_to` int(10) DEFAULT NULL,
  `message_content` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message_thread_id`, `sender_id`, `receiver_id`, `reply_to`, `message_content`, `created`, `updated`, `is_deleted`) VALUES
(1, 1, 4, 3, NULL, 'Hello', '2024-06-22 00:47:56', '2024-06-22 05:10:56', 1),
(2, 2, 4, 1, NULL, 'Hello', '2024-06-22 00:55:54', '2024-06-22 00:55:54', 1),
(3, 3, 2, 4, NULL, 'Hello', '2024-06-22 02:00:12', '2024-06-22 02:00:12', 1),
(4, 4, 2, 1, NULL, 'Hello', '2024-06-22 02:26:24', '2024-06-22 02:26:24', 0),
(5, 3, 4, 2, NULL, 'hello', '2024-06-22 02:58:28', '2024-06-22 05:34:35', 1),
(6, 2, 4, 1, NULL, 'asdasd', '2024-06-22 02:59:11', '2024-06-22 02:59:11', 1),
(7, 1, 4, 3, NULL, 'asdsad', '2024-06-22 02:59:25', '2024-06-22 02:59:25', 1),
(8, 1, 4, 3, NULL, 'asdsadsad', '2024-06-22 05:10:15', '2024-06-22 05:10:15', 1),
(9, 1, 4, 3, NULL, 'sadasd', '2024-06-22 05:10:19', '2024-06-22 05:10:19', 1),
(10, 5, 4, 1, NULL, 'Hello', '2024-06-22 05:34:48', '2024-06-23 06:04:04', 1),
(11, 6, 4, 3, NULL, 'May hatdog ka', '2024-06-22 05:35:00', '2024-06-23 05:35:06', 1),
(12, 5, 4, 1, NULL, 'Hello', '2024-06-23 05:35:56', '2024-06-23 05:35:56', 1),
(13, 6, 4, 3, NULL, 'Hi', '2024-06-23 05:36:15', '2024-06-24 05:12:42', 1),
(14, 6, 4, 3, NULL, 'asdsad', '2024-06-23 05:40:22', '2024-06-23 08:15:22', 1),
(15, 5, 4, 1, NULL, 'asdasdsd', '2024-06-23 06:02:17', '2024-06-23 06:02:17', 1),
(16, 5, 4, 1, NULL, 'Hello', '2024-06-23 06:05:03', '2024-06-23 06:05:03', 1),
(17, 5, 4, 1, NULL, 'asdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskdasdaskdjsakdsadsadmaskd', '2024-06-23 06:13:23', '2024-06-23 06:13:23', 1),
(18, 5, 4, 1, NULL, 'asd', '2024-06-23 06:15:31', '2024-06-23 06:15:31', 1),
(19, 5, 4, 1, NULL, 's', '2024-06-23 06:15:33', '2024-06-23 06:15:33', 1),
(20, 5, 4, 1, NULL, 's', '2024-06-23 06:15:35', '2024-06-23 06:15:35', 1),
(21, 5, 4, 1, NULL, 'asdasd', '2024-06-23 06:15:37', '2024-06-23 06:15:37', 1),
(22, 5, 4, 1, NULL, 'asdad', '2024-06-23 06:15:41', '2024-06-23 06:15:41', 1),
(23, 5, 4, 1, NULL, 'asdasdasdasdasd', '2024-06-23 06:15:51', '2024-06-23 06:15:51', 1),
(24, 5, 4, 1, NULL, 'asdasdasdsad', '2024-06-23 06:15:56', '2024-06-23 06:15:56', 1),
(25, 5, 4, 1, NULL, 'asdasd', '2024-06-23 06:15:59', '2024-06-23 06:15:59', 1),
(26, 5, 4, 1, NULL, 'asdasd', '2024-06-23 06:16:02', '2024-06-23 06:16:02', 1),
(27, 5, 4, 1, NULL, 'asdasdsadsad', '2024-06-23 06:16:06', '2024-06-23 06:16:06', 1),
(28, 5, 4, 1, NULL, 'asdsad', '2024-06-23 06:21:46', '2024-06-23 06:21:46', 1),
(29, 5, 4, 1, NULL, 'asdasdasd', '2024-06-23 06:21:53', '2024-06-23 06:21:53', 1),
(30, 6, 4, 3, NULL, 'Ambot', '2024-06-23 06:30:16', '2024-06-23 06:30:16', 0),
(31, 6, 4, 3, NULL, 'a very a verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya verya very', '2024-06-23 06:30:25', '2024-06-23 07:57:56', 1),
(32, 6, 4, 3, NULL, 'a', '2024-06-23 06:30:32', '2024-06-23 06:30:32', 0),
(33, 6, 4, 3, NULL, 'a', '2024-06-23 06:30:34', '2024-06-23 06:30:34', 0),
(34, 6, 4, 3, NULL, 's', '2024-06-23 06:30:36', '2024-06-23 06:30:36', 0),
(35, 6, 4, 3, NULL, 'd', '2024-06-23 06:30:39', '2024-06-23 06:30:39', 0),
(36, 6, 4, 3, NULL, 'f', '2024-06-23 06:30:42', '2024-06-23 06:30:42', 0),
(37, 6, 4, 3, NULL, 'g', '2024-06-23 06:30:45', '2024-06-23 06:37:03', 1),
(38, 6, 4, 3, NULL, 'h', '2024-06-23 06:30:49', '2024-06-23 06:30:49', 0),
(39, 6, 4, 3, NULL, 'j', '2024-06-23 06:30:52', '2024-06-23 06:30:52', 0),
(40, 5, 1, 4, NULL, 'Ajdkasdasd', '2024-06-23 06:41:09', '2024-06-23 06:41:09', 1),
(41, 5, 4, 1, NULL, 'asdasd', '2024-06-23 07:07:05', '2024-06-23 07:07:05', 1),
(42, 5, 4, 1, NULL, 'asdsad', '2024-06-23 07:07:09', '2024-06-23 07:07:09', 1),
(43, 5, 4, 1, NULL, 'asdasdsad', '2024-06-23 07:07:14', '2024-06-23 07:07:14', 1),
(44, 6, 4, 3, NULL, 'asdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsd', '2024-06-23 07:24:10', '2024-06-23 07:24:10', 0),
(45, 7, 4, 1, NULL, 'Hello pre', '2024-06-24 05:13:26', '2024-06-24 07:45:49', 1),
(46, 7, 4, 1, NULL, 'Hi', '2024-06-24 05:13:37', '2024-06-24 05:13:37', 1),
(47, 7, 4, 1, NULL, 'hi', '2024-06-24 05:13:40', '2024-06-24 05:13:40', 1),
(48, 7, 4, 1, NULL, 'hiiii', '2024-06-24 05:13:45', '2024-06-24 07:45:55', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
