-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2024 at 11:52 PM
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
-- Database: `institute_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `project_id`, `user_email`, `owner_email`) VALUES
(11, 5, 'sp.singh.302101@gmail.com', 'spsingh101203@gmail.com'),
(12, 5, 'sp.singh.302101@gmail.com', 'spsingh101203@gmail.com'),
(13, 7, 'spsingh101203@gmail.com', 'sp.singh.302101@gmail.com'),
(14, 6, 'sp.singh.302101@gmail.com', 'spsingh101203@gmail.com'),
(15, 8, 'spsingh101203@gmail.com', 'sp.singh.302101@gmail.com'),
(16, 6, 'spsingh101203@gmail.com', 'spsingh101203@gmail.com'),
(17, 9, 'sp.singh.302101@gmail.com', 'spsingh101203@gmail.com'),
(18, 5, 'spsingh101203@gmail.com', 'spsingh101203@gmail.com'),
(19, 5, 'sp.singh.302101@gmail.com', 'spsingh101203@gmail.com'),
(20, 10, 'sp.singh.302101@gmail.com', 'sp.singh.302101@gmail.com'),
(21, 14, 'sp.singh.302101@gmail.com', 'spsingh101203@gmail.com'),
(22, 15, 'spsingh101203@gmail.com', 'sp.singh.302101@gmail.com'),
(23, 16, 'sp.singh.302101@gmail.com', 'sp.singh.302101@gmail.com'),
(24, NULL, NULL, NULL),
(25, NULL, NULL, NULL),
(26, NULL, NULL, NULL),
(27, 17, 'spsingh101203@gmail.com', 'sp.singh.302101@gmail.com'),
(28, 5, 'saumya@gmail.com', 'spsingh101203@gmail.com'),
(29, 18, 'spsingh101203@gmail.com', 'saumya@gmail.com'),
(30, 7, 'saumya@gmail.com', 'sp.singh.302101@gmail.com'),
(31, 18, 'sp.singh.302101@gmail.com', 'saumya@gmail.com'),
(32, 11, 'saumya@gmail.com', 'spsingh101203@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `projectName` varchar(255) NOT NULL,
  `projectSubject` varchar(255) NOT NULL,
  `projectDescription` text NOT NULL,
  `projectTopics` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `email`, `projectName`, `projectSubject`, `projectDescription`, `projectTopics`) VALUES
(5, 'spsingh101203@gmail.com', 'WEB', 'WEB', 'WEB', 'WEB'),
(6, 'spsingh101203@gmail.com', 'ML', 'ML', 'ML', 'ML'),
(7, 'sp.singh.302101@gmail.com', 'PHY', 'phy', 'phy', 'phy'),
(8, 'sp.singh.302101@gmail.com', 'Mat', 'Mat', 'Mat', 'Mat'),
(9, 'spsingh101203@gmail.com', 'Dev', 'Dev', 'Dev', 'Dev'),
(10, 'sp.singh.302101@gmail.com', 'Art', 'Art', 'Art', 'Art'),
(11, 'spsingh101203@gmail.com', 'Chem', 'Chem', 'Chem', 'Chem'),
(12, 'sp.singh.302101@gmail.com', 'bf d', 'jb j', 'm xm', 'xb c'),
(13, 'sp.singh.302101@gmail.com', 'kdn', '  xm,', ' nxc', 'cx nncx'),
(14, 'spsingh101203@gmail.com', 'AI&DS', 'AI', 'AI&DS', 'AI'),
(15, 'sp.singh.302101@gmail.com', 'MME', 'MME', 'MME', 'MME'),
(16, 'sp.singh.302101@gmail.com', 'JS', 'JS', 'JSSS', 'JS'),
(17, 'sp.singh.302101@gmail.com', 'GFG', 'GFG', 'GFG', 'GFG'),
(18, 'saumya@gmail.com', 'PHP', 'PHP', 'PHP', 'PHP');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'spsingh101203@gmail.com', 'Somvanshi@123'),
(2, 'sp.singh.302101@gmail.com', 'password123'),
(3, 'saumya@gmail.com', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
