-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 19, 2015 at 02:14 PM
-- Server version: 10.0.14-MariaDB
-- PHP Version: 5.5.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
`id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
`id` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dt` datetime NOT NULL,
  `type` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `userID`, `dt`, `type`) VALUES
(3, 1, '2015-05-26 11:54:29', 'Login'),
(4, 2, '2015-05-26 11:54:52', 'Login'),
(5, 2, '2015-05-26 12:27:05', 'Logout'),
(6, 1, '2015-05-26 12:29:14', 'Login'),
(7, 1, '2015-05-26 12:29:17', 'Logout'),
(8, 1, '2015-05-26 12:29:20', 'Login'),
(9, 1, '2015-05-26 12:35:02', 'Logout'),
(10, 2, '2015-05-26 12:35:21', 'Login'),
(11, 2, '2015-05-26 12:35:30', 'Logout'),
(12, 1, '2015-05-26 12:36:57', 'Login'),
(13, 1, '2015-05-26 12:36:59', 'Logout'),
(14, 1, '2015-05-26 12:44:06', 'Login'),
(15, 1, '2015-05-26 12:44:13', 'Logout'),
(16, 1, '2015-05-26 12:46:10', 'Login'),
(17, 1, '2015-05-26 12:46:16', 'Logout'),
(18, 1, '2015-05-28 13:09:11', 'Login'),
(19, 1, '2015-05-28 13:09:15', 'Logout'),
(20, 1, '2015-05-28 13:09:19', 'Login'),
(21, 1, '2015-05-28 13:40:22', 'Login'),
(22, 1, '2015-05-28 13:50:05', 'Logout'),
(23, 1, '2015-05-28 13:50:08', 'Login'),
(24, 1, '2015-05-28 13:50:22', 'Logout'),
(25, 2, '2015-05-28 13:50:25', 'Login'),
(26, 2, '2015-05-28 13:51:04', 'Logout'),
(27, 1, '2015-06-01 11:04:53', 'Login'),
(28, 1, '2015-06-01 11:04:58', 'Logout'),
(29, 2, '2015-06-01 11:05:02', 'Login'),
(30, 2, '2015-06-01 11:05:10', 'Logout'),
(31, 1, '2015-06-01 12:18:36', 'Login'),
(32, 1, '2015-06-01 12:18:49', 'Logout'),
(33, 1, '2015-06-01 13:22:21', 'Login'),
(34, 1, '2015-06-01 14:02:58', 'Logout'),
(35, 1, '2015-06-01 14:03:38', 'Login'),
(36, 1, '2015-06-01 14:03:43', 'Logout'),
(37, 1, '2015-06-01 14:22:53', 'Login'),
(38, 1, '2015-06-02 08:52:27', 'Login'),
(39, 1, '2015-06-02 10:38:44', 'Logout'),
(40, 1, '2015-06-02 10:39:42', 'Login'),
(41, 1, '2015-06-02 10:39:56', 'Logout'),
(42, 2, '2015-06-02 10:40:00', 'Login'),
(43, 2, '2015-06-02 10:42:53', 'Logout'),
(44, 1, '2015-06-02 10:45:36', 'Login'),
(45, 1, '2015-06-02 10:45:48', 'Logout'),
(46, 1, '2015-06-02 10:57:53', 'Login'),
(47, 1, '2015-06-02 10:58:08', 'Login'),
(48, 1, '2015-06-02 10:58:09', 'Login'),
(49, 1, '2015-06-02 10:58:11', 'Login'),
(50, 1, '2015-06-02 11:02:34', 'Logout'),
(51, 1, '2015-06-02 11:02:47', 'Login'),
(52, 1, '2015-06-02 11:02:53', 'Logout'),
(53, 1, '2015-06-02 11:03:10', 'Login'),
(54, 1, '2015-06-02 11:03:25', 'Logout'),
(55, 1, '2015-06-02 11:03:29', 'Login'),
(56, 1, '2015-06-02 12:42:23', 'Logout'),
(57, 3, '2015-06-02 12:56:34', 'Login'),
(58, 3, '2015-06-02 12:56:54', 'Logout'),
(59, 3, '2015-06-02 12:56:58', 'Login'),
(60, 3, '2015-06-02 13:07:53', 'Login'),
(61, 1, '2015-06-02 13:11:14', 'Login'),
(62, 1, '2015-06-02 13:11:33', 'Login'),
(63, 1, '2015-06-02 13:11:36', 'Login'),
(64, 1, '2015-06-02 13:11:39', 'Login'),
(65, 1, '2015-06-02 13:17:36', 'Logout'),
(66, 1, '2015-06-02 13:17:39', 'Login'),
(67, 1, '2015-06-02 13:17:41', 'Login'),
(68, 1, '2015-06-02 13:18:20', 'Logout'),
(69, 1, '2015-06-02 13:18:24', 'Login'),
(70, 1, '2015-06-02 13:18:29', 'Login'),
(71, 1, '2015-06-02 13:18:30', 'Login'),
(72, 1, '2015-06-02 13:21:30', 'Logout'),
(73, 1, '2015-06-02 13:21:32', 'Login'),
(74, 1, '2015-06-02 13:21:52', 'Logout'),
(75, 1, '2015-06-02 13:22:25', 'Login'),
(76, 1, '2015-06-02 13:23:52', 'Logout'),
(77, 3, '2015-06-02 13:25:03', 'Logout'),
(78, 3, '2015-06-02 13:25:11', 'Login'),
(79, 3, '2015-06-02 13:25:18', 'Logout'),
(80, 3, '2015-06-02 13:27:46', 'Login'),
(81, 3, '2015-06-02 13:27:53', 'Logout'),
(82, 3, '2015-06-02 13:32:51', 'Login'),
(83, 3, '2015-06-03 10:08:04', 'Login'),
(84, 3, '2015-06-03 10:21:04', 'Logout'),
(85, 3, '2015-06-03 10:21:26', 'Login'),
(86, 3, '2015-06-03 10:21:34', 'Logout'),
(87, 3, '2015-06-03 10:21:48', 'Login'),
(88, 3, '2015-06-03 11:29:22', 'Logout'),
(89, 3, '2015-06-03 11:29:38', 'Login'),
(90, 3, '2015-06-03 11:31:22', 'Logout'),
(91, 3, '2015-06-03 11:31:31', 'Login'),
(92, 3, '2015-06-03 11:32:05', 'Logout'),
(93, 3, '2015-06-08 10:46:40', 'Login'),
(94, 3, '2015-06-08 12:05:29', 'Logout'),
(95, 3, '2015-06-08 12:07:56', 'Login'),
(96, 3, '2015-06-08 12:08:01', 'Logout'),
(97, 3, '2015-06-08 12:08:04', 'Login'),
(98, 3, '2015-06-08 13:19:59', 'Logout'),
(99, 1, '2015-06-08 13:20:10', 'Login'),
(100, 1, '2015-06-08 13:24:18', 'Logout'),
(101, 1, '2015-06-08 13:24:21', 'Login'),
(102, 1, '2015-06-08 13:32:16', 'Logout'),
(103, 1, '2015-06-08 13:32:27', 'Login'),
(104, 1, '2015-06-09 13:31:04', 'Login'),
(105, 1, '2015-06-09 14:06:37', 'Logout'),
(106, 3, '2015-06-09 14:06:45', 'Login'),
(107, 3, '2015-06-09 14:09:47', 'Logout'),
(108, 3, '2015-06-10 10:25:20', 'Login'),
(109, 3, '2015-06-10 10:26:40', 'Logout'),
(110, 1, '2015-06-10 10:26:51', 'Login'),
(111, 1, '2015-06-10 10:27:36', 'Logout'),
(112, 3, '2015-06-10 10:27:45', 'Login'),
(113, 3, '2015-06-10 10:40:49', 'Logout'),
(114, 1, '2015-06-10 10:41:00', 'Login'),
(115, 1, '2015-06-10 10:41:46', 'Logout'),
(116, 3, '2015-06-10 10:41:58', 'Login'),
(117, 3, '2015-06-10 11:53:18', 'Logout'),
(118, 1, '2015-06-10 11:53:26', 'Login'),
(119, 3, '2015-06-15 10:56:06', 'Login'),
(120, 3, '2015-06-15 12:51:42', 'Logout'),
(121, 1, '2015-06-15 13:05:05', 'Login'),
(122, 1, '2015-06-15 13:05:12', 'Logout'),
(123, 3, '2015-06-15 13:05:24', 'Login'),
(124, 3, '2015-06-16 10:27:12', 'Login'),
(125, 3, '2015-06-16 10:30:36', 'Logout'),
(126, 3, '2015-06-16 10:40:29', 'Login'),
(127, 3, '2015-06-16 10:43:34', 'Logout'),
(128, 3, '2015-06-16 10:43:39', 'Login'),
(129, 3, '2015-06-16 10:44:13', 'Logout'),
(130, 3, '2015-06-16 10:44:35', 'Login'),
(131, 3, '2015-06-16 10:45:22', 'Logout'),
(132, 3, '2015-06-16 10:46:42', 'Login'),
(133, 3, '2015-06-16 10:47:10', 'Logout'),
(134, 1, '2015-06-16 10:47:20', 'Login'),
(135, 1, '2015-06-16 10:49:50', 'Logout'),
(136, 1, '2015-06-16 10:49:56', 'Login'),
(137, 1, '2015-06-16 10:50:01', 'Logout'),
(138, 3, '2015-06-16 10:50:08', 'Login'),
(139, 3, '2015-06-16 10:54:47', 'Logout'),
(140, 3, '2015-06-16 10:54:55', 'Login'),
(141, 3, '2015-06-16 11:57:56', 'Logout'),
(142, 1, '2015-06-16 11:59:26', 'Login'),
(143, 1, '2015-06-16 11:59:31', 'Logout'),
(144, 1, '2015-06-16 12:00:05', 'Login'),
(145, 1, '2015-06-16 12:00:39', 'Logout'),
(146, 1, '2015-06-16 12:03:03', 'Login'),
(147, 1, '2015-06-16 12:03:12', 'Logout'),
(148, 1, '2015-06-16 12:04:09', 'Login'),
(149, 1, '2015-06-16 12:08:41', 'Logout'),
(150, 3, '2015-06-16 12:08:47', 'Login'),
(151, 3, '2015-06-16 12:18:44', 'Logout'),
(152, 3, '2015-06-16 12:18:58', 'Login'),
(153, 3, '2015-06-16 12:19:05', 'Logout'),
(154, 3, '2015-06-16 12:19:12', 'Login'),
(155, 3, '2015-06-16 12:20:08', 'Logout'),
(156, 1, '2015-06-16 12:20:15', 'Login'),
(157, 1, '2015-06-16 12:22:06', 'Logout'),
(158, 1, '2015-06-16 12:22:14', 'Login'),
(159, 1, '2015-06-16 12:22:22', 'Logout'),
(160, 1, '2015-06-16 12:22:24', 'Login'),
(161, 1, '2015-06-16 12:22:49', 'Logout'),
(162, 1, '2015-06-16 12:22:50', 'Login'),
(163, 1, '2015-06-16 12:23:02', 'Logout'),
(164, 1, '2015-06-16 12:23:14', 'Login'),
(165, 1, '2015-06-16 12:23:21', 'Logout'),
(166, 1, '2015-06-16 12:23:26', 'Login'),
(167, 1, '2015-06-16 12:41:42', 'Logout'),
(168, 1, '2015-06-16 12:41:45', 'Login'),
(169, 1, '2015-06-19 10:49:47', 'Login'),
(170, 1, '2015-06-19 10:52:57', 'Logout'),
(171, 1, '2015-06-19 11:05:52', 'Login'),
(172, 1, '2015-06-19 11:37:59', 'Logout'),
(173, 1, '2015-06-19 11:39:49', 'Login'),
(174, 1, '2015-06-19 11:40:16', 'Logout'),
(175, 1, '2015-06-19 11:42:28', 'Login');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
`id` int(11) NOT NULL,
  `permission` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `permission`, `type`, `status`) VALUES
(1, 'editProfile', '', 'deactive'),
(2, 'addPerm', '', 'deactive'),
(3, 'addRole', '', 'active'),
(4, 'getUserPermissions', 'admin', 'active'),
(5, 'loginUser', '', 'active'),
(6, 'logoutUser', '', 'active'),
(7, 'editProfile', '', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `topicID` int(11) NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` int(11) NOT NULL,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `status`) VALUES
(1, 'Admin', 'active'),
(2, 'Mod', 'deactive'),
(3, 'VIP', 'active'),
(4, 'User', 'active'),
(17, 'Asd', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `rolePermission`
--

CREATE TABLE IF NOT EXISTS `rolePermission` (
`id` int(11) NOT NULL,
  `dateAssigned` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rolePermission`
--

INSERT INTO `rolePermission` (`id`, `dateAssigned`, `roleId`, `permissionId`) VALUES
(1, '2015-06-04 00:00:00', 1, 1),
(2, '0000-00-00 00:00:00', 1, 2),
(3, '0000-00-00 00:00:00', 1, 3),
(4, '0000-00-00 00:00:00', 2, 2),
(5, '0000-00-00 00:00:00', 1, 4),
(6, '0000-00-00 00:00:00', 4, 5),
(7, '0000-00-00 00:00:00', 4, 6),
(8, '0000-00-00 00:00:00', 4, 7),
(9, '0000-00-00 00:00:00', 1, 5),
(10, '0000-00-00 00:00:00', 1, 6),
(11, '0000-00-00 00:00:00', 1, 7),
(12, '0000-00-00 00:00:00', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
`id` int(11) NOT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `userCount` int(11) DEFAULT NULL,
  `userMax` int(11) DEFAULT NULL,
  `creatorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
`id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `value` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `validTo` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `userID`, `value`, `created`, `validTo`) VALUES
(79, 1, 'f21ff807bd95fbb33f6cf085a3fe03baeea282c3', '2015-05-26 11:07:59', '2015-05-26 23:07:59'),
(80, 1, 'e745074ed99d79251c643c3d07ebfd934158714a', '2015-05-26 11:11:30', '2015-05-26 23:11:30'),
(81, 1, '050b995c2e3b5892ae145cf7dc909bc8271f45b8', '2015-05-26 11:11:48', '2015-05-26 23:11:48'),
(82, 1, 'eb276e4c233664f974311d8230f105bd90cce59b', '2015-05-26 11:12:34', '2015-05-26 11:12:38'),
(83, 1, 'bf313caa76bb28cd59bef7c1d5560202d72bd504', '2015-05-26 11:12:53', '2015-05-26 11:12:54'),
(84, 1, 'cd54b7249b9bc46311bdc030db99decd6457bc87', '2015-05-26 11:12:58', '2015-05-26 11:13:07'),
(85, 2, '58de3fd66750b5190266c51c7c7cfd836c16e3d0', '2015-05-26 11:13:59', '2015-05-26 11:14:14'),
(86, 1, '76ca6fe38e9ea3b48c2074973ac46d139991cd88', '2015-05-26 11:54:28', '2015-05-26 11:54:49'),
(87, 2, 'a53b375e8f0b5e7be47352acc7e6877779438b57', '2015-05-26 11:54:52', '2015-05-26 12:27:05'),
(88, 1, '7c2a43dc1a018ea30c8c16a8d87173faba745449', '2015-05-26 12:29:14', '2015-05-26 12:29:17'),
(89, 1, '019150af7aa45ab3c816475dd53202295eac0e89', '2015-05-26 12:29:20', '2015-05-26 12:35:02'),
(90, 2, 'affcabe1d3c87de2d6a03009452bb4533844d5f4', '2015-05-26 12:35:21', '2015-05-26 12:35:30'),
(91, 1, '37d4de6a4756d8b1bb4153e147d4339769c13aff', '2015-05-26 12:36:56', '2015-05-26 12:36:59'),
(92, 1, 'bcf802f6c688906aa72d36102dacfde2c72f6f64', '2015-05-26 12:44:06', '2015-05-26 12:44:13'),
(93, 1, '1b8c66a442011d366f5054ba040aac23ae25119f', '2015-05-26 12:46:09', '2015-05-26 12:46:16'),
(94, 1, 'fe21aab122491cc72ca390cee119c7404360c917', '2015-05-28 13:09:11', '2015-05-28 13:09:15'),
(95, 1, '9c8b7f13e70c10e0694346276fbed662cfbcd1f5', '2015-05-28 13:09:19', '2015-05-28 13:50:05'),
(96, 1, 'ad8ef6b061281d1e9d5444115d903221c1ed4142', '2015-05-28 13:40:22', '2015-05-29 01:40:22'),
(97, 1, '6c244f12e1930931be3920785c078dc18b234875', '2015-05-28 13:50:08', '2015-05-28 13:50:22'),
(98, 2, '59c3e0a52c64ba377b71b0cf4fbe0b949f8a4ef3', '2015-05-28 13:50:25', '2015-05-28 13:51:04'),
(99, 1, 'e9348f59d04d856fc1dd790356a27c1b962c0aad', '2015-06-01 11:04:53', '2015-06-01 11:04:58'),
(100, 2, '25805c262af5672d953f111755b1e36436a09ebe', '2015-06-01 11:05:02', '2015-06-01 11:05:10'),
(101, 1, 'a8ff2fc573d7f3076ba27e0d169cb3ea31177d2f', '2015-06-01 12:18:36', '2015-06-01 12:18:49'),
(102, 1, '45c3d080df3b059e115cd890a0ce9fa73ec785cd', '2015-06-01 13:22:21', '2015-06-01 14:02:58'),
(103, 1, '41508c769a669a74cce57d93656c37cb3d157985', '2015-06-01 14:03:38', '2015-06-01 14:03:43'),
(104, 1, 'fb45440bc3cc9f9a3ec435e9aaf0abe24aee0635', '2015-06-01 14:22:53', '2015-06-02 02:22:53'),
(105, 1, '0715bf8b741728f5a3f41523236a944abbda990a', '2015-06-02 08:52:27', '2015-06-02 10:38:44'),
(106, 1, 'ea4fb0e93930db75ffceef4e264fa0a7ae0f6880', '2015-06-02 10:39:42', '2015-06-02 10:39:56'),
(107, 2, '0d1368c2e24295e9989ee024a46a62a382efec41', '2015-06-02 10:40:00', '2015-06-02 10:42:53'),
(108, 1, 'b804227a401effd68a3ff05c4fcb49c4e3cf82f2', '2015-06-02 10:45:35', '2015-06-02 10:45:48'),
(109, 1, '7e01b28447b3e33d098009c54dffc4b60c26e66d', '2015-06-02 10:57:53', '2015-06-02 22:57:53'),
(110, 1, 'c2d2d8eeb645b93be6e3f25f733410e287df74d4', '2015-06-02 10:58:08', '2015-06-02 22:58:08'),
(111, 1, 'c2b51248457e133f5023045dd2e9149561a7e63b', '2015-06-02 10:58:09', '2015-06-02 22:58:09'),
(112, 1, 'ff3ccc564e46883e8c544a2353789bfb8c906cdb', '2015-06-02 10:58:11', '2015-06-02 11:02:34'),
(113, 1, '744ea720492fb51ed1a6ed28c82c492e072fd6e2', '2015-06-02 11:02:47', '2015-06-02 11:02:53'),
(114, 1, '5ada2fd0697c0ab76bc723a73f9e385880c34388', '2015-06-02 11:03:10', '2015-06-02 11:03:25'),
(115, 1, '278f8dab1d427504ad5bdb1a538cf4339de2bafb', '2015-06-02 11:03:29', '2015-06-02 12:42:23'),
(116, 3, 'c880ec48c823bbbc40ed32575e926faccf72364b', '2015-06-02 12:56:34', '2015-06-02 12:56:54'),
(117, 3, '44712d80d2ad30a39b8256b09737beba47da8f07', '2015-06-02 12:56:58', '2015-06-03 00:56:58'),
(118, 3, '3fdf82d3ec1de99c31e4d440ec8c1fd13ff15ea3', '2015-06-02 13:07:53', '2015-06-02 13:25:03'),
(119, 1, '77ea7f5270ffd2761688f3641259cd175c60e3b2', '2015-06-02 13:11:14', '2015-06-03 01:11:14'),
(120, 1, 'b3e00a4853e069f602dcc47fb8c777757e2c8630', '2015-06-02 13:11:33', '2015-06-03 01:11:33'),
(121, 1, '74e0abd2a072d52023342e87401fd2e6e4d323be', '2015-06-02 13:11:36', '2015-06-03 01:11:36'),
(122, 1, '3d8049fc06db6745cbd72e655abb5dd390860a8e', '2015-06-02 13:11:39', '2015-06-02 13:17:36'),
(123, 1, '41dfe8d239e22a14f14fce9e02228a1acebe7080', '2015-06-02 13:17:38', '2015-06-03 01:17:38'),
(124, 1, 'ba09f8a686b5a8b9e4c7f48129b1f7b8f14db53b', '2015-06-02 13:17:41', '2015-06-02 13:18:20'),
(125, 1, '88019a57f677ff1b5d7d6afe2738c019e84b7129', '2015-06-02 13:18:24', '2015-06-03 01:18:24'),
(126, 1, '316772d1cdc2a9eaa6293dfc152836029a50b849', '2015-06-02 13:18:29', '2015-06-03 01:18:29'),
(127, 1, 'ed81daf3f801ff7f2c92ca0df521b38cd9a25711', '2015-06-02 13:18:30', '2015-06-02 13:21:30'),
(128, 1, '65d24d514319ac15a03aff28e2200b03868ad862', '2015-06-02 13:21:32', '2015-06-02 13:21:52'),
(129, 1, '87e07c6eecc09079a53ea3dad630df6958d9d360', '2015-06-02 13:22:25', '2015-06-02 13:23:52'),
(130, 3, 'd8be7f566e59218401ce867d0cc145b7e7a78ab0', '2015-06-02 13:25:11', '2015-06-02 13:25:19'),
(131, 3, 'b1ef08760768f6f8110c50b85edf5b23347bb97b', '2015-06-02 13:27:46', '2015-06-02 13:27:53'),
(132, 3, '397417cc70f1a995e8786d144f6fa53ae2d3331e', '2015-06-02 13:32:51', '2015-06-03 01:32:51'),
(133, 3, '7a81b86f5499e2cdcac7a8958de5b2c5b8963912', '2015-06-03 10:08:04', '2015-06-03 10:21:04'),
(134, 3, '5aae00c3526f99481beaba2534a371aaba7d5927', '2015-06-03 10:21:26', '2015-06-03 10:21:34'),
(135, 3, '2b020a7b0deabb3108640c429cce68eff0929044', '2015-06-03 10:21:48', '2015-06-03 11:29:22'),
(136, 3, 'a43c184bdf746594931d38d0759017e07a2ec220', '2015-06-03 11:29:38', '2015-06-03 11:31:22'),
(137, 3, '8989caf96d4afdd132630a3ba0ce3c4557f1a38b', '2015-06-03 11:31:31', '2015-06-03 11:32:05'),
(138, 3, '91018ea66d431052c152d221e274f8cc43367b67', '2015-06-08 10:46:40', '2015-06-08 12:05:29'),
(139, 3, 'f5ec0ae352462a12544c7d6d83cf19d40456b573', '2015-06-08 12:07:56', '2015-06-08 12:08:01'),
(140, 3, '71fa9d4377df99d292f53592d09d0683663bd6f1', '2015-06-08 12:08:04', '2015-06-08 13:19:59'),
(141, 1, '6c8750e33551438ec78962d3b8776a938d93379e', '2015-06-08 13:20:09', '2015-06-08 13:24:19'),
(142, 1, '361afc0d07415fe4ffc756fd9c080d849cf93888', '2015-06-08 13:24:21', '2015-06-08 13:32:16'),
(143, 1, '10c24eeed337a407f4e2197dc56aa6cb538c18c8', '2015-06-08 13:32:27', '2015-06-09 01:32:27'),
(144, 1, '2f09fbcc57c3ac413c8359dbb681787edc05be3e', '2015-06-09 13:31:04', '2015-06-09 14:06:37'),
(145, 3, '459647a8ff7f9186b4e46f28e32ec1c5e4a19063', '2015-06-09 14:06:45', '2015-06-09 14:09:47'),
(146, 3, '834525e312f31564f393c70e490c2343ae784388', '2015-06-10 10:25:20', '2015-06-10 10:26:40'),
(147, 1, '9f1652136d906c566c1b5562e3793e0a9cd3d23d', '2015-06-10 10:26:51', '2015-06-10 10:27:36'),
(148, 3, 'af0f70e552d2381a3ca25cbfa4fbec79e6010b90', '2015-06-10 10:27:45', '2015-06-10 10:40:49'),
(149, 1, '786b4cda0eeaafa3cd169b7b6419fedb6d5ad942', '2015-06-10 10:41:00', '2015-06-10 10:41:46'),
(150, 3, '6d38a3235d64eb9666e612762da000de9f0d7314', '2015-06-10 10:41:58', '2015-06-10 11:53:18'),
(151, 1, '1b77b6c32a31f814420fa4a92e0455b5f6b0937c', '2015-06-10 11:53:25', '2015-06-10 23:53:25'),
(152, 3, '3f12b6f54a772deac00619f6ab6dfa3cb40bd76c', '2015-06-15 10:56:05', '2015-06-15 12:51:42'),
(153, 1, '53d16619f9b3a2670b4d3590cb8c724011d07dc4', '2015-06-15 13:05:05', '2015-06-15 13:05:12'),
(154, 3, '41976c6c851afb2a6d34a2580a83b8a76ca88b43', '2015-06-15 13:05:24', '2015-06-16 01:05:24'),
(155, 3, '1a29cc0b64831d5e0e318f3af52d6e71f5592fb8', '2015-06-16 10:27:12', '2015-06-16 10:30:36'),
(156, 3, '33c258668dc0a6f4f0b4e502ada43fecc47d6a81', '2015-06-16 10:40:29', '2015-06-16 10:43:34'),
(157, 3, 'b061b77050e0d9624cec3deede3bbbcaa1f28ccd', '2015-06-16 10:43:39', '2015-06-16 10:44:13'),
(158, 3, '3eef0495c67892ffd5fb2977705a74e9195b84fb', '2015-06-16 10:44:35', '2015-06-16 10:45:22'),
(159, 3, '0c93fff4f8ec7f3684c71739aa0be851475619c2', '2015-06-16 10:46:42', '2015-06-16 10:47:10'),
(160, 1, 'bedea80a4e70664d665e5fee880c8d98da9e2dbf', '2015-06-16 10:47:20', '2015-06-16 10:49:50'),
(161, 1, '2132c1c4f713ed36af0907f2f267a7453fa56c7a', '2015-06-16 10:49:56', '2015-06-16 10:50:01'),
(162, 3, '388a82542a5ad245eed1812b92cb15118f97aa39', '2015-06-16 10:50:08', '2015-06-16 10:54:47'),
(163, 3, '5bcbd73371d4194b4460009bfa1092c24502d43e', '2015-06-16 10:54:55', '2015-06-16 11:57:56'),
(164, 1, '4b393e587afb9cc2d4f6706fb1e04e7e80d644bb', '2015-06-16 11:59:26', '2015-06-16 11:59:31'),
(165, 1, '0cfdde6d9e25a1a7fb963352d70564287e70a2e6', '2015-06-16 12:00:05', '2015-06-16 12:00:40'),
(166, 1, 'dc72ce81a17145d25d474633e180e7b502a5f40e', '2015-06-16 12:03:02', '2015-06-16 12:03:12'),
(167, 1, '1b510edb33d2208a5851243b7bb9619fe195e5e4', '2015-06-16 12:04:09', '2015-06-16 12:08:41'),
(168, 3, '3c5ff6c1b096a6a528d43f972576ce3a0cb413dd', '2015-06-16 12:08:47', '2015-06-16 12:18:44'),
(169, 3, '22a2f07069adc2ab72b88043a28e2b22012d6425', '2015-06-16 12:18:57', '2015-06-16 12:19:05'),
(170, 3, 'd5f52a35b99f288cc34661be5f374d69d7ebb0e4', '2015-06-16 12:19:12', '2015-06-16 12:20:08'),
(171, 1, '4cfc5d3ad574ccaa0f061382209024b1ce6d1b99', '2015-06-16 12:20:15', '2015-06-16 12:22:06'),
(172, 1, '9544cfbc2abb04eedd46823f1901a7606cadb2ba', '2015-06-16 12:22:14', '2015-06-16 12:22:22'),
(173, 1, '2750b10456eb9d7def1372c09fc3bda07e444235', '2015-06-16 12:22:24', '2015-06-16 12:22:49'),
(174, 1, '9820fd79a7500e521d96af4ee29900147dafa561', '2015-06-16 12:22:50', '2015-06-16 12:23:02'),
(175, 1, 'c5075fa33fc38150f228c989c1d1858dc9befe93', '2015-06-16 12:23:14', '2015-06-16 12:23:21'),
(176, 1, '7bb3a5e0916ff88789a494d0ad1f5018702a3c0c', '2015-06-16 12:23:26', '2015-06-16 12:41:42'),
(177, 1, '2ffd4a905839494f2c0e2c28eb242bea9ceda106', '2015-06-16 12:41:45', '2015-06-17 00:41:45'),
(178, 1, '123f354d12d6510c0f6bd7a29468f74859175cbb', '2015-06-19 10:49:47', '2015-06-19 10:52:57'),
(179, 1, '6faeb407b2833d8fecf82e28d2bca7a29aca23ec', '2015-06-19 11:05:52', '2015-06-19 11:37:59'),
(180, 1, 'fc3b1cf95c7cac54e8b4687635fbb03cf700cb12', '2015-06-19 11:39:49', '2015-06-19 11:40:16'),
(181, 1, 'a6a3e203a3de09c7fde8076d5508cb6965739ea7', '2015-06-19 11:42:28', '2015-06-19 23:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
`id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `forumID` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `surname`, `email`) VALUES
(1, 'hugomo', 'cc03e747a6afbbcbf8be7668acfebee5', 'Drazen', 'neko prezime', 'drazen.a@gmail.com'),
(2, 'kristina', '098f6bcd4621d373cade4e832627b4f6', 'kristina', 'jozic', 'jozic.tina@gmail.com'),
(3, 'nikola', '098f6bcd4621d373cade4e832627b4f6', 'Nikola', 'Krtalic', 'krtalic.nikola@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `userRole`
--

CREATE TABLE IF NOT EXISTS `userRole` (
`id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `dateAssigned` date NOT NULL,
  `roomId` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userRole`
--

INSERT INTO `userRole` (`id`, `userId`, `roleId`, `dateAssigned`, `roomId`) VALUES
(1, 3, 1, '2015-06-10', NULL),
(2, 3, 2, '0000-00-00', NULL),
(3, 1, 4, '0000-00-00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`), ADD KEY `userID` (`userID`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `rolePermission`
--
ALTER TABLE `rolePermission`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
 ADD PRIMARY KEY (`id`,`name`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `value` (`value`), ADD KEY `userID` (`userID`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `userRole`
--
ALTER TABLE `userRole`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `rolePermission`
--
ALTER TABLE `rolePermission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=182;
--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `userRole`
--
ALTER TABLE `userRole`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
