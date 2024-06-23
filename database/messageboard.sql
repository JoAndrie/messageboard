-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2024 at 08:17 AM
-- Server version: 10.4.24-MariaDB
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
(13, 6, 4, 3, NULL, 'Hi', '2024-06-23 05:36:15', '2024-06-23 05:36:15', 0),
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
(44, 6, 4, 3, NULL, 'asdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsdasdsd', '2024-06-23 07:24:10', '2024-06-23 07:24:10', 0);

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
(6, 4, 3, '2024-06-22 05:35:00', '2024-06-22 05:35:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('Male','Female','""') DEFAULT '""',
  `hobby` text DEFAULT NULL,
  `img_url` varchar(255) NOT NULL DEFAULT '/img/default.png',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `birthdate`, `gender`, `hobby`, `img_url`, `created`, `updated`, `last_login_time`, `is_inactive`) VALUES
(1, 'Jonathan', 'joandrie@gmail.com', '$2a$10$gsaQyUSZCgtnmda/SW62mO7sD8tHj31.AL556gO.DEXHRmDcEXQ9q', '0000-00-00', '\"\"', NULL, '/img/default.png', '2024-06-14 07:16:38', '2024-06-23 06:40:54', '2024-06-23 06:40:54', 0),
(2, 'andrie', 'andrie@gmail.com', '$2a$10$gNXZtEXY4nHm6XWO9BbeUOzJIl9dfRo7vI9V4ODpFE77FmP.JSnpa', '0000-00-00', '\"\"', NULL, '/img/default.png', '2024-06-14 07:22:27', '2024-06-22 01:57:17', '2024-06-22 01:57:17', 0),
(3, 'JoAndrie', 'joandrie1350110@gmail.com', '$2a$10$HtNUKLPi3nq3uHSc8yik0uWhHyWzlxDM9NKqmk1mWOBANhu2bddbW', '2024-06-07', 'Female', 'Mama mo hobby', '/img/profile_pic/666c3ab608cce_277854490_258022226450332_1204372174305002921_n.jpg', '2024-06-14 07:31:06', '2024-06-23 05:45:39', '2024-06-23 05:45:39', 0),
(4, 'Jonathans Andries', 'joandriee1@gmail.com', '$2a$10$yy.MmZdDQ2Xd20gb/PhUtOv/ZWpJLctKwFh7kbSUSdeCctwmjhPpO', '2024-06-01', 'Male', 'asddsdasd', '/img/profile_pic/6675f2699cbc7_340164107_745742993726338_3753655993145125447_n.jpg', '2024-06-21 23:31:56', '2024-06-23 06:01:47', '2024-06-23 06:01:47', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
