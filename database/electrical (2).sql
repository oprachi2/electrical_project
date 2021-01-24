-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 24, 2021 at 11:35 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrical`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `managed_by_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `managed_by_id`, `name`, `description`, `created`, `updated`) VALUES
(25, 10, 'Geysers', '<div>The <strong>geyser</strong> consists of a water tank fitted with two pipes – one for inlet of cold water and the other for outlet of hot water.</div>', '2021-01-21 09:09:20', '2021-01-21 09:09:20'),
(26, 11, 'Mixers', '<div><strong>Mixers</strong> help automate the repetitive tasks of stirring, whisking or beating.</div>', '2021-01-21 09:23:55', '2021-01-21 09:23:55'),
(27, 11, 'FANS', '<div>&nbsp;A device for creating a current of air by movement of a surface or surfaces.&nbsp;</div>', '2021-01-21 09:25:35', '2021-01-21 09:25:35'),
(28, 11, 'Lamps', '<div><strong>Lamps</strong> usually have a base made of ceramic, metal, glass, or plastic, which secures the <strong>lamp</strong> in the socket of a light fixture.</div>', '2021-01-21 09:26:51', '2021-01-21 09:26:51'),
(29, 11, 'Ice cream makers', '<div>An <strong>ice cream maker</strong> has to simultaneously freeze the mixture while churning it so as to aerate the mixture and keep the <strong>ice</strong> crystals</div>', '2021-01-21 09:29:10', '2021-01-21 09:29:10'),
(30, 11, 'Grinders', '<div>An angle <strong>grinder</strong>, also known as a side <strong>grinder</strong> or disc <strong>grinder</strong>, is a handheld power tool used for <strong>grinding</strong></div>', '2021-01-21 09:30:36', '2021-01-21 09:30:36'),
(31, 11, 'Electrical kettle', '<div>used basically of warming up te liquid substances.</div>', '2021-01-21 13:35:36', '2021-01-21 13:35:36'),
(32, 11, 'Iron', '<div>used for ironing clothes</div>', '2021-01-21 14:23:02', '2021-01-21 14:23:02'),
(33, 1, 'heaters', '<div>Heating rods&nbsp;</div>', '2021-01-22 13:47:48', '2021-01-22 13:47:48'),
(34, 16, 'electrical cookers', '<div>cookers&nbsp;</div>', '2021-01-24 10:29:21', '2021-01-24 10:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210119181402', '2021-01-19 19:14:23', 262),
('DoctrineMigrations\\Version20210119184343', '2021-01-19 19:44:00', 5553),
('DoctrineMigrations\\Version20210119185737', '2021-01-19 19:57:43', 359),
('DoctrineMigrations\\Version20210119192200', '2021-01-19 20:22:20', 856),
('DoctrineMigrations\\Version20210119194358', '2021-01-19 20:44:06', 267),
('DoctrineMigrations\\Version20210120052021', '2021-01-20 06:20:33', 714),
('DoctrineMigrations\\Version20210124081628', '2021-01-24 09:16:58', 4304),
('DoctrineMigrations\\Version20210124084805', '2021-01-24 09:48:21', 665),
('DoctrineMigrations\\Version20210124085814', '2021-01-24 09:58:28', 312);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `managed_by_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `power_supply` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ratings` enum('2 star','3 star','4 star','5 star') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt_in_stock` int(11) NOT NULL,
  `market_price` int(11) NOT NULL,
  `warranty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voltage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `availability` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `extra_features` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','review','publish') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `managed_by_id`, `name`, `brand`, `color`, `power_supply`, `ratings`, `image`, `description`, `model_number`, `qt_in_stock`, `market_price`, `warranty`, `unit_weight`, `voltage`, `availability`, `created_at`, `updated_at`, `extra_features`, `status`) VALUES
(42, 25, 10, 'Hindware 3 L Instant Water Geyser', 'Hindware', 'white', '3000 W', '4 star', 'hindware.jpeg', 'Featuring a robust construction, this geyser comes with features such as an All-purpose RPR Valve, I-Thermostat, Copper-sheathed Heating Element, and LED Indicators to provide you with a hot and sizzling bath at any time of the day.', 'HI03PDB30', 10, 5999, '2 years', '3.2 kg', '240V', 'yes', '2021-01-22 09:51:25', '2021-01-22 09:57:09', '3 L : Greater the Capacity,more the users can be served for bath/wash', 'publish'),
(43, 25, 10, 'Bajaj 3 L Instant Water Geyser', 'Bajaj', 'black', '2000 W', '3 star', 'bajaj1.jpg', 'Instant : Useful for Kitchen, quick water heating 3 L : Greater the Capacity,more the users can be served for bath/wash', 'H938w2', 20, 2699, '2 years', '2.2 kg', '3000 v', 'yes', '2021-01-22 09:51:26', '2021-01-22 09:51:26', 'Bajaj 3 L Instant Water Geyser Ivora White', 'new'),
(44, 25, 10, 'Havells 10 L Storage Water Geyser', 'Havells', 'white and blue', '2000W', '4 star', 'havellswatergeyser.jpg', 'This stylish geyser comes with color-changing LED lights that indicate when the water has reached the optimum temperature', 'C8993Y9', 11, 9900, '2 years', '2.2 kg', '3000 v', 'yes', '2021-01-22 09:51:26', '2021-01-22 09:51:26', '10 L : Greater the Capacity,more the users can be served for bath/wash', 'new'),
(45, 26, 11, 'Butterfly Arrow 500 W Mixer Grinder', 'Butterfly', 'blue', '2000W', '4 star', 'butterfy.jpg', 'It has a powerful 500 W motor and its Three-speed Control setting makes blending and grinding extremely easy.', 'CC887Y6', 20, 8200, '3 years', '3.2 kg', '3000 v', 'yes', '2021-01-22 09:51:26', '2021-01-24 10:30:33', '10 L : Greater the Capacity,more the users can be served for bath/wash', 'publish'),
(46, 26, 11, 'Havells MaxxGrind 750 W Mixer Grinder  ', 'Havells', ' white', '2000W', '4 star', 'havellsgrinder.jpg', ' It comes with three jars using which you can prepare a plethora of delicious food items.', 'HY997Y', 10, 2799, '3 years', '3.2 kg', '3000 v', 'yes', '2021-01-22 09:51:26', '2021-01-22 09:51:26', 'Suitable for: Wet Grinding, Liquidizing', 'new'),
(47, 27, 11, 'Bajaj Crest Neo 1200 mm Ultra High Speed 3 Blade Ceiling Fan', 'Bajaj', 'copper brown', '2000W', '4 star', 'bajajfan.jpg', 'This fan has an air delivery rate of 205 CMM. To ensure that this fan lasts a long time, Bajaj has made its blades of high-grade aluminium.', 'P998YC', 10, 3980, '3 years', '3.2 kg', '230 V', 'yes', '2021-01-22 09:51:26', '2021-01-22 09:51:26', 'The Bajaj Crest Neo 1200 mm features high-grade aluminium blades that are long-lasting.', 'new'),
(48, 28, 11, 'Prodigious Deal Table Lamp', 'prodigious', 'red', '70 watts', '4 star', 'light.jpg', 'LED bulb which is quite okay ', 'HY009CVV', 10, 659, '1 years', '1.2 kg', '220 V', 'yes', '2021-01-22 09:51:26', '2021-01-22 09:51:26', 'Battery opratable and hae multi dimensions', 'new'),
(49, 28, 11, 'esscage Table Lamp Table Lamp Table Lamp', 'esscage', 'white', '25 watts', '3 star', 'ess.jpg', 'LED bulb which is quite okay', 'Cy9987Y', 11, 987, '1 years', '2.2 kg', '220 V', 'yes', '2021-01-22 09:51:27', '2021-01-24 11:21:09', 'Battery opratable and hae multi dimensions', 'publish'),
(50, 26, 11, 'Havells Rigo 2 jar Rigo 500 Juicer Mixer Grinder', 'Havells', 'silkwhite', '200 watts', '4 star', 'red.jpg', 'This mixer grinder features a 500 W copper-winded motor that increases the durability of the motor and delivers optimal performance.', '9Y6577Wy', 12, 9870, '2 years', '3.2 kg', '220 V', 'yes', '2021-01-22 09:51:27', '2021-01-24 11:19:53', 'stainless steel juicer mesh for enhanced life and better juicing efficiency,Online large Pulp container, 1L dry/wet grinding jar, 1.5L blending jar', 'publish'),
(51, 26, 11, 'Orient Electric Kitchen Kraft MGKK75B3 750 W Mixer Grinder', 'Orient', ' silkwhite', '750 watts', '4 star', 'oreo.jpg', ' With all its unique features put together this might sound like quite a deal. It comes with 3 jars for different functions', '9Y5679', 20, 2250, '2 years', '1.2 kg', '220 V', 'yes', '2021-01-22 09:51:27', '2021-01-22 09:51:27', ' Higher the Wattage, tougher the Juicing/Grinding', 'new'),
(52, 27, 11, 'Bajaj Archean 1200 mm 3 Blade Ceiling Fan', 'Bajaj', 'reddish brown', '73 W', '3 star', 'brown.jpg', 'With all its unique features put together this might sound like quite a deal. It comes with 3 fanpase for different functions', 'HY339YC', 12, 1500, '1 years', '1.4 kg', '220 V', 'yes', '2021-01-22 09:51:27', '2021-01-24 10:30:08', 'remote operated', 'publish'),
(53, 31, 11, 'Prestige PKOSS1500WATT Electric Kettle ', 'Prestige', 'silver grey', '3000 W', '4 star', 'electricalkettle.jpeg', 'Electric kettle with concealed element and detachable power base Elegant handle with single-touch lid locking for convenient use Power', 'PKOSS15', 7, 599, '2 years', '0.5', '220V', 'yes', '2021-01-22 09:51:27', '2021-01-22 09:51:27', 'kettel is gud', 'new'),
(54, 32, 11, 'Orient Electric Fabri Press DIFP10BP 1000 W Dry Iron ', 'Orient', 'Black', '1000 W', '4 star', 'bbc.jpeg', ' a 360-degree swivel cord, and a temperature-control knob, this iron is equipped to handle it all.', 'DIFP10BP', 7, 475, '2 years', '0.5', '220V', 'yes', '2021-01-22 09:51:47', '2021-01-22 09:51:47', 'Material is good', 'new'),
(55, 32, 11, 'Philips HI113 1000 W Dry Iron', 'Philips', 'white', '1000 W', '4 star', 'bye.jpeg', 'Iron your clothes to the perfection with this dry iron from Philips.', 'HI113', 7, 650, '2 years', '0.9 kg', '220V', 'yes', '2021-01-22 09:51:47', '2021-01-24 11:22:13', 'iron have a high temperature', 'publish'),
(56, 27, 11, 'Luminous Beast 1200 mm 3 Blade Ceiling Fan', 'Luminious', 'white', '1000 W', '4 star', 'orient.jpeg', 'With its high-air delivery and high-speed performance', 'HI113', 7, 2200, '1 years', '6 kg', '220V', 'yes', '2021-01-22 09:51:48', '2021-01-22 09:51:48', 'With 380 rotations per minute, the motor of this fan ensures optimum cooling performance', 'new'),
(57, 27, 11, 'Havells Festiva 1200 mm 3 Blade Ceiling Fan', 'Havells', 'blue', '1000 W', '5 star', 'blue.jpeg', 'With its high-air delivery and high-speed performance', 'HI113', 7, 2200, '2 years', '4 kg', '220V', 'yes', '2021-01-22 09:51:48', '2021-01-24 11:21:35', 'metallic paint finish high performance even at low voltage motor with decorative ring decorative trims', 'publish'),
(58, 30, 11, 'Butterfly MIXER GRINDER WAVE PLUS ', 'Butterfly', 'torqoise', '1000 W', '5 star', 'bf.jpeg', 'With its high-air delivery and high-speed performance', 'C12YBC3', 7, 4400, '2 years', '4 kg', '220V', 'yes', '2021-01-22 09:51:48', '2021-01-22 09:51:48', 'The razor-sharp blades have an RPM of 17000 20000 which precisely cuts, chops and mixes ingredients of any shapes or sizes.', 'new'),
(59, 32, 11, 'Orient Electric Fabri Press DIFP10BP 1000 W Dry Iron ', 'Orient', 'Black', '1000 W', '4 star', 'bbc.jpeg', ' a 360-degree swivel cord, and a temperature-control knob, this iron is equipped to handle it all.', 'DIFP10BP', 7, 475, '2 years', '0.5', '220V', 'yes', '2021-01-23 08:21:01', '2021-01-23 08:21:01', 'Material is good', 'new'),
(60, 32, 11, 'Philips HI113 1000 W Dry Iron', 'Philips', 'white', '1000 W', '4 star', 'bye.jpeg', 'Iron your clothes to the perfection with this dry iron from Philips.', 'HI113', 7, 650, '2 years', '0.9 kg', '220V', 'yes', '2021-01-23 08:21:02', '2021-01-23 08:21:02', ' iron have a high temperature', 'new'),
(61, 27, 11, 'Luminous Beast 1200 mm 3 Blade Ceiling Fan', 'Luminious', 'white', '1000 W', '4 star', 'orient.jpeg', 'With its high-air delivery and high-speed performance', 'HI113', 7, 2200, '1 years', '6 kg', '220V', 'yes', '2021-01-23 08:21:02', '2021-01-23 08:21:02', 'With 380 rotations per minute, the motor of this fan ensures optimum cooling performance', 'new'),
(62, 27, 11, 'Havells Festiva 1200 mm 3 Blade Ceiling Fan', 'Havells', 'blue', '1000 W', '5 star', 'blue.jpeg', 'With its high-air delivery and high-speed performance', 'HI113', 7, 2200, '2 years', '4 kg', '220V', 'yes', '2021-01-23 08:21:03', '2021-01-23 08:21:03', 'metallic paint finish high performance even at low voltage motor with decorative ring decorative trims', 'new'),
(63, 30, 11, 'Butterfly MIXER GRINDER WAVE PLUS ', 'Butterfly', 'torqoise', '1000 W', '5 star', 'bf.jpeg', 'With its high-air delivery and high-speed performance', 'C12YBC3', 7, 4400, '2 years', '4 kg', '220V', 'yes', '2021-01-23 08:21:03', '2021-01-23 08:21:03', 'The razor-sharp blades have an RPM of 17000 20000 which precisely cuts, chops and mixes ingredients of any shapes or sizes.', 'new'),
(64, 32, 11, 'Orient Electric Fabri Press DIFP10BP 1000 W Dry Iron ', 'Orient', 'Black', '1000 W', '4 star', 'bbc.jpeg', ' a 360-degree swivel cord, and a temperature-control knob, this iron is equipped to handle it all.', 'DIFP10BP', 7, 475, '2 years', '0.5', '220V', 'yes', '2021-01-23 13:32:07', '2021-01-23 13:32:07', 'Material is good', 'new'),
(65, 32, 11, 'Philips HI113 1000 W Dry Iron', 'Philips', 'white', '1000 W', '4 star', 'bye.jpeg', 'Iron your clothes to the perfection with this dry iron from Philips.', 'HI113', 7, 650, '2 years', '0.9 kg', '220V', 'yes', '2021-01-23 13:32:07', '2021-01-23 13:32:07', ' iron have a high temperature', 'new'),
(66, 27, 11, 'Luminous Beast 1200 mm 3 Blade Ceiling Fan', 'Luminious', 'white', '1000 W', '4 star', 'orient.jpeg', 'With its high-air delivery and high-speed performance', 'HI113', 7, 2200, '1 years', '6 kg', '220V', 'yes', '2021-01-23 13:32:07', '2021-01-23 13:32:07', 'With 380 rotations per minute, the motor of this fan ensures optimum cooling performance', 'new'),
(67, 27, 11, 'Havells Festiva 1200 mm 3 Blade Ceiling Fan', 'Havells', 'blue', '1000 W', '5 star', 'blue.jpeg', 'With its high-air delivery and high-speed performance', 'HI113', 7, 2200, '2 years', '4 kg', '220V', 'yes', '2021-01-23 13:32:07', '2021-01-23 13:32:07', 'metallic paint finish high performance even at low voltage motor with decorative ring decorative trims', 'new'),
(68, 30, 11, 'Butterfly MIXER GRINDER WAVE PLUS ', 'Butterfly', 'torqoise', '1000 W', '5 star', 'bf.jpeg', 'With its high-air delivery and high-speed performance', 'C12YBC3', 7, 4400, '2 years', '4 kg', '220V', 'yes', '2021-01-23 13:32:07', '2021-01-23 13:32:07', 'The razor-sharp blades have an RPM of 17000 20000 which precisely cuts, chops and mixes ingredients of any shapes or sizes.', 'new'),
(69, 25, 10, 'Hindware 3 L Instant Water Geyser ', 'Hindware', 'white', '3000 W', '4 star', 'hindware.jpeg', 'Featuring a robust construction, this geyser comes with features such as an All-purpose RPR Valve, I-Thermostat, Copper-sheathed Heating Element, and LED Indicators to provide you with a hot and sizzling bath at any time of the day.', 'HI03PDB30', 10, 5999, '2 years', '3.2 kg', '240V', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', '3 L : Greater the Capacity,more the users can be served for bath/wash', 'new'),
(70, 25, 10, 'Bajaj 3 L Instant Water Geyser', 'Bajaj', 'black', '2000 W', '3 star', 'bajaj1.jpg', 'Instant : Useful for Kitchen, quick water heating 3 L : Greater the Capacity,more the users can be served for bath/wash', 'H938w2', 20, 2699, '2 years', '2.2 kg', '3000 v', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', 'Bajaj 3 L Instant Water Geyser Ivora White', 'new'),
(71, 25, 10, 'Havells 10 L Storage Water Geyser', 'Havells', 'white and blue', '2000W', '4 star', 'havellswatergeyser.jpg', 'This stylish geyser comes with color-changing LED lights that indicate when the water has reached the optimum temperature', 'C8993Y9', 11, 9900, '2 years', '2.2 kg', '3000 v', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', '10 L : Greater the Capacity,more the users can be served for bath/wash', 'new'),
(72, 26, 11, 'Butterfly Arrow 500 W Mixer Grinder ', 'Butterfly', ' blue', '2000W', '4 star', 'butterfy.jpg', ' It has a powerful 500 W motor and its Three-speed Control setting makes blending and grinding extremely easy.', 'CC887Y6', 20, 8200, '3 years', '3.2 kg', '3000 v', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', '10 L : Greater the Capacity,more the users can be served for bath/wash', 'new'),
(73, 26, 11, 'Havells MaxxGrind 750 W Mixer Grinder  ', 'Havells', ' white', '2000W', '4 star', 'havellsgrinder.jpg', ' It comes with three jars using which you can prepare a plethora of delicious food items.', 'HY997Y', 10, 2799, '3 years', '3.2 kg', '3000 v', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', 'Suitable for: Wet Grinding, Liquidizing', 'new'),
(74, 27, 11, 'Bajaj Crest Neo 1200 mm Ultra High Speed 3 Blade Ceiling Fan', 'Bajaj', 'copper brown', '2000W', '4 star', 'bajajfan.jpg', 'This fan has an air delivery rate of 205 CMM. To ensure that this fan lasts a long time, Bajaj has made its blades of high-grade aluminium.', 'P998YC', 10, 3980, '3 years', '3.2 kg', '230 V', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', 'The Bajaj Crest Neo 1200 mm features high-grade aluminium blades that are long-lasting.', 'new'),
(75, 28, 11, 'Prodigious Deal Table Lamp', 'prodigious', 'red', '70 watts', '4 star', 'light.jpg', 'LED bulb which is quite okay ', 'HY009CVV', 10, 659, '1 years', '1.2 kg', '220 V', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', 'Battery opratable and hae multi dimensions', 'new'),
(76, 28, 11, 'esscage Table Lamp Table Lamp Table Lamp ', 'esscage', 'white', '25 watts', '3 star', 'ess.jpg', 'LED bulb which is quite okay ', 'Cy9987Y', 11, 987, '1 years', '2.2 kg', '220 V', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', 'Battery opratable and hae multi dimensions', 'new'),
(77, 26, 11, 'Havells Rigo 2 jar Rigo 500 Juicer Mixer Grinder', 'Havells', ' silkwhite', '200 watts', '4 star', 'red.jpg', 'This mixer grinder features a 500 W copper-winded motor that increases the durability of the motor and delivers optimal performance.', '9Y6577Wy', 12, 9870, '2 years', '3.2 kg', '220 V', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', 'stainless steel juicer mesh for enhanced life and better juicing efficiency,Online large Pulp container, 1L dry/wet grinding jar, 1.5L blending jar', 'new'),
(78, 26, 11, 'Orient Electric Kitchen Kraft MGKK75B3 750 W Mixer Grinder', 'Orient', 'silkwhite', '750 watts', '4 star', 'oreo.jpg', 'With all its unique features put together this might sound like quite a deal. It comes with 3 jars for different functions', '9Y5679', 20, 2250, '2 years', '1.2 kg', '220 V', 'yes', '2021-01-24 10:31:45', '2021-01-24 11:20:37', 'Higher the Wattage, tougher the Juicing/Grinding', 'publish'),
(79, 27, 11, 'Bajaj Archean 1200 mm 3 Blade Ceiling Fan ', 'Bajaj', ' reddish brown', '73 W', '3 star', 'brown.jpg', ' With all its unique features put together this might sound like quite a deal. It comes with 3 fanpase for different functions', 'HY339YC', 12, 1500, '1 years', '1.4 kg', '220 V', 'yes', '2021-01-24 10:31:45', '2021-01-24 10:31:45', ' remote operated', 'new'),
(80, 31, 11, 'Prestige PKOSS1500WATT Electric Kettle ', 'Prestige', 'silver grey', '3000 W', '4 star', 'electricalkettle.jpeg', 'Electric kettle with concealed element and detachable power base Elegant handle with single-touch lid locking for convenient use Power', 'PKOSS15', 7, 599, '2 years', '0.5', '220V', 'yes', '2021-01-24 10:31:46', '2021-01-24 10:31:46', 'kettel is gud', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(1, 1, '1jsM1kwKeQ6wUdoihhx1', 'teBdA0tTawgZns0NPP5XOTsxR43hWr98SJ5VMnfxF+4=', '2021-01-19 20:30:15', '2021-01-19 21:30:15'),
(2, 1, 'yUjpmfaXr6zjakIjPu3X', 'mlKCsbDkNDYyfp+xCtuikEyq4Wmgv5Wjd5Zy1Z23exA=', '2021-01-23 13:19:58', '2021-01-23 14:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `review_by_id` int(11) NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `review_by_id`, `comments`, `created_at`, `updated_at`) VALUES
(1, 1, 'fantastic', '2021-01-20 15:56:00', '2021-01-20 15:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`) VALUES
(1, 'oprachi2@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$ZXdzbjZ0OEZVSW5CVFVmbQ$nZy632PTY8IXtx1zgv0KpHvU1gEiLb0Y/Is9/RCYgzk', 0),
(3, 'vashusharma2625@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$ZkwyMlZKa092eGRSOVhLdg$bavuWHPvPIvWTMk4BreEetXLgeHx3+Q9pfLgskSNJdY', 0),
(4, 'oneeraj02@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$cUVRSWgycGZxWnpZM1BhOQ$CcYt2+t1bqxkzNWqWCi/BrSTTZv6VfmvFHKkTqd5AV4', 0),
(5, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2i$v=19$m=65536,t=4,p=1$TDRGeno0WHlCRnhzenpxdg$RDKu8BLsRdUpZe3FjB126xCD8Cc4voaLxqQlULMsOw4', 1),
(6, 'manager@gmail.com', '[\"ROLE_MANAGER\"]', '$argon2i$v=19$m=65536,t=4,p=1$bkE3cnR6ZlcxZjI1RGlPdw$cPxRSaEI4petIHUczhQggWEpd9EEAO5ldR4XiQTxVYA', 1),
(7, 'user2gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$WkYwZFNyTXdUeDhyaHZZZw$l4B2uLzpqSEmN+zwSzvr843Wb9J3PXppHISHo7BuSYI', 0),
(8, 'user2@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$bnNaZXdLWE95ZEE1YWVTbA$e5DOeMV0XfHTbOCGi0E4/MlG6TFxiRkPGkF6kCW+B4s', 1),
(10, 'shinneeraj98@gmail.com', '[\"ROLE_MANAGER\"]', '$argon2i$v=19$m=65536,t=4,p=1$WXptaW1keWZORTFjS2hCOA$cG6ZeA99FJWlChOmFgI6CtvR0+jrDy7a0Sgq+Rvp8vs', 1),
(11, 'creater@gmail.com', '[\"ROLE_MANAGER\"]', '$argon2i$v=19$m=65536,t=4,p=1$ZE13MFhoZ0dJSG1UeVZuaw$4XyvRMvi+SfsW/mRzT4Lp/HeossH/+Wles1hIeKGNMw', 1),
(12, 'tehreempervez959@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$Q2guY2QyaUkxS0o1TzlJdA$xYi5PZa8pt4KhUibxicLykTZnWnRQrTZxpvfzBGaQzo', 0),
(13, 'tamojit.saha30@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$V1luQmgueVlZMGNNWTFOSg$AsYmnpwbsqeCzGTvQALqAHuyDoYvl20yLCggJAWdgfQ', 0),
(14, 'user12@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$SC45M2QyS1Y3VkZwTWc2NA$dwhQGiD5GK0dlzKLG4fM3GKC6eNY/WMZld9eHgNHgAA', 0),
(15, 'manager12@gmail.com', '[\"ROLE_MANAGER\"]', '$argon2i$v=19$m=65536,t=4,p=1$NDBoZzRQbndMV3l3S3hvdw$AHZkxlq84g/CA718+2abPF9W0OElfgIeMvWa6YmzaNw', 1),
(16, 'bhawanatanwar219@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$QTFjUUtNOXZrcjU5Z2psRA$UGrzKSejADiUsbfAO2LYFDAWsS6WBatimPFd4Lo9MSI', 0),
(17, 'neerajbhandari128@gmail.com', '[]', '$argon2i$v=19$m=65536,t=4,p=1$dzRMS2c1bEkuMFZ4b09nbw$QrvJr1ubxqE7vWECmRPwJ/GDSIICTTfsZAx+fJVF3lY', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64C19C1873649CA` (`managed_by_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`),
  ADD KEY `IDX_D34A04AD873649CA` (`managed_by_id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6B9690C1F` (`review_by_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1873649CA` FOREIGN KEY (`managed_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD873649CA` FOREIGN KEY (`managed_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C6B9690C1F` FOREIGN KEY (`review_by_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
