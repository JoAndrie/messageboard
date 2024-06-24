-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2024 at 11:27 AM
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
(4, 'Jonathans Andries', 'joandriee1@gmail.com', '$2a$10$yy.MmZdDQ2Xd20gb/PhUtOv/ZWpJLctKwFh7kbSUSdeCctwmjhPpO', '2024-06-01', 'Male', 'asddsdasd', '/img/profile_pic/6675f2699cbc7_340164107_745742993726338_3753655993145125447_n.jpg', '2024-06-21 23:31:56', '2024-06-24 08:04:21', '2024-06-24 08:04:21', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
