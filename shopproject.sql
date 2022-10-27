-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 08:26 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopelzero`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `Ordering` int(11) DEFAULT NULL,
  `Visibility` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Comment` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Ads` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Description`, `parent`, `Ordering`, `Visibility`, `Allow_Comment`, `Allow_Ads`) VALUES
(8, 'Hand Made', 'Hand Made Items', 0, 1, 1, 1, 1),
(9, 'Computers', 'Computers Item', 0, 2, 0, 0, 0),
(10, 'Cell Phones', 'Cell Phones', 0, 3, 0, 0, 0),
(11, 'Clothing', 'Clothing And Fashion', 8, 4, 0, 0, 0),
(12, 'Tools', 'Home Tools', 0, 5, 0, 0, 0),
(14, 'Blackberry', 'Blackberry Phones', 10, 2, 0, 0, 0),
(15, 'Hammers', 'Hammers Desc', 12, 1, 0, 0, 0),
(17, 'Games', 'Hand Made Games ', 12, 3, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `comment_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `comment`, `status`, `comment_date`, `item_id`, `user_id`) VALUES
(13, 'nice video game', 1, '2022-01-05', 32, 38),
(14, 'nice video game', 1, '2022-01-05', 32, 38),
(15, 'nice video game', 1, '2022-01-05', 32, 1),
(16, 'good phone', 1, '2022-01-05', 35, 40),
(17, 'good phone', 0, '2022-01-05', 35, 40);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Item_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Price` varchar(255) NOT NULL,
  `Add_Date` date NOT NULL,
  `Country_Made` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Rating` smallint(6) NOT NULL,
  `Approve` tinyint(4) NOT NULL DEFAULT 0,
  `Cat_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_ID`, `Name`, `Description`, `Price`, `Add_Date`, `Country_Made`, `Image`, `Status`, `Rating`, `Approve`, `Cat_ID`, `Member_ID`, `tags`) VALUES
(32, 'ps5', ' Videos Games', '$450', '2022-01-05', 'USA', '', '2', 0, 1, 17, 35, 'videos games,gaming'),
(33, 'iphone 12 pro max', 'IPHONE 12 PRO MAX LIKE NEW ', '$800', '2022-01-05', 'USA', '', '3', 0, 1, 10, 39, 'apple,iphone,steve jobs'),
(34, 'Lenovo ideapad L3', '15.6 Inch,16GB RAM,1TB SSD', '$900', '2022-01-05', 'Europe', '', '1', 0, 1, 9, 39, 'COMPUTER,GAMES,PROGRAMMING'),
(35, 'iphone 8', 'phone for sale ...', '1050', '2022-01-05', 'China', '', '3', 0, 1, 10, 40, 'apple,iphone,steve jobs');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL COMMENT 'To Identify User',
  `Username` varchar(255) NOT NULL COMMENT 'Username To Login',
  `Password` varchar(255) NOT NULL COMMENT 'Password To Login',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0 COMMENT 'Identify User Group',
  `TrustStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'Seller Rank',
  `RegStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'User Approval',
  `Date` date NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `FullName`, `GroupID`, `TrustStatus`, `RegStatus`, `Date`, `avatar`) VALUES
(1, 'rabihmh', '601f1889667efaebb33b8c12572835da3f027f78', 'rabihmh@gmail.com', 'Rabih Mahmoud', 1, 0, 1, '2021-12-14', ''),
(35, 'mo mh', '601f1889667efaebb33b8c12572835da3f027f78', 'momh@mail.com', 'Mahmoud Mahmoud', 0, 0, 1, '2022-01-05', '422987147_568621957_wordpress-custom-user-avatar.png'),
(36, 'mhmh', '601f1889667efaebb33b8c12572835da3f027f78', 'moham@hotmai.com', 'Mohamad ', 0, 0, 1, '2022-01-05', '4358917290_28375_60ede7b0d55.png'),
(37, 'zirzir', 'c129b324aee662b04eccf68babba85851346dff9', 'zirzir77@gmail.com', 'Zir El Zir', 0, 0, 1, '2022-01-05', ''),
(38, 'zakmh', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'zakmh@hotmail.com', 'Zakaria Mahmoud', 0, 0, 1, '2022-01-05', ''),
(39, 'hussein99', '48058e0c99bf7d689ce71c360699a14ce2f99774', 'hussein.99@mail.com', 'Hussein Ayach', 0, 0, 1, '2022-01-05', '7516820690_568621957_wordpress-custom-user-avatar.png'),
(40, 'test00', 'c129b324aee662b04eccf68babba85851346dff9', 'test@mail.com', '', 0, 0, 1, '2022-01-05', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `items_comment` (`item_id`),
  ADD KEY `comment_user` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `member_1` (`Member_ID`),
  ADD KEY `cat_1` (`Cat_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'To Identify User', AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_comment` FOREIGN KEY (`item_id`) REFERENCES `items` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `cat_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_1` FOREIGN KEY (`Member_ID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
