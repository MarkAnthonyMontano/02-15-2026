-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2026 at 10:05 AM
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
-- Database: `admission`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission_exam`
--

CREATE TABLE `admission_exam` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `English` int(11) DEFAULT NULL,
  `Science` int(11) DEFAULT NULL,
  `Filipino` int(11) DEFAULT NULL,
  `Math` int(11) DEFAULT NULL,
  `Abstract` int(11) DEFAULT NULL,
  `final_rating` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admission_exam`
--

INSERT INTO `admission_exam` (`id`, `person_id`, `English`, `Science`, `Filipino`, `Math`, `Abstract`, `final_rating`, `status`, `date_created`) VALUES
(1526, 44, 90, 92, 90, 82, 83, 87, 'PASSED', '2026-02-03'),
(1527, 45, 90, 91, 95, 93, 87, 91, 'PASSED', '2026-02-04'),
(1528, 46, 90, 90, 90, 90, 92, 90, 'PASSED', '2026-02-08');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `valid_days` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp GENERATED ALWAYS AS (`created_at` + interval `valid_days` day) STORED,
  `target_role` enum('student','faculty','applicant') NOT NULL,
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `valid_days`, `created_at`, `target_role`, `file_path`) VALUES
(2, 'Enrollment Period', 'Until Febuary 7, 2026', 7, '2026-02-02 08:33:01', 'applicant', '2_announcement.jpg'),
(3, 'Admission Period', 'Until Febuary 7, 2026', 7, '2026-02-02 08:46:48', 'applicant', '3_announcement.jpg'),
(6, 'Admission Enrollment', 'Only applicable this week', 7, '2026-02-10 09:17:08', 'applicant', '6_announcement.png'),
(8, 'Enrollment Period', 'Only this February 7, 2026', 60, '2026-02-10 09:36:34', 'faculty', '8_announcement.png'),
(10, 'Enrollment Period', 'Only this week', 7, '2026-02-10 10:00:59', 'faculty', '10_announcement.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_numbering_table`
--

CREATE TABLE `applicant_numbering_table` (
  `applicant_number` varchar(20) NOT NULL,
  `person_id` int(11) NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applicant_numbering_table`
--

INSERT INTO `applicant_numbering_table` (`applicant_number`, `person_id`, `qr_code`) VALUES
('2025100003', 46, '2025100003_qrcode.png'),
('2026100001', 44, '2026100001_qrcode.png'),
('2026100002', 45, '2026100002_qrcode.png'),
('2026100004', 47, '2026100004_qrcode.png');

-- --------------------------------------------------------

--
-- Table structure for table `applied_programs`
--

CREATE TABLE `applied_programs` (
  `applied_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_settings`
--

CREATE TABLE `company_settings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `short_term` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `header_color` varchar(20) DEFAULT '#ffffff',
  `footer_text` text DEFAULT NULL,
  `footer_color` varchar(20) DEFAULT '#ffffff',
  `logo_url` varchar(255) DEFAULT NULL,
  `bg_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `main_button_color` varchar(20) DEFAULT '#ffffff',
  `sub_button_color` varchar(255) NOT NULL DEFAULT '#ffffff',
  `border_color` varchar(20) DEFAULT '#000000',
  `stepper_color` varchar(20) DEFAULT '#000000',
  `sidebar_button_color` varchar(20) DEFAULT '#000000',
  `title_color` varchar(20) DEFAULT '#000000',
  `subtitle_color` varchar(20) DEFAULT '#555555'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `company_name`, `short_term`, `address`, `header_color`, `footer_text`, `footer_color`, `logo_url`, `bg_image`, `created_at`, `updated_at`, `main_button_color`, `sub_button_color`, `border_color`, `stepper_color`, `sidebar_button_color`, `title_color`, `subtitle_color`) VALUES
(1, 'Eulogio \"Amang\" Rodriguez Institute of Science and Technology ', 'EARIST', 'Nagtahan St. Sampaloc, Manila', '#9e0000', '  © 2025 Eulogio \"Amang\" Rodriguez Institute of Science and Technology - Manila Campus', '#9e0000', '/uploads/Logo.png', '/uploads/Background.png', '2025-10-15 01:27:38', '2026-01-23 07:57:14', '#9e0000', '#ffebcd', '#000000', '#000000', '#000000', '#9e0000', '#c13333');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `template_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`template_id`, `sender_name`, `department_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'collegeofcomputingstudies@gmail.com', 3, 1, '2025-09-09 03:52:56', '2026-01-21 05:37:22'),
(2, 'collegeofengineering@gmail.com', 1, 1, '2025-09-09 03:54:30', '2025-09-09 05:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `entrance_exam_schedule`
--

CREATE TABLE `entrance_exam_schedule` (
  `schedule_id` int(11) NOT NULL,
  `day_description` varchar(20) NOT NULL,
  `building_description` varchar(255) DEFAULT NULL,
  `room_description` varchar(50) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `proctor` varchar(150) DEFAULT NULL,
  `active_school_year_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `room_quota` int(11) DEFAULT 40
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entrance_exam_schedule`
--

INSERT INTO `entrance_exam_schedule` (`schedule_id`, `day_description`, `building_description`, `room_description`, `start_time`, `end_time`, `proctor`, `active_school_year_id`, `created_at`, `room_quota`) VALUES
(26, '2026-11-18', 'NUDAS HALL', 'CCS Room 202', '08:00:00', '09:00:00', 'John Smith', 63, '2025-11-16 16:38:56', 40),
(28, '2026-11-18', 'NUDAS HALL', 'CCS Room 202', '10:00:00', '11:00:00', 'James Williams', 63, '2025-11-16 16:38:56', 40),
(29, '2026-11-18', 'NUDAS HALL', 'CCS Room 202', '11:00:00', '12:00:00', 'Patricia Brown', 63, '2025-11-16 16:38:56', 45),
(32, '2025-11-19', 'Washington Hall', 'Room 101', '08:00:00', '09:00:00', 'Michael Miller', 63, '2025-11-16 16:38:56', 35),
(33, '2025-11-19', 'Washington Hall', 'Room 102', '09:00:00', '10:00:00', 'Elizabeth Davis', 63, '2025-11-16 16:38:56', 30),
(34, '2025-11-19', 'Adams Hall', 'Room 201', '10:00:00', '11:00:00', 'William Martinez', 63, '2025-11-16 16:38:56', 40),
(35, '2025-11-19', 'Adams Hall', 'Room 202', '11:00:00', '12:00:00', 'Barbara Hernandez', 63, '2025-11-16 16:38:56', 45),
(36, '2025-11-19', 'Franklin Building', 'Room 301', '13:00:00', '14:00:00', 'David Lopez', 63, '2025-11-16 16:38:56', 50),
(37, '2025-11-19', 'Franklin Building', 'Room 302', '14:00:00', '15:00:00', 'Jennifer Gonzalez', 63, '2025-11-16 16:38:56', 40),
(38, '2025-11-20', 'Madison Hall', 'Room 101', '08:00:00', '09:00:00', 'Richard Wilson', 63, '2025-11-16 16:38:56', 35),
(39, '2025-11-20', 'Madison Hall', 'Room 102', '09:00:00', '10:00:00', 'Susan Anderson', 63, '2025-11-16 16:38:56', 30),
(40, '2025-11-20', 'Monroe Hall', 'Room 201', '10:00:00', '11:00:00', 'Joseph Thomas', 63, '2025-11-16 16:38:56', 40),
(41, '2025-11-20', 'Monroe Hall', 'Room 202', '11:00:00', '12:00:00', 'Sarah Taylor', 63, '2025-11-16 16:38:56', 45),
(42, '2025-11-20', 'Hamilton Building', 'Room 301', '13:00:00', '14:00:00', 'Charles Moore', 63, '2025-11-16 16:38:56', 50),
(43, '2025-11-20', 'Hamilton Building', 'Room 302', '14:00:00', '15:00:00', 'Karen Jackson', 63, '2025-11-16 16:38:56', 40),
(44, '2025-11-21', 'Kennedy Hall', 'Room 101', '08:00:00', '09:00:00', 'Daniel White', 63, '2025-11-16 16:38:56', 35),
(45, '2025-11-21', 'Kennedy Hall', 'Room 102', '09:00:00', '10:00:00', 'Nancy Harris', 63, '2025-11-16 16:38:56', 30),
(46, '2025-11-21', 'Reagan Hall', 'Room 201', '10:00:00', '11:00:00', 'Matthew Martin', 63, '2025-11-16 16:38:56', 40),
(47, '2025-11-21', 'Reagan Hall', 'Room 202', '11:00:00', '12:00:00', 'Lisa Thompson', 63, '2025-11-16 16:38:56', 45),
(48, '2025-11-21', 'Eisenhower Building', 'Room 301', '13:00:00', '14:00:00', 'Anthony Garcia', 63, '2025-11-16 16:38:56', 50),
(49, '2025-11-21', 'Eisenhower Building', 'Room 302', '14:00:00', '15:00:00', 'Sandra Martinez', 63, '2025-11-16 16:38:56', 40),
(50, '2025-11-22', 'Jackson Hall', 'Room 101', '08:00:00', '09:00:00', 'Mark Robinson', 63, '2025-11-16 16:38:56', 35),
(51, '2025-11-22', 'Jackson Hall', 'Room 102', '09:00:00', '10:00:00', 'Donna Clark', 63, '2025-11-16 16:38:56', 30),
(52, '2025-11-22', 'Truman Hall', 'Room 201', '10:00:00', '11:00:00', 'Steven Rodriguez', 63, '2025-11-16 16:38:56', 40),
(53, '2025-11-22', 'Truman Hall', 'Room 202', '11:00:00', '12:00:00', 'Emily Lewis', 63, '2025-11-16 16:38:56', 45),
(54, '2025-11-22', 'Coolidge Building', 'Room 301', '13:00:00', '14:00:00', 'Brian Lee', 63, '2025-11-16 16:38:56', 50),
(55, '2025-11-22', 'Coolidge Building', 'Room 302', '14:00:00', '15:00:00', 'Rebecca Walker', 63, '2025-11-16 16:38:56', 40),
(56, '2026-11-17', 'MIS Building', 'CCS 203', '10:00:00', '11:00:00', 'Prof. Anuncio', 63, '2025-11-17 02:32:51', 50),
(57, '2025-11-30', 'nudas hall', 'Rm 4', '08:00:00', '09:15:00', 'solis', 63, '2025-11-21 09:07:37', 40),
(58, '2025-11-23', 'MIS Building', 'CCS 203', '11:00:00', '00:15:00', '', 63, '2025-11-22 16:57:57', 40),
(62, '2026-02-11', 'NUDAS HALL Building', 'Cas Room 203', '10:00:00', '11:00:00', 'Dhani', NULL, '2026-02-11 07:13:21', 40),
(63, '2026-11-02', 'NUDAS HALL', 'CCS Room 202', '10:00:00', '12:00:00', 'Mark', 66, '2026-02-11 07:20:17', 40),
(64, '2026-02-11', 'Pureza', '123 Mabini St.', '10:00:00', '13:00:00', 'Mark', 66, '2026-02-11 07:58:18', 20);

-- --------------------------------------------------------

--
-- Table structure for table `exam_applicants`
--

CREATE TABLE `exam_applicants` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `applicant_id` varchar(13) NOT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_applicants`
--

INSERT INTO `exam_applicants` (`id`, `schedule_id`, `applicant_id`, `email_sent`) VALUES
(37, 56, '2026100002', 1),
(40, 56, '2025100003', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_evaluation_table`
--

CREATE TABLE `faculty_evaluation_table` (
  `eval_id` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `active_school_year_id` int(11) NOT NULL,
  `num1` int(11) DEFAULT 0,
  `num2` int(11) DEFAULT 0,
  `num3` int(11) DEFAULT 0,
  `eval_status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview_applicants`
--

CREATE TABLE `interview_applicants` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT 0,
  `applicant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0000000000',
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT 'Waiting List',
  `action` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interview_applicants`
--

INSERT INTO `interview_applicants` (`id`, `schedule_id`, `applicant_id`, `email_sent`, `status`, `action`, `created_at`) VALUES
(44, NULL, '2026100001', 1, 'Accepted', 1, '2026-02-03 14:56:13'),
(45, 1, '2026100002', 1, 'Accepted', 1, '2026-02-04 01:45:04'),
(46, 4, '2025100003', 1, 'Accepted', 1, '2026-02-07 15:46:07'),
(47, NULL, '2026100004', 0, 'Waiting List', 0, '2026-02-10 04:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `interview_exam_schedule`
--

CREATE TABLE `interview_exam_schedule` (
  `schedule_id` int(11) NOT NULL,
  `day_description` varchar(20) NOT NULL,
  `building_description` varchar(50) NOT NULL,
  `room_description` varchar(50) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `interviewer` varchar(150) DEFAULT NULL,
  `active_school_year_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `room_quota` int(11) DEFAULT 40
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interview_exam_schedule`
--

INSERT INTO `interview_exam_schedule` (`schedule_id`, `day_description`, `building_description`, `room_description`, `start_time`, `end_time`, `interviewer`, `active_school_year_id`, `created_at`, `room_quota`) VALUES
(1, '2026-02-11', 'MIS Building', 'CSS 202', '10:00:00', '12:00:00', 'Dhani San Jose', 66, '2025-09-08 11:27:55', 40),
(2, '2026-02-11', 'MIS Building', 'CCS 203', '07:00:00', '21:00:00', 'James Bungay', 66, '2025-09-08 17:58:28', 40),
(3, '2026-11-05', 'MIS Building', 'CCS 203', '13:00:00', '15:00:00', 'Jovel Advincula', 71, '2025-09-11 05:57:26', 20),
(4, '2026-11-05', 'NUDAS HALL', 'CAFA', '20:08:00', '15:00:00', 'Arjo', 63, '2025-11-24 08:09:13', 40);

-- --------------------------------------------------------

--
-- Table structure for table `medical_requirements`
--

CREATE TABLE `medical_requirements` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `applicant_number` varchar(50) DEFAULT NULL,
  `age_onset` varchar(50) DEFAULT NULL,
  `genital_enlargement` varchar(50) DEFAULT NULL,
  `pubic_hair` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `bmi` varchar(50) DEFAULT NULL,
  `interpretation` varchar(100) DEFAULT NULL,
  `heart_rate` varchar(50) DEFAULT NULL,
  `respiratory_rate` varchar(50) DEFAULT NULL,
  `o2_saturation` varchar(50) DEFAULT NULL,
  `blood_pressure` varchar(50) DEFAULT NULL,
  `vision_acuity` varchar(100) DEFAULT NULL,
  `general_survey` varchar(255) DEFAULT NULL,
  `skin` varchar(255) DEFAULT NULL,
  `eyes` varchar(255) DEFAULT NULL,
  `ent` varchar(255) DEFAULT NULL,
  `neck` varchar(255) DEFAULT NULL,
  `heart` varchar(255) DEFAULT NULL,
  `chest_lungs` varchar(255) DEFAULT NULL,
  `abdomen` varchar(255) DEFAULT NULL,
  `musculoskeletal` varchar(255) DEFAULT NULL,
  `breast_exam` varchar(255) DEFAULT NULL,
  `genitalia_smr` varchar(255) DEFAULT NULL,
  `penis` varchar(255) DEFAULT NULL,
  `dental_general_condition` varchar(100) DEFAULT NULL,
  `dental_good_hygiene` tinyint(1) DEFAULT 0,
  `dental_presence_of_calculus_plaque` tinyint(1) DEFAULT 0,
  `dental_gingivitis` tinyint(1) DEFAULT 0,
  `dental_denture_wearer_up` tinyint(1) DEFAULT 0,
  `dental_denture_wearer_down` tinyint(1) DEFAULT 0,
  `dental_with_braces_up` tinyint(1) DEFAULT 0,
  `dental_with_braces_down` tinyint(1) DEFAULT 0,
  `dental_with_oral_hygiene_reliner` tinyint(1) DEFAULT 0,
  `dental_diabetes` tinyint(1) DEFAULT 0,
  `dental_hypertension` tinyint(1) DEFAULT 0,
  `dental_allergies` tinyint(1) DEFAULT 0,
  `dental_heart_disease` tinyint(1) DEFAULT 0,
  `dental_epilepsy` tinyint(1) DEFAULT 0,
  `dental_mental_illness` tinyint(1) DEFAULT 0,
  `dental_clotting_disorder` tinyint(1) DEFAULT 0,
  `dental_upper_right` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dental_upper_right`)),
  `dental_upper_left` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dental_upper_left`)),
  `dental_lower_right` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dental_lower_right`)),
  `dental_lower_left` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dental_lower_left`)),
  `pne_mental_status_check` tinyint(1) DEFAULT 0,
  `pne_mental_status_text` varchar(255) DEFAULT NULL,
  `pne_sensory_check` tinyint(1) DEFAULT 0,
  `pne_sensory_text` varchar(255) DEFAULT NULL,
  `pne_cranial_nerve_check` tinyint(1) DEFAULT 0,
  `pne_cranial_nerve_text` varchar(255) DEFAULT NULL,
  `pne_cerebellar_check` tinyint(1) DEFAULT 0,
  `pne_cerebellar_text` varchar(255) DEFAULT NULL,
  `pne_motor_check` tinyint(1) DEFAULT 0,
  `pne_motor_text` varchar(255) DEFAULT NULL,
  `pne_reflexes_check` tinyint(1) DEFAULT 0,
  `pne_reflexes_text` varchar(255) DEFAULT NULL,
  `pne_findings_psychological` text DEFAULT NULL,
  `pne_recommendations` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_requirements`
--

INSERT INTO `medical_requirements` (`id`, `person_id`, `applicant_number`, `age_onset`, `genital_enlargement`, `pubic_hair`, `height`, `weight`, `bmi`, `interpretation`, `heart_rate`, `respiratory_rate`, `o2_saturation`, `blood_pressure`, `vision_acuity`, `general_survey`, `skin`, `eyes`, `ent`, `neck`, `heart`, `chest_lungs`, `abdomen`, `musculoskeletal`, `breast_exam`, `genitalia_smr`, `penis`, `dental_general_condition`, `dental_good_hygiene`, `dental_presence_of_calculus_plaque`, `dental_gingivitis`, `dental_denture_wearer_up`, `dental_denture_wearer_down`, `dental_with_braces_up`, `dental_with_braces_down`, `dental_with_oral_hygiene_reliner`, `dental_diabetes`, `dental_hypertension`, `dental_allergies`, `dental_heart_disease`, `dental_epilepsy`, `dental_mental_illness`, `dental_clotting_disorder`, `dental_upper_right`, `dental_upper_left`, `dental_lower_right`, `dental_lower_left`, `pne_mental_status_check`, `pne_mental_status_text`, `pne_sensory_check`, `pne_sensory_text`, `pne_cranial_nerve_check`, `pne_cranial_nerve_text`, `pne_cerebellar_check`, `pne_cerebellar_text`, `pne_motor_check`, `pne_motor_text`, `pne_reflexes_check`, `pne_reflexes_text`, `pne_findings_psychological`, `pne_recommendations`, `created_at`, `updated_at`) VALUES
(3, 0, '2025100001', '', '', '', '165', '56', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[\"Normal\",\"Normal\",\"With Caries\",\"With Caries\",\"Pontic\",\"Other Resto Mat\",\"Other Resto Mat\",\"FT\"]', '[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', 1, 'bad eyesight', 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 'Ongoing', NULL, '2025-10-10 13:51:30', '2025-10-15 04:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `applicant_number` varchar(20) DEFAULT NULL,
  `actor_email` varchar(100) DEFAULT NULL,
  `actor_name` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `message`, `applicant_number`, `actor_email`, `actor_name`, `timestamp`) VALUES
(1, 'submit', '✅ Applicant #2025100003 - Sumalabe, Lendhy Andrey D. submitted their form.', '2025100003', NULL, NULL, '2025-12-02 14:08:04'),
(2, 'submit', '✅ Applicant #2025100004 - Ciruela, Genny D. submitted their form.', '2025100004', NULL, NULL, '2025-12-02 14:13:43'),
(3, 'submit', '✅ Applicant #2025100001 - Torres, Aira Lorainne S. submitted their form.', '2025100001', NULL, NULL, '2025-12-02 14:17:15'),
(4, 'submit', '✅ Applicant #2025100001 - Torres, Aira Lorainne S. submitted their form.', '2025100001', NULL, NULL, '2025-12-02 14:17:37'),
(5, 'submit', '✅ Applicant #2025100002 - Arcaño, Elhize  E. submitted their form.', '2025100002', NULL, NULL, '2025-12-02 14:21:12'),
(6, 'submit', '✅ Applicant #2025100002 - Arcaño, Elhize  E. submitted their form.', '2025100002', NULL, NULL, '2025-12-02 14:21:39'),
(7, 'submit', '✅ Applicant #2025100002 - Arcaño, Elhize  E. submitted their form.', '2025100002', NULL, NULL, '2025-12-02 14:22:08'),
(8, 'submit', '✅ Applicant #2025100001 - Torres, Aira Lorainne S. submitted their form.', '2025100001', NULL, NULL, '2025-12-02 14:30:01'),
(9, 'submit', '✅ Applicant #2025100007 - Sumalabe, Leizel Kassandra D. submitted their form.', '2025100007', NULL, NULL, '2025-12-02 14:36:34'),
(10, 'submit', '✅ Applicant #2025100008 - Wright, Jim J. submitted their form.', '2025100008', NULL, NULL, '2025-12-02 14:37:50'),
(11, 'submit', '✅ Applicant #2025100009 - Morit, Sadie Amitiel N. submitted their form.', '2025100009', NULL, NULL, '2025-12-02 15:05:05'),
(12, 'submit', '✅ Applicant #2025100012 - Wortzbach, Catriona B. submitted their form.', '2025100012', NULL, NULL, '2025-12-02 15:06:33'),
(13, 'submit', '✅ Applicant #2025100005 - Sazon, Moneque  U. submitted their form.', '2025100005', NULL, NULL, '2025-12-02 15:07:19'),
(14, 'submit', '✅ Applicant #2025100010 - Valentine, Elise . submitted their form.', '2025100010', NULL, NULL, '2025-12-02 15:09:22'),
(15, 'submit', '✅ Applicant #2025100013 - Lastimosa, Athisa M. submitted their form.', '2025100013', NULL, NULL, '2025-12-02 15:16:15'),
(16, 'submit', '✅ Applicant #2025100014 - Palma, Drake S. submitted their form.', '2025100014', NULL, NULL, '2025-12-02 15:24:17'),
(17, 'submit', '✅ Applicant #2025100015 - Miller, Joji G. submitted their form.', '2025100015', NULL, NULL, '2025-12-02 15:29:49'),
(18, 'submit', '✅ Applicant #2025100011 - Colorado, Izabella . submitted their form.', '2025100011', NULL, NULL, '2025-12-02 15:34:24'),
(19, 'submit', '✅ Applicant #2025100017 - Tantiongco, Katelene A. submitted their form.', '2025100017', NULL, NULL, '2025-12-02 15:34:29'),
(20, 'submit', '✅ Applicant #2025100018 - Malto, Renato C. submitted their form.', '2025100018', NULL, NULL, '2025-12-02 15:36:48'),
(21, 'submit', '✅ Applicant #2025100015 - Miller, Joji G. submitted their form.', '2025100015', NULL, NULL, '2025-12-02 15:39:27'),
(22, 'submit', '✅ Applicant #2025100019 - Delacruz, Denzel B. submitted their form.', '2025100019', NULL, NULL, '2025-12-02 15:57:29'),
(23, 'submit', '✅ Applicant #2025100016 - Sazon, Carl U. submitted their form.', '2025100016', NULL, NULL, '2025-12-02 16:00:20'),
(24, 'submit', '✅ Applicant #2025100022 - Nacu, Adrian Kurt P. submitted their form.', '2025100022', NULL, NULL, '2025-12-02 16:02:36'),
(25, 'submit', '✅ Applicant #2025100020 - Potter, Harry  . submitted their form.', '2025100020', NULL, NULL, '2025-12-02 16:11:32'),
(26, 'submit', '✅ Applicant #2025100021 - Ciruela, Genny D. submitted their form.', '2025100021', NULL, NULL, '2025-12-02 16:15:29'),
(27, 'update', '📝 Entrance Exam updated (English: 0 → 45) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 16:19:30'),
(28, 'update', '📝 Entrance Exam updated (English: 45 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 16:19:32'),
(29, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 16:19:40'),
(30, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 16:19:40'),
(31, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 16:19:40'),
(32, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 16:19:40'),
(33, 'submit', '✅ Applicant #2025100021 - Ciruela, Genny D. submitted their form.', '2025100021', NULL, NULL, '2025-12-02 16:42:46'),
(34, 'submit', '✅ Applicant #2025100009 - Morit, Sadie Amitiel N. submitted their form.', '2025100009', NULL, NULL, '2025-12-02 16:44:04'),
(35, 'submit', '✅ Applicant #2025100021 - Ciruela, Genny D. submitted their form.', '2025100021', NULL, NULL, '2025-12-02 16:44:29'),
(36, 'submit', '✅ Applicant #2025100021 - Dasha, taran S. submitted their form.', '2025100021', NULL, NULL, '2025-12-02 16:45:20'),
(37, 'submit', '✅ Applicant #2025100024 - Manuel, Carl S. submitted their form.', '2025100024', NULL, NULL, '2025-12-02 17:28:56'),
(38, 'update', '📝 Entrance Exam updated (Science: -1 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 17:31:57'),
(39, 'update', '📝 Entrance Exam updated (English: 0 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 17:31:59'),
(40, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 17:31:59'),
(41, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 17:31:59'),
(42, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 17:31:59'),
(43, 'submit', '✅ Applicant #2025100016 - Sazon, Carl U. submitted their form.', '2025100016', NULL, NULL, '2025-12-02 17:39:56'),
(44, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:34'),
(45, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:34'),
(46, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:34'),
(47, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:34'),
(48, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:37'),
(49, 'update', '📝 Entrance Exam updated (Science: 0 → 7) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:37'),
(50, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:37'),
(51, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:37'),
(52, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:37'),
(53, 'update', '📝 Entrance Exam updated (Science: 7 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:43'),
(54, 'update', '📝 Entrance Exam updated (Science: 0 → 78) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:46'),
(55, 'update', '📝 Entrance Exam updated (Science: 78 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:50'),
(56, 'update', '📝 Entrance Exam updated (Science: 0 → 4) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:55'),
(57, 'update', '📝 Entrance Exam updated (Science: 4 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:57'),
(58, 'update', '📝 Entrance Exam updated (Science: 0 → 89) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:07:59'),
(59, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:03'),
(60, 'update', '📝 Entrance Exam updated (Science: 89 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:03'),
(61, 'update', '📝 Entrance Exam updated (Science: 0 → 12) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:07'),
(62, 'update', '📝 Entrance Exam updated (Science: 12 → 0) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:09'),
(63, 'update', '📝 Entrance Exam updated (Science: 7 → 87) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:17'),
(64, 'update', '📝 Entrance Exam updated (Science: 87 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:23'),
(65, 'update', '📝 Entrance Exam updated (Filipino: 0 → 99) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:27'),
(66, 'update', '📝 Entrance Exam updated (Filipino: 99 → 9) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:28'),
(67, 'update', '📝 Entrance Exam updated (Science: 0 → 87) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:31'),
(68, 'update', '📝 Entrance Exam updated (Filipino: 9 → 95) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:31'),
(69, 'update', '📝 Entrance Exam updated (Filipino: 95 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:35'),
(70, 'update', '📝 Entrance Exam updated (Math: 0 → 8) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:35'),
(71, 'update', '📝 Entrance Exam updated (Math: 8 → 85) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:36'),
(72, 'update', '📝 Entrance Exam updated (Filipino: 0 → 95) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:36'),
(73, 'update', '📝 Entrance Exam updated (Math: 85 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:41'),
(74, 'update', '📝 Entrance Exam updated (Abstract: 0 → 89) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:41'),
(75, 'update', '📝 Entrance Exam updated (Math: 0 → 85) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:42'),
(76, 'update', '📝 Entrance Exam updated (Abstract: 89 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:43'),
(77, 'update', '📝 Entrance Exam updated (English: 5 → 14) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:52'),
(78, 'update', '📝 Entrance Exam updated (English: 14 → 90) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:54'),
(79, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:55'),
(80, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:55'),
(81, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:55'),
(82, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:55'),
(83, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:56'),
(84, 'update', '📝 Entrance Exam updated (Science: 0 → -2) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:56'),
(85, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:56'),
(86, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:56'),
(87, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:56'),
(88, 'update', '📝 Entrance Exam updated (Science: -2 → 0) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:08:59'),
(89, 'update', '📝 Entrance Exam updated (Science: 0 → 9) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:01'),
(90, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:02'),
(91, 'update', '📝 Entrance Exam updated (Science: 9 → 0) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:02'),
(92, 'update', '📝 Entrance Exam updated (Science: 0 → 89) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:06'),
(93, 'update', '📝 Entrance Exam updated (Science: 89 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:10'),
(94, 'update', '📝 Entrance Exam updated (Filipino: 0 → 9) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:10'),
(95, 'update', '📝 Entrance Exam updated (Filipino: 9 → 92) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:11'),
(96, 'update', '📝 Entrance Exam updated (Math: 0 → 87) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:14'),
(97, 'update', '📝 Entrance Exam updated (Filipino: 92 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:15'),
(98, 'update', '📝 Entrance Exam updated (Math: 87 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:18'),
(99, 'update', '📝 Entrance Exam updated (Abstract: 0 → 88) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:18'),
(100, 'update', '📝 Entrance Exam updated (Filipino: 0 → 92) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:25'),
(101, 'update', '📝 Entrance Exam updated (English: 2 → 88) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:31'),
(102, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:33'),
(103, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:33'),
(104, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:33'),
(105, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:33'),
(106, 'update', '📝 Entrance Exam updated (English: 88 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:34'),
(107, 'update', '📝 Entrance Exam updated (Science: 0 → -1) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:34'),
(108, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:34'),
(109, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:34'),
(110, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:34'),
(111, 'update', '📝 Entrance Exam updated (English: 0 → 88) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:37'),
(112, 'update', '📝 Entrance Exam updated (Science: -1 → 93) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:37'),
(113, 'update', '📝 Entrance Exam updated (Science: 93 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:40'),
(114, 'update', '📝 Entrance Exam updated (Science: 0 → 93) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:43'),
(115, 'update', '📝 Entrance Exam updated (Filipino: 0 → 87) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:43'),
(116, 'update', '📝 Entrance Exam updated (Filipino: 87 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:48'),
(117, 'update', '📝 Entrance Exam updated (Math: 0 → 9) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:48'),
(118, 'update', '📝 Entrance Exam updated (Math: 9 → 97) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:49'),
(119, 'update', '📝 Entrance Exam updated (Math: 97 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:55'),
(120, 'update', '📝 Entrance Exam updated (Abstract: 0 → 8) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:55'),
(121, 'update', '📝 Entrance Exam updated (Abstract: 8 → 86) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:09:56'),
(122, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:01'),
(123, 'update', '📝 Entrance Exam updated (English: 9 → 96) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:08'),
(124, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:09'),
(125, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:09'),
(126, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:09'),
(127, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:09'),
(128, 'update', '📝 Entrance Exam updated (English: 96 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:17'),
(129, 'update', '📝 Entrance Exam updated (Science: 0 → 12) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:17'),
(130, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:17'),
(131, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:17'),
(132, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:17'),
(133, 'update', '📝 Entrance Exam updated (Science: 12 → 55) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:21'),
(134, 'update', '📝 Entrance Exam updated (English: 0 → 96) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:21'),
(135, 'update', '📝 Entrance Exam updated (Science: 55 → 89) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:37'),
(136, 'update', '📝 Entrance Exam updated (Science: 89 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:42'),
(137, 'update', '📝 Entrance Exam updated (Filipino: 0 → 98) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:42'),
(138, 'update', '📝 Entrance Exam updated (Filipino: 98 → 0) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:44'),
(139, 'update', '📝 Entrance Exam updated (Filipino: 0 → 7) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:48'),
(140, 'update', '📝 Entrance Exam updated (Filipino: 7 → 80) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:10:53'),
(141, 'update', '📝 Entrance Exam updated (Filipino: 80 → 84) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:00'),
(142, 'update', '📝 Entrance Exam updated (Science: 0 → 89) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:01'),
(143, 'update', '📝 Entrance Exam updated (Filipino: 84 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:09'),
(144, 'update', '📝 Entrance Exam updated (Math: 0 → 59) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:13'),
(145, 'update', '📝 Entrance Exam updated (Math: 59 → 9) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:16'),
(146, 'update', '📝 Entrance Exam updated (Math: 9 → 94) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:17'),
(147, 'update', '📝 Entrance Exam updated (Filipino: 0 → 84) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:17'),
(148, 'update', '📝 Entrance Exam updated (Math: 94 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:21'),
(149, 'update', '📝 Entrance Exam updated (Abstract: 0 → 7) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:21'),
(150, 'update', '📝 Entrance Exam updated (Abstract: 7 → 0) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:22'),
(151, 'update', '📝 Entrance Exam updated (Abstract: 0 → 8) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:29'),
(152, 'update', '📝 Entrance Exam updated (Math: 0 → 94) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:30'),
(153, 'update', '📝 Entrance Exam updated (Abstract: 8 → 84) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:30'),
(154, 'update', '📝 Entrance Exam updated (Abstract: 84 → 88) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:37'),
(155, 'update', '📝 Entrance Exam updated (Abstract: 88 → 89) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:41'),
(156, 'update', '📝 Entrance Exam updated (Abstract: 89 → 90) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:45'),
(157, 'update', '📝 Entrance Exam updated (Abstract: 90 → 98) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:50'),
(158, 'update', '📝 Entrance Exam updated (Abstract: 98 → 97) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:52'),
(159, 'update', '📝 Entrance Exam updated (Abstract: 97 → 92) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:54'),
(160, 'update', '📝 Entrance Exam updated (Abstract: 92 → 91) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:56'),
(161, 'update', '📝 Entrance Exam updated (Math: 87 → 88) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:59'),
(162, 'update', '📝 Entrance Exam updated (Abstract: 91 → null) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:11:59'),
(163, 'update', '📝 Entrance Exam updated (Abstract: 0 → 91) for Applicant #2025100007', '2025100007', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:02'),
(164, 'update', '📝 Entrance Exam updated (Science: 0 → 88) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:04'),
(165, 'update', '📝 Entrance Exam updated (Science: 88 → 89) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:05'),
(166, 'update', '📝 Entrance Exam updated (Science: 89 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:07'),
(167, 'update', '📝 Entrance Exam updated (Math: 85 → 86) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:07'),
(168, 'update', '📝 Entrance Exam updated (Math: 86 → 87) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:08'),
(169, 'update', '📝 Entrance Exam updated (Math: 87 → null) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:10'),
(170, 'update', '📝 Entrance Exam updated (Abstract: 89 → 91) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:10'),
(171, 'update', '📝 Entrance Exam updated (Math: 0 → 87) for Applicant #2025100003', '2025100003', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:16'),
(172, 'update', '📝 Entrance Exam updated (Abstract: 86 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:18'),
(173, 'update', '📝 Entrance Exam updated (Abstract: 88 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:12:21'),
(174, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:32'),
(175, 'update', '📝 Entrance Exam updated (English: 97 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:38'),
(176, 'update', '📝 Entrance Exam updated (Science: 0 → 8) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:38'),
(177, 'update', '📝 Entrance Exam updated (Science: 8 → 84) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:40'),
(178, 'update', '📝 Entrance Exam updated (Science: 84 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:44'),
(179, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:44'),
(180, 'update', '📝 Entrance Exam updated (Science: 0 → 84) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:44'),
(181, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:48'),
(182, 'update', '📝 Entrance Exam updated (Math: 0 → 88) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:48'),
(183, 'update', '📝 Entrance Exam updated (Math: 88 → null) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:52'),
(184, 'update', '📝 Entrance Exam updated (Abstract: 0 → 92) for Applicant #2025100011', '2025100011', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:25:52'),
(185, 'update', '📝 Entrance Exam updated (English: 0 → 9) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:01'),
(186, 'update', '📝 Entrance Exam updated (English: 9 → 94) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:03'),
(187, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:03'),
(188, 'update', '📝 Entrance Exam updated (English: 94 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:06'),
(189, 'update', '📝 Entrance Exam updated (Science: 0 → 87) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:06'),
(190, 'update', '📝 Entrance Exam updated (English: 0 → 94) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:06'),
(191, 'update', '📝 Entrance Exam updated (Science: 87 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:11'),
(192, 'update', '📝 Entrance Exam updated (Filipino: 0 → 89) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:11'),
(193, 'update', '📝 Entrance Exam updated (Filipino: 89 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:14'),
(194, 'update', '📝 Entrance Exam updated (Math: 0 → 88) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:14'),
(195, 'update', '📝 Entrance Exam updated (Math: 88 → null) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:18'),
(196, 'update', '📝 Entrance Exam updated (Abstract: 0 → 94) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:18'),
(197, 'update', '📝 Entrance Exam updated (Abstract: 94 → 9) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:20'),
(198, 'update', '📝 Entrance Exam updated (Abstract: 9 → 95) for Applicant #2025100020', '2025100020', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:26:21'),
(199, 'email', '📧 Exam schedule email sent for Applicant #2025100004 (Schedule #56)', '2025100004', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:38:59'),
(200, 'email', '📧 Exam schedule email sent for Applicant #2025100011 (Schedule #56)', '2025100011', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:38:59'),
(201, 'email', '📧 Exam schedule email sent for Applicant #2025100002 (Schedule #56)', '2025100002', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:38:59'),
(202, 'email', '📧 Exam schedule email sent for Applicant #2025100021 (Schedule #56)', '2025100021', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:00'),
(203, 'email', '📧 Exam schedule email sent for Applicant #2025100019 (Schedule #56)', '2025100019', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:01'),
(204, 'email', '📧 Exam schedule email sent for Applicant #2025100013 (Schedule #56)', '2025100013', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:04'),
(205, 'email', '📧 Exam schedule email sent for Applicant #2025100015 (Schedule #56)', '2025100015', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:05'),
(206, 'email', '📧 Exam schedule email sent for Applicant #2025100024 (Schedule #56)', '2025100024', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:05'),
(207, 'email', '📧 Exam schedule email sent for Applicant #2025100018 (Schedule #56)', '2025100018', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:06'),
(208, 'email', '📧 Exam schedule email sent for Applicant #2025100009 (Schedule #56)', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:06'),
(209, 'email', '📧 Exam schedule email sent for Applicant #2025100022 (Schedule #56)', '2025100022', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:10'),
(210, 'email', '📧 Exam schedule email sent for Applicant #2025100014 (Schedule #56)', '2025100014', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:10'),
(211, 'email', '📧 Exam schedule email sent for Applicant #2025100020 (Schedule #56)', '2025100020', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:10'),
(212, 'email', '📧 Exam schedule email sent for Applicant #2025100016 (Schedule #56)', '2025100016', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:12'),
(213, 'email', '📧 Exam schedule email sent for Applicant #2025100005 (Schedule #56)', '2025100005', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:12'),
(214, 'email', '📧 Exam schedule email sent for Applicant #2025100017 (Schedule #56)', '2025100017', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:15'),
(215, 'email', '📧 Exam schedule email sent for Applicant #2025100010 (Schedule #56)', '2025100010', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:15'),
(216, 'email', '📧 Exam schedule email sent for Applicant #2025100001 (Schedule #56)', '2025100001', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:15'),
(217, 'email', '📧 Exam schedule email sent for Applicant #2025100003 (Schedule #56)', '2025100003', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:17'),
(218, 'email', '📧 Exam schedule email sent for Applicant #2025100007 (Schedule #56)', '2025100007', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:17'),
(219, 'email', '📧 Exam schedule email sent for Applicant #2025100008 (Schedule #56)', '2025100008', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:20'),
(220, 'email', '📧 Exam schedule email sent for Applicant #2025100012 (Schedule #56)', '2025100012', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 18:39:21'),
(221, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:23'),
(222, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:23'),
(223, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:23'),
(224, 'update', '📝 Entrance Exam updated (English: 90 → 4) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:24'),
(225, 'update', '📝 Entrance Exam updated (English: 4 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(226, 'update', '📝 Entrance Exam updated (English: 4 → 90) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(227, 'update', '📝 Entrance Exam updated (Science: 0 → 900) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(228, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(229, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(230, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(231, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(232, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(233, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(234, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:26'),
(235, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(236, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(237, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(238, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(239, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(240, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(241, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(242, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(243, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:36'),
(244, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:37'),
(245, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:37'),
(246, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:37'),
(247, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:37'),
(248, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:44'),
(249, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:46'),
(250, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:50'),
(251, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:51'),
(252, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(253, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(254, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(255, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(256, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(257, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(258, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(259, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(260, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:52'),
(261, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(262, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(263, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(264, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(265, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(266, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(267, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(268, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(269, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:56'),
(270, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:58'),
(271, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:58'),
(272, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:58'),
(273, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:58'),
(274, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:58'),
(275, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:58'),
(276, 'update', '📝 Entrance Exam updated (English: 94 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:59'),
(277, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:59'),
(278, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:59'),
(279, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:59'),
(280, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:41:59'),
(281, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:00'),
(282, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:01'),
(283, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:01'),
(284, 'update', '📝 Entrance Exam updated (English: 0 → 9) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:01'),
(285, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:01'),
(286, 'update', '📝 Entrance Exam updated (English: 9 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:03'),
(287, 'update', '📝 Entrance Exam updated (Science: 0 → 900) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:03'),
(288, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:03'),
(289, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:04'),
(290, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:05'),
(291, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:05'),
(292, 'update', '📝 Entrance Exam updated (Science: 900 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:06'),
(293, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:06'),
(294, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:06'),
(295, 'update', '📝 Entrance Exam updated (Science: 0 → 95) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:06'),
(296, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:07'),
(297, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:07'),
(298, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:07'),
(299, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:07'),
(300, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:09'),
(301, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:09'),
(302, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:09'),
(303, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:09'),
(304, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:09'),
(305, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:09'),
(306, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:09'),
(307, 'update', '📝 Entrance Exam updated (Science: 95 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:10'),
(308, 'update', '📝 Entrance Exam updated (Filipino: 0 → 89) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:10'),
(309, 'update', '📝 Entrance Exam updated (Science: 0 → 86) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:11'),
(310, 'update', '📝 Entrance Exam updated (Filipino: 89 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:11'),
(311, 'update', '📝 Entrance Exam updated (English: 0 → 94) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:11'),
(312, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:11'),
(313, 'update', '📝 Entrance Exam updated (English: 94 → 90) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:11'),
(314, 'update', '📝 Entrance Exam updated (Science: 86 → 95) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:11'),
(315, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:11'),
(316, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:13'),
(317, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:13'),
(318, 'update', '📝 Entrance Exam updated (Math: 0 → 92) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:14');
INSERT INTO `notifications` (`id`, `type`, `message`, `applicant_number`, `actor_email`, `actor_name`, `timestamp`) VALUES
(319, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:14'),
(320, 'update', '📝 Entrance Exam updated (Math: 92 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:14'),
(321, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:14'),
(322, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:15'),
(323, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:15'),
(324, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:15'),
(325, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:16'),
(326, 'update', '📝 Entrance Exam updated (Science: 86 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:16'),
(327, 'update', '📝 Entrance Exam updated (Abstract: 0 → 91) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:16'),
(328, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:16'),
(329, 'update', '📝 Entrance Exam updated (Math: 92 → 88) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:17'),
(330, 'update', '📝 Entrance Exam updated (Abstract: 91 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:17'),
(331, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:17'),
(332, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:17'),
(333, 'update', '📝 Entrance Exam updated (Abstract: 0 → -1) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:17'),
(334, 'update', '📝 Entrance Exam updated (Abstract: -1 → 90) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:19'),
(335, 'update', '📝 Entrance Exam updated (English: 0 → 9590) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:21'),
(336, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:21'),
(337, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:21'),
(338, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:21'),
(339, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:21'),
(340, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:21'),
(341, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:21'),
(342, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:23'),
(343, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:23'),
(344, 'update', '📝 Entrance Exam updated (English: 9590 → 94) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:23'),
(345, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:23'),
(346, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:23'),
(347, 'update', '📝 Entrance Exam updated (Math: 88 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:24'),
(348, 'update', '📝 Entrance Exam updated (Abstract: 0 → 93) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:24'),
(349, 'update', '📝 Entrance Exam updated (English: 94 → 95) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:25'),
(350, 'update', '📝 Entrance Exam updated (Math: 0 → 88) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:25'),
(351, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:26'),
(352, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:26'),
(353, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:26'),
(354, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:26'),
(355, 'update', '📝 Entrance Exam updated (English: 8 → 89) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(356, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(357, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(358, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(359, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(360, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(361, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(362, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(363, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:28'),
(364, 'update', '📝 Entrance Exam updated (Science: 0 → 95) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:29'),
(365, 'update', '📝 Entrance Exam updated (English: 95 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:29'),
(366, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:30'),
(367, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:30'),
(368, 'update', '📝 Entrance Exam updated (Science: 95 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:30'),
(369, 'update', '📝 Entrance Exam updated (Filipino: 0 → 95) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:30'),
(370, 'update', '📝 Entrance Exam updated (English: 0 → 95) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:30'),
(371, 'update', '📝 Entrance Exam updated (Science: 0 → 92) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:30'),
(372, 'update', '📝 Entrance Exam updated (English: 89 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:30'),
(373, 'update', '📝 Entrance Exam updated (English: 0 → 96) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:31'),
(374, 'update', '📝 Entrance Exam updated (Science: 92 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:31'),
(375, 'update', '📝 Entrance Exam updated (Filipino: 95 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:31'),
(376, 'update', '📝 Entrance Exam updated (Math: 0 → 95) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:31'),
(377, 'update', '📝 Entrance Exam updated (English: 96 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:32'),
(378, 'update', '📝 Entrance Exam updated (Filipino: 0 → 9) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:32'),
(379, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:32'),
(380, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:32'),
(381, 'update', '📝 Entrance Exam updated (Filipino: 9 → 95) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:33'),
(382, 'update', '📝 Entrance Exam updated (English: 0 → 89) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:33'),
(383, 'update', '📝 Entrance Exam updated (Math: 95 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:33'),
(384, 'update', '📝 Entrance Exam updated (Abstract: 0 → 95) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:33'),
(385, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:34'),
(386, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:34'),
(387, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:35'),
(388, 'update', '📝 Entrance Exam updated (Math: 0 → 92) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:36'),
(389, 'update', '📝 Entrance Exam updated (Filipino: 95 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:36'),
(390, 'update', '📝 Entrance Exam updated (Math: 92 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:36'),
(391, 'update', '📝 Entrance Exam updated (Abstract: 0 → 1) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:37'),
(392, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:37'),
(393, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:39'),
(394, 'update', '📝 Entrance Exam updated (Abstract: 1 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:39'),
(395, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:39'),
(396, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:39'),
(397, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:39'),
(398, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:39'),
(399, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:40'),
(400, 'update', '📝 Entrance Exam updated (Abstract: 0 → 9) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:40'),
(401, 'update', '📝 Entrance Exam updated (Science: 0 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:40'),
(402, 'update', '📝 Entrance Exam updated (English: 96 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(403, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(404, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(405, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(406, 'update', '📝 Entrance Exam updated (Science: 0 → 91) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(407, 'update', '📝 Entrance Exam updated (Abstract: 9 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(408, 'update', '📝 Entrance Exam updated (English: 0 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(409, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(410, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:41'),
(411, 'update', '📝 Entrance Exam updated (Science: 96 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:42'),
(412, 'update', '📝 Entrance Exam updated (Math: 0 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:43'),
(413, 'update', '📝 Entrance Exam updated (Filipino: 96 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:43'),
(414, 'update', '📝 Entrance Exam updated (Science: 91 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:43'),
(415, 'update', '📝 Entrance Exam updated (Abstract: 0 → 91) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:43'),
(416, 'update', '📝 Entrance Exam updated (Math: 96 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:44'),
(417, 'update', '📝 Entrance Exam updated (Abstract: 0 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:44'),
(418, 'update', '📝 Entrance Exam updated (Filipino: 0 → 95) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:44'),
(419, 'update', '📝 Entrance Exam updated (Filipino: 95 → 96) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:49'),
(420, 'update', '📝 Entrance Exam updated (Abstract: 91 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:49'),
(421, 'update', '📝 Entrance Exam updated (English: 98 → 96) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:49'),
(422, 'update', '📝 Entrance Exam updated (Filipino: 96 → 9) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:50'),
(423, 'update', '📝 Entrance Exam updated (English: 96 → 95) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:51'),
(424, 'update', '📝 Entrance Exam updated (Filipino: 9 → 93) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:52'),
(425, 'update', '📝 Entrance Exam updated (English: 9 → 91) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:52'),
(426, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:52'),
(427, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:52'),
(428, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:52'),
(429, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:52'),
(430, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:53'),
(431, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:53'),
(432, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:53'),
(433, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:53'),
(434, 'update', '📝 Entrance Exam updated (English: 95 → 8) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:53'),
(435, 'update', '📝 Entrance Exam updated (Science: 0 → 96) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:56'),
(436, 'update', '📝 Entrance Exam updated (Math: 0 → 87) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:56'),
(437, 'update', '📝 Entrance Exam updated (English: 91 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:56'),
(438, 'update', '📝 Entrance Exam updated (Filipino: 93 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:56'),
(439, 'update', '📝 Entrance Exam updated (English: 8 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:56'),
(440, 'update', '📝 Entrance Exam updated (Science: 96 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:57'),
(441, 'update', '📝 Entrance Exam updated (Filipino: 0 → 9) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:57'),
(442, 'update', '📝 Entrance Exam updated (Filipino: 0 → 93) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:58'),
(443, 'update', '📝 Entrance Exam updated (Abstract: 0 → 88) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:58'),
(444, 'update', '📝 Entrance Exam updated (Math: 87 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:42:58'),
(445, 'update', '📝 Entrance Exam updated (Abstract: 93 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:00'),
(446, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:01'),
(447, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:01'),
(448, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:01'),
(449, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:01'),
(450, 'update', '📝 Entrance Exam updated (Abstract: 88 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:02'),
(451, 'update', '📝 Entrance Exam updated (English: 0 → 91) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:02'),
(452, 'update', '📝 Entrance Exam updated (Filipino: 9 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:02'),
(453, 'update', '📝 Entrance Exam updated (Science: 0 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:02'),
(454, 'update', '📝 Entrance Exam updated (English: 97 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:03'),
(455, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:03'),
(456, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:03'),
(457, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:03'),
(458, 'update', '📝 Entrance Exam updated (Math: 0 → 96) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(459, 'update', '📝 Entrance Exam updated (Science: 97 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(460, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(461, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(462, 'update', '📝 Entrance Exam updated (English: 91 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(463, 'update', '📝 Entrance Exam updated (Science: 96 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(464, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(465, 'update', '📝 Entrance Exam updated (Math: 96 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(466, 'update', '📝 Entrance Exam updated (English: 0 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:04'),
(467, 'update', '📝 Entrance Exam updated (Filipino: 97 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:05'),
(468, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:05'),
(469, 'update', '📝 Entrance Exam updated (Math: 97 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:07'),
(470, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:07'),
(471, 'update', '📝 Entrance Exam updated (Math: 96 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:07'),
(472, 'update', '📝 Entrance Exam updated (Abstract: 0 → 85) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:07'),
(473, 'update', '📝 Entrance Exam updated (English: 0 → 92) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:10'),
(474, 'update', '📝 Entrance Exam updated (Abstract: 85 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:10'),
(475, 'update', '📝 Entrance Exam updated (Science: 0 → 91) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:12'),
(476, 'update', '📝 Entrance Exam updated (English: 92 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:13'),
(477, 'update', '📝 Entrance Exam updated (Science: 91 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:13'),
(478, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:14'),
(479, 'update', '📝 Entrance Exam updated (Abstract: 0 → 8) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:14'),
(480, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:15'),
(481, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:15'),
(482, 'update', '📝 Entrance Exam updated (Abstract: 8 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:15'),
(483, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:16'),
(484, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:16'),
(485, 'update', '📝 Entrance Exam updated (Abstract: 90 → 89) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:16'),
(486, 'update', '📝 Entrance Exam updated (Abstract: 89 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:16'),
(487, 'update', '📝 Entrance Exam updated (Abstract: 90 → 897) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:18'),
(488, 'update', '📝 Entrance Exam updated (Abstract: 897 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:18'),
(489, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:19'),
(490, 'update', '📝 Entrance Exam updated (Math: 96 → 97) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:21'),
(491, 'update', '📝 Entrance Exam updated (Abstract: 97 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:21'),
(492, 'update', '📝 Entrance Exam updated (English: -1 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:23'),
(493, 'update', '📝 Entrance Exam updated (Math: 97 → 9) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:25'),
(494, 'update', '📝 Entrance Exam updated (Math: 9 → 98) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:26'),
(495, 'update', '📝 Entrance Exam updated (Math: 98 → 8) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:27'),
(496, 'update', '📝 Entrance Exam updated (English: 0 → 8) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:28'),
(497, 'update', '📝 Entrance Exam updated (Math: 8 → 89) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:28'),
(498, 'update', '📝 Entrance Exam updated (English: 8 → 88) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:30'),
(499, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:30'),
(500, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:30'),
(501, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:30'),
(502, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:30'),
(503, 'update', '📝 Entrance Exam updated (Science: 0 → 89) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:31'),
(504, 'update', '📝 Entrance Exam updated (English: 88 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:31'),
(505, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:31'),
(506, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:31'),
(507, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:31'),
(508, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:32'),
(509, 'update', '📝 Entrance Exam updated (Science: 0 → 97) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:33'),
(510, 'update', '📝 Entrance Exam updated (Math: 89 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:33'),
(511, 'update', '📝 Entrance Exam updated (English: 0 → 88) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:33'),
(512, 'update', '📝 Entrance Exam updated (Filipino: 0 → 91) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:33'),
(513, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:34'),
(514, 'update', '📝 Entrance Exam updated (Science: 89 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:34'),
(515, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:35'),
(516, 'update', '📝 Entrance Exam updated (English: 97 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:35'),
(517, 'update', '📝 Entrance Exam updated (Science: 97 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:35'),
(518, 'update', '📝 Entrance Exam updated (Filipino: 97 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:35'),
(519, 'update', '📝 Entrance Exam updated (Filipino: 91 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:35'),
(520, 'update', '📝 Entrance Exam updated (Math: 0 → 9) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:35'),
(521, 'update', '📝 Entrance Exam updated (Math: 9 → 93) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:36'),
(522, 'update', '📝 Entrance Exam updated (Math: 97 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:36'),
(523, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:36'),
(524, 'update', '📝 Entrance Exam updated (Math: 93 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:38'),
(525, 'update', '📝 Entrance Exam updated (Abstract: 0 → 9) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:38'),
(526, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:38'),
(527, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:38'),
(528, 'update', '📝 Entrance Exam updated (Abstract: 9 → 96) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:39'),
(529, 'update', '📝 Entrance Exam updated (Science: 0 → 97) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:39'),
(530, 'update', '📝 Entrance Exam updated (Math: 0 → 93) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:40'),
(531, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:40'),
(532, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:41'),
(533, 'update', '📝 Entrance Exam updated (English: 97 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:41'),
(534, 'update', '📝 Entrance Exam updated (Science: 97 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:41'),
(535, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:41'),
(536, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(537, 'update', '📝 Entrance Exam updated (Filipino: 97 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(538, 'update', '📝 Entrance Exam updated (Math: 97 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(539, 'update', '📝 Entrance Exam updated (Math: 0 → 8) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(540, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(541, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(542, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(543, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:43'),
(544, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:44'),
(545, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:44'),
(546, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:44'),
(547, 'update', '📝 Entrance Exam updated (Math: 8 → 85) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:44'),
(548, 'update', '📝 Entrance Exam updated (Science: 0 → 97) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:45'),
(549, 'update', '📝 Entrance Exam updated (English: 97 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:45'),
(550, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:46'),
(551, 'update', '📝 Entrance Exam updated (Science: 97 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:46'),
(552, 'update', '📝 Entrance Exam updated (English: 92 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:46'),
(553, 'update', '📝 Entrance Exam updated (Science: 0 → 1) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:46'),
(554, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:46'),
(555, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:46'),
(556, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:46'),
(557, 'update', '📝 Entrance Exam updated (Math: 85 → 8) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:47'),
(558, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:47'),
(559, 'update', '📝 Entrance Exam updated (Filipino: 97 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:47'),
(560, 'update', '📝 Entrance Exam updated (Math: 8 → 87) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:47'),
(561, 'update', '📝 Entrance Exam updated (Math: 97 → null) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:48'),
(562, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:48'),
(563, 'update', '📝 Entrance Exam updated (Science: 1 → 91) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:49'),
(564, 'update', '📝 Entrance Exam updated (English: 0 → 92) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:49'),
(565, 'update', '📝 Entrance Exam updated (Science: 91 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:52'),
(566, 'update', '📝 Entrance Exam updated (Filipino: 0 → 9) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:52'),
(567, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:52'),
(568, 'update', '📝 Entrance Exam updated (Science: 0 → 97) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:53'),
(569, 'update', '📝 Entrance Exam updated (Filipino: 9 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:53'),
(570, 'update', '📝 Entrance Exam updated (English: 97 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:53'),
(571, 'update', '📝 Entrance Exam updated (Science: 0 → 91) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:54'),
(572, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:54'),
(573, 'update', '📝 Entrance Exam updated (Science: 97 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:55'),
(574, 'update', '📝 Entrance Exam updated (Filipino: 97 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:56'),
(575, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:56'),
(576, 'update', '📝 Entrance Exam updated (Math: 97 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:57'),
(577, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:57'),
(578, 'update', '📝 Entrance Exam updated (Filipino: 94 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:59'),
(579, 'update', '📝 Entrance Exam updated (Math: 0 → 9) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:59'),
(580, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:43:59'),
(581, 'update', '📝 Entrance Exam updated (Math: 9 → 92) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:00'),
(582, 'update', '📝 Entrance Exam updated (Filipino: 0 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:00'),
(583, 'update', '📝 Entrance Exam updated (Science: 0 → 97) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:00'),
(584, 'update', '📝 Entrance Exam updated (English: 97 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:02'),
(585, 'update', '📝 Entrance Exam updated (Science: 97 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:02'),
(586, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:02'),
(587, 'update', '📝 Entrance Exam updated (Math: 92 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:02'),
(588, 'update', '📝 Entrance Exam updated (Abstract: 0 → 89) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:02'),
(589, 'update', '📝 Entrance Exam updated (Math: 0 → 92) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:03'),
(590, 'update', '📝 Entrance Exam updated (Abstract: 96 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:04'),
(591, 'update', '📝 Entrance Exam updated (Abstract: 89 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:06'),
(592, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:08'),
(593, 'update', '📝 Entrance Exam updated (Filipino: 97 → 0) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:08'),
(594, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100009', '2025100009', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:08'),
(595, 'update', '📝 Entrance Exam updated (English: 0 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:12'),
(596, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:12'),
(597, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:12'),
(598, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:12'),
(599, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:12'),
(600, 'update', '📝 Entrance Exam updated (English: 0 → 89) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:17'),
(601, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:17'),
(602, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:17'),
(603, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:17'),
(604, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:17'),
(605, 'update', '📝 Entrance Exam updated (English: 0 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:19'),
(606, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:19'),
(607, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:19'),
(608, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:19'),
(609, 'update', '📝 Entrance Exam updated (English: 89 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:20'),
(610, 'update', '📝 Entrance Exam updated (Science: 0 → 87) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:20'),
(611, 'update', '📝 Entrance Exam updated (English: 91 → 1) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:20'),
(612, 'update', '📝 Entrance Exam updated (Math: 87 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:20'),
(613, 'update', '📝 Entrance Exam updated (Abstract: 97 → 85) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:20'),
(614, 'update', '📝 Entrance Exam updated (Filipino: 0 → 92) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:22'),
(615, 'update', '📝 Entrance Exam updated (Science: 87 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:22'),
(616, 'update', '📝 Entrance Exam updated (Filipino: 92 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:24'),
(617, 'update', '📝 Entrance Exam updated (Math: 0 → 91) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:24'),
(618, 'update', '📝 Entrance Exam updated (Math: 91 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:28'),
(619, 'update', '📝 Entrance Exam updated (Abstract: 0 → 93) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:28'),
(620, 'update', '📝 Entrance Exam updated (Abstract: 85 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:30'),
(621, 'update', '📝 Entrance Exam updated (English: 9 → 90) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:37'),
(622, 'update', '📝 Entrance Exam updated (Science: 0 → 9) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:41'),
(623, 'update', '📝 Entrance Exam updated (Science: 9 → 93) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:42'),
(624, 'update', '📝 Entrance Exam updated (Science: 93 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:45'),
(625, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:45'),
(626, 'update', '📝 Entrance Exam updated (Science: 0 → 93) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:49'),
(627, 'update', '📝 Entrance Exam updated (Filipino: 97 → 91) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:49'),
(628, 'update', '📝 Entrance Exam updated (Math: 0 → 89) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:50'),
(629, 'update', '📝 Entrance Exam updated (Filipino: 91 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:51'),
(630, 'update', '📝 Entrance Exam updated (Math: 89 → null) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:52'),
(631, 'update', '📝 Entrance Exam updated (Abstract: 0 → 9) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:52'),
(632, 'update', '📝 Entrance Exam updated (Abstract: 9 → 95) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:44:54'),
(633, 'update', '📝 Entrance Exam updated (Abstract: 97 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:01'),
(634, 'update', '📝 Entrance Exam updated (English: 90 → 1) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:02'),
(635, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:02'),
(636, 'update', '📝 Entrance Exam updated (Abstract: 97 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:02');
INSERT INTO `notifications` (`id`, `type`, `message`, `applicant_number`, `actor_email`, `actor_name`, `timestamp`) VALUES
(637, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:03'),
(638, 'update', '📝 Entrance Exam updated (English: 89 → 90) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:04'),
(639, 'update', '📝 Entrance Exam updated (Science: 87 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:04'),
(640, 'update', '📝 Entrance Exam updated (Filipino: 92 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:04'),
(641, 'update', '📝 Entrance Exam updated (Math: 91 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:04'),
(642, 'update', '📝 Entrance Exam updated (Abstract: 93 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:04'),
(643, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:06'),
(644, 'update', '📝 Entrance Exam updated (English: 1 → 98) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:06'),
(645, 'update', '📝 Entrance Exam updated (Science: 0 → 98) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:07'),
(646, 'update', '📝 Entrance Exam updated (English: 1 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:07'),
(647, 'update', '📝 Entrance Exam updated (Filipino: 0 → 98) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:07'),
(648, 'update', '📝 Entrance Exam updated (Math: 0 → 98) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:08'),
(649, 'update', '📝 Entrance Exam updated (Abstract: 0 → 98) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:09'),
(650, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:09'),
(651, 'update', '📝 Entrance Exam updated (English: 98 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:10'),
(652, 'update', '📝 Entrance Exam updated (Science: 98 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:10'),
(653, 'update', '📝 Entrance Exam updated (Filipino: 98 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:10'),
(654, 'update', '📝 Entrance Exam updated (Math: 98 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:10'),
(655, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:10'),
(656, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:11'),
(657, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:11'),
(658, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:12'),
(659, 'update', '📝 Entrance Exam updated (English: 90 → -2) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:12'),
(660, 'update', '📝 Entrance Exam updated (Abstract: 95 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:14'),
(661, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:16'),
(662, 'update', '📝 Entrance Exam updated (English: -2 → 95) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:16'),
(663, 'update', '📝 Entrance Exam updated (Math: -1 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:17'),
(664, 'update', '📝 Entrance Exam updated (English: 95 → 93) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:18'),
(665, 'update', '📝 Entrance Exam updated (Abstract: 98 → 97) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:18'),
(666, 'update', '📝 Entrance Exam updated (Abstract: 98 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:18'),
(667, 'update', '📝 Entrance Exam updated (English: 93 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:19'),
(668, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:19'),
(669, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:19'),
(670, 'update', '📝 Entrance Exam updated (Science: 90 → 9) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:19'),
(671, 'update', '📝 Entrance Exam updated (Science: 9 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:20'),
(672, 'update', '📝 Entrance Exam updated (English: 0 → 93) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:20'),
(673, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:21'),
(674, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:21'),
(675, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:21'),
(676, 'update', '📝 Entrance Exam updated (Science: 9 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:22'),
(677, 'update', '📝 Entrance Exam updated (Filipino: 0 → 91) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:22'),
(678, 'update', '📝 Entrance Exam updated (Abstract: 0 → 95) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:22'),
(679, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:22'),
(680, 'update', '📝 Entrance Exam updated (Science: 0 → 93) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:22'),
(681, 'update', '📝 Entrance Exam updated (English: 90 → 1) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:22'),
(682, 'update', '📝 Entrance Exam updated (Filipino: 0 → 93) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:23'),
(683, 'update', '📝 Entrance Exam updated (English: 90 → 1) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:23'),
(684, 'update', '📝 Entrance Exam updated (Math: 0 → 93) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:24'),
(685, 'update', '📝 Entrance Exam updated (English: 93 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:25'),
(686, 'update', '📝 Entrance Exam updated (Science: 93 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:25'),
(687, 'update', '📝 Entrance Exam updated (Filipino: 93 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:25'),
(688, 'update', '📝 Entrance Exam updated (Math: 93 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:25'),
(689, 'update', '📝 Entrance Exam updated (Abstract: 0 → 93) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:25'),
(690, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(691, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(692, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(693, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(694, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(695, 'update', '📝 Entrance Exam updated (English: 1 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(696, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(697, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:26'),
(698, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:28'),
(699, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:28'),
(700, 'update', '📝 Entrance Exam updated (English: 0 → 8) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:28'),
(701, 'update', '📝 Entrance Exam updated (English: 8 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:30'),
(702, 'update', '📝 Entrance Exam updated (English: 8 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:30'),
(703, 'update', '📝 Entrance Exam updated (Science: 0 → 87) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:30'),
(704, 'update', '📝 Entrance Exam updated (English: 90 → 88) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:31'),
(705, 'update', '📝 Entrance Exam updated (Science: 87 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:31'),
(706, 'update', '📝 Entrance Exam updated (Science: 93 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:31'),
(707, 'update', '📝 Entrance Exam updated (Filipino: 91 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:31'),
(708, 'update', '📝 Entrance Exam updated (Math: 89 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:31'),
(709, 'update', '📝 Entrance Exam updated (Science: 0 → 86) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:32'),
(710, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:32'),
(711, 'update', '📝 Entrance Exam updated (English: 88 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:33'),
(712, 'update', '📝 Entrance Exam updated (Science: 86 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:34'),
(713, 'update', '📝 Entrance Exam updated (Filipino: 0 → 8) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:34'),
(714, 'update', '📝 Entrance Exam updated (Abstract: 93 → 92) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:34'),
(715, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:34'),
(716, 'update', '📝 Entrance Exam updated (Filipino: 8 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:34'),
(717, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:34'),
(718, 'update', '📝 Entrance Exam updated (English: 0 → 88) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:35'),
(719, 'update', '📝 Entrance Exam updated (Science: 90 → 86) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:35'),
(720, 'update', '📝 Entrance Exam updated (Filipino: 0 → 89) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:35'),
(721, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:36'),
(722, 'update', '📝 Entrance Exam updated (Science: 0 → 900) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:36'),
(723, 'update', '📝 Entrance Exam updated (Math: 0 → -1) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:36'),
(724, 'update', '📝 Entrance Exam updated (Filipino: 89 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:37'),
(725, 'update', '📝 Entrance Exam updated (Math: 0 → 9) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:37'),
(726, 'update', '📝 Entrance Exam updated (Science: 900 → 90) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:38'),
(727, 'update', '📝 Entrance Exam updated (Math: 9 → 96) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:38'),
(728, 'update', '📝 Entrance Exam updated (Math: 96 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:40'),
(729, 'update', '📝 Entrance Exam updated (Abstract: 0 → 95) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:40'),
(730, 'update', '📝 Entrance Exam updated (Math: 0 → 96) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:42'),
(731, 'update', '📝 Entrance Exam updated (Filipino: 93 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:42'),
(732, 'update', '📝 Entrance Exam updated (Abstract: 92 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:42'),
(733, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:43'),
(734, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:46'),
(735, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:48'),
(736, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:48'),
(737, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:48'),
(738, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:48'),
(739, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:48'),
(740, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:49'),
(741, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:50'),
(742, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:50'),
(743, 'update', '📝 Entrance Exam updated (English: 88 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:51'),
(744, 'update', '📝 Entrance Exam updated (Science: 86 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:51'),
(745, 'update', '📝 Entrance Exam updated (Filipino: 89 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:51'),
(746, 'update', '📝 Entrance Exam updated (Math: 96 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:51'),
(747, 'update', '📝 Entrance Exam updated (Abstract: 95 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:51'),
(748, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:52'),
(749, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:52'),
(750, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:53'),
(751, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:53'),
(752, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:53'),
(753, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:54'),
(754, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:54'),
(755, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:55'),
(756, 'update', '📝 Entrance Exam updated (English: 0 → 8) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:56'),
(757, 'update', '📝 Entrance Exam updated (Math: 90 → 95) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:58'),
(758, 'update', '📝 Entrance Exam updated (English: 8 → 89) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:45:58'),
(759, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:00'),
(760, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:00'),
(761, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:00'),
(762, 'update', '📝 Entrance Exam updated (English: 89 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:01'),
(763, 'update', '📝 Entrance Exam updated (English: 0 → 89) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:02'),
(764, 'update', '📝 Entrance Exam updated (Filipino: 0 → 95) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:02'),
(765, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:02'),
(766, 'update', '📝 Entrance Exam updated (Filipino: 95 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:03'),
(767, 'update', '📝 Entrance Exam updated (English: 90 → 89) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:04'),
(768, 'update', '📝 Entrance Exam updated (Filipino: 90 → 95) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:04'),
(769, 'update', '📝 Entrance Exam updated (Math: 90 → 86) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:04'),
(770, 'update', '📝 Entrance Exam updated (Filipino: 95 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:04'),
(771, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:04'),
(772, 'update', '📝 Entrance Exam updated (Math: 90 → 93) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:04'),
(773, 'update', '📝 Entrance Exam updated (Filipino: 90 → 91) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:05'),
(774, 'update', '📝 Entrance Exam updated (Math: 86 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:05'),
(775, 'update', '📝 Entrance Exam updated (Abstract: 0 → 97) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:05'),
(776, 'update', '📝 Entrance Exam updated (Math: 0 → 86) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:06'),
(777, 'update', '📝 Entrance Exam updated (Science: 90 → 86) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:07'),
(778, 'update', '📝 Entrance Exam updated (Filipino: 91 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:07'),
(779, 'update', '📝 Entrance Exam updated (Science: 86 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:09'),
(780, 'update', '📝 Entrance Exam updated (Science: 0 → 86) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:09'),
(781, 'update', '📝 Entrance Exam updated (Filipino: 0 → 91) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:09'),
(782, 'update', '📝 Entrance Exam updated (English: 90 → 92) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:11'),
(783, 'update', '📝 Entrance Exam updated (Abstract: 97 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:11'),
(784, 'update', '📝 Entrance Exam updated (English: 1 → 91) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:13'),
(785, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:15'),
(786, 'update', '📝 Entrance Exam updated (English: 90 → 96) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:17'),
(787, 'update', '📝 Entrance Exam updated (English: 0 → 89) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:18'),
(788, 'update', '📝 Entrance Exam updated (English: 0 → 91) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:19'),
(789, 'update', '📝 Entrance Exam updated (English: 0 → 92) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:21'),
(790, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:21'),
(791, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:22'),
(792, 'update', '📝 Entrance Exam updated (English: 90 → 91) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:23'),
(793, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:23'),
(794, 'update', '📝 Entrance Exam updated (Science: 90 → 91) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:24'),
(795, 'update', '📝 Entrance Exam updated (English: 91 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:25'),
(796, 'update', '📝 Entrance Exam updated (Science: 90 → 91) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:25'),
(797, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:25'),
(798, 'update', '📝 Entrance Exam updated (Science: 90 → 88) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:27'),
(799, 'update', '📝 Entrance Exam updated (Science: 90 → 89) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:28'),
(800, 'update', '📝 Entrance Exam updated (English: 91 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:29'),
(801, 'update', '📝 Entrance Exam updated (Science: 90 → 91) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:29'),
(802, 'update', '📝 Entrance Exam updated (English: 0 → 91) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:29'),
(803, 'update', '📝 Entrance Exam updated (English: 89 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:30'),
(804, 'update', '📝 Entrance Exam updated (Science: 90 → 91) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:30'),
(805, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:30'),
(806, 'update', '📝 Entrance Exam updated (English: 92 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:37'),
(807, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:37'),
(808, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:37'),
(809, 'update', '📝 Entrance Exam updated (English: 96 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:41'),
(810, 'update', '📝 Entrance Exam updated (Science: 91 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:41'),
(811, 'update', '📝 Entrance Exam updated (Science: 91 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:43'),
(812, 'update', '📝 Entrance Exam updated (English: 0 → 9) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:45'),
(813, 'update', '📝 Entrance Exam updated (English: 9 → 92) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:47'),
(814, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:47'),
(815, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:47'),
(816, 'update', '📝 Entrance Exam updated (English: 92 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:49'),
(817, 'update', '📝 Entrance Exam updated (Science: 0 → 9) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:49'),
(818, 'update', '📝 Entrance Exam updated (English: 0 → 92) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:50'),
(819, 'update', '📝 Entrance Exam updated (Science: 9 → 94) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:50'),
(820, 'update', '📝 Entrance Exam updated (Science: 94 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:52'),
(821, 'update', '📝 Entrance Exam updated (Science: 0 → 94) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:53'),
(822, 'update', '📝 Entrance Exam updated (Math: 0 → 98) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:53'),
(823, 'update', '📝 Entrance Exam updated (Abstract: 0 → 92) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:55'),
(824, 'update', '📝 Entrance Exam updated (Math: 98 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:56'),
(825, 'update', '📝 Entrance Exam updated (Abstract: 92 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:46:59'),
(826, 'update', '📝 Entrance Exam updated (English: 0 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:01'),
(827, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:01'),
(828, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:01'),
(829, 'update', '📝 Entrance Exam updated (Math: -1 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:01'),
(830, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:01'),
(831, 'update', '📝 Entrance Exam updated (Math: 0 → 3) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:04'),
(832, 'update', '📝 Entrance Exam updated (Math: 3 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:06'),
(833, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:08'),
(834, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:11'),
(835, 'update', '📝 Entrance Exam updated (English: 0 → 93) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:11'),
(836, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:11'),
(837, 'update', '📝 Entrance Exam updated (English: 91 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:14'),
(838, 'update', '📝 Entrance Exam updated (Science: 91 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:14'),
(839, 'update', '📝 Entrance Exam updated (Science: 0 → 92) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:14'),
(840, 'update', '📝 Entrance Exam updated (English: 93 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:14'),
(841, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:14'),
(842, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:16'),
(843, 'update', '📝 Entrance Exam updated (Science: 0 → 91) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:16'),
(844, 'update', '📝 Entrance Exam updated (Filipino: 0 → 91) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:17'),
(845, 'update', '📝 Entrance Exam updated (English: 89 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:17'),
(846, 'update', '📝 Entrance Exam updated (Science: 91 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:17'),
(847, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:17'),
(848, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:17'),
(849, 'update', '📝 Entrance Exam updated (Science: 92 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:17'),
(850, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:19'),
(851, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:19'),
(852, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:19'),
(853, 'update', '📝 Entrance Exam updated (Filipino: 91 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:19'),
(854, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:21'),
(855, 'update', '📝 Entrance Exam updated (Abstract: 0 → 89) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:21'),
(856, 'update', '📝 Entrance Exam updated (English: 92 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:21'),
(857, 'update', '📝 Entrance Exam updated (Science: 88 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:21'),
(858, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:21'),
(859, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:21'),
(860, 'update', '📝 Entrance Exam updated (Science: 0 → 88) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:21'),
(861, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:22'),
(862, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:23'),
(863, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:24'),
(864, 'update', '📝 Entrance Exam updated (Science: 89 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:24'),
(865, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:24'),
(866, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:24'),
(867, 'update', '📝 Entrance Exam updated (Science: 0 → 89) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:24'),
(868, 'update', '📝 Entrance Exam updated (English: 0 → 98) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:25'),
(869, 'update', '📝 Entrance Exam updated (Abstract: 97 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:25'),
(870, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:25'),
(871, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:25'),
(872, 'update', '📝 Entrance Exam updated (English: 98 → 89) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:26'),
(873, 'update', '📝 Entrance Exam updated (English: 0 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:26'),
(874, 'update', '📝 Entrance Exam updated (Math: 95 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:26'),
(875, 'update', '📝 Entrance Exam updated (English: 0 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:26'),
(876, 'update', '📝 Entrance Exam updated (Math: 0 → 95) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:26'),
(877, 'update', '📝 Entrance Exam updated (English: 89 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:30'),
(878, 'update', '📝 Entrance Exam updated (English: 90 → 89) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:31'),
(879, 'update', '📝 Entrance Exam updated (Science: 0 → 87) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:31'),
(880, 'update', '📝 Entrance Exam updated (English: 89 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:32'),
(881, 'update', '📝 Entrance Exam updated (Science: 87 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:34'),
(882, 'update', '📝 Entrance Exam updated (English: 0 → 89) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:35'),
(883, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:35'),
(884, 'update', '📝 Entrance Exam updated (English: 93 → 90) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:39'),
(885, 'update', '📝 Entrance Exam updated (Science: 92 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:39'),
(886, 'update', '📝 Entrance Exam updated (Filipino: 91 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:39'),
(887, 'update', '📝 Entrance Exam updated (Math: 90 → -1) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:39'),
(888, 'update', '📝 Entrance Exam updated (Abstract: 89 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:39'),
(889, 'update', '📝 Entrance Exam updated (Abstract: 0 → 92) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:40'),
(890, 'update', '📝 Entrance Exam updated (Abstract: 92 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:40'),
(891, 'update', '📝 Entrance Exam updated (Science: 90 → 87) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:41'),
(892, 'update', '📝 Entrance Exam updated (Abstract: 97 → 92) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:41'),
(893, 'update', '📝 Entrance Exam updated (English: 96 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:43'),
(894, 'update', '📝 Entrance Exam updated (Science: 96 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:43'),
(895, 'update', '📝 Entrance Exam updated (Filipino: 96 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:43'),
(896, 'update', '📝 Entrance Exam updated (Math: 96 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:43'),
(897, 'update', '📝 Entrance Exam updated (Abstract: 96 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:43'),
(898, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:43'),
(899, 'update', '📝 Entrance Exam updated (Science: 87 → 90) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:48'),
(900, 'update', '📝 Entrance Exam updated (Math: 93 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:48'),
(901, 'update', '📝 Entrance Exam updated (English: 0 → 9) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:53'),
(902, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:53'),
(903, 'update', '📝 Entrance Exam updated (English: 9 → 92) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:55'),
(904, 'update', '📝 Entrance Exam updated (Science: 0 → 91) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:57'),
(905, 'update', '📝 Entrance Exam updated (Math: 90 → 98) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:58'),
(906, 'update', '📝 Entrance Exam updated (English: 92 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:59'),
(907, 'update', '📝 Entrance Exam updated (Science: 91 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:59'),
(908, 'update', '📝 Entrance Exam updated (Filipino: 0 → 901) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:47:59'),
(909, 'update', '📝 Entrance Exam updated (Filipino: 901 → 90) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:00'),
(910, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:02'),
(911, 'update', '📝 Entrance Exam updated (English: 0 → 92) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:04'),
(912, 'update', '📝 Entrance Exam updated (Filipino: 0 → 80) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:04'),
(913, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:07'),
(914, 'update', '📝 Entrance Exam updated (Math: 0 → 95) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:08'),
(915, 'update', '📝 Entrance Exam updated (Filipino: 80 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:08'),
(916, 'update', '📝 Entrance Exam updated (Math: 95 → null) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:10'),
(917, 'update', '📝 Entrance Exam updated (Abstract: 0 → 9) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:10'),
(918, 'update', '📝 Entrance Exam updated (Abstract: 9 → 90) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:11'),
(919, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:13'),
(920, 'update', '📝 Entrance Exam updated (Abstract: 90 → 9) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:13'),
(921, 'update', '📝 Entrance Exam updated (Abstract: 9 → 93) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:14'),
(922, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:16'),
(923, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:17'),
(924, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:18'),
(925, 'update', '📝 Entrance Exam updated (English: 95 → 9) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:19'),
(926, 'update', '📝 Entrance Exam updated (Abstract: 95 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:19'),
(927, 'update', '📝 Entrance Exam updated (English: 9 → 91) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:19'),
(928, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:21'),
(929, 'update', '📝 Entrance Exam updated (English: 91 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:22'),
(930, 'update', '📝 Entrance Exam updated (Science: 0 → 9) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:22'),
(931, 'update', '📝 Entrance Exam updated (English: 0 → 91) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:22'),
(932, 'update', '📝 Entrance Exam updated (Science: 9 → 90) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:22'),
(933, 'update', '📝 Entrance Exam updated (Filipino: 0 → 89) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:24'),
(934, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:25'),
(935, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:26'),
(936, 'update', '📝 Entrance Exam updated (Math: 0 → 87) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:26'),
(937, 'update', '📝 Entrance Exam updated (Filipino: 89 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:27'),
(938, 'update', '📝 Entrance Exam updated (Math: 87 → null) for Applicant #2025100012', '2025100012', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:29'),
(939, 'update', '📝 Entrance Exam updated (English: 0 → 1) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:33'),
(940, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:33'),
(941, 'update', '📝 Entrance Exam updated (Filipino: 97 → 95) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:37'),
(942, 'update', '📝 Entrance Exam updated (Filipino: 97 → 94) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:37'),
(943, 'update', '📝 Entrance Exam updated (Abstract: 97 → 0) for Applicant #2025100008', '2025100008', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:37'),
(944, 'update', '📝 Entrance Exam updated (Filipino: 97 → 98) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:38'),
(945, 'update', '📝 Entrance Exam updated (English: 97 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:38'),
(946, 'update', '📝 Entrance Exam updated (Science: 97 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:38'),
(947, 'update', '📝 Entrance Exam updated (Math: 97 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:38'),
(948, 'update', '📝 Entrance Exam updated (Abstract: 97 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:38'),
(949, 'update', '📝 Entrance Exam updated (English: 90 → 91) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:39'),
(950, 'update', '📝 Entrance Exam updated (Math: 97 → 100) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:40'),
(951, 'update', '📝 Entrance Exam updated (English: 91 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42'),
(952, 'update', '📝 Entrance Exam updated (Science: 0 → 9) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42'),
(953, 'update', '📝 Entrance Exam updated (English: 97 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42'),
(954, 'update', '📝 Entrance Exam updated (Science: 97 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42');
INSERT INTO `notifications` (`id`, `type`, `message`, `applicant_number`, `actor_email`, `actor_name`, `timestamp`) VALUES
(955, 'update', '📝 Entrance Exam updated (Filipino: 97 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42'),
(956, 'update', '📝 Entrance Exam updated (Abstract: 97 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42'),
(957, 'update', '📝 Entrance Exam updated (English: 0 → 91) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42'),
(958, 'update', '📝 Entrance Exam updated (Science: 9 → 95) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:42'),
(959, 'update', '📝 Entrance Exam updated (English: 92 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:43'),
(960, 'update', '📝 Entrance Exam updated (Science: 91 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:43'),
(961, 'update', '📝 Entrance Exam updated (Filipino: 80 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:43'),
(962, 'update', '📝 Entrance Exam updated (Math: 95 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:43'),
(963, 'update', '📝 Entrance Exam updated (Filipino: 0 → 94) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:44'),
(964, 'update', '📝 Entrance Exam updated (Math: 0 → 93) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:45'),
(965, 'update', '📝 Entrance Exam updated (Science: 95 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:47'),
(966, 'update', '📝 Entrance Exam updated (Filipino: 94 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:47'),
(967, 'update', '📝 Entrance Exam updated (Math: 93 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:47'),
(968, 'update', '📝 Entrance Exam updated (Abstract: 0 → 91) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:47'),
(969, 'update', '📝 Entrance Exam updated (Math: 0 → 88) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:47'),
(970, 'update', '📝 Entrance Exam updated (Abstract: 91 → 90) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:47'),
(971, 'update', '📝 Entrance Exam updated (Science: 90 → 95) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:48'),
(972, 'update', '📝 Entrance Exam updated (Filipino: 90 → 94) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:48'),
(973, 'update', '📝 Entrance Exam updated (Math: 88 → 93) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:48'),
(974, 'update', '📝 Entrance Exam updated (Abstract: 90 → 91) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:48'),
(975, 'update', '📝 Entrance Exam updated (Abstract: 91 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:48'),
(976, 'update', '📝 Entrance Exam updated (Math: 0 → 87) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:48'),
(977, 'update', '📝 Entrance Exam updated (English: 0 → 1) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:51'),
(978, 'update', '📝 Entrance Exam updated (Math: 100 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:51'),
(979, 'update', '📝 Entrance Exam updated (Math: 90 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:52'),
(980, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:52'),
(981, 'update', '📝 Entrance Exam updated (English: 1 → 0) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:52'),
(982, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:54'),
(983, 'update', '📝 Entrance Exam updated (Science: 0 → 92) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:56'),
(984, 'update', '📝 Entrance Exam updated (Science: 92 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:58'),
(985, 'update', '📝 Entrance Exam updated (Filipino: 0 → 9) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:58'),
(986, 'update', '📝 Entrance Exam updated (Filipino: 9 → 94) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:48:59'),
(987, 'update', '📝 Entrance Exam updated (Math: 0 → 93) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:01'),
(988, 'update', '📝 Entrance Exam updated (Filipino: 94 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:02'),
(989, 'update', '📝 Entrance Exam updated (Math: 0 → 9) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:02'),
(990, 'update', '📝 Entrance Exam updated (Filipino: 0 → 94) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:03'),
(991, 'update', '📝 Entrance Exam updated (Math: 9 → 95) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:03'),
(992, 'update', '📝 Entrance Exam updated (Filipino: 0 → 94) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:04'),
(993, 'update', '📝 Entrance Exam updated (Math: 93 → null) for Applicant #2025100016', '2025100016', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:04'),
(994, 'update', '📝 Entrance Exam updated (Math: 95 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:05'),
(995, 'update', '📝 Entrance Exam updated (Abstract: 0 → 9) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:05'),
(996, 'update', '📝 Entrance Exam updated (Math: -1 → 88) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:06'),
(997, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:06'),
(998, 'update', '📝 Entrance Exam updated (Abstract: 9 → 93) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:07'),
(999, 'update', '📝 Entrance Exam updated (Math: 0 → 95) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:09'),
(1000, 'update', '📝 Entrance Exam updated (Abstract: 93 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:10'),
(1001, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:13'),
(1002, 'update', '📝 Entrance Exam updated (Math: 95 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:13'),
(1003, 'update', '📝 Entrance Exam updated (Abstract: 97 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:13'),
(1004, 'update', '📝 Entrance Exam updated (Science: 0 → 91) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:17'),
(1005, 'update', '📝 Entrance Exam updated (Filipino: 0 → 92) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:21'),
(1006, 'update', '📝 Entrance Exam updated (Science: 91 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:21'),
(1007, 'update', '📝 Entrance Exam updated (Math: 0 → 93) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:23'),
(1008, 'update', '📝 Entrance Exam updated (Filipino: 92 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:23'),
(1009, 'update', '📝 Entrance Exam updated (Math: 93 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:25'),
(1010, 'update', '📝 Entrance Exam updated (Abstract: 0 → 94) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:25'),
(1011, 'update', '📝 Entrance Exam updated (Abstract: 94 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:27'),
(1012, 'update', '📝 Entrance Exam updated (Filipino: 98 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:49:30'),
(1013, 'update', '📝 Entrance Exam updated (English: 0 → 9) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:16'),
(1014, 'update', '📝 Entrance Exam updated (English: 9 → 91) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:18'),
(1015, 'update', '📝 Entrance Exam updated (Math: 98 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:18'),
(1016, 'update', '📝 Entrance Exam updated (Math: 0 → 98) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:18'),
(1017, 'update', '📝 Entrance Exam updated (Science: 0 → 94) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:19'),
(1018, 'update', '📝 Entrance Exam updated (English: 91 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:20'),
(1019, 'update', '📝 Entrance Exam updated (Science: 94 → null) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:22'),
(1020, 'update', '📝 Entrance Exam updated (Filipino: 0 → 5) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:22'),
(1021, 'update', '📝 Entrance Exam updated (Filipino: 5 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:23'),
(1022, 'update', '📝 Entrance Exam updated (Filipino: 0 → 8) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:25'),
(1023, 'update', '📝 Entrance Exam updated (Filipino: 8 → 87) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:27'),
(1024, 'update', '📝 Entrance Exam updated (English: 0 → 91) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:27'),
(1025, 'update', '📝 Entrance Exam updated (English: 0 → 9) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:34'),
(1026, 'update', '📝 Entrance Exam updated (English: 9 → 92) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:35'),
(1027, 'update', '📝 Entrance Exam updated (Math: 94 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:35'),
(1028, 'update', '📝 Entrance Exam updated (Math: 0 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:36'),
(1029, 'update', '📝 Entrance Exam updated (English: 92 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:39'),
(1030, 'update', '📝 Entrance Exam updated (Science: 0 → 9) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:39'),
(1031, 'update', '📝 Entrance Exam updated (Science: 9 → 95) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:40'),
(1032, 'update', '📝 Entrance Exam updated (Filipino: 0 → 93) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:42'),
(1033, 'update', '📝 Entrance Exam updated (Science: 95 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:42'),
(1034, 'update', '📝 Entrance Exam updated (Science: 0 → 95) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:44'),
(1035, 'update', '📝 Entrance Exam updated (English: 0 → 88) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:50'),
(1036, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:50:50'),
(1037, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:33'),
(1038, 'update', '📝 Entrance Exam updated (Math: 90 → 95) for Applicant #2025100019', '2025100019', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:34'),
(1039, 'update', '📝 Entrance Exam updated (Abstract: 90 → 95) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:36'),
(1040, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:36'),
(1041, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:36'),
(1042, 'update', '📝 Entrance Exam updated (Abstract: 95 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:38'),
(1043, 'update', '📝 Entrance Exam updated (Math: 0 → 98) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:39'),
(1044, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:39'),
(1045, 'update', '📝 Entrance Exam updated (Math: 98 → 91) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:41'),
(1046, 'update', '📝 Entrance Exam updated (Abstract: 0 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:41'),
(1047, 'update', '📝 Entrance Exam updated (Filipino: 93 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:42'),
(1048, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:44'),
(1049, 'update', '📝 Entrance Exam updated (Abstract: 96 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:44'),
(1050, 'update', '📝 Entrance Exam updated (English: 91 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:46'),
(1051, 'update', '📝 Entrance Exam updated (Science: 94 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:46'),
(1052, 'update', '📝 Entrance Exam updated (Filipino: 87 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:46'),
(1053, 'update', '📝 Entrance Exam updated (Abstract: 0 → 95) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:46'),
(1054, 'update', '📝 Entrance Exam updated (Filipino: 0 → 87) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:46'),
(1055, 'update', '📝 Entrance Exam updated (Abstract: 95 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:51:48'),
(1056, 'update', '📝 Entrance Exam updated (Math: 97 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:53:15'),
(1057, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:53:18'),
(1058, 'update', '📝 Entrance Exam updated (Filipino: 0 → 95) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:53:22'),
(1059, 'update', '📝 Entrance Exam updated (Filipino: 0 → 95) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:53:38'),
(1060, 'update', '📝 Entrance Exam updated (Math: 97 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:53:39'),
(1061, 'update', '📝 Entrance Exam updated (Science: 0 → 85) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:53:58'),
(1062, 'update', '📝 Entrance Exam updated (Filipino: 95 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:53:58'),
(1063, 'update', '📝 Entrance Exam updated (Science: 85 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:01'),
(1064, 'update', '📝 Entrance Exam updated (English: 0 → 5) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:03'),
(1065, 'update', '📝 Entrance Exam updated (English: 5 → 95) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:20'),
(1066, 'update', '📝 Entrance Exam updated (Math: 87 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:20'),
(1067, 'update', '📝 Entrance Exam updated (English: 95 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:29'),
(1068, 'update', '📝 Entrance Exam updated (Science: 0 → 96) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:29'),
(1069, 'update', '📝 Entrance Exam updated (English: 0 → 95) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:29'),
(1070, 'update', '📝 Entrance Exam updated (Science: 96 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:30'),
(1071, 'update', '📝 Entrance Exam updated (Filipino: 0 → 1) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:30'),
(1072, 'update', '📝 Entrance Exam updated (Filipino: 1 → 7) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:33'),
(1073, 'update', '📝 Entrance Exam updated (Filipino: 7 → 87) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:34'),
(1074, 'update', '📝 Entrance Exam updated (Math: 0 → 97) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:43'),
(1075, 'update', '📝 Entrance Exam updated (Abstract: 93 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:43'),
(1076, 'update', '📝 Entrance Exam updated (Filipino: 0 → 2) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:45'),
(1077, 'update', '📝 Entrance Exam updated (Math: 97 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:45'),
(1078, 'update', '📝 Entrance Exam updated (Abstract: 0 → 93) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:45'),
(1079, 'update', '📝 Entrance Exam updated (Filipino: 2 → 96) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:54:47'),
(1080, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:20'),
(1081, 'update', '📝 Entrance Exam updated (English: 90 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:22'),
(1082, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:22'),
(1083, 'update', '📝 Entrance Exam updated (English: 0 → 80) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:24'),
(1084, 'update', '📝 Entrance Exam updated (Math: 91 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:24'),
(1085, 'update', '📝 Entrance Exam updated (English: 80 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:30'),
(1086, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:30'),
(1087, 'update', '📝 Entrance Exam updated (Filipino: 0 → -1) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:30'),
(1088, 'update', '📝 Entrance Exam updated (Math: 0 → 91) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:30'),
(1089, 'update', '📝 Entrance Exam updated (Filipino: -1 → 0) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:31'),
(1090, 'update', '📝 Entrance Exam updated (English: 0 → 100) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:37'),
(1091, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:37'),
(1092, 'update', '📝 Entrance Exam updated (Filipino: 0 → 100) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:38'),
(1093, 'update', '📝 Entrance Exam updated (English: 100 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:40'),
(1094, 'update', '📝 Entrance Exam updated (Filipino: 100 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:40'),
(1095, 'update', '📝 Entrance Exam updated (Math: 88 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:41'),
(1096, 'update', '📝 Entrance Exam updated (Science: 0 → 100) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:42'),
(1097, 'update', '📝 Entrance Exam updated (Math: 0 → 88) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:43'),
(1098, 'update', '📝 Entrance Exam updated (Science: 100 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:44'),
(1099, 'update', '📝 Entrance Exam updated (English: 88 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:49'),
(1100, 'update', '📝 Entrance Exam updated (Filipino: 0 → 100) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:50'),
(1101, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:51'),
(1102, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:53'),
(1103, 'update', '📝 Entrance Exam updated (Filipino: 100 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:53'),
(1104, 'update', '📝 Entrance Exam updated (Math: 90 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:53'),
(1105, 'update', '📝 Entrance Exam updated (Abstract: 0 → 100) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:53'),
(1106, 'update', '📝 Entrance Exam updated (English: 0 → 1000) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:56'),
(1107, 'update', '📝 Entrance Exam updated (Math: 87 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:56'),
(1108, 'update', '📝 Entrance Exam updated (Science: 0 → 100) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:56'),
(1109, 'update', '📝 Entrance Exam updated (English: 1000 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:57'),
(1110, 'update', '📝 Entrance Exam updated (Filipino: 0 → 98) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:59'),
(1111, 'update', '📝 Entrance Exam updated (Science: 100 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:55:59'),
(1112, 'update', '📝 Entrance Exam updated (Filipino: 98 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:01'),
(1113, 'update', '📝 Entrance Exam updated (English: 1000 → 100) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:07'),
(1114, 'update', '📝 Entrance Exam updated (Abstract: 100 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:13'),
(1115, 'update', '📝 Entrance Exam updated (English: 1 → 9) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:13'),
(1116, 'update', '📝 Entrance Exam updated (English: 9 → -1) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:15'),
(1117, 'update', '📝 Entrance Exam updated (English: -1 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:17'),
(1118, 'update', '📝 Entrance Exam updated (Science: 0 → 100) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:18'),
(1119, 'update', '📝 Entrance Exam updated (English: 90 → 1) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:19'),
(1120, 'update', '📝 Entrance Exam updated (Science: 100 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:22'),
(1121, 'update', '📝 Entrance Exam updated (Filipino: 90 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:24'),
(1122, 'update', '📝 Entrance Exam updated (Filipino: 0 → 10) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:25'),
(1123, 'update', '📝 Entrance Exam updated (Filipino: 10 → 100) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:26'),
(1124, 'update', '📝 Entrance Exam updated (English: 1 → 90) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:26'),
(1125, 'update', '📝 Entrance Exam updated (Filipino: 100 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:29'),
(1126, 'update', '📝 Entrance Exam updated (English: 100 → 99) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:36'),
(1127, 'update', '📝 Entrance Exam updated (English: 99 → 97) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:38'),
(1128, 'update', '📝 Entrance Exam updated (English: 97 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:41'),
(1129, 'update', '📝 Entrance Exam updated (Filipino: 100 → 95) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:41'),
(1130, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:41'),
(1131, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:43'),
(1132, 'update', '📝 Entrance Exam updated (Filipino: 96 → 0) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:45'),
(1133, 'update', '📝 Entrance Exam updated (Abstract: 100 → 97) for Applicant #2025100017', '2025100017', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:45'),
(1134, 'update', '📝 Entrance Exam updated (Science: 100 → 95) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:50'),
(1135, 'update', '📝 Entrance Exam updated (English: 100 → 95) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:52'),
(1136, 'update', '📝 Entrance Exam updated (English: 90 → 86) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:53'),
(1137, 'update', '📝 Entrance Exam updated (Filipino: 95 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:53'),
(1138, 'update', '📝 Entrance Exam updated (Abstract: 90 → 0) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:53'),
(1139, 'update', '📝 Entrance Exam updated (English: 86 → 87) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:56'),
(1140, 'update', '📝 Entrance Exam updated (English: 87 → 1) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:59'),
(1141, 'update', '📝 Entrance Exam updated (Science: 100 → 93) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:56:59'),
(1142, 'update', '📝 Entrance Exam updated (English: 1 → 87) for Applicant #2025100010', '2025100010', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:03'),
(1143, 'update', '📝 Entrance Exam updated (Science: 100 → 95) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:04'),
(1144, 'update', '📝 Entrance Exam updated (English: 0 → 94) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:09'),
(1145, 'update', '📝 Entrance Exam updated (Science: 0 → 86) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:11'),
(1146, 'update', '📝 Entrance Exam updated (English: 94 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:12'),
(1147, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:13'),
(1148, 'update', '📝 Entrance Exam updated (Science: 86 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:13'),
(1149, 'update', '📝 Entrance Exam updated (Math: 0 → 94) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:14'),
(1150, 'update', '📝 Entrance Exam updated (Filipino: 96 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:14'),
(1151, 'update', '📝 Entrance Exam updated (Math: 94 → null) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:16'),
(1152, 'update', '📝 Entrance Exam updated (Abstract: 0 → 96) for Applicant #2025100002', '2025100002', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:16'),
(1153, 'update', '📝 Entrance Exam updated (English: 0 → 86) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:18'),
(1154, 'update', '📝 Entrance Exam updated (English: 86 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:21'),
(1155, 'update', '📝 Entrance Exam updated (Science: 0 → 288) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:21'),
(1156, 'update', '📝 Entrance Exam updated (Science: 288 → 68) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:22'),
(1157, 'update', '📝 Entrance Exam updated (Science: 68 → 86) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:23'),
(1158, 'update', '📝 Entrance Exam updated (Science: 86 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:25'),
(1159, 'update', '📝 Entrance Exam updated (Math: 0 → 876) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:26'),
(1160, 'update', '📝 Entrance Exam updated (Math: 876 → 87) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:27'),
(1161, 'update', '📝 Entrance Exam updated (Science: 0 → 86) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:28'),
(1162, 'update', '📝 Entrance Exam updated (Math: 87 → null) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:30'),
(1163, 'update', '📝 Entrance Exam updated (Abstract: 0 → 86) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:30'),
(1164, 'update', '📝 Entrance Exam updated (Abstract: 86 → 90) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:34'),
(1165, 'update', '📝 Entrance Exam updated (Math: 0 → 87) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:40'),
(1166, 'update', '📝 Entrance Exam updated (Math: 87 → 92) for Applicant #2025100004', '2025100004', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:43'),
(1167, 'update', '📝 Entrance Exam updated (English: 0 → 96) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:45'),
(1168, 'update', '📝 Entrance Exam updated (Science: 0 → 95) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:47'),
(1169, 'update', '📝 Entrance Exam updated (English: 96 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:47'),
(1170, 'update', '📝 Entrance Exam updated (Science: 95 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:50'),
(1171, 'update', '📝 Entrance Exam updated (Filipino: 97 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:57:50'),
(1172, 'update', '📝 Entrance Exam updated (English: 95 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:27'),
(1173, 'update', '📝 Entrance Exam updated (Math: 0 → 98) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:27'),
(1174, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:29'),
(1175, 'update', '📝 Entrance Exam updated (Filipino: 95 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:30'),
(1176, 'update', '📝 Entrance Exam updated (Abstract: 0 → 96) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:30'),
(1177, 'update', '📝 Entrance Exam updated (Math: 0 → 19) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:32'),
(1178, 'update', '📝 Entrance Exam updated (Math: 19 → 99) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:33'),
(1179, 'update', '📝 Entrance Exam updated (Science: 95 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:33'),
(1180, 'update', '📝 Entrance Exam updated (Math: 0 → 96) for Applicant #2025100024', '2025100024', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:35'),
(1181, 'update', '📝 Entrance Exam updated (Math: 0 → 6) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:36'),
(1182, 'update', '📝 Entrance Exam updated (Math: 6 → 997) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:41'),
(1183, 'update', '📝 Entrance Exam updated (Math: 997 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:42'),
(1184, 'update', '📝 Entrance Exam updated (English: 98 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:43'),
(1185, 'update', '📝 Entrance Exam updated (Abstract: 0 → 87) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:58:45'),
(1186, 'update', '📝 Entrance Exam updated (Math: 0 → 98) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:06'),
(1187, 'update', '📝 Entrance Exam updated (Filipino: 87 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:06'),
(1188, 'update', '📝 Entrance Exam updated (Filipino: 0 → 87) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:07'),
(1189, 'update', '📝 Entrance Exam updated (Math: 98 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:07'),
(1190, 'update', '📝 Entrance Exam updated (Abstract: 0 → 6) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:07'),
(1191, 'update', '📝 Entrance Exam updated (Abstract: 6 → 96) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:08'),
(1192, 'update', '📝 Entrance Exam updated (Filipino: 95 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:09'),
(1193, 'update', '📝 Entrance Exam updated (Abstract: 0 → 98) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:09'),
(1194, 'update', '📝 Entrance Exam updated (Math: 0 → 98) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:15'),
(1195, 'update', '📝 Entrance Exam updated (Abstract: 98 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:15'),
(1196, 'update', '📝 Entrance Exam updated (English: 0 → -1) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:18'),
(1197, 'update', '📝 Entrance Exam updated (English: -1 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:20'),
(1198, 'update', '📝 Entrance Exam updated (Abstract: 87 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:20'),
(1199, 'update', '📝 Entrance Exam updated (Science: 0 → 96) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:21'),
(1200, 'update', '📝 Entrance Exam updated (English: 97 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:21'),
(1201, 'update', '📝 Entrance Exam updated (Science: 96 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:23'),
(1202, 'update', '📝 Entrance Exam updated (Math: 0 → 95) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:42'),
(1203, 'update', '📝 Entrance Exam updated (Abstract: 96 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:43'),
(1204, 'update', '📝 Entrance Exam updated (English: 0 → 96) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:45'),
(1205, 'update', '📝 Entrance Exam updated (English: 96 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:47'),
(1206, 'update', '📝 Entrance Exam updated (Science: 0 → 997) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:47'),
(1207, 'update', '📝 Entrance Exam updated (Science: 997 → 97) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:48'),
(1208, 'update', '📝 Entrance Exam updated (English: 0 → 59) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:53'),
(1209, 'update', '📝 Entrance Exam updated (English: 59 → 99) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:55'),
(1210, 'update', '📝 Entrance Exam updated (English: 99 → 98) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:57'),
(1211, 'update', '📝 Entrance Exam updated (Math: 98 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 18:59:57'),
(1212, 'update', '📝 Entrance Exam updated (Science: 0 → 87) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:00:00'),
(1213, 'update', '📝 Entrance Exam updated (English: 98 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:00:00'),
(1214, 'update', '📝 Entrance Exam updated (Science: 87 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:00:02'),
(1215, 'update', '📝 Entrance Exam updated (Filipino: 0 → 74) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:00:02'),
(1216, 'update', '📝 Entrance Exam updated (Filipino: 74 → 87) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:00:05'),
(1217, 'update', '📝 Entrance Exam updated (Filipino: 87 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:01:34'),
(1218, 'update', '📝 Entrance Exam updated (English: 0 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:01:36'),
(1219, 'update', '📝 Entrance Exam updated (Filipino: 0 → 87) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:01:36'),
(1220, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:02:53'),
(1221, 'update', '📝 Entrance Exam updated (Science: 97 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:03:46'),
(1222, 'update', '📝 Entrance Exam updated (Filipino: 96 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:03:46'),
(1223, 'update', '📝 Entrance Exam updated (Filipino: 0 → -1) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:03:47'),
(1224, 'update', '📝 Entrance Exam updated (Filipino: -1 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:03:51'),
(1225, 'update', '📝 Entrance Exam updated (Filipino: 96 → 99) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:03:53'),
(1226, 'update', '📝 Entrance Exam updated (English: 96 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:03:54'),
(1227, 'update', '📝 Entrance Exam updated (Filipino: 99 → 98) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:03:57'),
(1228, 'update', '📝 Entrance Exam updated (Filipino: 98 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:03'),
(1229, 'update', '📝 Entrance Exam updated (Math: 0 → -3) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:03'),
(1230, 'update', '📝 Entrance Exam updated (Math: -3 → 6) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:06'),
(1231, 'update', '📝 Entrance Exam updated (Filipino: 0 → 98) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:11'),
(1232, 'update', '📝 Entrance Exam updated (Math: 6 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:11'),
(1233, 'update', '📝 Entrance Exam updated (English: 0 → 97) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:37'),
(1234, 'update', '📝 Entrance Exam updated (Math: 96 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:41'),
(1235, 'update', '📝 Entrance Exam updated (English: 97 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:45'),
(1236, 'update', '📝 Entrance Exam updated (Math: 0 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:04:45'),
(1237, 'update', '📝 Entrance Exam updated (Abstract: 0 → 86) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:00'),
(1238, 'update', '📝 Entrance Exam updated (Math: 99 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:30'),
(1239, 'update', '📝 Entrance Exam updated (Science: 0 → 95) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:40'),
(1240, 'update', '📝 Entrance Exam updated (Math: 0 → 99) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:40'),
(1241, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:43'),
(1242, 'update', '📝 Entrance Exam updated (Filipino: 97 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:49'),
(1243, 'update', '📝 Entrance Exam updated (Abstract: 0 → 94) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:49'),
(1244, 'update', '📝 Entrance Exam updated (Abstract: 94 → 0) for Applicant #2025100015', '2025100015', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:05:52'),
(1245, 'update', '📝 Entrance Exam updated (Filipino: 0 → 85) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:06:07'),
(1246, 'update', '📝 Entrance Exam updated (Abstract: 86 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:06:09'),
(1247, 'update', '📝 Entrance Exam updated (Filipino: 85 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:06:13'),
(1248, 'update', '📝 Entrance Exam updated (Math: 0 → 88) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:06:13'),
(1249, 'update', '📝 Entrance Exam updated (Math: 88 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:06:41'),
(1250, 'update', '📝 Entrance Exam updated (English: 90 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:06:59'),
(1251, 'update', '📝 Entrance Exam updated (Science: 90 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:06:59'),
(1252, 'update', '📝 Entrance Exam updated (English: 94 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:07:10'),
(1253, 'update', '📝 Entrance Exam updated (Science: 90 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:07:10'),
(1254, 'update', '📝 Entrance Exam updated (English: 0 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:07:13'),
(1255, 'update', '📝 Entrance Exam updated (Science: 94 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:07:17'),
(1256, 'update', '📝 Entrance Exam updated (Science: 0 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:07:30'),
(1257, 'update', '📝 Entrance Exam updated (Filipino: 0 → 88) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:11'),
(1258, 'update', '📝 Entrance Exam updated (Filipino: 88 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:26'),
(1259, 'update', '📝 Entrance Exam updated (Filipino: 88 → 89) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:35'),
(1260, 'update', '📝 Entrance Exam updated (Filipino: 89 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:45'),
(1261, 'update', '📝 Entrance Exam updated (English: 0 → 98) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:55'),
(1262, 'update', '📝 Entrance Exam updated (Math: 98 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:55'),
(1263, 'update', '📝 Entrance Exam updated (Science: 0 → 96) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:56'),
(1264, 'update', '📝 Entrance Exam updated (English: 98 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:57'),
(1265, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:58'),
(1266, 'update', '📝 Entrance Exam updated (Science: 96 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:08:58'),
(1267, 'update', '📝 Entrance Exam updated (Math: 98 → 96) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:00'),
(1268, 'update', '📝 Entrance Exam updated (Filipino: 96 → 0) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:00'),
(1269, 'update', '📝 Entrance Exam updated (Math: 96 → 98) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:01'),
(1270, 'update', '📝 Entrance Exam updated (Abstract: 0 → 5) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:01'),
(1271, 'update', '📝 Entrance Exam updated (Abstract: 5 → 95) for Applicant #2025100001', '2025100001', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:03');
INSERT INTO `notifications` (`id`, `type`, `message`, `applicant_number`, `actor_email`, `actor_name`, `timestamp`) VALUES
(1272, 'update', '📝 Entrance Exam updated (Science: 0 → 85) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:11'),
(1273, 'update', '📝 Entrance Exam updated (Science: 85 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:13'),
(1274, 'update', '📝 Entrance Exam updated (Filipino: 0 → 7) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:13'),
(1275, 'update', '📝 Entrance Exam updated (Filipino: 7 → 87) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:16'),
(1276, 'update', '📝 Entrance Exam updated (Filipino: 87 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:18'),
(1277, 'update', '📝 Entrance Exam updated (Math: 0 → 88) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:18'),
(1278, 'update', '📝 Entrance Exam updated (Filipino: 0 → 87) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:20'),
(1279, 'update', '📝 Entrance Exam updated (English: 0 → 86) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:23'),
(1280, 'update', '📝 Entrance Exam updated (English: 86 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:25'),
(1281, 'update', '📝 Entrance Exam updated (Science: 0 → 87) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:25'),
(1282, 'update', '📝 Entrance Exam updated (Filipino: 0 → 88) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:27'),
(1283, 'update', '📝 Entrance Exam updated (Science: 87 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:27'),
(1284, 'update', '📝 Entrance Exam updated (Math: 0 → 89) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:29'),
(1285, 'update', '📝 Entrance Exam updated (Filipino: 88 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:29'),
(1286, 'update', '📝 Entrance Exam updated (Math: 89 → 0) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:31'),
(1287, 'update', '📝 Entrance Exam updated (Abstract: 96 → 90) for Applicant #2025100013', '2025100013', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:31'),
(1288, 'update', '📝 Entrance Exam updated (English: 0 → 88) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:34'),
(1289, 'update', '📝 Entrance Exam updated (Abstract: 96 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:34'),
(1290, 'update', '📝 Entrance Exam updated (English: 88 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:37'),
(1291, 'update', '📝 Entrance Exam updated (Science: 0 → 89) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:37'),
(1292, 'update', '📝 Entrance Exam updated (Science: 89 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:40'),
(1293, 'update', '📝 Entrance Exam updated (Math: 0 → 91) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:43'),
(1294, 'update', '📝 Entrance Exam updated (English: 0 → 92) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:47'),
(1295, 'update', '📝 Entrance Exam updated (Science: 0 → 92) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:50'),
(1296, 'update', '📝 Entrance Exam updated (English: 92 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:50'),
(1297, 'update', '📝 Entrance Exam updated (Science: 92 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:53'),
(1298, 'update', '📝 Entrance Exam updated (Filipino: 93 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:55'),
(1299, 'update', '📝 Entrance Exam updated (Math: 0 → 94) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:55'),
(1300, 'update', '📝 Entrance Exam updated (Math: 95 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:58'),
(1301, 'update', '📝 Entrance Exam updated (Science: 0 → 94) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:09:59'),
(1302, 'update', '📝 Entrance Exam updated (Science: 94 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:00'),
(1303, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:00'),
(1304, 'update', '📝 Entrance Exam updated (Filipino: 96 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:03'),
(1305, 'update', '📝 Entrance Exam updated (Abstract: 0 → 94) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:03'),
(1306, 'update', '📝 Entrance Exam updated (Science: 0 → 2) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:06'),
(1307, 'update', '📝 Entrance Exam updated (Science: 2 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:08'),
(1308, 'update', '📝 Entrance Exam updated (Science: 96 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:09'),
(1309, 'update', '📝 Entrance Exam updated (Science: 0 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:10'),
(1310, 'update', '📝 Entrance Exam updated (Abstract: 0 → 94) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:14'),
(1311, 'update', '📝 Entrance Exam updated (Abstract: 94 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:35'),
(1312, 'update', '📝 Entrance Exam updated (Abstract: 94 → 0) for Applicant #2025100022', '2025100022', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:38'),
(1313, 'update', '📝 Entrance Exam updated (Math: 94 → 0) for Applicant #2025100014', '2025100014', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:39'),
(1314, 'update', '📝 Entrance Exam updated (Math: 91 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:41'),
(1315, 'update', '📝 Entrance Exam updated (Math: 88 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:44'),
(1316, 'update', '📝 Entrance Exam updated (English: 0 → 87) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:55'),
(1317, 'update', '📝 Entrance Exam updated (Science: 0 → 86) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:56'),
(1318, 'update', '📝 Entrance Exam updated (English: 87 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:56'),
(1319, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:58'),
(1320, 'update', '📝 Entrance Exam updated (Science: 86 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:58'),
(1321, 'update', '📝 Entrance Exam updated (Math: 0 → 85) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:59'),
(1322, 'update', '📝 Entrance Exam updated (Filipino: 96 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:10:59'),
(1323, 'update', '📝 Entrance Exam updated (Math: 85 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:00'),
(1324, 'update', '📝 Entrance Exam updated (Abstract: 97 → 74) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:00'),
(1325, 'update', '📝 Entrance Exam updated (Abstract: 74 → 0) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:02'),
(1326, 'update', '📝 Entrance Exam updated (Abstract: 0 → 98) for Applicant #2025100005', '2025100005', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:07'),
(1327, 'update', '📝 Entrance Exam updated (Science: 0 → 99) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:23'),
(1328, 'update', '📝 Entrance Exam updated (English: 0 → 7) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:24'),
(1329, 'update', '📝 Entrance Exam updated (Science: 99 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:24'),
(1330, 'update', '📝 Entrance Exam updated (English: 7 → 87) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:27'),
(1331, 'update', '📝 Entrance Exam updated (English: 87 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:31'),
(1332, 'update', '📝 Entrance Exam updated (Abstract: 0 → 88) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:31'),
(1333, 'update', '📝 Entrance Exam updated (English: 0 → 87) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:31'),
(1334, 'update', '📝 Entrance Exam updated (English: 0 → 86) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:34'),
(1335, 'update', '📝 Entrance Exam updated (Science: 0 → 88) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:35'),
(1336, 'update', '📝 Entrance Exam updated (English: 86 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:36'),
(1337, 'update', '📝 Entrance Exam updated (Science: 88 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:37'),
(1338, 'update', '📝 Entrance Exam updated (Math: 0 → 92) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:11:39'),
(1339, 'update', '📝 Entrance Exam updated (Abstract: 88 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:12'),
(1340, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:14'),
(1341, 'update', '📝 Entrance Exam updated (English: 90 → 91) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:16'),
(1342, 'update', '📝 Entrance Exam updated (Math: 92 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:16'),
(1343, 'update', '📝 Entrance Exam updated (Filipino: 0 → 1) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:37'),
(1344, 'update', '📝 Entrance Exam updated (Filipino: 1 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:37'),
(1345, 'update', '📝 Entrance Exam updated (Filipino: 96 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:40'),
(1346, 'update', '📝 Entrance Exam updated (Filipino: 0 → 96) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:40'),
(1347, 'update', '📝 Entrance Exam updated (Science: 0 → 95) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:12:41'),
(1348, 'update', '📝 Entrance Exam updated (Abstract: 0 → 98) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:03'),
(1349, 'update', '📝 Entrance Exam updated (Science: 95 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:04'),
(1350, 'update', '📝 Entrance Exam updated (Math: 0 → 86) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:05'),
(1351, 'update', '📝 Entrance Exam updated (Abstract: 98 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:05'),
(1352, 'update', '📝 Entrance Exam updated (Filipino: 0 → 98) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:07'),
(1353, 'update', '📝 Entrance Exam updated (Math: 86 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:08'),
(1354, 'update', '📝 Entrance Exam updated (Filipino: 9 → 97) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:26'),
(1355, 'update', '📝 Entrance Exam updated (Filipino: 98 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:30'),
(1356, 'update', '📝 Entrance Exam updated (Filipino: 97 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:35'),
(1357, 'update', '📝 Entrance Exam updated (Abstract: 0 → 9) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:35'),
(1358, 'update', '📝 Entrance Exam updated (Abstract: 9 → 98) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:36'),
(1359, 'update', '📝 Entrance Exam updated (Filipino: 0 → 97) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:13:40'),
(1360, 'update', '📝 Entrance Exam updated (Math: 9 → 98) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:14:00'),
(1361, 'update', '📝 Entrance Exam updated (Abstract: 97 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:14:23'),
(1362, 'update', '📝 Entrance Exam updated (English: 90 → 89) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:14:32'),
(1363, 'update', '📝 Entrance Exam updated (English: 89 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:14:42'),
(1364, 'update', '📝 Entrance Exam updated (English: 0 → 89) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:14:43'),
(1365, 'update', '📝 Entrance Exam updated (English: 0 → 1) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:27'),
(1366, 'update', '📝 Entrance Exam updated (Filipino: 90 → 96) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:39'),
(1367, 'update', '📝 Entrance Exam updated (Math: 0 → 949) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:41'),
(1368, 'update', '📝 Entrance Exam updated (Science: 91 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:43'),
(1369, 'update', '📝 Entrance Exam updated (Filipino: 96 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:43'),
(1370, 'update', '📝 Entrance Exam updated (Math: 949 → 90) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:43'),
(1371, 'update', '📝 Entrance Exam updated (Abstract: 0 → 95) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:43'),
(1372, 'update', '📝 Entrance Exam updated (Abstract: 95 → 0) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:44'),
(1373, 'update', '📝 Entrance Exam updated (Math: 90 → 949) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:51'),
(1374, 'update', '📝 Entrance Exam updated (Math: 949 → 49) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:52'),
(1375, 'update', '📝 Entrance Exam updated (Math: 49 → 9) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:54'),
(1376, 'update', '📝 Entrance Exam updated (Math: 9 → 94) for Applicant #2025100021', '2025100021', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:20:56'),
(1377, 'update', '📝 Entrance Exam updated (English: 1 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:21:02'),
(1378, 'update', '📝 Entrance Exam updated (Filipino: 0 → 92) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:21:07'),
(1379, 'update', '📝 Entrance Exam updated (English: 90 → 1) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:21:10'),
(1380, 'update', '📝 Entrance Exam updated (Filipino: 92 → 0) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:21:10'),
(1381, 'update', '📝 Entrance Exam updated (Abstract: 0 → 91) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:21:10'),
(1382, 'update', '📝 Entrance Exam updated (English: 1 → 90) for Applicant #2025100018', '2025100018', 'earistmis@gmail.com', 'SYSTEM', '2025-12-02 19:21:12'),
(1383, 'email', '📧 Interview schedule email sent for Applicant #2025100001 (Schedule #3)', '2025100001', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:04'),
(1384, 'email', '📧 Interview schedule email sent for Applicant #2025100002 (Schedule #3)', '2025100002', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:06'),
(1385, 'email', '📧 Interview schedule email sent for Applicant #2025100003 (Schedule #3)', '2025100003', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:09'),
(1386, 'email', '📧 Interview schedule email sent for Applicant #2025100004 (Schedule #3)', '2025100004', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:12'),
(1387, 'email', '📧 Interview schedule email sent for Applicant #2025100005 (Schedule #3)', '2025100005', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:14'),
(1388, 'email', '📧 Interview schedule email sent for Applicant #2025100007 (Schedule #3)', '2025100007', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:17'),
(1389, 'email', '📧 Interview schedule email sent for Applicant #2025100008 (Schedule #3)', '2025100008', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:19'),
(1390, 'email', '📧 Interview schedule email sent for Applicant #2025100009 (Schedule #3)', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:22'),
(1391, 'email', '📧 Interview schedule email sent for Applicant #2025100010 (Schedule #3)', '2025100010', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:25'),
(1392, 'email', '📧 Interview schedule email sent for Applicant #2025100011 (Schedule #3)', '2025100011', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:27'),
(1393, 'email', '📧 Interview schedule email sent for Applicant #2025100012 (Schedule #3)', '2025100012', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:30'),
(1394, 'email', '📧 Interview schedule email sent for Applicant #2025100013 (Schedule #3)', '2025100013', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:33'),
(1395, 'email', '📧 Interview schedule email sent for Applicant #2025100014 (Schedule #3)', '2025100014', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:35'),
(1396, 'email', '📧 Interview schedule email sent for Applicant #2025100015 (Schedule #3)', '2025100015', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:38'),
(1397, 'email', '📧 Interview schedule email sent for Applicant #2025100016 (Schedule #3)', '2025100016', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:40'),
(1398, 'email', '📧 Interview schedule email sent for Applicant #2025100017 (Schedule #3)', '2025100017', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:43'),
(1399, 'email', '📧 Interview schedule email sent for Applicant #2025100018 (Schedule #3)', '2025100018', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:45'),
(1400, 'email', '📧 Interview schedule email sent for Applicant #2025100019 (Schedule #3)', '2025100019', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:48'),
(1401, 'email', '📧 Interview schedule email sent for Applicant #2025100020 (Schedule #3)', '2025100020', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:50'),
(1402, 'email', '📧 Interview schedule email sent for Applicant #2025100021 (Schedule #3)', '2025100021', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:53'),
(1403, 'email', '📧 Interview schedule email sent for Applicant #2025100022 (Schedule #3)', '2025100022', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:55'),
(1404, 'email', '📧 Interview schedule email sent for Applicant #2025100024 (Schedule #3)', '2025100024', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:23:57'),
(1405, 'update', '📝 Qualifying Exam: 0 → 8 | Interview: 0 → 0 | Final Rating: 0 → 4.00 for Applicant #2025100001', '2025100001', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:49'),
(1406, 'update', '📝 Qualifying Exam: 8 → 88 | Interview: 0 → 0 | Final Rating: 4 → 44.00 for Applicant #2025100001', '2025100001', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:49'),
(1407, 'update', '📝 Qualifying Exam: 0 → 8 | Interview: 0 → 0 | Final Rating: 0 → 4.00 for Applicant #2025100002', '2025100002', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:51'),
(1408, 'update', '📝 Qualifying Exam: 8 → 89 | Interview: 0 → 0 | Final Rating: 4 → 44.50 for Applicant #2025100002', '2025100002', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:51'),
(1409, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100003', '2025100003', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:55'),
(1410, 'update', '📝 Qualifying Exam: 9 → 90 | Interview: 0 → 0 | Final Rating: 5 → 45.00 for Applicant #2025100003', '2025100003', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:55'),
(1411, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100004', '2025100004', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:59'),
(1412, 'update', '📝 Qualifying Exam: 9 → 91 | Interview: 0 → 0 | Final Rating: 5 → 45.50 for Applicant #2025100004', '2025100004', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:25:59'),
(1413, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100005', '2025100005', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:01'),
(1414, 'update', '📝 Qualifying Exam: 9 → 92 | Interview: 0 → 0 | Final Rating: 5 → 46.00 for Applicant #2025100005', '2025100005', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:02'),
(1415, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100007', '2025100007', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:03'),
(1416, 'update', '📝 Qualifying Exam: 9 → 93 | Interview: 0 → 0 | Final Rating: 5 → 46.50 for Applicant #2025100007', '2025100007', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:04'),
(1417, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100008', '2025100008', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:06'),
(1418, 'update', '📝 Qualifying Exam: 9 → 94 | Interview: 0 → 0 | Final Rating: 5 → 47.00 for Applicant #2025100008', '2025100008', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:06'),
(1419, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100009', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:09'),
(1420, 'update', '📝 Qualifying Exam: 9 → 95 | Interview: 0 → 0 | Final Rating: 5 → 47.50 for Applicant #2025100009', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:09'),
(1421, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100010', '2025100010', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:12'),
(1422, 'update', '📝 Qualifying Exam: 9 → 96 | Interview: 0 → 0 | Final Rating: 5 → 48.00 for Applicant #2025100010', '2025100010', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:13'),
(1423, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100011', '2025100011', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:16'),
(1424, 'update', '📝 Qualifying Exam: 9 → 97 | Interview: 0 → 0 | Final Rating: 5 → 48.50 for Applicant #2025100011', '2025100011', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:17'),
(1425, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100012', '2025100012', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:21'),
(1426, 'update', '📝 Qualifying Exam: 9 → 98 | Interview: 0 → 0 | Final Rating: 5 → 49.00 for Applicant #2025100012', '2025100012', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:21'),
(1427, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100013', '2025100013', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:25'),
(1428, 'update', '📝 Qualifying Exam: 9 → 99 | Interview: 0 → 0 | Final Rating: 5 → 49.50 for Applicant #2025100013', '2025100013', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:26:26'),
(1429, 'update', '📝 Qualifying Exam: 0 → 8 | Interview: 0 → 0 | Final Rating: 0 → 4.00 for Applicant #2025100014', '2025100014', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:46'),
(1430, 'update', '📝 Qualifying Exam: 8 → 87 | Interview: 0 → 0 | Final Rating: 4 → 43.50 for Applicant #2025100014', '2025100014', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:47'),
(1431, 'update', '📝 Qualifying Exam: 0 → 8 | Interview: 0 → 0 | Final Rating: 0 → 4.00 for Applicant #2025100015', '2025100015', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:48'),
(1432, 'update', '📝 Qualifying Exam: 8 → 86 | Interview: 0 → 0 | Final Rating: 4 → 43.00 for Applicant #2025100015', '2025100015', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:49'),
(1433, 'update', '📝 Qualifying Exam: 0 → -1 | Interview: 0 → 0 | Final Rating: 0 → -0.50 for Applicant #2025100016', '2025100016', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:50'),
(1434, 'update', '📝 Qualifying Exam: 0 → 8 | Interview: 0 → 0 | Final Rating: 0 → 4.00 for Applicant #2025100017', '2025100017', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:57'),
(1435, 'update', '📝 Qualifying Exam: 8 → 89 | Interview: 0 → 0 | Final Rating: 4 → 44.50 for Applicant #2025100017', '2025100017', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:57'),
(1436, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100018', '2025100018', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:59'),
(1437, 'update', '📝 Qualifying Exam: 9 → 90 | Interview: 0 → 0 | Final Rating: 5 → 45.00 for Applicant #2025100018', '2025100018', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:27:59'),
(1438, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100019', '2025100019', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:01'),
(1439, 'update', '📝 Qualifying Exam: 9 → 91 | Interview: 0 → 0 | Final Rating: 5 → 45.50 for Applicant #2025100019', '2025100019', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:02'),
(1440, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100020', '2025100020', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:04'),
(1441, 'update', '📝 Qualifying Exam: 9 → 92 | Interview: 0 → 0 | Final Rating: 5 → 46.00 for Applicant #2025100020', '2025100020', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:05'),
(1442, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100021', '2025100021', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:09'),
(1443, 'update', '📝 Qualifying Exam: 9 → 93 | Interview: 0 → 0 | Final Rating: 5 → 46.50 for Applicant #2025100021', '2025100021', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:10'),
(1444, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100022', '2025100022', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:12'),
(1445, 'update', '📝 Qualifying Exam: 9 → 94 | Interview: 0 → 0 | Final Rating: 5 → 47.00 for Applicant #2025100022', '2025100022', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:13'),
(1446, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100024', '2025100024', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:19'),
(1447, 'update', '📝 Qualifying Exam: 9 → 94 | Interview: 0 → 0 | Final Rating: 5 → 47.00 for Applicant #2025100024', '2025100024', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:19'),
(1448, 'update', '📝 Qualifying Exam: -1 → 9 | Interview: 0 → 0 | Final Rating: -1 → 4.50 for Applicant #2025100016', '2025100016', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:19'),
(1449, 'update', '📝 Qualifying Exam: 9 → 96 | Interview: 0 → 0 | Final Rating: 5 → 48.00 for Applicant #2025100016', '2025100016', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:19'),
(1450, 'update', '📝 Qualifying Exam: 99 → 99 | Interview: 0 → 8 | Final Rating: 50 → 53.50 for Applicant #2025100013', '2025100013', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:24'),
(1451, 'update', '📝 Qualifying Exam: 99 → 99 | Interview: 8 → 89 | Final Rating: 54 → 94.00 for Applicant #2025100013', '2025100013', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:24'),
(1452, 'update', '📝 Qualifying Exam: 98 → 98 | Interview: 0 → 9 | Final Rating: 49 → 53.50 for Applicant #2025100012', '2025100012', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:26'),
(1453, 'update', '📝 Qualifying Exam: 98 → 98 | Interview: 9 → 90 | Final Rating: 54 → 94.00 for Applicant #2025100012', '2025100012', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:26'),
(1454, 'update', '📝 Qualifying Exam: 97 → 97 | Interview: 0 → 9 | Final Rating: 49 → 53.00 for Applicant #2025100011', '2025100011', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:28'),
(1455, 'update', '📝 Qualifying Exam: 97 → 97 | Interview: 9 → 91 | Final Rating: 53 → 94.00 for Applicant #2025100011', '2025100011', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:28'),
(1456, 'update', '📝 Qualifying Exam: 96 → 96 | Interview: 0 → 9 | Final Rating: 48 → 52.50 for Applicant #2025100010', '2025100010', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:31'),
(1457, 'update', '📝 Qualifying Exam: 96 → 96 | Interview: 9 → 92 | Final Rating: 53 → 94.00 for Applicant #2025100010', '2025100010', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:34'),
(1458, 'update', '📝 Qualifying Exam: 96 → 96 | Interview: 0 → 9 | Final Rating: 48 → 52.50 for Applicant #2025100016', '2025100016', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:35'),
(1459, 'update', '📝 Qualifying Exam: 96 → 96 | Interview: 9 → 93 | Final Rating: 53 → 94.50 for Applicant #2025100016', '2025100016', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:36'),
(1460, 'update', '📝 Qualifying Exam: 95 → 95 | Interview: 0 → 8 | Final Rating: 48 → 51.50 for Applicant #2025100009', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:38'),
(1461, 'update', '📝 Qualifying Exam: 95 → 95 | Interview: 8 → 0 | Final Rating: 52 → 47.50 for Applicant #2025100009', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:38'),
(1462, 'update', '📝 Qualifying Exam: 95 → 95 | Interview: 0 → 9 | Final Rating: 48 → 52.00 for Applicant #2025100009', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:39'),
(1463, 'update', '📝 Qualifying Exam: 95 → 95 | Interview: 9 → 94 | Final Rating: 52 → 94.50 for Applicant #2025100009', '2025100009', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:39'),
(1464, 'update', '📝 Qualifying Exam: 94 → 94 | Interview: 0 → 9 | Final Rating: 47 → 51.50 for Applicant #2025100008', '2025100008', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:41'),
(1465, 'update', '📝 Qualifying Exam: 94 → 94 | Interview: 9 → 95 | Final Rating: 52 → 94.50 for Applicant #2025100008', '2025100008', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:42'),
(1466, 'update', '📝 Qualifying Exam: 94 → 94 | Interview: 0 → 9 | Final Rating: 47 → 51.50 for Applicant #2025100022', '2025100022', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:44'),
(1467, 'update', '📝 Qualifying Exam: 94 → 94 | Interview: 9 → 96 | Final Rating: 52 → 95.00 for Applicant #2025100022', '2025100022', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:45'),
(1468, 'update', '📝 Qualifying Exam: 94 → 94 | Interview: 0 → 9 | Final Rating: 47 → 51.50 for Applicant #2025100024', '2025100024', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:47'),
(1469, 'update', '📝 Qualifying Exam: 94 → 94 | Interview: 9 → 97 | Final Rating: 52 → 95.50 for Applicant #2025100024', '2025100024', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:47'),
(1470, 'update', '📝 Qualifying Exam: 93 → 93 | Interview: 0 → 9 | Final Rating: 47 → 51.00 for Applicant #2025100007', '2025100007', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:50'),
(1471, 'update', '📝 Qualifying Exam: 93 → 93 | Interview: 9 → 98 | Final Rating: 51 → 95.50 for Applicant #2025100007', '2025100007', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:50'),
(1472, 'update', '📝 Qualifying Exam: 93 → 93 | Interview: 0 → 9 | Final Rating: 47 → 51.00 for Applicant #2025100021', '2025100021', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:54'),
(1473, 'update', '📝 Qualifying Exam: 93 → 93 | Interview: 9 → 99 | Final Rating: 51 → 96.00 for Applicant #2025100021', '2025100021', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:55'),
(1474, 'update', '📝 Qualifying Exam: 92 → 92 | Interview: 0 → 8 | Final Rating: 46 → 50.00 for Applicant #2025100005', '2025100005', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:58'),
(1475, 'update', '📝 Qualifying Exam: 92 → 92 | Interview: 8 → 86 | Final Rating: 50 → 89.00 for Applicant #2025100005', '2025100005', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:28:59'),
(1476, 'update', '📝 Qualifying Exam: 92 → 92 | Interview: 0 → 8 | Final Rating: 46 → 50.00 for Applicant #2025100020', '2025100020', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:02'),
(1477, 'update', '📝 Qualifying Exam: 92 → 92 | Interview: 8 → 87 | Final Rating: 50 → 89.50 for Applicant #2025100020', '2025100020', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:02'),
(1478, 'update', '📝 Qualifying Exam: 91 → 91 | Interview: 0 → 8 | Final Rating: 46 → 49.50 for Applicant #2025100004', '2025100004', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:04'),
(1479, 'update', '📝 Qualifying Exam: 91 → 91 | Interview: 8 → 88 | Final Rating: 50 → 89.50 for Applicant #2025100004', '2025100004', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:04'),
(1480, 'update', '📝 Qualifying Exam: 91 → 91 | Interview: 0 → 8 | Final Rating: 46 → 49.50 for Applicant #2025100019', '2025100019', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:06'),
(1481, 'update', '📝 Qualifying Exam: 91 → 91 | Interview: 8 → 89 | Final Rating: 50 → 90.00 for Applicant #2025100019', '2025100019', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:06'),
(1482, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 0 → 9 | Final Rating: 45 → 49.50 for Applicant #2025100003', '2025100003', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:11'),
(1483, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 9 → 90 | Final Rating: 50 → 90.00 for Applicant #2025100003', '2025100003', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:11'),
(1484, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 0 → 9 | Final Rating: 45 → 49.50 for Applicant #2025100018', '2025100018', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:12'),
(1485, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 9 → 91 | Final Rating: 50 → 90.50 for Applicant #2025100018', '2025100018', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:13'),
(1486, 'update', '📝 Qualifying Exam: 89 → 89 | Interview: 0 → 9 | Final Rating: 45 → 49.00 for Applicant #2025100002', '2025100002', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:15'),
(1487, 'update', '📝 Qualifying Exam: 89 → 89 | Interview: 9 → 92 | Final Rating: 49 → 90.50 for Applicant #2025100002', '2025100002', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:16'),
(1488, 'update', '📝 Qualifying Exam: 89 → 89 | Interview: 0 → 9 | Final Rating: 45 → 49.00 for Applicant #2025100017', '2025100017', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:20'),
(1489, 'update', '📝 Qualifying Exam: 89 → 89 | Interview: 9 → 93 | Final Rating: 49 → 91.00 for Applicant #2025100017', '2025100017', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:21'),
(1490, 'update', '📝 Qualifying Exam: 88 → 88 | Interview: 0 → 9 | Final Rating: 44 → 48.50 for Applicant #2025100001', '2025100001', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:23'),
(1491, 'update', '📝 Qualifying Exam: 88 → 88 | Interview: 9 → 94 | Final Rating: 49 → 91.00 for Applicant #2025100001', '2025100001', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:24'),
(1492, 'update', '📝 Qualifying Exam: 87 → 87 | Interview: 0 → 9 | Final Rating: 44 → 48.00 for Applicant #2025100014', '2025100014', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:26'),
(1493, 'update', '📝 Qualifying Exam: 87 → 87 | Interview: 9 → 95 | Final Rating: 48 → 91.00 for Applicant #2025100014', '2025100014', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:26'),
(1494, 'update', '📝 Qualifying Exam: 86 → 86 | Interview: 0 → 9 | Final Rating: 43 → 47.50 for Applicant #2025100015', '2025100015', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:28'),
(1495, 'update', '📝 Qualifying Exam: 86 → 86 | Interview: 9 → 96 | Final Rating: 48 → 91.00 for Applicant #2025100015', '2025100015', 'ciruela.g.bsinfotech@gmail.com', 'REGISTRAR (224000006) - Cireula, Genny', '2025-12-02 19:29:28'),
(1496, 'submit', '✅ Applicant #2025100022 - Nacu, Adrian Kurt P. submitted their form.', '2025100022', NULL, NULL, '2025-12-02 20:12:26'),
(1497, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:16'),
(1498, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:16'),
(1499, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:16'),
(1500, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:17'),
(1501, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:17'),
(1502, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:18'),
(1503, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:18'),
(1504, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:11:19'),
(1505, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:06'),
(1506, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:06'),
(1507, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:06'),
(1508, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:06'),
(1509, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:07'),
(1510, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:07'),
(1511, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:08'),
(1512, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:14:08'),
(1513, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1514, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1515, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1516, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1517, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1518, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1519, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1520, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1521, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:14'),
(1522, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:15'),
(1523, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:15'),
(1524, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:15'),
(1525, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:17'),
(1526, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:17:17'),
(1527, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:26:35'),
(1528, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:26:35'),
(1529, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:26:35'),
(1530, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:26:36'),
(1531, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:26:36');
INSERT INTO `notifications` (`id`, `type`, `message`, `applicant_number`, `actor_email`, `actor_name`, `timestamp`) VALUES
(1532, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:26:37'),
(1533, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:50'),
(1534, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:51'),
(1535, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:51'),
(1536, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:52'),
(1537, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:52'),
(1538, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:53'),
(1539, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:54'),
(1540, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:54'),
(1541, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:55'),
(1542, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:56'),
(1543, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 13:41:57'),
(1544, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:09:58'),
(1545, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:36'),
(1546, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:36'),
(1547, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:36'),
(1548, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:36'),
(1549, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:37'),
(1550, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:37'),
(1551, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:39'),
(1552, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:10:39'),
(1553, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:14:38'),
(1554, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:14:39'),
(1555, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:15:03'),
(1556, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:15:03'),
(1557, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:15:04'),
(1558, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:35:57'),
(1559, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:35:58'),
(1560, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:35:58'),
(1561, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:35:58'),
(1562, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:35:59'),
(1563, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:36:00'),
(1564, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:36:00'),
(1565, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:36:00'),
(1566, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:36:01'),
(1567, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:37:42'),
(1568, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:37:52'),
(1569, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:41:19'),
(1570, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:41:20'),
(1571, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:41:28'),
(1572, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 14:41:37'),
(1573, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:19'),
(1574, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:19'),
(1575, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:20'),
(1576, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:21'),
(1577, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:21'),
(1578, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:21'),
(1579, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:22'),
(1580, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:22'),
(1581, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:42:23'),
(1582, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:28'),
(1583, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:29'),
(1584, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:29'),
(1585, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:30'),
(1586, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:30'),
(1587, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:31'),
(1588, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:31'),
(1589, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:32'),
(1590, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:43:32'),
(1591, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:34'),
(1592, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:34'),
(1593, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:35'),
(1594, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:35'),
(1595, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:35'),
(1596, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:36'),
(1597, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:36'),
(1598, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:37'),
(1599, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:37'),
(1600, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:44:38'),
(1601, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:39'),
(1602, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:40'),
(1603, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:40'),
(1604, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:41'),
(1605, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:41'),
(1606, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:41'),
(1607, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:42'),
(1608, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:42'),
(1609, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:45:43'),
(1610, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:34'),
(1611, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:35'),
(1612, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:35'),
(1613, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:35'),
(1614, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:36'),
(1615, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:37'),
(1616, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:37'),
(1617, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:38'),
(1618, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:38'),
(1619, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:38'),
(1620, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:39'),
(1621, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:39'),
(1622, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:39'),
(1623, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:40'),
(1624, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:40'),
(1625, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:41'),
(1626, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:46:41'),
(1627, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:21'),
(1628, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:21'),
(1629, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:22'),
(1630, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:22'),
(1631, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:23'),
(1632, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:23'),
(1633, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:23'),
(1634, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:24'),
(1635, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:47:25'),
(1636, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:09'),
(1637, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:09'),
(1638, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:09'),
(1639, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:10'),
(1640, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:10'),
(1641, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:10'),
(1642, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:11'),
(1643, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:12'),
(1644, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:12'),
(1645, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:48:12'),
(1646, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:16'),
(1647, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:16'),
(1648, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:16'),
(1649, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:17'),
(1650, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:17'),
(1651, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:18'),
(1652, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:18'),
(1653, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:19'),
(1654, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:19'),
(1655, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:52'),
(1656, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:52'),
(1657, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:55'),
(1658, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:56'),
(1659, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:56'),
(1660, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:57'),
(1661, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:58'),
(1662, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:58'),
(1663, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:58'),
(1664, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:58'),
(1665, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:59'),
(1666, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:59'),
(1667, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:49:59'),
(1668, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:00'),
(1669, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:37'),
(1670, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:38'),
(1671, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:38'),
(1672, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:39'),
(1673, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:39'),
(1674, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:40'),
(1675, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:41'),
(1676, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:41'),
(1677, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:50:41'),
(1678, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:15'),
(1679, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:15'),
(1680, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:16'),
(1681, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:16'),
(1682, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:17'),
(1683, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:18'),
(1684, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:18'),
(1685, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:19'),
(1686, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 15:51:19'),
(1687, 'submit', '✅ Applicant #2025100026 - Smith, Cristopher D. submitted their form.', '2025100026', NULL, NULL, '2025-12-03 16:07:55'),
(1688, 'submit', '✅ Applicant #2025100025 - Zoro, Roronoa . submitted their form.', '2025100025', NULL, NULL, '2025-12-03 16:15:21'),
(1689, 'submit', '✅ Applicant #2025100027 - Pacia, Clyde J. submitted their form.', '2025100027', NULL, NULL, '2025-12-03 16:18:38'),
(1690, 'email', '📧 Exam schedule email sent for Applicant #2025100027 (Schedule #32)', '2025100027', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:22:26'),
(1691, 'email', '📧 Exam schedule email sent for Applicant #2025100027 (Schedule #32)', '2025100027', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:22:26'),
(1692, 'email', '📧 Exam schedule email sent for Applicant #2025100025 (Schedule #32)', '2025100025', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:22:27'),
(1693, 'email', '📧 Exam schedule email sent for Applicant #2025100026 (Schedule #32)', '2025100026', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:22:28'),
(1694, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:22:55'),
(1695, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:22:55'),
(1696, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:22:55'),
(1697, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:22:55'),
(1698, 'update', '📝 Entrance Exam updated (English: 8 → 90) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:22:59'),
(1699, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1700, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1701, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1702, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1703, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1704, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1705, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1706, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:01'),
(1707, 'update', '📝 Entrance Exam updated (Science: 0 → 0) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:03'),
(1708, 'update', '📝 Entrance Exam updated (Filipino: 0 → 0) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:03'),
(1709, 'update', '📝 Entrance Exam updated (Math: 0 → 0) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:03'),
(1710, 'update', '📝 Entrance Exam updated (Abstract: 0 → 0) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:03'),
(1711, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:05'),
(1712, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:06'),
(1713, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:06'),
(1714, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:06'),
(1715, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:06'),
(1716, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:07'),
(1717, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:07'),
(1718, 'update', '📝 Entrance Exam updated (Science: 0 → 90) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:08'),
(1719, 'update', '📝 Entrance Exam updated (English: 90 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:09'),
(1720, 'update', '📝 Entrance Exam updated (Filipino: 0 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:09'),
(1721, 'update', '📝 Entrance Exam updated (Math: 0 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:09'),
(1722, 'update', '📝 Entrance Exam updated (Abstract: 0 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:09'),
(1723, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:10'),
(1724, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:10'),
(1725, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:10'),
(1726, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:11'),
(1727, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:11'),
(1728, 'update', '📝 Entrance Exam updated (English: 0 → 90) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:12'),
(1729, 'update', '📝 Entrance Exam updated (Filipino: 0 → 90) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:12'),
(1730, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:13'),
(1731, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:14'),
(1732, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:15'),
(1733, 'update', '📝 Entrance Exam updated (Science: 90 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:15'),
(1734, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:15'),
(1735, 'update', '📝 Entrance Exam updated (Math: 0 → 90) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:17'),
(1736, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:17'),
(1737, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:18'),
(1738, 'update', '📝 Entrance Exam updated (Filipino: 90 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:18'),
(1739, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:18'),
(1740, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:20'),
(1741, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:21'),
(1742, 'update', '📝 Entrance Exam updated (Abstract: 0 → 90) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:21'),
(1743, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100025', '2025100025', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:23'),
(1744, 'update', '📝 Entrance Exam updated (Math: 90 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:25'),
(1745, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100026', '2025100026', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:25'),
(1746, 'update', '📝 Entrance Exam updated (Abstract: 90 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:27'),
(1747, 'update', '📝 Entrance Exam updated (Science: 0 → null) for Applicant #2025100027', '2025100027', 'earistmis@gmail.com', 'SYSTEM', '2025-12-03 16:23:57'),
(1748, 'email', '📧 Interview schedule email sent for Applicant #2025100025 (Schedule #2)', '2025100025', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:24:38'),
(1749, 'email', '📧 Interview schedule email sent for Applicant #2025100026 (Schedule #2)', '2025100026', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:24:40'),
(1750, 'email', '📧 Interview schedule email sent for Applicant #2025100027 (Schedule #2)', '2025100027', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:24:43'),
(1751, 'update', '📝 Qualifying Exam: 0 → 90 | Interview: 0 → 0 | Final Rating: 0 → 45.00 for Applicant #2025100025', '2025100025', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:25:07'),
(1752, 'update', '📝 Qualifying Exam: 0 → 90 | Interview: 0 → 0 | Final Rating: 0 → 45.00 for Applicant #2025100026', '2025100026', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:25:08'),
(1753, 'update', '📝 Qualifying Exam: 0 → 90 | Interview: 0 → 0 | Final Rating: 0 → 45.00 for Applicant #2025100027', '2025100027', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:25:09'),
(1754, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 0 → 90 | Final Rating: 45 → 90.00 for Applicant #2025100025', '2025100025', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:25:10'),
(1755, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 0 → 90 | Final Rating: 45 → 90.00 for Applicant #2025100026', '2025100026', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:25:11'),
(1756, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 0 → 90 | Final Rating: 45 → 90.00 for Applicant #2025100027', '2025100027', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick Pacheco', '2025-12-03 16:25:12'),
(1757, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:01'),
(1758, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:01'),
(1759, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:02'),
(1760, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:02'),
(1761, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:03'),
(1762, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:17'),
(1763, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:17'),
(1764, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:01:18'),
(1765, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:00'),
(1766, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:01'),
(1767, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:01'),
(1768, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:02'),
(1769, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:02'),
(1770, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:17'),
(1771, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:18'),
(1772, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:19'),
(1773, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:50'),
(1774, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:50'),
(1775, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:51'),
(1776, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:51'),
(1777, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:52'),
(1778, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:07:52'),
(1779, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:54'),
(1780, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:55'),
(1781, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:55'),
(1782, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:56'),
(1783, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:56'),
(1784, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:57'),
(1785, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:57'),
(1786, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:58'),
(1787, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:58'),
(1788, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:58'),
(1789, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:59'),
(1790, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:09:59'),
(1791, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:11:39'),
(1792, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:12:11'),
(1793, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:12:11'),
(1794, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:12:32'),
(1795, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:12:33'),
(1796, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:12:33');
INSERT INTO `notifications` (`id`, `type`, `message`, `applicant_number`, `actor_email`, `actor_name`, `timestamp`) VALUES
(1797, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:13:15'),
(1798, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:13:16'),
(1799, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:13:16'),
(1800, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:13:56'),
(1801, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:13:56'),
(1802, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:13:57'),
(1803, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:13:57'),
(1804, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:14:19'),
(1805, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:14:20'),
(1806, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:14:20'),
(1807, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:02'),
(1808, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:03'),
(1809, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:04'),
(1810, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:04'),
(1811, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:05'),
(1812, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:05'),
(1813, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:05'),
(1814, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:06'),
(1815, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:06'),
(1816, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:07'),
(1817, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:08'),
(1818, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:08'),
(1819, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:08'),
(1820, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:24'),
(1821, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:24'),
(1822, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:25'),
(1823, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:40'),
(1824, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:40'),
(1825, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:41'),
(1826, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:41'),
(1827, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:41'),
(1828, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:42'),
(1829, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:42'),
(1830, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:42'),
(1831, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:43'),
(1832, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:43'),
(1833, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:44'),
(1834, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:15:44'),
(1835, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:16:00'),
(1836, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:16:00'),
(1837, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:16:01'),
(1838, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:16:01'),
(1839, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:16:12'),
(1840, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:16:13'),
(1841, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 17:16:13'),
(1842, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:00'),
(1843, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:00'),
(1844, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:00'),
(1845, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:01'),
(1846, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:01'),
(1847, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:02'),
(1848, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:02'),
(1849, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:02'),
(1850, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:03'),
(1851, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:03'),
(1852, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:04'),
(1853, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:19:05'),
(1854, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:25'),
(1855, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:25'),
(1856, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:26'),
(1857, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:26'),
(1858, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:27'),
(1859, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:27'),
(1860, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:28'),
(1861, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:28'),
(1862, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:29'),
(1863, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:29'),
(1864, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:30'),
(1865, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:24:30'),
(1866, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:11'),
(1867, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:12'),
(1868, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:12'),
(1869, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:13'),
(1870, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:13'),
(1871, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:14'),
(1872, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:15'),
(1873, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:15'),
(1874, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:16'),
(1875, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:16'),
(1876, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:17'),
(1877, 'submit', 'User #1 - Anuncio, Hazel Fogata successfully submit the student grades in Grading Sheet', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-03 17:25:17'),
(1878, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:37:52'),
(1879, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:38:59'),
(1880, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:39:26'),
(1881, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:03'),
(1882, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:03'),
(1883, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:04'),
(1884, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:04'),
(1885, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:05'),
(1886, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:05'),
(1887, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:05'),
(1888, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:06'),
(1889, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:07'),
(1890, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:07'),
(1891, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:07'),
(1892, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:08'),
(1893, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:08'),
(1894, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:09'),
(1895, 'submit', 'User #9 - Carlos, Ernanie Molina successfully submit the student grades in Grading Sheet', '9', 'ernanie.carlos@earist.edu.ph', 'Carlos, Ernanie Molina', '2025-12-03 21:45:10'),
(1896, 'Printing', 'User #1 - Anuncio, Hazel Fogata printed Faculty Evaluation Report', '1', 'hazel.anuncio@earist.edu.ph', 'Anuncio, Hazel Fogata', '2025-12-04 20:29:14'),
(1897, 'submit', '✅ Applicant #2025100029 - Monacillo, Princess M. submitted their form.', '2025100029', NULL, NULL, '2025-12-05 02:06:31'),
(1898, 'submit', '✅ Applicant #2025100030 - Supnet, April P. submitted their form.', '2025100030', NULL, NULL, '2025-12-05 02:34:40'),
(1899, 'submit', '✅ Applicant #2025100031 - Echague, Kate M. submitted their form.', '2025100031', NULL, NULL, '2025-12-05 02:49:31'),
(1900, 'submit', '✅ Applicant #2025100032 - Ebojo, Darein E. submitted their form.', '2025100032', NULL, NULL, '2025-12-05 03:12:10'),
(1901, 'email', '📧 Exam schedule email sent for Applicant #2025100029 (Schedule #56)', '2025100029', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick  P.', '2025-12-05 03:13:58'),
(1902, 'email', '📧 Exam schedule email sent for Applicant #2025100031 (Schedule #56)', '2025100031', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick  P.', '2025-12-05 03:13:58'),
(1903, 'email', '📧 Exam schedule email sent for Applicant #2025100030 (Schedule #56)', '2025100030', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick  P.', '2025-12-05 03:13:58'),
(1904, 'email', '📧 Exam schedule email sent for Applicant #2025100032 (Schedule #56)', '2025100032', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick  P.', '2025-12-05 03:13:59'),
(1905, 'email', '📧 Exam schedule email sent for Applicant #2025100029 (Schedule #56)', '2025100029', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick  P.', '2025-12-05 03:15:13'),
(1906, 'email', '📧 Exam schedule email sent for Applicant #2025100030 (Schedule #56)', '2025100030', 'berseker.main@gmail.com', 'REGISTRAR (224-08543M) - De La Cruz, Lloyd Cedrick  P.', '2025-12-05 03:15:21'),
(1907, 'upload', '📊 Bulk Qualifying/Interview Exam Scores uploaded by Montano, Mark Anthony Placido', NULL, 'markmontano522@gmail.com', 'Montano, Mark Anthony Placido', '2025-12-05 07:34:06'),
(1908, 'upload', '📊 Bulk Qualifying/Interview Exam Scores uploaded by Montano, Mark Anthony Placido', NULL, 'markmontano522@gmail.com', 'Montano, Mark Anthony Placido', '2025-12-05 07:34:06'),
(1909, 'email', '📧 Exam schedule email sent for Applicant #2025100002 (Schedule #57)', '2025100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-13 14:06:36'),
(1910, 'submit', '✅ Requirements submitted by Applicant #2025100002 - Arcaño, Elhize  E.', '2025100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-13 14:08:52'),
(1911, 'unsubmit', '↩️ Requirements unsubmitted for Applicant #2025100002 - Arcaño, Elhize  E.', '2025100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-13 14:08:58'),
(1912, 'submit', '✅ Applicant #2025100002 - Arcaño, Elhize  E. submitted their form.', '2025100002', NULL, NULL, '2026-01-13 16:32:56'),
(1913, 'submit', '✅ Requirements submitted by Applicant #2025100004 - Ciruela, Genny D.', '2025100004', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-14 21:10:22'),
(1914, 'submit', '✅ Applicant #2025100037 - Montano, Mark Anthony P. submitted their form.', '2025100037', NULL, NULL, '2026-01-15 17:35:43'),
(1915, 'submit', '✅ Requirements submitted by Applicant #2025100027 - Pacia, Clyde J.', '2025100027', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 11:55:58'),
(1916, 'unsubmit', '↩️ Requirements unsubmitted for Applicant #2025100027 - Pacia, Clyde J.', '2025100027', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 11:56:00'),
(1917, 'submit', '✅ Applicant #2025100038 - Montano, Mark P. submitted their form.', '2025100038', NULL, NULL, '2026-01-21 12:44:23'),
(1918, 'submit', '✅ Applicant #2025100039 - Montano, Mark Anthony P. submitted their form.', '2025100039', NULL, NULL, '2026-01-21 13:13:14'),
(1919, 'email', '📧 Exam schedule email sent for Applicant #2025100038 (Schedule #41)', '2025100038', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 13:33:46'),
(1920, 'email', '📧 Interview schedule email sent for Applicant #2025100038 (Schedule #1)', '2025100038', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 13:37:46'),
(1921, 'update', '📝 Qualifying Exam: 0 → 10 | Interview: 0 → 0 | Final Rating: 0 → 5.00 for Applicant #2025100038', '2025100038', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 13:38:11'),
(1922, 'update', '📝 Qualifying Exam: 10 → 100 | Interview: 0 → 0 | Final Rating: 5 → 50.00 for Applicant #2025100038', '2025100038', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 13:38:11'),
(1923, 'update', '📝 Qualifying Exam: 100 → 100 | Interview: 0 → 9 | Final Rating: 50 → 54.50 for Applicant #2025100038', '2025100038', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 13:38:12'),
(1924, 'update', '📝 Qualifying Exam: 100 → 100 | Interview: 9 → 90 | Final Rating: 55 → 95.00 for Applicant #2025100038', '2025100038', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 13:38:13'),
(1925, 'submit', '✅ Requirements submitted by Applicant #2025100038 - Montano, Mark P.', '2025100038', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-01-21 13:39:05'),
(1926, 'submit', '✅ Applicant #2025100040 - Montano, Mark Anthony P. submitted their form.', '2025100040', NULL, NULL, '2026-02-02 17:49:15'),
(1927, 'submit', '✅ Applicant #2025100041 - ffas, hdfh f. submitted their form.', '2025100041', NULL, NULL, '2026-02-02 19:04:09'),
(1928, 'submit', '✅ Applicant #2026100042 - Montano, Mark Anthony P. submitted their form.', '2026100042', NULL, NULL, '2026-02-03 09:22:31'),
(1929, 'submit', '✅ Applicant #2026100043 - Montano, Mark Anthony P. submitted their form.', '2026100043', NULL, NULL, '2026-02-03 10:41:56'),
(1930, 'email', '📧 Exam schedule email sent for Applicant #2025100040 (Schedule #56)', '2025100040', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 11:03:38'),
(1931, 'submit', '✅ Applicant #2026100001 - Mecasio, Arden B. submitted their form.', '2026100001', NULL, NULL, '2026-02-03 23:01:24'),
(1932, 'submit', '✅ Applicant #2026100001 - Mecasio, Arden B. submitted their form.', '2026100001', NULL, NULL, '2026-02-03 23:02:43'),
(1933, 'submit', '✅ Applicant #2026100001 - Mecasio, Arden B. submitted their form.', '2026100001', NULL, NULL, '2026-02-03 23:02:54'),
(1934, 'email', '📧 Exam schedule email sent for Applicant #2026100001 (Schedule #56)', '2026100001', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 23:33:57'),
(1935, 'email', '📧 Exam schedule email sent for Applicant #2026100001 (Schedule #26)', '2026100001', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 23:36:19'),
(1936, 'email', '📧 Interview schedule email sent for Applicant #2026100001 (Schedule #3)', '2026100001', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 23:46:44'),
(1937, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2026100001', '2026100001', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 23:49:24'),
(1938, 'update', '📝 Qualifying Exam: 9 → 90 | Interview: 0 → 0 | Final Rating: 5 → 45.00 for Applicant #2026100001', '2026100001', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 23:49:24'),
(1939, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 0 → 9 | Final Rating: 45 → 49.50 for Applicant #2026100001', '2026100001', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 23:49:25'),
(1940, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 9 → 90 | Final Rating: 50 → 90.00 for Applicant #2026100001', '2026100001', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-03 23:49:26'),
(1941, 'submit', '✅ Applicant #2026100002 - Torres, Aira Lorainne S. submitted their form.', '2026100002', NULL, NULL, '2026-02-04 09:54:40'),
(1942, 'email', '📧 Exam schedule email sent for Applicant #2026100002 (Schedule #56)', '2026100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-04 10:05:26'),
(1943, 'email', '📧 Interview schedule email sent for Applicant #2026100002 (Schedule #1)', '2026100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-04 10:07:03'),
(1944, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2026100002', '2026100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-04 10:07:26'),
(1945, 'update', '📝 Qualifying Exam: 9 → 95 | Interview: 0 → 0 | Final Rating: 5 → 47.50 for Applicant #2026100002', '2026100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-04 10:07:27'),
(1946, 'update', '📝 Qualifying Exam: 95 → 95 | Interview: 0 → 9 | Final Rating: 48 → 52.00 for Applicant #2026100002', '2026100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-04 10:07:30'),
(1947, 'update', '📝 Qualifying Exam: 95 → 95 | Interview: 9 → 91 | Final Rating: 52 → 93.00 for Applicant #2026100002', '2026100002', 'markmontano522@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-04 10:07:34'),
(1948, 'submit', '✅ Applicant #2025100003 - Aguile, Fred H. submitted their form.', '2025100003', NULL, NULL, '2026-02-08 16:23:01'),
(1949, 'email', '📧 Schedule email sent to Applicant #2025100003', '2025100003', '4rdenmecasi0@gmail.com', 'REGISTRAR (224-06342M) - \n      Montano, Mark Anthony Placido', '2026-02-08 16:27:44'),
(1950, 'email', '📧 Interview schedule email sent for Applicant #2025100003 (Schedule #3)', '2025100003', '4rdenmecasi0@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-08 16:37:42'),
(1951, 'email', '📧 Interview schedule email sent for Applicant #2025100003 (Schedule #4)', '2025100003', '4rdenmecasi0@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-08 16:56:26'),
(1952, 'update', '📝 Qualifying Exam: 0 → 9 | Interview: 0 → 0 | Final Rating: 0 → 4.50 for Applicant #2025100003', '2025100003', '4rdenmecasi0@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-08 16:57:00'),
(1953, 'update', '📝 Qualifying Exam: 9 → 90 | Interview: 0 → 0 | Final Rating: 5 → 45.00 for Applicant #2025100003', '2025100003', '4rdenmecasi0@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-08 16:57:01'),
(1954, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 0 → 9 | Final Rating: 45 → 49.50 for Applicant #2025100003', '2025100003', '4rdenmecasi0@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-08 16:57:03'),
(1955, 'update', '📝 Qualifying Exam: 90 → 90 | Interview: 9 → 93 | Final Rating: 50 → 91.50 for Applicant #2025100003', '2025100003', '4rdenmecasi0@gmail.com', 'REGISTRAR (224-06342M) - Montano, Mark Anthony Placido', '2026-02-08 16:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `person_status_table`
--

CREATE TABLE `person_status_table` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `applicant_id` bigint(20) NOT NULL,
  `exam_status` tinyint(4) DEFAULT 0,
  `interview_status` int(11) DEFAULT 0,
  `requirements` tinyint(4) DEFAULT 0,
  `residency` tinyint(4) DEFAULT 0,
  `student_registration_status` tinyint(4) DEFAULT 0,
  `exam_result` decimal(11,0) DEFAULT 0,
  `hs_ave` int(11) DEFAULT 0,
  `qualifying_result` int(11) DEFAULT 0,
  `interview_result` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person_status_table`
--

INSERT INTO `person_status_table` (`id`, `person_id`, `applicant_id`, `exam_status`, `interview_status`, `requirements`, `residency`, `student_registration_status`, `exam_result`, `hs_ave`, `qualifying_result`, `interview_result`) VALUES
(155, 44, 2026100001, 1, 0, 0, 0, 0, 90, 0, 90, 90),
(161, 45, 2026100002, 1, 0, 0, 0, 0, 93, 0, 95, 91),
(166, 46, 2025100003, 1, 0, 0, 0, 0, 92, 0, 90, 93),
(173, 47, 2026100004, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `person_table`
--

CREATE TABLE `person_table` (
  `person_id` int(11) NOT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `campus` int(11) DEFAULT NULL,
  `academicProgram` varchar(100) DEFAULT NULL,
  `classifiedAs` varchar(50) DEFAULT NULL,
  `applyingAs` varchar(100) DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  `program2` varchar(100) DEFAULT NULL,
  `program3` varchar(100) DEFAULT NULL,
  `yearLevel` varchar(30) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `lrnNumber` varchar(20) DEFAULT NULL,
  `nolrnNumber` int(5) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `pwdMember` int(5) DEFAULT NULL,
  `pwdType` varchar(50) DEFAULT NULL,
  `pwdId` varchar(50) DEFAULT NULL,
  `birthOfDate` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthPlace` varchar(255) DEFAULT NULL,
  `languageDialectSpoken` varchar(255) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `civilStatus` varchar(50) DEFAULT NULL,
  `tribeEthnicGroup` varchar(50) DEFAULT NULL,
  `cellphoneNumber` varchar(20) DEFAULT NULL,
  `emailAddress` varchar(100) DEFAULT NULL,
  `presentStreet` varchar(255) DEFAULT NULL,
  `presentBarangay` varchar(100) DEFAULT NULL,
  `presentZipCode` varchar(10) DEFAULT NULL,
  `presentRegion` varchar(100) DEFAULT NULL,
  `presentProvince` varchar(100) DEFAULT NULL,
  `presentMunicipality` varchar(100) DEFAULT NULL,
  `presentDswdHouseholdNumber` varchar(50) DEFAULT NULL,
  `sameAsPresentAddress` int(5) DEFAULT NULL,
  `permanentStreet` varchar(255) DEFAULT NULL,
  `permanentBarangay` varchar(100) DEFAULT NULL,
  `permanentZipCode` varchar(10) DEFAULT NULL,
  `permanentRegion` varchar(75) DEFAULT NULL,
  `permanentProvince` varchar(75) DEFAULT NULL,
  `permanentMunicipality` varchar(75) DEFAULT NULL,
  `permanentDswdHouseholdNumber` varchar(50) DEFAULT NULL,
  `solo_parent` int(5) DEFAULT NULL,
  `father_deceased` int(5) DEFAULT NULL,
  `father_family_name` varchar(100) DEFAULT NULL,
  `father_given_name` varchar(100) DEFAULT NULL,
  `father_middle_name` varchar(100) DEFAULT NULL,
  `father_ext` varchar(10) DEFAULT NULL,
  `father_nickname` varchar(50) DEFAULT NULL,
  `father_education` int(5) NOT NULL,
  `father_education_level` varchar(100) DEFAULT NULL,
  `father_last_school` varchar(100) DEFAULT NULL,
  `father_course` varchar(100) DEFAULT NULL,
  `father_year_graduated` varchar(10) DEFAULT NULL,
  `father_school_address` varchar(255) DEFAULT NULL,
  `father_contact` varchar(20) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_employer` varchar(100) DEFAULT NULL,
  `father_income` varchar(20) DEFAULT NULL,
  `father_email` varchar(100) DEFAULT NULL,
  `mother_deceased` int(5) DEFAULT NULL,
  `mother_family_name` varchar(100) DEFAULT NULL,
  `mother_given_name` varchar(100) DEFAULT NULL,
  `mother_middle_name` varchar(100) DEFAULT NULL,
  `mother_ext` varchar(10) DEFAULT NULL,
  `mother_nickname` varchar(50) DEFAULT NULL,
  `mother_education` int(5) NOT NULL,
  `mother_education_level` varchar(100) DEFAULT NULL,
  `mother_last_school` varchar(100) DEFAULT NULL,
  `mother_course` varchar(100) DEFAULT NULL,
  `mother_year_graduated` varchar(10) DEFAULT NULL,
  `mother_school_address` varchar(255) DEFAULT NULL,
  `mother_contact` varchar(20) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `mother_employer` varchar(100) DEFAULT NULL,
  `mother_income` varchar(20) DEFAULT NULL,
  `mother_email` varchar(100) DEFAULT NULL,
  `guardian` varchar(100) DEFAULT NULL,
  `guardian_family_name` varchar(100) DEFAULT NULL,
  `guardian_given_name` varchar(100) DEFAULT NULL,
  `guardian_middle_name` varchar(100) DEFAULT NULL,
  `guardian_ext` varchar(20) DEFAULT NULL,
  `guardian_nickname` varchar(50) DEFAULT NULL,
  `guardian_address` varchar(255) DEFAULT NULL,
  `guardian_contact` varchar(20) DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `annual_income` varchar(50) DEFAULT NULL,
  `schoolLevel` varchar(50) DEFAULT NULL,
  `schoolLastAttended` varchar(100) DEFAULT NULL,
  `schoolAddress` varchar(255) DEFAULT NULL,
  `courseProgram` varchar(100) DEFAULT NULL,
  `honor` varchar(100) DEFAULT NULL,
  `generalAverage` decimal(5,2) DEFAULT NULL,
  `yearGraduated` int(11) DEFAULT NULL,
  `schoolLevel1` varchar(50) DEFAULT NULL,
  `schoolLastAttended1` varchar(100) DEFAULT NULL,
  `schoolAddress1` varchar(255) DEFAULT NULL,
  `courseProgram1` varchar(100) DEFAULT NULL,
  `honor1` varchar(100) DEFAULT NULL,
  `generalAverage1` decimal(5,2) DEFAULT NULL,
  `yearGraduated1` int(11) DEFAULT NULL,
  `strand` varchar(100) DEFAULT NULL,
  `cough` int(11) DEFAULT NULL,
  `colds` int(11) DEFAULT NULL,
  `fever` int(11) DEFAULT NULL,
  `asthma` int(11) DEFAULT NULL,
  `faintingSpells` int(11) DEFAULT NULL,
  `heartDisease` int(11) DEFAULT NULL,
  `tuberculosis` int(11) DEFAULT NULL,
  `frequentHeadaches` int(11) DEFAULT NULL,
  `hernia` int(11) DEFAULT NULL,
  `chronicCough` int(11) DEFAULT NULL,
  `headNeckInjury` int(11) DEFAULT NULL,
  `hiv` int(11) DEFAULT NULL,
  `highBloodPressure` int(11) DEFAULT NULL,
  `diabetesMellitus` int(11) DEFAULT NULL,
  `allergies` int(11) DEFAULT NULL,
  `cancer` int(11) DEFAULT NULL,
  `smokingCigarette` int(11) DEFAULT NULL,
  `alcoholDrinking` int(11) DEFAULT NULL,
  `hospitalized` int(11) DEFAULT NULL,
  `hospitalizationDetails` varchar(255) DEFAULT NULL,
  `medications` varchar(255) DEFAULT NULL,
  `hadCovid` int(11) DEFAULT NULL,
  `covidDate` varchar(50) DEFAULT NULL,
  `vaccine1Brand` varchar(50) DEFAULT NULL,
  `vaccine1Date` varchar(50) DEFAULT NULL,
  `vaccine2Brand` varchar(50) DEFAULT NULL,
  `vaccine2Date` varchar(50) DEFAULT NULL,
  `booster1Brand` varchar(50) DEFAULT NULL,
  `booster1Date` varchar(50) DEFAULT NULL,
  `booster2Brand` varchar(50) DEFAULT NULL,
  `booster2Date` varchar(50) DEFAULT NULL,
  `chestXray` varchar(100) DEFAULT NULL,
  `cbc` varchar(100) DEFAULT NULL,
  `urinalysis` varchar(100) DEFAULT NULL,
  `otherworkups` varchar(255) DEFAULT NULL,
  `symptomsToday` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `termsOfAgreement` int(10) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `current_step` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `person_table`
--

INSERT INTO `person_table` (`person_id`, `profile_img`, `campus`, `academicProgram`, `classifiedAs`, `applyingAs`, `program`, `program2`, `program3`, `yearLevel`, `last_name`, `first_name`, `middle_name`, `extension`, `nickname`, `height`, `weight`, `lrnNumber`, `nolrnNumber`, `gender`, `pwdMember`, `pwdType`, `pwdId`, `birthOfDate`, `age`, `birthPlace`, `languageDialectSpoken`, `citizenship`, `religion`, `civilStatus`, `tribeEthnicGroup`, `cellphoneNumber`, `emailAddress`, `presentStreet`, `presentBarangay`, `presentZipCode`, `presentRegion`, `presentProvince`, `presentMunicipality`, `presentDswdHouseholdNumber`, `sameAsPresentAddress`, `permanentStreet`, `permanentBarangay`, `permanentZipCode`, `permanentRegion`, `permanentProvince`, `permanentMunicipality`, `permanentDswdHouseholdNumber`, `solo_parent`, `father_deceased`, `father_family_name`, `father_given_name`, `father_middle_name`, `father_ext`, `father_nickname`, `father_education`, `father_education_level`, `father_last_school`, `father_course`, `father_year_graduated`, `father_school_address`, `father_contact`, `father_occupation`, `father_employer`, `father_income`, `father_email`, `mother_deceased`, `mother_family_name`, `mother_given_name`, `mother_middle_name`, `mother_ext`, `mother_nickname`, `mother_education`, `mother_education_level`, `mother_last_school`, `mother_course`, `mother_year_graduated`, `mother_school_address`, `mother_contact`, `mother_occupation`, `mother_employer`, `mother_income`, `mother_email`, `guardian`, `guardian_family_name`, `guardian_given_name`, `guardian_middle_name`, `guardian_ext`, `guardian_nickname`, `guardian_address`, `guardian_contact`, `guardian_email`, `annual_income`, `schoolLevel`, `schoolLastAttended`, `schoolAddress`, `courseProgram`, `honor`, `generalAverage`, `yearGraduated`, `schoolLevel1`, `schoolLastAttended1`, `schoolAddress1`, `courseProgram1`, `honor1`, `generalAverage1`, `yearGraduated1`, `strand`, `cough`, `colds`, `fever`, `asthma`, `faintingSpells`, `heartDisease`, `tuberculosis`, `frequentHeadaches`, `hernia`, `chronicCough`, `headNeckInjury`, `hiv`, `highBloodPressure`, `diabetesMellitus`, `allergies`, `cancer`, `smokingCigarette`, `alcoholDrinking`, `hospitalized`, `hospitalizationDetails`, `medications`, `hadCovid`, `covidDate`, `vaccine1Brand`, `vaccine1Date`, `vaccine2Brand`, `vaccine2Date`, `booster1Brand`, `booster1Date`, `booster2Brand`, `booster2Date`, `chestXray`, `cbc`, `urinalysis`, `otherworkups`, `symptomsToday`, `remarks`, `termsOfAgreement`, `created_at`, `current_step`) VALUES
(44, '2026100001_1by1_2026.png', 1, 'Undergraduate', 'Freshman (First Year)', 'Senior High School Graduate', '15', NULL, NULL, 'First Year', 'Mecasio', 'Arden', 'Bandoja', NULL, 'Arden', '151', '45', '123456789012', NULL, 0, NULL, NULL, NULL, '2003-04-10', 22, 'Manila, Philippines', 'Tagalog, English', 'FILIPINO', 'Catholic', 'Single', 'None', '639561692738', 'mecasio.a.bsinfotech@gmail.com', 'Manunggal St.', 'Ligid-Tipas', '1113', 'National Capital Region (NCR)', 'Metro Manila, Fourth District', 'Taguig City', 'DSWD123456', 1, 'Manunggal St.', 'Ligid-Tipas', '1113', 'National Capital Region (NCR)', 'Metro Manila, Fourth District', 'Taguig City', 'DSWD123456', NULL, NULL, 'Mecasio', 'Rolando', 'Godines', NULL, 'Roy', 1, NULL, NULL, NULL, NULL, NULL, '981923213', 'Engineer', 'ABC Corp', '50000', 'rolando.mecasio@gmail.com', NULL, 'Mecasio', 'Lourdes', 'Bandoja', NULL, 'Inday', 1, NULL, NULL, NULL, NULL, NULL, '9207556916', 'CEO', 'asd', '45000', 'lourdes.mecasio@gmail.com', 'Brother/Sister', 'Mecasio', 'Arden', 'Bandoja', NULL, 'Benny', 'Manunggal St.', '9192233445', 'mecasio.a.bsinfotech@gmail.com', '80,000 to 135,000', 'High School/Junior High School', 'Rizal High School', 'manila', 'Bachelor of Science Mjor in Information Technology', 'With Honors', 89.70, 2022, 'Senior High School', 'asdad', 'asdas', 'asda', 'dasda', 90.00, 2022, 'Information and Communications Technology (ICT)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-01-31', 1),
(45, '2026100002_1by1_2026.jpg', 1, 'Undergraduate', 'Freshman (First Year)', 'Senior High School Graduate', '15', NULL, NULL, 'First Year', 'Torres', 'Aira Lorainne', 'Santos', NULL, 'Lorainne', '152', '63', 'No LRN Number', NULL, 1, NULL, NULL, NULL, '2002-09-06', 23, 'Manila, Philippines', 'Tagalog, English', 'FILIPINO', 'Catholic', 'Single', 'None', '9198246351', 'montano.ma.bsinfotech@gmail.com', 'Peñalosa Street', 'Barangay 60', '1012', 'National Capital Region (NCR)', 'Metro Manila, First District', 'Tondo I / Ii', 'None', 1, 'Peñalosa Street', 'Barangay 60', '1012', 'National Capital Region (NCR)', 'Metro Manila, First District', 'Tondo I / Ii', 'None', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Torres', 'Aileen', 'Santos', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '9217650044', 'Distributor', 'Zynergia', '30000', 'aileen_ilu@yahoo.com', 'Mother', 'Torres', 'Aira Lorainne', 'Santos', NULL, NULL, '736 Peñalosa Street Tondo Manila', '9217650044', 'aileen_ilu@yahoo.com', '80,000 and below', 'High School/Junior High School', 'Ramon Magsaysay High School', 'España Manila', NULL, 'With High Honors', 92.00, 2017, 'Senior High School', 'Arellano University', 'Mendiola', 'ICT', 'With highest honor', 95.00, 2021, 'Information and Communications Technology (ICT)', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-01-30', 1),
(46, '2025100003_1by1_2026.png', 1, 'Undergraduate', 'Freshman (First Year)', 'Senior High School Graduate', '15', NULL, NULL, 'First Year', 'Aguile', 'Fred', 'Hel', NULL, 'Jof', '151', '65', '123456789012', NULL, 0, NULL, NULL, NULL, '2002-04-10', 23, 'Manila, Philippines', 'Tagalog, English', 'FILIPINO', 'Baptist', 'Single', 'None', '639561692738', 'freddiellove9@gmail.com', 'Manunggal St.', 'Barangay 13', '1113', 'National Capital Region (NCR)', 'Metro Manila, Fourth District', 'Pasay City', '241526172', 1, 'Manunggal St.', 'Barangay 13', '1113', 'National Capital Region (NCR)', 'Metro Manila, Fourth District', 'Pasay City', '241526172', NULL, NULL, 'Rolando', 'Mecasio', 'Godines', NULL, 'Roy', 1, NULL, NULL, NULL, NULL, NULL, '925371921', 'Mechanic', 'Heather', '45000', 'rolandomecasio@gmail.com', NULL, 'Lourdes', 'Mecasio', 'Bandoja', NULL, 'Inday', 1, NULL, NULL, NULL, NULL, NULL, '09221234567', 'Accountant', 'asd', '45000', 'lourdesmecasio@gmail.com', 'Uncle', 's', 's', 's', NULL, 's', 'we@gmail.com', '1231212', 'gsaie@gmail.com', '80,000 to 135,000', 'High School/Junior High School', 'ACLC Manila', 'Pasig City', 'Bachelor of Science Mjor in Information Technology', 'With Honors', 89.70, 2022, 'Senior High School', 'asdad', 'asdas', 'asda', 'dasda', 90.00, 2022, 'Science, Technology, Engineering, and Mathematics (STEM)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-01-28', 1),
(47, '2026100004_1by1_2026.jpg', 1, 'Undergraduate', 'Freshman (First Year)', 'Senior High School Graduate', '15', NULL, NULL, 'First Year', 'Montano', 'Mark Anthony', 'Placido', NULL, 'Mark', '165', '57', '123456789012', NULL, 0, NULL, NULL, NULL, '2003-02-19', 22, 'Manila, Philippines', 'Tagalog, English', 'BOTSWANIAN', 'Protestant', 'Single', 'Bantoanon', '639953242510', 'markmontano999@gmail.com', '19 G Dona yayang Street Libis', 'Anislag', '4100', 'Region VII (Central Visayas)', 'Bohol', 'Corella', 'DSWD123456', 1, '19 G Dona yayang Street Libis', 'Anislag', '4100', 'Region VII (Central Visayas)', 'Bohol', 'Corella', 'DSWD123456', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mother in Law', 'Montano', 'Mark Anthony', 'Placido', 'I', 'Benny', '19 G Dona yayang Street Libis', '09953242510', 'montano.ma.bsinfotech@gmail.com', '250,000 to 500,000', 'High School/Junior High School', 'Rizal High School', 'Pasig City', NULL, 'With Honors', 92.50, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_slots`
--

CREATE TABLE `program_slots` (
  `slot_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `max_slots` int(11) NOT NULL,
  `active_school_year_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_slots`
--

INSERT INTO `program_slots` (`slot_id`, `curriculum_id`, `max_slots`, `active_school_year_id`, `created_at`) VALUES
(20, 15, 30, 66, '2026-02-08 08:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `requirements_table`
--

CREATE TABLE `requirements_table` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `short_label` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT 'Regular',
  `is_verifiable` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requirements_table`
--

INSERT INTO `requirements_table` (`id`, `description`, `short_label`, `label`, `category`, `is_verifiable`) VALUES
(1, 'PSA Birth Certificate', 'PSA', NULL, 'Regular', 1),
(2, 'Form 138 (Grade 12, 1st Semester / No failing Grades)', 'F138', NULL, 'Regular', 1),
(3, 'Certificate of Good Moral Character', 'CGMC', NULL, 'Regular', 1),
(4, 'Certificate belonging to Graduating Class', 'CBGC', NULL, 'Regular', 1),
(5, 'Copy of Vaccine Card (1st and 2nd Dose) (Optional)', 'CVC', NULL, 'Medical', 1);

-- --------------------------------------------------------

--
-- Table structure for table `requirement_uploads`
--

CREATE TABLE `requirement_uploads` (
  `upload_id` int(11) NOT NULL,
  `requirements_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `submitted_documents` int(11) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `original_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `document_status` varchar(255) DEFAULT NULL,
  `missing_documents` varchar(255) DEFAULT NULL,
  `registrar_status` int(11) DEFAULT NULL,
  `submitted_medical` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `last_updated_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `requirement_uploads`
--

INSERT INTO `requirement_uploads` (`upload_id`, `requirements_id`, `person_id`, `submitted_documents`, `file_path`, `original_name`, `remarks`, `status`, `document_status`, `missing_documents`, `registrar_status`, `submitted_medical`, `created_at`, `last_updated_by`) VALUES
(202, 1, 44, NULL, '2026100001_PSA_2026.pdf', 'Capstoen-ERD.pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-03 23:03:09', '1'),
(203, 2, 44, NULL, '2026100001_F138_2026.pdf', 'Supplemental-Form-2025-4 (5).pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-03 23:03:13', '1'),
(204, 3, 44, NULL, '2026100001_CGMC_2026.pdf', 'Supplemental-Form-2025-4 (3).pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-03 23:03:17', '1'),
(205, 4, 44, NULL, '2026100001_CBGC_2026.pdf', 'Supplemental-Form-2025-4.pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-03 23:03:22', '1'),
(206, 5, 44, NULL, '2026100001_CVC_2026.pdf', 'Supplemental-Form-2025-4.pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-03 23:03:31', '1'),
(207, 1, 45, NULL, '2026100002_PSA_2026.jpg', '594356692_1350671940405508_2882115776391298937_n.jpg', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-04 09:58:37', '1'),
(208, 2, 45, NULL, '2026100002_F138_2026.webp', '594310936_1970981603838297_2798307342816336025_n.webp', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-04 09:59:13', '1'),
(209, 3, 45, NULL, '2026100002_CGMC_2026.png', '594039884_877176391537851_4730275361593935458_n (1).png', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-04 09:59:17', '1'),
(210, 4, 45, NULL, '2026100002_CBGC_2026.jpg', '438246372_1112634963353842_3477992500473611072_n.jpg', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-04 09:59:22', '1'),
(211, 5, 45, NULL, '2026100002_CVC_2026.jpg', '590437545_4218540075079399_2149840376645997838_n.jpg', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-04 09:59:29', '1'),
(212, 1, 46, NULL, '2025100003_PSA_2026.pdf', '202600044_Certificate_Of_Registration.pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-08 16:23:15', '1'),
(213, 2, 46, NULL, '2025100003_F138_2026.pdf', 'Capstoen-ERD.pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-08 16:23:19', '1'),
(214, 3, 46, NULL, '2025100003_CGMC_2026.pdf', 'Supplemental-Form-2025-4 (4).pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-08 16:23:24', '1'),
(215, 4, 46, NULL, '2025100003_CBGC_2026.pdf', 'Supplemental-Form-2025-4 (4).pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-08 16:23:28', '1'),
(216, 5, 46, NULL, '2025100003_CVC_2026.pdf', 'Supplemental-Form-2025-4 (3).pdf', NULL, 1, 'Documents Verified & ECAT', NULL, NULL, 0, '2026-02-08 16:23:33', '1');

-- --------------------------------------------------------

--
-- Table structure for table `signature_table`
--

CREATE TABLE `signature_table` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `signature_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signature_table`
--

INSERT INTO `signature_table` (`id`, `full_name`, `signature_image`, `created_at`) VALUES
(1, 'Mark Anthony P. Montano', 'signature/signature_1769396836212.png', '2026-01-26 03:07:16'),
(2, 'marku', 'signature/signature_1769406670491.png', '2026-01-26 05:51:10'),
(3, 'mark', 'signature/signature_1769408713846.jpg', '2026-01-26 06:25:13'),
(4, 'Mark Anthony P. Montano', 'signature/signature_1769409775293.png', '2026-01-26 06:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `user_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'applicant',
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`user_id`, `person_id`, `email`, `password`, `role`, `status`) VALUES
(44, 44, 'mecasio.a.bsinfotech@gmail.com', '$2b$10$pXv9731bnwfCCCed2xsUMe6a2qtw1dtZn6UBUTGkOJ5zLnoBoh00.', 'applicant', NULL),
(45, 45, 'montano.ma.bsinfotech@gmail.com', '$2b$10$Q1QY9KCQzuzcnmgQDd0QfOo/Aq1FZ70NFcy9euRoh3LEyr3IZYCXC', 'applicant', NULL),
(46, 46, 'freddiellove9@gmail.com', '$2b$10$8s9D07ILcF3SJMCJMwlrJ.V064MiL6KmG0sRa50bmtrl6flP1JUli', 'applicant', NULL),
(47, 47, 'markmontano999@gmail.com', '$2b$10$we877nYee.uUQgr5qOX4LOrEZHEAJ3WFW6h/pFOLZXoI1t.yXwiSO', 'applicant', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verify_applicants`
--

CREATE TABLE `verify_applicants` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `applicant_id` varchar(13) NOT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verify_applicants`
--

INSERT INTO `verify_applicants` (`id`, `schedule_id`, `applicant_id`, `email_sent`) VALUES
(1, NULL, '2026100001', 1),
(2, NULL, '2026100002', 0),
(3, 3, '2025100003', 0);

-- --------------------------------------------------------

--
-- Table structure for table `verify_document_schedule`
--

CREATE TABLE `verify_document_schedule` (
  `schedule_id` int(11) NOT NULL,
  `schedule_date` varchar(255) NOT NULL,
  `building_description` varchar(150) NOT NULL,
  `room_description` varchar(150) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `evaluator` varchar(150) DEFAULT NULL,
  `room_quota` int(11) DEFAULT 0,
  `active_school_year_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verify_document_schedule`
--

INSERT INTO `verify_document_schedule` (`schedule_id`, `schedule_date`, `building_description`, `room_description`, `start_time`, `end_time`, `evaluator`, `room_quota`, `active_school_year_id`, `created_at`) VALUES
(3, '2026-04-03', 'NUDAS HALL', 'CCS Room 202', '10:00:00', '12:00:00', 'Purok 4', 20, NULL, '2026-02-08 17:34:40'),
(4, '2026-10-04', 'NUDAS HALL', 'CCS Room 202', '10:00:00', '12:00:00', 'Mark', 20, 66, '2026-02-11 07:45:49'),
(5, '2026-02-11', 'NUDAS HALL', 'CCS Room 202', '08:00:00', '10:00:00', 'mARK', 10, 66, '2026-02-11 07:57:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission_exam`
--
ALTER TABLE `admission_exam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_person` (`person_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applicant_numbering_table`
--
ALTER TABLE `applicant_numbering_table`
  ADD PRIMARY KEY (`applicant_number`),
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `applied_programs`
--
ALTER TABLE `applied_programs`
  ADD PRIMARY KEY (`applied_id`);

--
-- Indexes for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `entrance_exam_schedule`
--
ALTER TABLE `entrance_exam_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `exam_applicants`
--
ALTER TABLE `exam_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty_evaluation_table`
--
ALTER TABLE `faculty_evaluation_table`
  ADD PRIMARY KEY (`eval_id`);

--
-- Indexes for table `interview_applicants`
--
ALTER TABLE `interview_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interview_exam_schedule`
--
ALTER TABLE `interview_exam_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `medical_requirements`
--
ALTER TABLE `medical_requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_status_table`
--
ALTER TABLE `person_status_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_person_id` (`person_id`);

--
-- Indexes for table `person_table`
--
ALTER TABLE `person_table`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `program_slots`
--
ALTER TABLE `program_slots`
  ADD PRIMARY KEY (`slot_id`);

--
-- Indexes for table `requirements_table`
--
ALTER TABLE `requirements_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requirement_uploads`
--
ALTER TABLE `requirement_uploads`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `signature_table`
--
ALTER TABLE `signature_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `verify_applicants`
--
ALTER TABLE `verify_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_document_schedule`
--
ALTER TABLE `verify_document_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admission_exam`
--
ALTER TABLE `admission_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1529;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `applied_programs`
--
ALTER TABLE `applied_programs`
  MODIFY `applied_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `company_settings`
--
ALTER TABLE `company_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `entrance_exam_schedule`
--
ALTER TABLE `entrance_exam_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `exam_applicants`
--
ALTER TABLE `exam_applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `faculty_evaluation_table`
--
ALTER TABLE `faculty_evaluation_table`
  MODIFY `eval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview_applicants`
--
ALTER TABLE `interview_applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `interview_exam_schedule`
--
ALTER TABLE `interview_exam_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medical_requirements`
--
ALTER TABLE `medical_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1956;

--
-- AUTO_INCREMENT for table `person_status_table`
--
ALTER TABLE `person_status_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `person_table`
--
ALTER TABLE `person_table`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `program_slots`
--
ALTER TABLE `program_slots`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `requirements_table`
--
ALTER TABLE `requirements_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `requirement_uploads`
--
ALTER TABLE `requirement_uploads`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `signature_table`
--
ALTER TABLE `signature_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `verify_applicants`
--
ALTER TABLE `verify_applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `verify_document_schedule`
--
ALTER TABLE `verify_document_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
