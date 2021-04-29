-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2021 at 09:37 PM
-- Server version: 10.6.0-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ohioer`
--

-- --------------------------------------------------------

--
-- Table structure for table `ohio_citizen_data`
--

CREATE TABLE `ohio_citizen_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `residential_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_zip` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county_number` int(10) UNSIGNED NOT NULL,
  `registered_city` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county_court_district` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `congressional_district` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `court_of_appeals` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `township` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_service_center_district` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exempted_vill_school_district` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `library` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_school_district` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_board_of_education` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipal_court_district` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precinct_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precinct_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_representative_district` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_senate_district` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voter_registration_date` date DEFAULT NULL,
  `party_affiliation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ohio_citizen_data`
--
ALTER TABLE `ohio_citizen_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohio_citizen_data_first_name_index` (`first_name`),
  ADD KEY `ohio_citizen_data_last_name_index` (`last_name`),
  ADD KEY `ohio_citizen_data_first_name_last_name_index` (`first_name`,`last_name`),
  ADD KEY `ohio_citizen_data_county_number_index` (`county_number`),
  ADD KEY `ohio_citizen_data_date_of_birth_index` (`date_of_birth`),
  ADD KEY `ohio_citizen_data_residential_zip_index` (`residential_zip`),
  ADD KEY `add_index_to_search` (`id`,`date_of_birth`,`first_name`,`last_name`,`residential_zip`,`residential_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ohio_citizen_data`
--
ALTER TABLE `ohio_citizen_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
