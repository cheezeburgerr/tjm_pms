-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2024 at 03:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pms_tjm`
--

-- --------------------------------------------------------

--
-- Table structure for table `approve_designs`
--

CREATE TABLE `approve_designs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `approve_designs`
--

INSERT INTO `approve_designs` (`id`, `order_id`, `image_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 43, 'itgo logo.jpg', 'Rejected', '2024-06-20 02:59:48', '2024-06-20 02:59:48'),
(4, 43, 'Artboard 1.png', 'Rejected', '2024-06-20 03:27:05', '2024-06-20 04:13:04'),
(5, 43, '4gt designs mockup (1).png', 'Rejected', '2024-06-20 05:03:08', '2024-06-20 05:03:23'),
(6, 43, 'ELMARS.png', 'Rejected', '2024-06-20 19:50:54', '2024-06-20 19:50:54'),
(7, 45, 'org shirt mockup FACULTY.png', 'Waiting for Approval', '2024-06-21 01:31:01', '2024-06-21 01:31:01'),
(8, 44, 'YDS.png', 'Approved', '2024-06-21 01:56:11', '2024-06-21 01:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'Cut', 1, '2024-06-10 06:28:40', '2024-06-10 06:28:40'),
(2, 'Neck Type', 1, '2024-06-10 06:28:40', '2024-06-10 06:28:40'),
(3, 'Short Type', 1, '2024-06-10 06:28:40', '2024-06-10 06:28:40'),
(14, 'Jacket Type', 14, '2024-06-10 16:07:02', '2024-06-10 16:07:02'),
(15, 'Cut', 2, '2024-06-10 17:07:19', '2024-06-10 17:07:19'),
(16, 'Neck Type', 2, '2024-06-10 17:07:19', '2024-06-10 17:07:19'),
(17, 'Short Type', 3, '2024-06-10 17:08:05', '2024-06-10 17:08:05'),
(18, 'Neck Type', 4, '2024-06-10 17:08:33', '2024-06-10 17:08:33'),
(19, 'Collar', 5, '2024-06-10 17:09:14', '2024-06-10 17:09:14'),
(20, 'Polo Type', 5, '2024-06-10 17:09:14', '2024-06-10 17:09:14'),
(21, 'Neck Type', 6, '2024-06-10 17:09:49', '2024-06-10 17:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `name`, `type`, `user_id`, `order_id`, `created_at`, `updated_at`) VALUES
(6, 'Erjian Soriano', 'User', 1, NULL, '2024-06-28 04:32:12', '2024-06-28 04:32:12'),
(8, 'Renalyn Aquino', 'User', 7, NULL, '2024-06-28 04:33:29', '2024-06-28 04:33:29'),
(9, 'Chris Cadiao', 'User', 6, NULL, '2024-06-28 07:13:57', '2024-06-28 07:13:57'),
(10, 'Deither Ramos', 'User', 5, NULL, '2024-06-28 07:50:27', '2024-06-28 07:50:27'),
(11, 'Floyd De Vera', 'User', 4, NULL, '2024-06-28 07:50:28', '2024-06-28 07:50:28'),
(12, 'Cherry Corrales', 'User', 3, NULL, '2024-06-28 07:50:34', '2024-06-28 07:50:34'),
(13, 'Joseph Mislang', 'User', 8, NULL, '2024-07-03 06:38:12', '2024-07-03 06:38:12'),
(36, 'Mildred Arenas', 'User', 9, NULL, '2024-07-29 06:37:49', '2024-07-29 06:37:49'),
(43, 'Ian Soriano', 'User', 2, NULL, '2024-07-29 06:46:02', '2024-07-29 06:46:02'),
(44, 'Raiders', 'Order', 1, 55, '2024-07-29 06:46:53', '2024-07-29 06:46:53'),
(45, 'CDMCCC', 'Order', 9, 54, '2024-07-29 06:47:29', '2024-07-29 06:47:29'),
(46, 'Rocks', 'Order', 7, 53, '2024-07-29 06:48:26', '2024-07-29 06:48:26'),
(47, 'Bay Area', 'Order', 7, 52, '2024-07-29 06:48:26', '2024-07-29 06:48:26'),
(48, 'Brgy Officials', 'Order', 1, 44, '2024-07-29 06:50:00', '2024-07-29 06:50:00'),
(49, 'ITGO Officers Polo Shirt', 'Order', 7, 45, '2024-07-30 02:41:22', '2024-07-30 02:41:22'),
(50, 'The Boyzs', 'Order', 1, 43, '2024-07-30 10:41:55', '2024-07-30 10:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dept_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `dept_name`, `created_at`, `updated_at`) VALUES
(1, 'Artist', '2024-06-12 05:12:29', '2024-06-12 05:12:29'),
(2, 'Customer Service Representative', '2024-06-12 05:12:29', '2024-06-12 05:12:29'),
(3, 'Printing', '2024-06-12 05:12:29', '2024-06-12 05:12:29'),
(4, 'Checking', '2024-06-12 05:12:29', '2024-06-12 05:12:29'),
(5, 'Sewing', '2024-06-12 05:12:29', '2024-06-12 05:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `equipment_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `equipment_name`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ATEXCO', 'Printer', 'Working', '2024-06-13 22:40:20', '2024-06-13 22:40:20'),
(2, 'EPSON', 'Printer', 'Working', '2024-06-13 22:40:20', '2024-06-13 22:40:20'),
(3, 'Tecjet', 'Printer', 'Working', '2024-06-13 22:40:20', '2024-06-13 22:40:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '3e9d8f6f-3c9a-4587-9df5-c7f67c1d57fd', 'database', 'default', '{\"uuid\":\"3e9d8f6f-3c9a-4587-9df5-c7f67c1d57fd\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:149;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Message]. in D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:628\nStack trace:\n#0 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(109): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(62): App\\Events\\MessageSent->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(93): App\\Events\\MessageSent->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\MessageSent->__unserialize(Array)\n#4 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(98): unserialize(\'O:38:\"Illuminat...\')\n#5 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(61): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#18 D:\\tjm_pms2\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 D:\\tjm_pms2\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2024-07-30 04:34:26'),
(2, '7df3177c-7736-48be-b54b-3358de8b2925', 'database', 'default', '{\"uuid\":\"7df3177c-7736-48be-b54b-3358de8b2925\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:150;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Message]. in D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:628\nStack trace:\n#0 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(109): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(62): App\\Events\\MessageSent->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(93): App\\Events\\MessageSent->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\MessageSent->__unserialize(Array)\n#4 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(98): unserialize(\'O:38:\"Illuminat...\')\n#5 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(61): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#18 D:\\tjm_pms2\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 D:\\tjm_pms2\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2024-07-30 04:34:27'),
(3, '854fcba2-c7df-4904-8e70-234d6169bc13', 'database', 'default', '{\"uuid\":\"854fcba2-c7df-4904-8e70-234d6169bc13\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:151;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Message]. in D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:628\nStack trace:\n#0 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(109): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(62): App\\Events\\MessageSent->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(93): App\\Events\\MessageSent->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\MessageSent->__unserialize(Array)\n#4 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(98): unserialize(\'O:38:\"Illuminat...\')\n#5 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(61): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#18 D:\\tjm_pms2\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 D:\\tjm_pms2\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2024-07-30 04:34:27'),
(4, '1991be88-de2c-4e25-a93c-2fb60c086d4a', 'database', 'default', '{\"uuid\":\"1991be88-de2c-4e25-a93c-2fb60c086d4a\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:152;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Message]. in D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:628\nStack trace:\n#0 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(109): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(62): App\\Events\\MessageSent->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(93): App\\Events\\MessageSent->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\MessageSent->__unserialize(Array)\n#4 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(98): unserialize(\'O:38:\"Illuminat...\')\n#5 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(61): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#18 D:\\tjm_pms2\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 D:\\tjm_pms2\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2024-07-30 04:34:28'),
(5, '0d3b37c1-a2ec-4e4e-92df-d7bf832f20fb', 'database', 'default', '{\"uuid\":\"0d3b37c1-a2ec-4e4e-92df-d7bf832f20fb\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:153;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Message]. in D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:628\nStack trace:\n#0 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(109): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(62): App\\Events\\MessageSent->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(93): App\\Events\\MessageSent->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\MessageSent->__unserialize(Array)\n#4 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(98): unserialize(\'O:38:\"Illuminat...\')\n#5 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(61): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#18 D:\\tjm_pms2\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 D:\\tjm_pms2\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2024-07-30 04:34:28'),
(6, '3ae54207-2bb1-4a55-bf28-43c511c98ad7', 'database', 'default', '{\"uuid\":\"3ae54207-2bb1-4a55-bf28-43c511c98ad7\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:154;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Message]. in D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:628\nStack trace:\n#0 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(109): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(62): App\\Events\\MessageSent->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(93): App\\Events\\MessageSent->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\MessageSent->__unserialize(Array)\n#4 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(98): unserialize(\'O:38:\"Illuminat...\')\n#5 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(61): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#18 D:\\tjm_pms2\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 D:\\tjm_pms2\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2024-07-30 04:34:29'),
(7, 'f24d91ab-5ec5-455b-82fb-8e9aa1e2daac', 'database', 'default', '{\"uuid\":\"f24d91ab-5ec5-455b-82fb-8e9aa1e2daac\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:155;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Message]. in D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:628\nStack trace:\n#0 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(109): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(62): App\\Events\\MessageSent->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(93): App\\Events\\MessageSent->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\MessageSent->__unserialize(Array)\n#4 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(98): unserialize(\'O:38:\"Illuminat...\')\n#5 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(61): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#18 D:\\tjm_pms2\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 D:\\tjm_pms2\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 D:\\tjm_pms2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 D:\\tjm_pms2\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2024-07-30 04:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lineups`
--

CREATE TABLE `lineups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `player_details` varchar(255) DEFAULT NULL,
  `classification` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `upper_size` varchar(255) NOT NULL,
  `lower_size` varchar(255) NOT NULL,
  `remarks` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lineups`
--

INSERT INTO `lineups` (`id`, `order_id`, `product_id`, `player_name`, `player_details`, `classification`, `gender`, `upper_size`, `lower_size`, `remarks`, `status`, `note`, `price`, `created_at`, `updated_at`) VALUES
(32, 41, 1, 'Ian', '40', 'Adult', 'Male', 'M', 'S', '', 'Error', 'Wrong Size', 1050, '2024-06-12 01:09:11', '2024-06-25 05:32:51'),
(33, 41, 4, 'Soriano', '10', 'Kid', 'Male', 'S', 'S', 'Tokyo', 'Error', 'Wrong Number/Detail', 450, '2024-06-12 01:09:11', '2024-06-25 05:32:51'),
(34, 42, 1, 'Operania', '17', 'Adult', 'Male', 'L', 'L', '', 'Finished', NULL, 1050, '2024-06-13 16:43:09', '2024-07-23 03:48:44'),
(35, 43, 1, 'Arenas', '04', 'Adult', 'Male', 'M', 'M', NULL, 'Printed', NULL, 1000, '2024-06-15 02:16:12', '2024-07-24 04:15:12'),
(36, 43, 5, 'Manager', '13', 'Adult', 'Male', 'L', 'S', NULL, NULL, NULL, 600, '2024-06-15 02:16:12', '2024-07-23 06:39:53'),
(38, 44, 5, 'Soriano', 'Brgy. Captain', 'Adult', 'Male', 'L', 'L', '', 'Printed', NULL, 700, '2024-06-15 02:29:36', '2024-06-21 01:58:33'),
(39, 44, 5, 'Aquino', 'Brgy. Kagawad', 'Adult', 'Female', 'M', 'M', '', 'Printed', NULL, 700, '2024-06-15 02:29:36', '2024-06-21 01:58:34'),
(40, 44, 5, 'Arenas', 'Brgy. Kagawad', 'Adult', 'Female', 'M', 'M', '', 'Printed', NULL, 700, '2024-06-15 02:29:36', '2024-06-21 02:02:53'),
(41, 44, 5, 'Diaz', 'Secretary', 'Adult', 'Female', 'L', 'M', '', 'Printed', NULL, 700, '2024-06-15 02:29:36', '2024-06-21 02:03:05'),
(42, 45, 5, 'Mildred Arenas', 'President', 'Adult', 'Female', 'M', 'M', '', NULL, NULL, 600, '2024-06-19 23:41:46', '2024-06-20 21:25:06'),
(43, 45, 5, 'Renalyn Aquino', 'Treasurer', 'Adult', 'Female', 'L', 'L', '', NULL, NULL, 600, '2024-06-19 23:41:46', '2024-06-20 21:07:17'),
(50, 52, 1, 'Lonzo', '13', 'Adult', 'Male', 'L', 'L', 'Mataeus', NULL, NULL, 1000, '2024-06-26 03:42:20', '2024-06-26 03:42:20'),
(51, 53, 1, 'Arambulo', '13', 'Adult', 'Male', 'L', 'L', 'Mataeus', NULL, NULL, 1000, '2024-06-26 03:51:26', '2024-06-26 03:51:26'),
(52, 53, 1, 'Soriano', '2', 'Adult', 'Male', 'M', 'M', '', NULL, NULL, 1000, '2024-06-26 03:51:26', '2024-06-26 03:51:26'),
(53, 54, 2, 'Arenas', '05', 'Adult', 'Female', 'S', 'S', 'Mild', NULL, NULL, 450, '2024-07-03 06:40:51', '2024-07-03 06:40:51'),
(186, 43, 4, 'Ian', '23', 'Adult', 'Male', 'XS', 'XS', NULL, NULL, NULL, 500, '2024-07-24 04:29:23', '2024-07-24 04:29:23'),
(187, 55, 1, 'Soriano', '20', 'Adult', 'Male', 'XS', 'XS', '', NULL, NULL, 1050, '2024-07-24 06:17:50', '2024-07-24 06:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `chat_room_id`, `user_id`, `message`, `file_path`, `created_at`, `updated_at`) VALUES
(80, 8, 7, 'Hello po', NULL, '2024-06-28 05:43:00', '2024-06-28 05:43:00'),
(81, 8, 7, 'Hello', NULL, '2024-06-28 06:13:53', '2024-06-28 06:13:53'),
(82, 8, 3, 'Hi', NULL, '2024-06-28 06:17:21', '2024-06-28 06:17:21'),
(83, 8, 7, 'Haaa', NULL, '2024-06-28 06:18:50', '2024-06-28 06:18:50'),
(84, 8, 3, 'HE?', NULL, '2024-06-28 06:19:22', '2024-06-28 06:19:22'),
(85, 8, 3, 'Good evening po', NULL, '2024-06-28 06:23:04', '2024-06-28 06:23:04'),
(86, 8, 7, 'Hi', NULL, '2024-06-28 06:26:06', '2024-06-28 06:26:06'),
(87, 8, 7, 'Hello', NULL, '2024-06-28 06:26:08', '2024-06-28 06:26:08'),
(88, 8, 3, 'How can I help you?', NULL, '2024-06-28 06:33:30', '2024-06-28 06:33:30'),
(89, 8, 3, 'Jersey?', NULL, '2024-06-28 06:34:07', '2024-06-28 06:34:07'),
(90, 8, 7, 'Yes please', NULL, '2024-06-28 06:36:11', '2024-06-28 06:36:11'),
(91, 8, 7, 'How much', NULL, '2024-06-28 06:36:14', '2024-06-28 06:36:14'),
(92, 8, 3, '850 for fullset', NULL, '2024-06-28 06:36:33', '2024-06-28 06:36:33'),
(93, 8, 7, 'Wala na po bang bawas?', NULL, '2024-06-28 07:20:50', '2024-06-28 07:20:50'),
(94, 8, 3, 'Wala na po', NULL, '2024-06-28 07:22:32', '2024-06-28 07:22:32'),
(95, 8, 7, 'Kahit piso?', NULL, '2024-06-28 07:23:37', '2024-06-28 07:23:37'),
(96, 8, 7, 'Kahit Lima?', NULL, '2024-06-28 07:24:39', '2024-06-28 07:24:39'),
(97, 8, 3, 'Tanong ko po', NULL, '2024-06-28 07:25:01', '2024-06-28 07:25:01'),
(98, 8, 7, 'Sige po', NULL, '2024-06-28 07:25:32', '2024-06-28 07:25:32'),
(99, 8, 3, 'Wala daw po talaga ma\'am', NULL, '2024-06-28 07:27:15', '2024-06-28 07:27:15'),
(100, 8, 7, 'Ay sayang', NULL, '2024-06-28 07:28:11', '2024-06-28 07:28:11'),
(101, 8, 7, 'Sa TShirt po ba?', NULL, '2024-06-28 07:28:19', '2024-06-28 07:28:19'),
(102, 8, 3, '500 po', NULL, '2024-06-28 07:28:33', '2024-06-28 07:28:33'),
(103, 8, 3, '550 po pala', NULL, '2024-06-28 07:30:00', '2024-06-28 07:30:00'),
(104, 8, 7, 'Okay po ma\'am', NULL, '2024-06-28 07:52:42', '2024-06-28 07:52:42'),
(110, 8, 3, 'ddff', 'images/customers/chats/8UxI953SpPPfgkeuNkugzpUv8aASuiBfp14XJzmK.jpg', '2024-06-28 08:25:03', '2024-06-28 08:25:03'),
(111, 8, 7, 'Hello po', NULL, '2024-06-28 21:12:24', '2024-06-28 21:12:24'),
(112, 8, 3, 'Yes po?', NULL, '2024-06-28 21:12:35', '2024-06-28 21:12:35'),
(148, 6, 3, 'Hello', NULL, '2024-06-29 06:42:15', '2024-06-29 06:42:15'),
(156, 36, 9, 'Hello', NULL, '2024-07-29 06:37:52', '2024-07-29 06:37:52'),
(157, 44, 3, 'Hello', NULL, '2024-07-29 06:48:35', '2024-07-29 06:48:35'),
(158, 43, 3, 'Hi', NULL, '2024-07-29 06:55:50', '2024-07-29 06:55:50'),
(159, 6, 1, 'Hello', NULL, '2024-07-30 02:21:24', '2024-07-30 02:21:24'),
(160, 48, 1, 'Update po?', NULL, '2024-07-30 04:07:49', '2024-07-30 04:07:49'),
(161, 8, 7, 'Ma\'am', NULL, '2024-07-30 04:34:33', '2024-07-30 04:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `message_files`
--

CREATE TABLE `message_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_files`
--

INSERT INTO `message_files` (`id`, `message_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 145, 'uploads/A1AiWxgdsqIbS8zC1XJNEGviEZxTam5YdeUbU7iu.jpg', '2024-06-29 06:00:09', '2024-06-29 06:00:09'),
(2, 147, 'uploads/e3E1PoKAGkRiSkBruC3UJzlJcWZvNYe1x35yXthD.jpg', '2024-06-29 06:30:57', '2024-06-29 06:30:57'),
(3, 147, 'uploads/TI6GtJoG7ZakxoZOr3YzwEzO2iokQghZSTpm1Zcf.png', '2024-06-29 06:30:57', '2024-06-29 06:30:57'),
(4, 148, 'uploads/edMaFs7zn2zl3WyPg0ApRTsnfqrnV69ZicxrWwyQ.jpg', '2024-06-29 06:42:15', '2024-06-29 06:42:15'),
(5, 148, 'uploads/0hXx6S6X2Fv91f6daGuC67s9ZTxViicM6cMf3tSk.png', '2024-06-29 06:42:15', '2024-06-29 06:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '0001_01_01_000000_create_users_table', 1),
(8, '0001_01_01_000001_create_cache_table', 1),
(9, '0001_01_01_000002_create_jobs_table', 1),
(12, '2024_06_10_141537_create_products_table', 2),
(13, '2024_06_10_142449_create_categories_table', 3),
(14, '2024_06_10_142607_create_variations_table', 3),
(19, '2024_06_11_144818_create_orders_table', 4),
(20, '2024_06_11_145015_create_order_products_table', 4),
(21, '2024_06_11_145029_create_order_variations_table', 4),
(22, '2024_06_11_145040_create_lineups_table', 4),
(23, '2024_06_12_001752_create_order_images_table', 5),
(24, '2024_06_12_013205_add_column_to_order_products', 6),
(25, '2024_06_12_085940_create_production_details_table', 7),
(26, '2024_06_12_091611_create_production_employees_table', 8),
(27, '2024_06_12_130734_create_departments_table', 9),
(28, '2024_06_14_063721_create_equipment_table', 10),
(29, '2024_06_20_102348_create_approve_designs_table', 11),
(30, '2024_06_26_104357_create_notifications_table', 12),
(31, '2024_06_27_145617_create_chatrooms_table', 13),
(32, '2024_06_27_145703_create_messages_table', 13),
(33, '2024_06_29_130244_create_message_files_table', 14),
(34, '2024_07_06_091427_create_product_models_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'New Order Placed', 'Order \'The Boyz\' has been placed by one of the customers. Check it out.', '/employee/view-order/43', NULL, '2024-06-26 11:01:22', '2024-06-26 11:01:22'),
(8, 3, 'New Order Placed', 'Order \"Bay Area\" has been placed by one of the customers. Check it out.', '/employee/view-order/52', NULL, '2024-06-26 03:42:21', '2024-06-26 03:42:21'),
(11, 3, 'New Order Placed', 'Order \"Rocks\" has been placed by one of the customers. Check it out.', '/employee/view-order/53', NULL, '2024-06-26 03:51:27', '2024-06-26 03:51:27'),
(13, 4, 'Assign Artist', 'Order \"Bay Area\" has been approved. Assign artist to start the production.', '/employee/view-order/52', NULL, '2024-06-26 04:34:25', '2024-06-26 04:34:25'),
(15, 4, 'Assign Artist', 'Order \"Rocks\" has been approved. Assign artist to start the production.', '/employee/view-order/53', 'read', '2024-06-26 06:42:47', '2024-06-27 05:22:17'),
(17, 2, 'New Order For You', 'Order \"\" has been assigned to you. Check it out.', '/employee/view-order/52', NULL, '2024-06-26 17:03:14', '2024-06-26 17:03:14'),
(18, 2, 'New Order For You', 'Order \"\" has been assigned to you. Check it out.', '/employee/view-order/53', 'read', '2024-06-27 06:24:52', '2024-06-27 06:27:22'),
(19, 3, 'New Order Placed', 'Order \"CDMCCC\" has been placed by one of the customers. Check it out.', '/employee/view-order/54', 'unread', '2024-07-03 06:40:51', '2024-07-03 06:40:51'),
(20, 1, 'Order Ready to Pickup', 'Order \"\" is ready for you to pick it up. Go to the nearest branch to claim your order.', 'orders/42', 'read', '2024-07-23 03:49:17', '2024-07-23 03:55:45'),
(21, 3, 'New Order Placed', 'Order \"Raiders\" has been placed by one of the customers. Check it out.', '/employee/view-order/55', 'unread', '2024-07-24 06:17:50', '2024-07-24 06:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `customer_id` int(20) NOT NULL,
  `total_price` float NOT NULL DEFAULT 0,
  `downpayment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `team_name`, `due_date`, `customer_id`, `total_price`, `downpayment`, `created_at`, `updated_at`) VALUES
(41, 'PSU Badminton', '2024-06-25', 1, 1500, NULL, '2024-06-12 01:09:10', '2024-06-12 01:11:21'),
(42, 'Urbiztondo Basketball', '2024-06-21', 1, 1050, NULL, '2024-06-13 16:43:08', '2024-06-13 16:43:09'),
(43, 'The Boyzs', '2024-08-14', 1, 2100, NULL, '2024-06-15 02:16:11', '2024-07-24 05:09:00'),
(44, 'Brgy Officials', '2024-08-06', 1, 2800, NULL, '2024-06-15 02:29:35', '2024-06-15 02:29:36'),
(45, 'ITGO Officers Polo Shirt', '2024-08-31', 7, 1200, NULL, '2024-06-19 23:41:46', '2024-06-19 23:41:46'),
(52, 'Bay Area', '2024-09-11', 7, 1000, NULL, '2024-06-26 03:42:18', '2024-06-26 03:42:20'),
(53, 'Rocks', '2024-09-11', 7, 2000, NULL, '2024-06-26 03:51:24', '2024-06-26 03:51:26'),
(54, 'CDMCCC', '2024-09-10', 9, 450, NULL, '2024-07-03 06:40:51', '2024-07-03 06:40:51'),
(55, 'Raiders', '2024-08-10', 1, 1050, '1721830906.jpg', '2024-07-24 06:17:50', '2024-07-24 06:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `order_images`
--

CREATE TABLE `order_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_images`
--

INSERT INTO `order_images` (`id`, `order_id`, `file_name`, `path`, `created_at`, `updated_at`) VALUES
(25, 41, 'PSU B.png', 'images/orders\\PSU B.png', '2024-06-12 01:09:10', '2024-06-12 01:09:10'),
(26, 42, '358136227_251574454289765_7946999641261777470_n.jpg', 'images/orders\\358136227_251574454289765_7946999641261777470_n.jpg', '2024-06-13 16:43:09', '2024-06-13 16:43:09'),
(28, 44, 'DIGGER FIVE.png', 'images/orders\\DIGGER FIVE.png', '2024-06-15 02:29:35', '2024-06-15 02:29:35'),
(29, 45, 'org shirt mockup FACULTY.png', 'images/orders\\org shirt mockup FACULTY.png', '2024-06-19 23:41:46', '2024-06-19 23:41:46'),
(36, 52, '449206983_838087134432358_5093589712621579023_n.jpg', 'images/orders\\449206983_838087134432358_5093589712621579023_n.jpg', '2024-06-26 03:42:19', '2024-06-26 03:42:19'),
(37, 53, 'ja-morant-nike-ja-1-launch-9.jpg', 'images/orders\\ja-morant-nike-ja-1-launch-9.jpg', '2024-06-26 03:51:24', '2024-06-26 03:51:24'),
(38, 54, 'sportsfest logo-03.png', 'images/orders\\sportsfest logo-03.png', '2024-07-03 06:40:51', '2024-07-03 06:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `subtotal`, `created_at`, `updated_at`) VALUES
(45, 41, 1, 1050.00, '2024-06-12 01:09:10', '2024-06-12 01:11:21'),
(46, 41, 4, 500.00, '2024-06-12 01:09:11', '2024-06-13 19:20:23'),
(47, 42, 1, 1050.00, '2024-06-13 16:43:09', '2024-06-13 16:43:09'),
(48, 43, 1, 1000.00, '2024-06-15 02:16:12', '2024-07-23 06:06:40'),
(49, 43, 4, 500.00, '2024-06-15 02:16:12', '2024-06-15 02:16:12'),
(50, 43, 5, 600.00, '2024-06-15 02:16:12', '2024-06-15 02:16:12'),
(51, 44, 5, 700.00, '2024-06-15 02:29:36', '2024-06-15 02:29:36'),
(52, 45, 5, 600.00, '2024-06-19 23:41:46', '2024-06-19 23:41:46'),
(59, 52, 1, 1000.00, '2024-06-26 03:42:19', '2024-06-26 03:42:19'),
(60, 53, 1, 1000.00, '2024-06-26 03:51:25', '2024-06-26 03:51:25'),
(61, 54, 2, 450.00, '2024-07-03 06:40:51', '2024-07-03 06:40:51'),
(62, 55, 1, 1050.00, '2024-07-24 06:17:50', '2024-07-24 06:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_variations`
--

CREATE TABLE `order_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_variations`
--

INSERT INTO `order_variations` (`id`, `order_id`, `product_id`, `category_id`, `variation_id`, `created_at`, `updated_at`) VALUES
(84, 41, 45, 1, 2, '2024-06-12 01:09:11', '2024-06-12 01:09:11'),
(85, 41, 45, 2, 15, '2024-06-12 01:09:11', '2024-06-12 01:09:11'),
(86, 41, 45, 3, 32, '2024-06-12 01:09:11', '2024-06-12 01:11:21'),
(87, 41, 46, 18, 22, '2024-06-12 01:09:11', '2024-06-13 19:20:23'),
(88, 42, 47, 1, 2, '2024-06-13 16:43:09', '2024-06-13 16:43:09'),
(89, 42, 47, 2, 14, '2024-06-13 16:43:09', '2024-06-13 16:43:09'),
(90, 42, 47, 3, 32, '2024-06-13 16:43:09', '2024-06-13 16:43:09'),
(91, 43, 48, 1, 2, '2024-06-15 02:16:12', '2024-07-23 06:06:40'),
(92, 43, 48, 2, 14, '2024-06-15 02:16:12', '2024-06-15 02:16:12'),
(93, 43, 48, 3, 31, '2024-06-15 02:16:12', '2024-06-15 02:16:12'),
(94, 43, 49, 18, 22, '2024-06-15 02:16:12', '2024-06-15 02:16:12'),
(95, 43, 50, 19, 24, '2024-06-15 02:16:12', '2024-06-15 02:16:12'),
(96, 43, 50, 20, 26, '2024-06-15 02:16:12', '2024-06-15 02:16:12'),
(97, 44, 51, 19, 25, '2024-06-15 02:29:36', '2024-06-15 02:29:36'),
(98, 44, 51, 20, 27, '2024-06-15 02:29:36', '2024-06-15 02:29:36'),
(99, 45, 52, 19, 24, '2024-06-19 23:41:46', '2024-06-19 23:41:46'),
(100, 45, 52, 20, 26, '2024-06-19 23:41:46', '2024-06-19 23:41:46'),
(119, 52, 59, 1, 2, '2024-06-26 03:42:20', '2024-06-26 03:42:20'),
(120, 52, 59, 2, 15, '2024-06-26 03:42:20', '2024-06-26 03:42:20'),
(121, 52, 59, 3, 31, '2024-06-26 03:42:20', '2024-06-26 03:42:20'),
(122, 53, 60, 1, 2, '2024-06-26 03:51:25', '2024-06-26 03:51:25'),
(123, 53, 60, 2, 15, '2024-06-26 03:51:26', '2024-06-26 03:51:26'),
(124, 53, 60, 3, 31, '2024-06-26 03:51:26', '2024-06-26 03:51:26'),
(125, 54, 61, 15, 16, '2024-07-03 06:40:51', '2024-07-03 06:40:51'),
(126, 54, 61, 16, 18, '2024-07-03 06:40:51', '2024-07-03 06:40:51'),
(127, 55, 62, 1, 2, '2024-07-24 06:17:50', '2024-07-24 06:17:50'),
(128, 55, 62, 2, 14, '2024-07-24 06:17:50', '2024-07-24 06:17:50'),
(129, 55, 62, 3, 32, '2024-07-24 06:17:50', '2024-07-24 06:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_details`
--

CREATE TABLE `production_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `note` varchar(255) DEFAULT NULL,
  `start_production` date DEFAULT NULL,
  `end_production` date DEFAULT NULL,
  `printing_progress` double NOT NULL DEFAULT 0,
  `sewing_progress` double NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL,
  `downtime` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_details`
--

INSERT INTO `production_details` (`id`, `order_id`, `printer_id`, `status`, `note`, `start_production`, `end_production`, `printing_progress`, `sewing_progress`, `priority`, `downtime`, `created_at`, `updated_at`) VALUES
(1, 41, 1, 'Released', 'Printed', '2024-06-14', '2024-06-17', 100, 100, NULL, 0, '2024-06-12 01:09:10', '2024-06-25 03:42:44'),
(2, 42, 1, 'Finished', 'Printing', '2024-06-15', '2024-07-23', 100, 100, NULL, 0, '2024-06-13 16:43:08', '2024-07-23 03:49:18'),
(3, 43, NULL, 'Designing', 'Artist Assigned', NULL, NULL, 0, 0, NULL, 0, '2024-06-15 02:16:11', '2024-06-20 20:45:18'),
(4, 44, 1, 'Printing', 'Printing', '2024-06-21', NULL, 100, 0, NULL, 0, '2024-06-15 02:29:35', '2024-06-21 02:03:05'),
(5, 45, NULL, 'Designing', 'Waiting for Approval', NULL, NULL, 0, 0, NULL, 0, '2024-06-19 23:41:46', '2024-06-21 01:31:01'),
(12, 52, NULL, 'Designing', 'Artist Assigned', NULL, NULL, 0, 0, NULL, 0, '2024-06-26 03:42:19', '2024-06-26 17:00:31'),
(13, 53, NULL, 'Designing', 'Artist Assigned', NULL, NULL, 0, 0, NULL, 0, '2024-06-26 03:51:24', '2024-06-27 06:24:52'),
(14, 54, NULL, 'Pending', NULL, NULL, NULL, 0, 0, NULL, 0, '2024-07-03 06:40:51', '2024-07-03 06:40:51'),
(15, 55, NULL, 'Pending', NULL, NULL, NULL, 0, 0, NULL, 0, '2024-07-24 06:17:50', '2024-07-24 06:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `production_employees`
--

CREATE TABLE `production_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `employee_role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_employees`
--

INSERT INTO `production_employees` (`id`, `order_id`, `user_id`, `employee_role`, `created_at`, `updated_at`) VALUES
(8, 41, 3, 'CSR', '2024-06-13 21:41:14', '2024-06-13 21:41:14'),
(10, 41, 4, 'Artist', '2024-06-13 21:45:25', '2024-06-13 21:45:25'),
(11, 42, 3, 'CSR', '2024-06-13 23:40:14', '2024-06-13 23:40:14'),
(12, 42, 4, 'Artist', '2024-06-13 23:40:29', '2024-06-13 23:40:29'),
(15, 43, 3, 'CSR', '2024-06-15 02:16:37', '2024-06-15 02:16:37'),
(20, 44, 3, 'CSR', '2024-06-19 23:43:46', '2024-06-19 23:43:46'),
(21, 45, 3, 'CSR', '2024-06-19 23:43:47', '2024-06-19 23:43:47'),
(22, 43, 4, 'Artist', '2024-06-19 23:57:59', '2024-06-19 23:57:59'),
(23, 41, 6, 'Checker', '2024-06-20 22:08:41', '2024-06-20 22:08:41'),
(24, 41, 6, 'Final Checker', '2024-06-21 01:08:41', '2024-06-21 01:08:41'),
(25, 44, 2, 'Artist', '2024-06-21 01:18:25', '2024-06-21 01:18:25'),
(26, 45, 4, 'Artist', '2024-06-21 01:18:40', '2024-06-21 01:18:40'),
(27, 42, 6, 'Checker', '2024-06-21 01:55:26', '2024-06-21 01:55:26'),
(31, 52, 3, 'CSR', '2024-06-26 04:34:25', '2024-06-26 04:34:25'),
(33, 53, 3, 'CSR', '2024-06-26 06:42:47', '2024-06-26 06:42:47'),
(35, 52, 2, 'Artist', '2024-06-26 17:03:14', '2024-06-26 17:03:14'),
(36, 53, 2, 'Artist', '2024-06-27 06:24:52', '2024-06-27 06:24:52'),
(37, 42, 6, 'Final Checker', '2024-07-23 03:49:18', '2024-07-23 03:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_price`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Fullset Jersey', 950, NULL, '2024-06-10 06:23:40', '2024-06-10 06:23:40'),
(2, 'Sando', 450, NULL, '2024-06-10 06:23:40', '2024-06-10 17:04:44'),
(3, 'Shorts', 400, NULL, '2024-06-10 06:23:40', '2024-06-10 06:23:40'),
(4, 'T-Shirt', 500, NULL, '2024-06-10 06:23:40', '2024-06-10 06:23:40'),
(5, 'Polo Shirt', 600, NULL, '2024-06-10 06:23:40', '2024-06-10 06:23:40'),
(6, 'Longsleeve', 700, NULL, '2024-06-10 06:23:40', '2024-06-10 06:23:40'),
(14, 'Jacket', 900, '1718064422.jpg', '2024-06-10 16:07:02', '2024-06-10 16:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_models`
--

CREATE TABLE `product_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `canvas_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_models`
--

INSERT INTO `product_models` (`id`, `name`, `path`, `canvas_path`, `created_at`, `updated_at`) VALUES
(23, 'Jersey', '66893a0c77018_jersey.glb', '66893a0c77019_texture-01.svg', '2024-07-06 04:35:24', '2024-07-06 04:35:24'),
(24, 'Polo Shirt', '66893a1c778dd_polo.glb', '66893a1c778de_polo-01.svg', '2024-07-06 04:35:40', '2024-07-06 04:35:40'),
(25, 'T Shirt', '66893a2ea2e19_tshirt.glb', '66893a2ea2e1a_t-shirt-01.svg', '2024-07-06 04:35:58', '2024-07-06 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5cOASRqzcTDZ9qkSAJzCR1EZGRXakwuzI6ZwmeDf', 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVlhCanNXZWo0MERFakg1VnNXWkVyMmVwZkJhVEFyYmdjemE5STRCViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NztzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rlc2lnbmVyIjt9czo1NToibG9naW5fZW1wbG95ZWVfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1722347859);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `is_supervisor` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `name`, `email`, `user_type`, `is_supervisor`, `address`, `contact_number`, `email_verified_at`, `password`, `image`, `remember_token`, `dept_id`, `created_at`, `updated_at`) VALUES
(1, 'CUS_00001', 'Erjian Soriano', 'erjiansoriano05@gmail.com', 'Customer', 0, 'Urbiztondo', '09685144938', NULL, '$2y$12$qcr4GBKVIVto55xyAg1SduWxd8r6xT8jQ0wChj5s.IxRa6L/m6eB6', NULL, NULL, NULL, '2024-06-10 03:25:54', '2024-06-10 03:25:54'),
(2, 'TJM_00001', 'Ian Soriano', 'iansoriano05@gmail.com', 'Employee', 0, 'Urbiz', '09685144938', NULL, '$2y$12$d733OVI0vsucoXYaa8NzzuH7p0gHKQAFJ5n0Yg2TPpX3UcH7lzxzK', NULL, NULL, 1, '2024-06-10 03:37:39', '2024-06-10 03:37:39'),
(3, 'TJM_00002', 'Cherry Corrales', 'cherrycorrales@gmail.com', 'Employee', 0, 'San Carlos', '09776765454', NULL, '$2y$12$Fqh1YumkyNWgokXojzfGH./dcP/PM847GZ65cH298mFgZPl4HgIOi', NULL, NULL, 2, '2024-06-13 19:27:52', '2024-06-13 19:27:52'),
(4, 'TJM_00003', 'Floyd De Vera', 'floyddevera@gmail.com', 'Employee', 1, 'Binmaley', '09323434454', NULL, '$2y$12$M.gyRPhHNVSEAqduf68j6OcVzjyGls0a7w/GO2eJTzORiACO.b6Pi', NULL, NULL, 1, '2024-06-13 19:30:44', '2024-06-13 19:30:44'),
(5, 'TJM_00004', 'Deither Ramos', 'deither@gmail.com', 'Employee', 0, 'San Carlos', '0977875453', NULL, '$2y$12$noYCfpMQAd6JyDIAE3TdJeUTvPvb96h7KvhmBvx8cpUH0832aWpiK', NULL, NULL, 3, '2024-06-14 00:35:09', '2024-06-14 00:35:09'),
(6, 'TJM_00005', 'Chris Cadiao', 'chriscadiao@gmail.com', 'Employee', 0, 'San Carlos', '09302441874', NULL, '$2y$12$CQ3G5ZSEUH78peD7Sw/rA.G/73J.2k8FaZ2CA1ZqeQnPt9gfcAgTi', NULL, NULL, 4, '2024-06-14 00:35:10', '2024-06-14 00:35:10'),
(7, 'CUS_00002', 'Renalyn Aquino', 'rena@gmail.com', 'Customer', 0, 'San Carlos', '09334347564', NULL, '$2y$12$JhL2u32Is7C.gNq6SdjIxOgspxFuZn/m7LwdxpAyNA1INUyEWFlOS', NULL, NULL, NULL, '2024-06-19 23:40:07', '2024-06-19 23:40:07'),
(8, 'ADM_00001', 'Joseph Mislang', 'josephmislang@gmail.com', 'Admin', 1, 'San Carlos', '09348874578', NULL, '$2y$12$6YNY48XrXOacmGBvcFq2iu3CXwCLLr3rI7JV4F7KbiVhsdS2f6K8q', NULL, NULL, NULL, '2024-07-03 05:01:13', '2024-07-03 05:01:13'),
(9, 'CUS_00003', 'Mildred Arenas', 'mildred@gmail.com', 'Customer', 0, 'Angatel, Urbiztondo', '09403394586', NULL, '$2y$12$FCjHb3ubIQYbUysA5NPtbOwXdM0/91mfM6lKPoUqkBpKTO1cQAKgm', NULL, NULL, NULL, '2024-07-03 06:39:13', '2024-07-03 06:39:13');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_name` varchar(255) NOT NULL,
  `variation_price` double NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `variation_name`, `variation_price`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Normal Cut', 0, 1, '2024-06-10 06:33:57', '2024-06-10 06:33:57'),
(2, 'NBA Cut', 50, 1, '2024-06-10 06:33:57', '2024-06-10 06:33:57'),
(13, 'Hoodie', 50, 14, '2024-06-10 16:07:02', '2024-06-10 16:07:02'),
(14, 'Round Neck', 0, 2, '2024-06-10 16:22:39', '2024-06-10 16:22:39'),
(15, 'VNeck', 0, 2, '2024-06-10 16:22:39', '2024-06-10 16:22:39'),
(16, 'Normal Cut', 0, 15, '2024-06-10 17:07:19', '2024-06-10 17:07:19'),
(17, 'NBA  Cut', 50, 15, '2024-06-10 17:07:19', '2024-06-10 17:07:19'),
(18, 'Round Neck', 0, 16, '2024-06-10 17:07:19', '2024-06-10 17:07:19'),
(19, 'VNeck', 0, 16, '2024-06-10 17:07:19', '2024-06-10 17:07:19'),
(20, 'Geena', 0, 17, '2024-06-10 17:08:05', '2024-06-10 17:08:05'),
(21, 'Waistband', 50, 17, '2024-06-10 17:08:05', '2024-06-10 17:08:05'),
(22, 'Round Neck', 0, 18, '2024-06-10 17:08:33', '2024-06-10 17:08:33'),
(23, 'VNeck', 0, 18, '2024-06-10 17:08:33', '2024-06-10 17:08:33'),
(24, 'Normal', 0, 19, '2024-06-10 17:09:14', '2024-06-10 17:09:14'),
(25, 'Chinese', 50, 19, '2024-06-10 17:09:14', '2024-06-10 17:09:14'),
(26, 'Button', 0, 20, '2024-06-10 17:09:14', '2024-06-10 17:09:14'),
(27, 'Zipper', 50, 20, '2024-06-10 17:09:14', '2024-06-10 17:09:14'),
(28, 'Round Neck', 0, 21, '2024-06-10 17:09:49', '2024-06-10 17:09:49'),
(29, 'VNeck', 0, 21, '2024-06-10 17:09:49', '2024-06-10 17:09:49'),
(30, 'Hoodie', 50, 21, '2024-06-10 17:09:49', '2024-06-10 17:09:49'),
(31, 'Geena', 0, 3, '2024-06-11 03:24:04', '2024-06-11 03:24:04'),
(32, 'Waistband', 50, 3, '2024-06-11 03:24:04', '2024-06-11 03:24:04'),
(33, 'None', 0, 14, '2024-07-23 06:45:34', '2024-07-23 06:45:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approve_designs`
--
ALTER TABLE `approve_designs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_product_id_foreign` (`product_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lineups`
--
ALTER TABLE `lineups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lineups_order_id_foreign` (`order_id`),
  ADD KEY `lineups_product_id_foreign` (`product_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `message_files`
--
ALTER TABLE `message_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_images`
--
ALTER TABLE `order_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_variations`
--
ALTER TABLE `order_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_variations_category_id_foreign` (`category_id`),
  ADD KEY `order_variations_order_id_foreign` (`order_id`),
  ADD KEY `order_variations_product_id_foreign` (`product_id`),
  ADD KEY `order_variations_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `production_details`
--
ALTER TABLE `production_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `production_employees`
--
ALTER TABLE `production_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_employees_order_id_foreign` (`order_id`),
  ADD KEY `production_employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_models`
--
ALTER TABLE `product_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_category_id_foreign` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approve_designs`
--
ALTER TABLE `approve_designs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `lineups`
--
ALTER TABLE `lineups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `message_files`
--
ALTER TABLE `message_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `order_images`
--
ALTER TABLE `order_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `order_variations`
--
ALTER TABLE `order_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `production_details`
--
ALTER TABLE `production_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `production_employees`
--
ALTER TABLE `production_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_models`
--
ALTER TABLE `product_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lineups`
--
ALTER TABLE `lineups`
  ADD CONSTRAINT `lineups_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lineups_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_images`
--
ALTER TABLE `order_images`
  ADD CONSTRAINT `order_images_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_variations`
--
ALTER TABLE `order_variations`
  ADD CONSTRAINT `order_variations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_variations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_variations_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `production_details`
--
ALTER TABLE `production_details`
  ADD CONSTRAINT `production_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `production_employees`
--
ALTER TABLE `production_employees`
  ADD CONSTRAINT `production_employees_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `production_employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
