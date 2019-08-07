-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2019 at 05:45 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountMembers` (OUT `total_members` INT)  BEGIN
  SELECT COUNT(*) INTO total_members FROM tblmembers;
  SELECT total_members;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllMembers` ()  BEGIN
  SELECT tm.id, tm.name, tm.email, tp.full_address, tp.hobby, tp.food_habit, tp.smoking_habit, tp.drinking_habit, tp.profile_img FROM tblmembers AS tm JOIN
  tblprofile AS tp ON tm.id = tp.member_id ORDER BY tm.id DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStatesByCountry` (IN `CountryCode` INT)  BEGIN
  SELECT state_id, state_name FROM states WHERE country_id = CountryCode;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `dateval` date NOT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `emp_id`, `dateval`, `in_time`, `out_time`) VALUES
(1, 1, '2019-05-02', '10:05:00', '13:17:00'),
(2, 1, '2019-05-02', '14:10:00', '15:30:00'),
(3, 1, '2019-05-02', '16:10:00', '19:20:00'),
(4, 1, '2019-05-03', '10:15:00', '11:11:18'),
(5, 1, '2019-05-03', '11:20:07', '12:10:24'),
(6, 1, '2019-05-03', '12:21:26', '13:45:18'),
(7, 1, '2019-05-03', '14:45:23', '16:18:36'),
(8, 1, '2019-05-03', '16:30:12', '18:45:14'),
(9, 1, '2019-05-06', '10:35:10', '11:15:36'),
(10, 1, '2019-05-06', '11:21:28', '12:40:18'),
(11, 1, '2019-05-06', '12:49:21', '14:05:34'),
(12, 1, '2019-05-06', '15:05:32', '16:10:45'),
(13, 1, '2019-05-06', '16:25:18', '17:30:17'),
(14, 1, '2019-05-06', '17:45:31', '19:05:40'),
(15, 2, '2019-05-04', '12:30:16', '18:30:11'),
(16, 2, '2019-05-03', '09:44:14', '19:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `budget_managers`
--

CREATE TABLE `budget_managers` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `budget_managers`
--

INSERT INTO `budget_managers` (`id`, `name`, `created`, `updated`) VALUES
(2, 'Torry Harris', '2019-07-21 18:03:32', '2019-07-21 12:33:32'),
(3, 'Creig Mackmilan', '2019-07-21 18:04:20', '2019-07-21 12:34:20'),
(4, 'Jerome K Jerome', '2019-07-21 18:04:54', '2019-07-23 09:06:28'),
(5, 'Benn Stokes', '2019-07-21 18:05:21', '2019-07-21 12:35:21'),
(6, 'Jeff Bezos', '2019-07-21 18:05:32', '2019-07-21 12:54:53'),
(8, 'Chris Harris', '2019-07-21 18:27:49', '2019-07-23 07:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `business_units`
--

CREATE TABLE `business_units` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `budget_m` varchar(100) NOT NULL,
  `subbusiness_units_m` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_units`
--

INSERT INTO `business_units` (`id`, `name`, `budget_m`, `subbusiness_units_m`, `created`, `updated`) VALUES
(2, 'Express Weather', '6,5', '3,1', '2019-07-23 17:15:48', '2019-07-24 17:40:40'),
(3, 'Smartwork Business Solution', '8,3', '5', '2019-07-24 17:10:05', '2019-07-24 12:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'Sri Lanka'),
(3, 'Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_phone` varchar(50) NOT NULL,
  `emp_salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `emp_name`, `emp_email`, `emp_phone`, `emp_salary`) VALUES
(1, 'Manojit Nandi', 'manojit87@gmail.com', '9230459769', 7000),
(2, 'Doyeta Chakrovarty', 'doyeta.piyali@gmail.com', '9903772144', 5000),
(3, 'Anusua Putatunda', 'anu.csc@gmail.com', '9007175423', 10000),
(4, 'Rahul', 'rahul@gmail.com', '9123409786', 7000);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `img_name`, `created`) VALUES
(1, '1561208055.jpg', '2019-06-22 12:54:15'),
(2, '7190.jpg', '2019-06-22 13:03:53'),
(3, '3027.jpg', '2019-06-22 13:04:57'),
(4, '4933.jpg', '2019-06-22 13:04:57'),
(5, '4772.jpg', '2019-06-22 13:07:45'),
(6, '1823.jpg', '2019-06-22 13:07:46'),
(7, '7987.jpg', '2019-06-22 13:07:46'),
(8, '5572.jpg', '2019-06-22 13:07:46'),
(12, '7193.jpg', '2019-06-22 13:11:27'),
(13, '2570.jpg', '2019-06-22 13:11:27'),
(14, '490.jpg', '2019-06-23 07:23:06'),
(15, '7874.jpg', '2019-06-23 08:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_28_114148_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderabovetwohundred`
-- (See below for the actual view)
--
CREATE TABLE `orderabovetwohundred` (
`id` int(11)
,`txn_id` varchar(255)
,`order_id` int(11)
,`payment_gross` decimal(12,2)
,`currency_code` varchar(5)
,`payer_id` varchar(20)
,`payer_name` varchar(50)
,`payer_email` varchar(100)
,`payer_country` varchar(5)
,`payment_status` varchar(10)
,`created` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created`, `modified`) VALUES
(1, 'First Post', 'lorem ipsum is the dummy text.\r\nlorem ipsum is the dummy text.\r\nlorem ipsum is the dummy text.\r\nlorem ipsum is the dummy text.', '2019-01-01 06:29:39', '2019-07-13 18:13:14'),
(2, 'My experiment with laravel', 'laravel is a nice framework.', '2019-01-01 06:32:29', '2019-01-01 06:50:51'),
(4, 'Fresh Post', 'lorem ipsum is the dummy text', '2019-01-01 12:32:46', '2019-01-01 12:32:46'),
(5, 'Laravel is most popular framework in web development', 'lorem ipsum is the dummy text', '2019-01-01 14:51:00', '2019-01-01 15:51:10'),
(6, 'Codeigniter is a very beautiful framework', 'We can achieve everything through codeigniter.', '2019-01-02 13:02:45', '2019-06-20 16:32:29'),
(12, 'Hi', 'Hello AngularJS.', '2019-06-19 14:08:02', '2019-06-20 16:34:48'),
(18, 'AngularJS', 'Angularjs is a nicely developed js library.', '2019-06-19 15:09:00', '2019-06-19 18:39:00'),
(19, 'AngularJS', 'My Experiment with angularjs.', '2019-06-19 15:47:32', '2019-06-19 19:17:32'),
(20, 'Jquery', 'Jquery is better than angularjs.', '2019-06-19 15:48:08', '2019-06-19 19:18:08'),
(21, 'ReactJS', 'No idea about reactjs.', '2019-06-19 15:48:37', '2019-07-13 18:12:01'),
(22, 'Node js vs PHP', 'PHP 7 is far better than nodejs.', '2019-06-19 15:49:53', '2019-06-19 19:19:53'),
(23, 'Modern web development', 'Javascript is the backbone of modern web development.', '2019-06-19 19:21:39', '2019-06-19 19:21:39'),
(24, 'Angularjs has few faults.', 'HTTP post request in angularjs nor working properly.', '2019-06-20 12:36:42', '2019-06-20 16:37:10'),
(25, 'Hello Testing', 'Testing hello', '2019-06-20 12:46:02', '2019-07-13 18:46:32'),
(26, 'AngularJS is fun', 'Love you angular.', '2019-06-20 13:54:27', '2019-06-20 16:28:12'),
(27, 'PHP with AngularJS is fun.', 'WBlesson is a nice tutorial website. It teaches angularjs with PHP very nicely.', '2019-06-20 16:31:58', '2019-06-20 16:37:59'),
(28, 'Alert not working', 'Need to check.Try to fix it.', '2019-06-20 16:38:42', '2019-06-23 17:29:47'),
(29, 'Cakephp is beautiful.', 'My experiment with cakephp 2.x', '2019-07-13 13:41:11', '2019-07-13 18:41:02'),
(30, 'New Post', 'lorem ipsum is the dummy text.', '2019-07-13 17:14:21', '2019-07-13 18:27:20'),
(31, 'Bhagawat Gita is the source of my inspiration', 'I love Bhagawat Gita.', '2019-07-13 17:16:53', '2019-07-13 17:16:53'),
(32, 'Cakephp blog tutorial', 'lorem ipsum is the dummy text.', '2019-07-13 17:17:52', '2019-07-13 18:05:47'),
(39, 'Another php framework.', 'lorem ipsum is the dummy text in industry. Cakephp is the first framework in PHP  industry.', '2019-07-21 13:24:32', '2019-07-21 13:32:01'),
(40, 'lorem ipsum', 'lorem ipsum is the dummy text in industry.', '2019-07-21 13:32:51', '2019-07-21 13:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `details` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 for active 0 for inactive',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `product_image`, `status`, `created`, `modified`) VALUES
(1, 'Samsung Galaxy J5', 'This is an awesome smartphone', 130, '1546608455.jpg', '1', '2019-01-04 18:57:35', '2019-01-04 18:57:35'),
(2, 'Samsung Galaxy S5', 'This is another smartphone', 140, '1546609150.jpg', '1', '2019-01-04 19:09:10', '2019-01-04 19:09:10'),
(3, 'Samsung Galaxy S7', 'This is a great smartphone', 115, '1546609456.jpg', '1', '2019-01-04 19:14:16', '2019-01-04 19:14:16'),
(4, 'Micromax Canvas 6', 'lorem ipsum is the dummy text', 100, '1546609603.jpg', '1', '2019-01-04 19:16:43', '2019-01-04 19:16:43'),
(5, 'Micromax Nitro 3', 'A micromax smartphone', 100, '1546610346.jpg', '1', '2019-01-04 19:29:07', '2019-01-09 13:18:28'),
(6, 'Oppo smartphone', 'lorem ipsum is the dummy text', 170, '1546613797.jpg', '1', '2019-01-04 20:26:37', '2019-03-16 19:59:40'),
(7, 'Vivo V5 Smartphone', 'This is a vivo smartphone', 165, '1552747300.jpg', '1', '2019-01-04 20:29:22', '2019-03-16 20:23:19'),
(8, 'One plus smartphone', 'lorem ipsum is the dummy text.', 9000, '1564731670.jpg', '1', '2019-08-02 13:11:10', '2019-08-02 13:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `country_id`, `state_name`) VALUES
(1, 1, 'West Bengal'),
(2, 1, 'Kerala'),
(3, 1, 'Gujrat'),
(4, 1, 'Assam'),
(5, 3, 'Dhaka'),
(6, 3, 'Khulna'),
(7, 3, 'Chitagang'),
(8, 2, 'Colombo'),
(9, 2, 'Candy');

-- --------------------------------------------------------

--
-- Table structure for table `subbusiness_units`
--

CREATE TABLE `subbusiness_units` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subbusiness_units`
--

INSERT INTO `subbusiness_units` (`id`, `name`, `created`, `updated`) VALUES
(1, 'Business Unit', '2019-07-23 12:45:10', '2019-07-23 07:16:42'),
(2, 'Business Unit 1', '2019-07-23 12:47:29', '2019-07-23 07:17:50'),
(3, 'Business Unit 2', '2019-07-23 12:48:20', '2019-07-23 07:17:50'),
(4, 'Business Unit 3', '2019-07-24 06:28:10', '2019-07-24 06:50:17'),
(5, 'Business Unit 4', '2019-07-24 10:10:29', '2019-07-24 06:51:22'),
(6, 'Business Unit 5', '2019-07-24 12:23:09', '2019-07-24 06:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_username` varchar(150) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'admin',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`admin_id`, `admin_name`, `admin_username`, `admin_password`, `role`, `created`, `updated`) VALUES
(1, 'Site Admin', 'admin', '49c86917806787124d94d9bac68fc0b8', 'admin', '2019-07-31 15:33:31', '2019-07-31 15:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `tblblog`
--

CREATE TABLE `tblblog` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `thumb` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of blogs';

--
-- Dumping data for table `tblblog`
--

INSERT INTO `tblblog` (`id`, `title`, `content`, `thumb`, `created`, `updated`) VALUES
(1, 'My first blog', 'lorem ipsum is the dummy text for the industry', '1564128003.jpg', '2019-07-25 13:06:41', '2019-07-26 08:00:03'),
(2, 'Bhagawat Gita: A power house', 'lorem ipsum is the dummy text', '1564127927.jpg', '2019-07-25 13:40:27', '2019-07-26 07:58:47'),
(4, 'Cakephp upload', 'How to upload and save file in php.', '1564128290.jpg', '2019-07-26 03:39:28', '2019-07-26 08:04:50'),
(5, 'Cakephp is a nice framework', 'Cakephp supports RAD process.', '1564127880.jpg', '2019-07-26 03:43:16', '2019-07-26 07:58:00'),
(6, 'lorem ipsum.', 'lorem ipsum is the dummy text for industry.', '1564127788.jpg', '2019-07-26 03:48:13', '2019-07-26 07:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) NOT NULL COMMENT 'The unique session id for any customer',
  `item_id` int(11) NOT NULL COMMENT 'The id of product',
  `item_quantity` int(11) NOT NULL COMMENT 'Number of quantity added',
  `item_price` int(11) NOT NULL COMMENT 'instant price for item',
  `created` bigint(20) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcart`
--

INSERT INTO `tblcart` (`id`, `unique_id`, `item_id`, `item_quantity`, `item_price`, `created`, `modified`) VALUES
(5, 'eea2qpthfqje1abv5scmrrka6q', 2, 1, 140, 1561789420, '2019-06-29 06:23:40'),
(7, 'eea2qpthfqje1abv5scmrrka6q', 4, 1, 100, 1561791241, '2019-06-29 06:54:01'),
(8, 'eea2qpthfqje1abv5scmrrka6q', 5, 1, 100, 1561800378, '2019-06-29 09:26:18'),
(13, '1561801282_9437149', 1, 1, 130, 1561801282, '2019-06-29 09:41:22'),
(14, '1561801282_9437149', 7, 1, 165, 1561801301, '2019-06-29 09:41:41'),
(16, '1561801498_349220', 5, 1, 100, 1561801498, '2019-06-29 09:44:58'),
(17, '1561801498_349220', 2, 1, 140, 1561801507, '2019-06-29 09:45:07'),
(20, '1561801623_8054856', 6, 1, 170, 1561801959, '2019-06-29 09:52:39'),
(21, '1561801623_8054856', 1, 1, 130, 1561801963, '2019-06-29 09:52:43'),
(22, '1561801623_8054856', 3, 1, 115, 1561801967, '2019-06-29 09:52:47'),
(23, '1561803774_8793574', 1, 1, 130, 1561803774, '2019-06-29 10:22:54'),
(24, '1561803938_6258441', 4, 1, 100, 1561803938, '2019-06-29 10:25:38'),
(25, '1561804526_1064495', 7, 1, 165, 1561804526, '2019-06-29 10:35:26'),
(27, '1561804583_4674706', 1, 1, 130, 1561804638, '2019-06-29 10:37:18'),
(28, '1561804583_4674706', 7, 1, 165, 1561804644, '2019-06-29 10:37:24'),
(29, '1561804583_4674706', 3, 1, 115, 1561804650, '2019-06-29 10:37:30'),
(30, '1561804583_4674706', 2, 1, 140, 1561804655, '2019-06-29 10:37:35'),
(31, '1561806274_5525339', 2, 1, 140, 1561806274, '2019-06-29 11:04:34'),
(32, '1561806635_2724546', 5, 1, 100, 1561806635, '2019-06-29 11:10:35'),
(33, '1561966724_2539034', 1, 1, 130, 1561966724, '2019-07-01 07:38:44'),
(34, '1561966724_2539034', 6, 1, 170, 1561966734, '2019-07-01 07:38:54'),
(35, '1561967534_2276440', 5, 1, 100, 1561967534, '2019-07-01 07:52:14'),
(36, '1561976526_4160469', 1, 1, 130, 1561976526, '2019-07-01 10:22:06'),
(37, '1561976526_4160469', 6, 1, 170, 1561976536, '2019-07-01 10:22:16'),
(38, '1561977012_2684746', 4, 1, 100, 1561977012, '2019-07-01 10:30:12'),
(39, '1561982107_7550068', 1, 1, 130, 1561982107, '2019-07-01 11:55:07'),
(40, '1561982107_7550068', 6, 1, 170, 1561982124, '2019-07-01 11:55:24'),
(41, '1562046285_2532204', 1, 1, 130, 1562046285, '2019-07-02 05:44:45'),
(44, '1562135850_8540692', 2, 1, 140, 1562140514, '2019-07-03 07:55:14'),
(45, '1562135850_8540692', 7, 1, 165, 1562140527, '2019-07-03 07:55:27'),
(46, '1562140797_5267286', 1, 1, 130, 1562140797, '2019-07-03 07:59:57'),
(47, '1562141432_2648642', 4, 1, 100, 1562141432, '2019-07-03 08:10:32'),
(48, '1562141432_2648642', 6, 1, 170, 1562141637, '2019-07-03 08:13:57'),
(49, '1562141976_6065933', 4, 1, 100, 1562141976, '2019-07-03 08:19:36'),
(50, '1562141976_6065933', 1, 1, 130, 1562141982, '2019-07-03 08:19:42'),
(51, '1562141976_6065933', 6, 1, 170, 1562141988, '2019-07-03 08:19:48'),
(54, '1562143859_5895242', 1, 1, 130, 1562144112, '2019-07-03 08:55:12'),
(55, '1562143859_5895242', 5, 1, 100, 1562144119, '2019-07-03 08:55:19'),
(56, '1562147615_147789', 1, 1, 130, 1562147615, '2019-07-03 09:53:35'),
(57, '1562147615_147789', 3, 1, 115, 1562147734, '2019-07-03 09:55:34'),
(58, '1562148812_4744770', 4, 1, 100, 1562148812, '2019-07-03 10:13:32'),
(59, '1562148812_4744770', 7, 1, 165, 1562148824, '2019-07-03 10:13:44'),
(60, '1562393637_4080324', 1, 1, 130, 1562393637, '2019-07-06 06:13:57'),
(61, '1562393637_4080324', 6, 1, 170, 1562393664, '2019-07-06 06:14:24'),
(62, '1562657504_7838597', 1, 1, 130, 1562657504, '2019-07-09 07:31:44'),
(63, '1562657504_7838597', 2, 1, 140, 1562670321, '2019-07-09 11:05:21'),
(64, '1562670529_2918082', 1, 1, 130, 1562670529, '2019-07-09 11:08:49'),
(65, '1562670529_2918082', 6, 1, 170, 1562670536, '2019-07-09 11:08:56'),
(66, '1562670884_5175896', 5, 1, 100, 1562670884, '2019-07-09 11:14:44'),
(67, '1562671234_9697957', 2, 1, 140, 1562671234, '2019-07-09 11:20:34'),
(68, '1562671234_9697957', 6, 1, 170, 1562671241, '2019-07-09 11:20:41'),
(69, '1562671306_1320394', 7, 1, 165, 1562671306, '2019-07-09 11:21:46'),
(70, '1562671306_1320394', 3, 1, 115, 1562671340, '2019-07-09 11:22:20'),
(71, '1562671441_165543', 1, 1, 130, 1562671441, '2019-07-09 11:24:01'),
(72, '1562671441_165543', 5, 1, 100, 1562671445, '2019-07-09 11:24:05'),
(73, '1562671770_40810', 2, 1, 140, 1562671770, '2019-07-09 11:29:30'),
(74, '1562671770_40810', 6, 1, 170, 1562671778, '2019-07-09 11:29:38'),
(75, '1562671947_1660185', 1, 1, 130, 1562671947, '2019-07-09 11:32:27'),
(76, '1562671947_1660185', 2, 1, 140, 1562671951, '2019-07-09 11:32:31'),
(77, '1562671947_1660185', 3, 1, 115, 1562671955, '2019-07-09 11:32:35'),
(78, '1562672200_1645907', 2, 1, 140, 1562672200, '2019-07-09 11:36:40'),
(79, '1562672200_1645907', 4, 1, 100, 1562672211, '2019-07-09 11:36:51'),
(80, '1562737093_5778573', 1, 1, 130, 1562737093, '2019-07-10 05:38:13'),
(81, '1562738714_2936189', 3, 1, 115, 1562738714, '2019-07-10 06:05:14'),
(82, '1562738714_2936189', 6, 1, 170, 1562738830, '2019-07-10 06:07:10'),
(83, '1562740470_8029243', 2, 1, 140, 1562740470, '2019-07-10 06:34:30'),
(84, '1562740470_8029243', 7, 1, 165, 1562740480, '2019-07-10 06:34:40'),
(85, '1562743221_2410279', 4, 1, 100, 1562743221, '2019-07-10 07:20:21'),
(86, '1562909745_6112445', 2, 1, 140, 1562909745, '2019-07-12 05:35:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblhobby`
--

CREATE TABLE `tblhobby` (
  `id` int(11) NOT NULL,
  `hobby_name` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblhobby`
--

INSERT INTO `tblhobby` (`id`, `hobby_name`, `created`, `modified`) VALUES
(1, 'Singing', '2019-07-27 12:38:19', '2019-07-27 07:12:14'),
(2, 'Watching Movies', '2019-07-27 12:40:21', '2019-07-27 07:10:42'),
(3, 'Listening Music', '2019-07-27 12:41:22', '2019-07-27 07:11:33'),
(4, 'Gardening', '2019-07-27 12:43:27', '2019-07-27 07:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `tblmembers`
--

CREATE TABLE `tblmembers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('1','0') DEFAULT '1' COMMENT '1 for active 0 for inactive',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmembers`
--

INSERT INTO `tblmembers` (`id`, `name`, `email`, `password`, `is_active`, `created`, `modified`) VALUES
(10, 'Doyeta Chakravarti Biswas', 'doyeta.piyali@gmail.com', '7a6583060583f77fa4192cdec816d664', '1', '2019-07-29 16:08:05', '2019-08-05 03:46:44'),
(11, 'Manojit Nandi', 'manojit.nandi@gmail.com', '49c86917806787124d94d9bac68fc0b8', '1', '2019-07-29 16:10:18', '2019-07-29 10:40:18'),
(12, 'Sanjay Patra', 'sanjay.d@gmail.com', '49c86917806787124d94d9bac68fc0b8', '1', '2019-07-29 16:22:52', '2019-08-05 04:01:38'),
(13, 'Kaustav Nandi', 'kaustav.n@gmail.com', '7a6583060583f77fa4192cdec816d664', '1', '2019-07-29 16:24:39', '2019-07-29 10:54:39'),
(14, 'Manojit Nandi', 'mnbl87@gmail.com', '49c86917806787124d94d9bac68fc0b8', '1', '2019-07-30 15:05:58', '2019-08-05 03:42:35'),
(15, 'Manojit Nandi', 'manojit87@gmail.com', '49c86917806787124d94d9bac68fc0b8', '1', '2019-07-30 15:18:58', '2019-07-30 09:48:58'),
(16, 'bbcvcbcv', 'hello@gmail.com', '49c86917806787124d94d9bac68fc0b8', '1', '2019-07-30 18:09:31', '2019-07-31 07:46:51'),
(17, 'Manojit Nandi', 'manojit.n@expressgrp.com', '49c86917806787124d94d9bac68fc0b8', '1', '2019-07-31 11:16:53', '2019-08-01 05:20:38'),
(18, 'Sourav Nandi', 'souravn@gmail.com', '49c86917806787124d94d9bac68fc0b8', '1', '2019-07-31 13:22:07', '2019-08-05 03:37:12'),
(19, 'Pinki Maitra', 'pinki.m@gmail.com', '7a6583060583f77fa4192cdec816d664', '1', '2019-08-01 01:12:10', '2019-07-31 19:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `order_id` int(11) NOT NULL,
  `order_unique_id` varchar(255) NOT NULL COMMENT 'The unique session id for any order',
  `order_amt` decimal(12,2) NOT NULL,
  `order_currency` varchar(50) NOT NULL,
  `order_cust_id` int(11) DEFAULT NULL,
  `order_time` datetime NOT NULL,
  `paid_status` enum('1','0') NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`order_id`, `order_unique_id`, `order_amt`, `order_currency`, `order_cust_id`, `order_time`, `paid_status`, `modified`) VALUES
(5, 'eea2qpthfqje1abv5scmrrka6q', '240.00', 'USD', 2147483647, '2019-06-29 14:51:25', '1', '2019-06-29 09:21:25'),
(7, '1561801282_9437149', '295.00', 'USD', 2147483647, '2019-06-29 15:12:58', '1', '2019-06-29 09:42:58'),
(8, '1561801498_349220', '240.00', 'USD', 2147483647, '2019-06-29 15:16:18', '1', '2019-06-29 09:46:18'),
(9, '1561801623_8054856', '415.00', 'USD', 2147483647, '2019-06-29 15:23:26', '1', '2019-06-29 09:53:26'),
(10, '1561803774_8793574', '130.00', 'USD', 2147483647, '2019-06-29 15:54:13', '1', '2019-06-29 10:24:13'),
(11, '1561803938_6258441', '100.00', 'USD', 2147483647, '2019-06-29 15:56:38', '1', '2019-06-29 10:26:38'),
(12, '1561804526_1064495', '165.00', 'USD', 2147483647, '2019-06-29 16:06:07', '1', '2019-06-29 10:36:07'),
(13, '1561804583_4674706', '550.00', 'USD', 2147483647, '2019-06-29 16:09:02', '1', '2019-06-29 10:39:02'),
(14, '1561806274_5525339', '140.00', 'USD', 2147483647, '2019-06-29 16:36:44', '1', '2019-06-29 11:06:44'),
(15, '1561806635_2724546', '100.00', 'USD', 2147483647, '2019-06-29 16:41:44', '1', '2019-06-29 11:11:44'),
(16, '1561966724_2539034', '300.00', 'USD', 2147483647, '2019-07-01 13:12:00', '1', '2019-07-01 07:42:00'),
(17, '1561967534_2276440', '100.00', 'USD', 2147483647, '2019-07-01 13:23:01', '1', '2019-07-01 07:53:01'),
(18, '1561976526_4160469', '300.00', 'USD', 2147483647, '2019-07-01 15:53:56', '1', '2019-07-01 10:23:56'),
(19, '1561977012_2684746', '100.00', 'USD', 2147483647, '2019-07-01 16:01:01', '1', '2019-07-01 10:31:01'),
(20, '1561982107_7550068', '300.00', 'USD', 0, '2019-07-01 17:27:36', '1', '2019-07-01 11:57:36'),
(21, '1562046285_2532204', '130.00', 'USD', 2147483647, '2019-07-02 15:02:05', '1', '2019-07-02 09:32:05'),
(22, '1562141432_2648642', '270.00', 'USD', NULL, '2019-07-03 13:46:17', '1', '2019-07-03 08:16:17'),
(23, '1562141976_6065933', '400.00', 'USD', NULL, '2019-07-03 14:11:07', '1', '2019-07-03 08:41:07'),
(24, '1562143859_5895242', '230.00', 'USD', NULL, '2019-07-03 14:26:48', '1', '2019-07-03 08:56:48'),
(25, '1562147615_147789', '245.00', 'USD', NULL, '2019-07-03 15:26:36', '1', '2019-07-03 09:56:36'),
(26, '1562148812_4744770', '265.00', 'USD', 2147483647, '2019-07-03 15:44:54', '1', '2019-07-03 10:14:54'),
(27, '1562393637_4080324', '300.00', 'USD', NULL, '2019-07-06 11:45:57', '1', '2019-07-06 06:15:57'),
(28, '1562657504_7838597', '270.00', 'USD', NULL, '2019-07-09 13:06:20', '1', '2019-07-09 11:06:20'),
(29, '1562670529_2918082', '300.00', 'USD', NULL, '2019-07-09 13:10:33', '1', '2019-07-09 11:10:33'),
(30, '1562670884_5175896', '100.00', 'USD', NULL, '2019-07-09 13:16:03', '1', '2019-07-09 11:16:03'),
(31, '1562671234_9697957', '310.00', 'USD', NULL, '2019-07-09 13:21:26', '1', '2019-07-09 11:21:26'),
(32, '1562671306_1320394', '280.00', 'USD', NULL, '2019-07-09 13:23:02', '1', '2019-07-09 11:23:02'),
(33, '1562671441_165543', '230.00', 'USD', NULL, '2019-07-09 13:24:56', '1', '2019-07-09 11:24:56'),
(34, '1562671770_40810', '310.00', 'USD', NULL, '2019-07-09 13:30:37', '1', '2019-07-09 11:30:37'),
(35, '1562671947_1660185', '385.00', 'USD', NULL, '2019-07-09 13:33:28', '1', '2019-07-09 11:33:28'),
(36, '1562672200_1645907', '240.00', 'USD', NULL, '2019-07-09 13:37:47', '1', '2019-07-09 11:37:47'),
(37, '1562737093_5778573', '130.00', 'USD', NULL, '2019-07-10 11:09:58', '1', '2019-07-10 05:39:59'),
(38, '1562738714_2936189', '285.00', 'USD', NULL, '2019-07-10 11:38:03', '1', '2019-07-10 06:08:03'),
(39, '1562740470_8029243', '305.00', 'USD', NULL, '2019-07-10 12:06:06', '1', '2019-07-10 06:36:06'),
(40, '1562743221_2410279', '100.00', 'USD', NULL, '2019-07-10 12:52:07', '1', '2019-07-10 07:22:07'),
(41, '1562909745_6112445', '140.00', 'USD', NULL, '2019-07-12 11:08:52', '1', '2019-07-12 05:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblpayments`
--

CREATE TABLE `tblpayments` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_gross` decimal(12,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payer_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_country` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblpayments`
--

INSERT INTO `tblpayments` (`id`, `txn_id`, `order_id`, `payment_gross`, `currency_code`, `payer_id`, `payer_name`, `payer_email`, `payer_country`, `payment_status`, `created`) VALUES
(1, 'PAYID-LULSSDQ04N3131809503544A', 5, '240.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 09:21:25'),
(2, 'PAYID-LULTASY1MH4559724496550S', 6, '170.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 09:34:36'),
(3, 'PAYID-LULTEXI1SS54443EH853113D', 7, '295.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 09:42:58'),
(4, 'PAYID-LULTGKA7T243972WP218461U', 8, '240.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 09:46:19'),
(5, 'PAYID-LULTJ6I2S664552BH331893E', 9, '415.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 09:53:26'),
(6, 'PAYID-LULTYBQ19M38822MV300301U', 10, '130.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 10:24:13'),
(7, 'PAYID-LULTZKA16104602MN2540341', 11, '100.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 10:26:39'),
(8, 'PAYID-LULT55I3YT384375L556544U', 12, '165.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 10:36:07'),
(9, 'PAYID-LULT67Q0G987918UJ727781V', 13, '550.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 10:39:02'),
(10, 'PAYID-LULUL5A9WE00225XC4047713', 14, '140.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 11:06:44'),
(11, 'PAYID-LULUONQ3R453908PE869264H', 15, '100.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-06-29 11:11:45'),
(12, 'PAYID-LUM3SBA8K496263P7275870R', 16, '300.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-07-01 07:42:00'),
(13, 'PAYID-LUM3XNQ7MB43466UF898830P', 17, '100.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-07-01 07:53:02'),
(14, 'PAYID-LUM554Y7U081585SV898534E', 18, '300.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-07-01 10:23:56'),
(15, 'PAYID-LUM6BPI3F395151686452822', 19, '100.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-07-01 10:31:01'),
(16, 'PAYID-LUM7JQQ3HS463479L432420R', 20, '300.00', 'USD', 'PXHNE8UWU9JRE', 'Manojit Nandi', 'manojit.kgec.it@gmail.com', 'US', 'approved', '2019-07-01 11:57:36'),
(17, 'PAYID-LUNSITQ9EE99450SM9415020', 21, '130.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-07-02 09:32:05'),
(18, '5M993119A34900016', 0, '305.00', 'USD', NULL, NULL, NULL, NULL, NULL, '2019-07-03 07:56:51'),
(19, '7D898516C0128072D', 0, '130.00', 'USD', NULL, NULL, NULL, NULL, 'Pending', '2019-07-03 08:00:38'),
(20, '72E52195M2929893X', 22, '270.00', 'USD', NULL, NULL, NULL, NULL, 'Pending', '2019-07-03 08:16:17'),
(21, '4KB00350JF874813H', 23, '400.00', 'USD', NULL, NULL, NULL, NULL, 'Pending', '2019-07-03 08:41:07'),
(22, '1T299433EK0816044', 24, '230.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-03 08:56:48'),
(23, '28D2500553465243P', 25, '245.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-03 09:56:37'),
(24, 'PAYID-LUOH7YI23P2889025447220S', 26, '265.00', 'USD', '7E9VPNWPB4JFU', 'Manojit Nandi', 'manojit87@gmail.com', 'US', 'approved', '2019-07-03 10:14:54'),
(25, '62A43936B1920874H', 27, '300.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-06 06:15:57'),
(26, '8186921260648410H', 28, '270.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:06:20'),
(27, '8JW740298X9890352', 29, '300.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:10:33'),
(28, '47M83469JK5249941', 30, '100.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:16:04'),
(29, '8X052276KR312604S', 31, '310.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:21:26'),
(30, '94P24378JV5115936', 32, '280.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:23:02'),
(31, '7YJ62891YT6714410', 33, '230.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:24:56'),
(32, '3F045424BX825670S', 34, '310.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:30:37'),
(33, '3DW021893V395102F', 35, '385.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:33:28'),
(34, '68R942479F6654150', 36, '240.00', 'USD', NULL, NULL, NULL, NULL, 'Success', '2019-07-09 11:37:47'),
(35, '5C065951S32414412', 37, '130.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-10 05:39:59'),
(36, '9BN69266A78664054', 38, '285.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-10 06:08:03'),
(37, '0R9815205J265902V', 39, '305.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-10 06:36:06'),
(38, '76B55565EE782871B', 40, '100.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-10 07:22:07'),
(39, '6KX903649S343032U', 41, '140.00', 'USD', NULL, NULL, NULL, NULL, 'Completed', '2019-07-12 05:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblprofile`
--

CREATE TABLE `tblprofile` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `full_address` text NOT NULL,
  `hobby` varchar(50) NOT NULL,
  `food_habit` enum('V','NV','E') NOT NULL COMMENT 'V for vegeterian NV for non vegeterian E for Eggiterian',
  `smoking_habit` enum('RS','NS','OS') NOT NULL COMMENT 'RS for regular smoker NS for non smoker OS for occational smoker',
  `drinking_habit` enum('ND','RD','SD') NOT NULL COMMENT 'ND for non drinker RD for regular drinker SD for social drinker',
  `profile_img` varchar(150) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblprofile`
--

INSERT INTO `tblprofile` (`id`, `member_id`, `full_address`, `hobby`, `food_habit`, `smoking_habit`, `drinking_habit`, `profile_img`, `created`, `modified`) VALUES
(22, 10, 'Barasat', '4,3,1,2', 'NV', 'NS', 'ND', '1564976804.jpg', '2019-07-29 16:08:05', '2019-08-05 03:46:44'),
(23, 11, '194 Gorakhshabasi Road Nagerbazar\r\n sumi apt Flat-7\r\n Kolkata-700028', '4,1', 'V', 'NS', 'ND', '1564396818.jpg', '2019-07-29 16:10:19', '2019-07-29 10:40:19'),
(24, 12, 'Ballygung, Kolkata', '4,3,1,2', 'E', 'NS', 'SD', '1564976953.jpg', '2019-07-29 16:22:52', '2019-08-05 04:01:38'),
(25, 13, 'Kalyani, Nadia', '3,1', 'NV', 'RS', 'RD', '1564397679.jpg', '2019-07-29 16:24:39', '2019-07-29 10:54:39'),
(26, 14, '194 Gorakhshabasi Road Nagerbazar Sumi Apt Flat No-7,Kolkata-700028', '4,3,1,2', 'NV', 'NS', 'ND', '1564976555.jpg', '2019-07-30 15:05:58', '2019-08-05 03:42:35'),
(27, 15, 'DumDum', '3', 'V', 'RS', 'RD', '1564480138.jpg', '2019-07-30 15:18:58', '2019-07-30 09:48:58'),
(28, 16, 'b     bvvvnvbnbvvbnvbnvb', '3,1', 'NV', 'NS', 'ND', NULL, '2019-07-30 18:09:31', '2019-07-30 12:39:31'),
(29, 17, 'Kolkata', '3', 'E', 'NS', 'RD', '1564552013.jpg', '2019-07-31 11:16:53', '2019-07-31 05:46:53'),
(30, 18, 'Chinsurah, Hooghly', '4,3,1,2', 'E', 'NS', 'ND', '1564976232.jpg', '2019-07-31 13:22:07', '2019-08-05 03:37:12'),
(31, 19, 'Newtown, Rajarhat', '3,1,2', 'NV', 'RS', 'RD', '1564602130.jpg', '2019-08-01 01:12:10', '2019-07-31 19:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 for active user 0 for inactive subject',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `name`, `code`, `status`, `created`, `modified`) VALUES
(1, 'Bengali', 'BENG', '1', '2019-08-03 16:15:36', '2019-08-03 16:15:50'),
(2, 'English', 'ENG', '1', '2019-08-07 19:12:14', '2019-08-07 19:12:14'),
(3, 'Physics', 'PHY', '1', '2019-08-07 19:13:52', '2019-08-07 19:13:52'),
(4, 'Chemistry', 'CHEM', '1', '2019-08-07 19:14:51', '2019-08-07 19:14:51'),
(5, 'Mathematics', 'MATH', '1', '2019-08-07 19:16:46', '2019-08-07 19:16:46'),
(6, 'Biology', 'BIO', '1', '2019-08-07 19:17:12', '2019-08-07 19:17:12'),
(7, 'History', 'HIST', '1', '2019-08-07 19:17:35', '2019-08-07 19:17:35'),
(8, 'Geography', 'GEO', '1', '2019-08-07 19:17:53', '2019-08-07 19:17:53'),
(9, 'Computer Science', 'COMP', '1', '2019-08-07 19:19:36', '2019-08-07 19:19:36'),
(10, 'Hindi', 'HND', '1', '2019-08-07 19:20:36', '2019-08-07 19:20:36'),
(11, 'Economics', 'ECO', '1', '2019-08-07 19:21:03', '2019-08-07 21:03:25'),
(12, 'Test sub', 'TES', '0', '2019-08-07 21:06:44', '2019-08-07 21:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `tbtstudents`
--

CREATE TABLE `tbtstudents` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `roll_no` int(11) NOT NULL,
  `student_class` int(11) NOT NULL,
  `section` varchar(10) NOT NULL,
  `fav_subjects` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `u_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1 for active user 0 for inactive user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `u_status`) VALUES
(1, 'Manojit Nandi', 'manojit87@gmail.com', NULL, '$2y$10$Klwm3wZBv/.Ys3F82OSWR.hmHvR/x4hk9ml/GtoVS.1etEq1mjA86', 'IgUYkZnBShZ9MhD34Kr86KwwyytQEeQIAaosnthrJ0RIjld9FQHz4X0vmgMv', '2019-01-11 07:51:49', '2019-01-11 07:51:49', '1'),
(2, 'Manojit Nandi', 'mnbl87@gmail.com', NULL, '$2y$10$q0/SI580wBhPtKKJQopwae5Ql.dnk56FCWy0H7wDPMEAnI8IsfgOG', 'swbNrD4ydI1qa74KIdDSev2Y7s35IYMq7rKoKBqSumBhDzaSwhBjiIyLuzZx', '2019-01-11 11:07:09', '2019-01-11 11:07:09', '1'),
(3, 'Doyeta Chakrovarty', 'doyeta.piyali@gmail.com', NULL, '$2y$10$stg8ppOlT/QxrfOIaVuTWObNYSUTYjFvf1gWFEKhMF45q5YMa0HBe', 'QwQCQAQKZX8hkqYdMhsS37ru8RMChbXjVAr4rXE8m2K2iCWfMQq8QvRqAUUb', '2019-01-11 13:11:39', '2019-01-11 13:11:39', '1');

-- --------------------------------------------------------

--
-- Structure for view `orderabovetwohundred`
--
DROP TABLE IF EXISTS `orderabovetwohundred`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderabovetwohundred`  AS  select `tblpayments`.`id` AS `id`,`tblpayments`.`txn_id` AS `txn_id`,`tblpayments`.`order_id` AS `order_id`,`tblpayments`.`payment_gross` AS `payment_gross`,`tblpayments`.`currency_code` AS `currency_code`,`tblpayments`.`payer_id` AS `payer_id`,`tblpayments`.`payer_name` AS `payer_name`,`tblpayments`.`payer_email` AS `payer_email`,`tblpayments`.`payer_country` AS `payer_country`,`tblpayments`.`payment_status` AS `payment_status`,`tblpayments`.`created` AS `created` from `tblpayments` where (`tblpayments`.`payment_gross` > 200) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_managers`
--
ALTER TABLE `budget_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_units`
--
ALTER TABLE `business_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `subbusiness_units`
--
ALTER TABLE `subbusiness_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tblblog`
--
ALTER TABLE `tblblog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblhobby`
--
ALTER TABLE `tblhobby`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmembers`
--
ALTER TABLE `tblmembers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tblpayments`
--
ALTER TABLE `tblpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblprofile`
--
ALTER TABLE `tblprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbtstudents`
--
ALTER TABLE `tbtstudents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `budget_managers`
--
ALTER TABLE `budget_managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business_units`
--
ALTER TABLE `business_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subbusiness_units`
--
ALTER TABLE `subbusiness_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblblog`
--
ALTER TABLE `tblblog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `tblhobby`
--
ALTER TABLE `tblhobby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblmembers`
--
ALTER TABLE `tblmembers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblpayments`
--
ALTER TABLE `tblpayments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tblprofile`
--
ALTER TABLE `tblprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbtstudents`
--
ALTER TABLE `tbtstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
