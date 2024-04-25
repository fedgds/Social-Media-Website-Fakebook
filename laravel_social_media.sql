-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 25, 2024 lúc 03:35 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel_social_media`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `cover_path` varchar(1024) NOT NULL,
  `thumbnail_path` varchar(1024) NOT NULL,
  `auto_approval` tinyint(1) NOT NULL DEFAULT 1,
  `about` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_users`
--

CREATE TABLE `group_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `token_expire_date` varchar(255) DEFAULT NULL,
  `token_used` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_16_141597_create_groups_table', 1),
(6, '2024_04_16_141599_create_group_users_table', 1),
(7, '2024_04_16_141601_create_posts_table', 1),
(8, '2024_04_16_141649_create_post_attachments_table', 1),
(9, '2024_04_16_141706_create_post_reactions_table', 1),
(10, '2024_04_16_141729_create_comments_table', 1),
(11, '2024_04_16_141823_create_followers_table', 1),
(12, '2024_04_16_153352_add_columns_to_users_table', 1),
(13, '2024_04_23_144418_add_size_column_to_post_attachments_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('sangokyes@gmail.com', '$2y$12$Bvo9GxYNtzhvzkk.THAOpO3uxCkJ7kzq350hVNKvv2m1IN6kSvJIq', '2024-04-25 02:08:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `body`, `user_id`, `group_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tét pót', 1, NULL, NULL, '2024-04-21 01:09:44', '2024-04-20 02:51:24', '2024-04-21 01:09:44'),
(8, 'Another post update', 1, NULL, NULL, '2024-04-21 01:08:51', '2024-04-20 05:44:10', '2024-04-21 01:08:51'),
(9, '<h3>Lorem ipsum&nbsp;</h3><p>dolor sit amet, consectetur adipiscing elit. Sed eleifend ipsum eget metus ullamcorper, quis sagittis nisi efficitur. Aliquam erat volutpat. Duis sit amet lacus eros. Sed eget mauris nunc. Integer nec arcu vel nisi laoreet lacinia. Proin posuere magna ut ligula posuere, eu sodales ipsum tempus. Donec ut massa vel felis consequat hendrerit sed nec tortor. Vestibulum luctus tellus in fermentum bibendum. Integer venenatis lacinia libero ut malesuada. Aenean hendrerit auctor arcu, ut rhoncus odio finibus et. Aliquam ac arcu nec justo tristique consectetur. Fusce rutrum magna et nunc commodo, nec ultricies est rhoncus. Donec quis mauris feugiat, convallis lorem in, fermentum justo. Cras tincidunt justo at dolor eleifend volutpat. Nullam efficitur sem et mi tempus, quis lobortis purus consequat. Sed eget mauris eros. Sed vel metus non arcu mollis vestibulum. Sed et mi sit amet elit volutpat varius non nec sem.</p>', 1, NULL, NULL, NULL, '2024-04-20 06:53:51', '2024-04-21 02:19:07'),
(10, '<h2>Today todo list</h2><ul><li>Weak up</li><li>Eat</li><li>Sleep</li></ul><p>Ok then end of a day</p>', 1, NULL, NULL, '2024-04-25 01:22:49', '2024-04-20 20:01:41', '2024-04-25 01:22:49'),
(11, '<p>Choose&nbsp;</p><p>1 <a href=\"https://facebook.com\">Kiti</a></p><p>2 <i>Kata</i></p><p>3 <strong>Kete</strong></p><p>&nbsp; &nbsp; 4</p><p>&nbsp;5</p><p>&nbsp;6</p><p>&nbsp;7</p><p>&nbsp;8</p><p>&nbsp;9</p><p>&nbsp;10</p><p>&nbsp;11</p><p>&nbsp;12</p><p>&nbsp;13</p><p>&nbsp;14</p><p>&nbsp;15</p>', 1, NULL, NULL, '2024-04-25 01:22:44', '2024-04-21 06:19:05', '2024-04-25 01:22:44'),
(12, '<p>Create with ckediter</p><p>1tr</p><p>2tr</p><p>3tr</p><p>4tr</p><p>5tr</p><p>6tr</p><p>7tr</p><p>8tr</p><p>9tr</p><p>l</p><p>l</p><p>l</p><p>l</p><p>k</p><p>k</p><p>k</p><p>k</p><p>k</p><p>k</p><p>k</p><p>k</p><p>k</p>', 1, NULL, NULL, '2024-04-25 01:22:37', '2024-04-21 08:03:22', '2024-04-25 01:22:37'),
(13, '<p>ok 1</p>', 1, NULL, NULL, '2024-04-23 09:00:23', '2024-04-21 08:10:08', '2024-04-23 09:00:23'),
(14, '<h2>ok</h2><h3>ok</h3>', 1, NULL, NULL, '2024-04-25 01:22:32', '2024-04-21 09:11:38', '2024-04-25 01:22:32'),
(15, '', 1, NULL, NULL, '2024-04-25 01:22:26', '2024-04-21 19:05:13', '2024-04-25 01:22:26'),
(16, '', 1, NULL, NULL, '2024-04-25 01:22:19', '2024-04-23 08:48:37', '2024-04-25 01:22:19'),
(17, '<p>Váy đẹp</p>', 1, NULL, NULL, NULL, '2024-04-23 09:00:08', '2024-04-23 09:00:08'),
(18, '<p>Please praise me 😘</p>', 1, NULL, NULL, NULL, '2024-04-23 09:05:40', '2024-04-25 01:22:07'),
(19, '<p>la em oi</p>', 1, NULL, NULL, '2024-04-24 06:15:48', '2024-04-23 09:16:20', '2024-04-24 06:15:48'),
(20, '<p>ok hj</p>', 1, NULL, NULL, '2024-04-25 01:20:34', '2024-04-24 02:04:57', '2024-04-25 01:20:34'),
(21, '<h3>Is this ok? 🤗</h3>', 1, NULL, NULL, NULL, '2024-04-24 06:14:54', '2024-04-25 01:20:27'),
(22, '<p>I need this dress 🤔</p>', 1, NULL, NULL, NULL, '2024-04-24 06:23:35', '2024-04-25 01:18:54'),
(23, '<h2>Hello everyone!&nbsp;</h2><p>This is my personal GitHub profile: <a href=\"https://github.com/fedgds\">Shoppe</a></p>', 1, NULL, NULL, NULL, '2024-04-25 01:28:02', '2024-04-25 01:28:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_attachments`
--

CREATE TABLE `post_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `mime` varchar(25) NOT NULL,
  `size` int(11) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_attachments`
--

INSERT INTO `post_attachments` (`id`, `post_id`, `name`, `path`, `mime`, `size`, `created_by`, `created_at`) VALUES
(1, 16, 'ao-polo-nu-apn6256-dxl-7.webp', 'attachments/16/PQQiHHpomZ4CuxqMXZxxsKmdNk3PoKyWovEo88BY.webp', 'image/webp', 97974, 1, '2024-04-23 08:48:37'),
(2, 16, 'ao-polo-nu-apn7096-vag-1.webp', 'attachments/16/jHilhZ6PyABfnGPXWWLUEY9KJoQ2cEVUnyPVfNIF.webp', 'image/webp', 229562, 1, '2024-04-23 08:48:37'),
(3, 17, 'cvn6192-den-5.webp', 'attachments/17/Jxmf07iw2p3Mu45RKbf10PdtdQ87kO6PKJWioXYa.webp', 'image/webp', 153780, 1, '2024-04-23 09:00:08'),
(4, 17, 'cvn6192-den-8.webp', 'attachments/17/qB3aaWMmlLA8Rh7puQuBUsSQSiPGXqAVIf4KT0WR.webp', 'image/webp', 382392, 1, '2024-04-23 09:00:08'),
(5, 18, 'ao-polo-nu-apn5300-den-2-yodyvn.webp', 'attachments/18/RwLxnWt7FbjGVtb1nLZxb1Pv08dIAEktpRmZ1RjJ.webp', 'image/webp', 128022, 1, '2024-04-23 09:05:40'),
(6, 18, 'ao-polo-nu-apn5300-den-3-yodyvn.webp', 'attachments/18/5LNdcmCPqimdjzSqO90Csf6jy6poCrvHXmlUAnFM.webp', 'image/webp', 72600, 1, '2024-04-23 09:05:40'),
(7, 18, 'ao-polo-nu-apn5300-den-6-yodyvn.webp', 'attachments/18/tyBiPaIc0GiQTJp7ksvUtp9lpkZxSPSv36QJMAvx.webp', 'image/webp', 113882, 1, '2024-04-23 09:05:40'),
(8, 18, 'ao-polo-nu-apn5300-den-7-yodyvn.webp', 'attachments/18/mL5CyCQdSESYeWTSqebmdMlp7InM3xxbmdYhb8AV.webp', 'image/webp', 122824, 1, '2024-04-23 09:05:40'),
(9, 18, 'ao-polo-nu-apn6256-dxl-2.webp', 'attachments/18/uxGySG09qJmZvprtS9U45qZ0ctICDvOKhiBAlDVC.webp', 'image/webp', 155360, 1, '2024-04-23 09:05:40'),
(10, 18, 'ao-polo-nu-apn6256-dxl-4.webp', 'attachments/18/1iola4G9w4SILgFX7ydBC6v2hvOmxYpqvrOz6B76.webp', 'image/webp', 156330, 1, '2024-04-23 09:05:40'),
(11, 18, 'ao-polo-nu-apn6256-dxl-6.webp', 'attachments/18/yqLqaMNfzRiVMaG93l0aZFPyERI71p0dOYrNT109.webp', 'image/webp', 165490, 1, '2024-04-23 09:05:40'),
(12, 18, 'ao-polo-nu-apn6256-dxl-7.webp', 'attachments/18/3I6nPirXxAIbcHKy9u455GBwIMTTjkr35ZkK3idY.webp', 'image/webp', 97974, 1, '2024-04-23 09:05:40'),
(13, 18, 'ao-polo-nu-apn7096-vag-1.webp', 'attachments/18/9aMphBpdVJjHOs1He98ZOLo5t6iS9bmlCKURcHiY.webp', 'image/webp', 229562, 1, '2024-04-23 09:05:40'),
(14, 18, 'ao-polo-nu-apn7096-vag-2.webp', 'attachments/18/GPDnOdcMn8NmjQETlM8xTvWXxsqzUrWeTFM0uYxU.webp', 'image/webp', 245894, 1, '2024-04-23 09:05:40'),
(15, 19, 'ao-polo-nu-apn6256-dxl-4.webp', 'attachments/19/fvfFiXMTAtPZ9RHrUyKSXTJGs1vMg7pcRT8mEyOW.webp', 'image/webp', 156330, 1, '2024-04-23 09:16:20'),
(16, 21, 'ao-polo-nu-apn5300-den-6-yodyvn.webp', 'attachments/21/6IPTxk4ZHyuFJw6GSohXGDwB3CEUlqW9ElGhctBi.webp', 'image/webp', 113882, 1, '2024-04-24 06:14:54'),
(17, 21, 'ao-polo-nu-apn6256-dxl-7.webp', 'attachments/21/wAjThr3lidzqg7PL0jWIm3PCGvwIugJ7OvTdBnI5.webp', 'image/webp', 97974, 1, '2024-04-24 06:15:58'),
(18, 21, 'ao-polo-nu-apn7096-vag-1.webp', 'attachments/21/8XWAsKLs6VwoHBV1a0MMaCWBokcOS8tXnN0szd2f.webp', 'image/webp', 229562, 1, '2024-04-24 06:19:13'),
(19, 21, 'ao-polo-nu-apn7096-vag-2.webp', 'attachments/21/7147RtpHuwme9yM78PmAm2pULX1QWtiDIGZ1OjPP.webp', 'image/webp', 245894, 1, '2024-04-24 06:19:13'),
(23, 22, 'chan-vay-nu-cvn6152-nau-3.webp', 'attachments/22/P6bnHEXDuUi0ziWmghKI1GGbp0wiNNrzQfqfGeRY.webp', 'image/webp', 266372, 1, '2024-04-24 07:15:07'),
(27, 21, 'chan-vay-nu-cvn3192-den-1-yodyvn.webp', 'attachments/21/5nVrmYvQIMA1jxPLVXFSx1KjqGwpy2MoFxWpi4u9.webp', 'image/webp', 51858, 1, '2024-04-25 01:19:33'),
(28, 21, 'chan-vay-nu-cvn3192-den-2-yodyvn.webp', 'attachments/21/Kdnr5lLehKoZktTpoStb1WahyaHm3iKm8jNcoy5p.webp', 'image/webp', 60416, 1, '2024-04-25 01:19:33'),
(29, 21, 'chan-vay-nu-cvn3192-den-4-yodyvn.webp', 'attachments/21/SJhcCfqjbJ4SOe6biqzzNHY6nEB3iqO0yjG4EmvK.webp', 'image/webp', 62860, 1, '2024-04-25 01:19:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_reactions`
--

CREATE TABLE `post_reactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `cover_path` varchar(1024) DEFAULT NULL,
  `avatar_path` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `cover_path`, `avatar_path`) VALUES
(1, 'Sang La', 'sangokyes@gmail.com', NULL, '$2y$12$V932EPqzF7KzLZCKhjxBue07iNIobXZTvPatrouRGBHZb.nKYazE2', '7rMkycsfFIfOgRqKFu7zK9yqG6Cny2Gqd7EagSEbizvW1qCyH25aB2EsUJQ9', '2024-04-16 18:52:57', '2024-04-25 02:47:03', 'sang-la', 'user-/1/InivH4NuH6a7I9M43fv7chjYBgZnVlI94M0Z5RoI.jpg', 'user-/1/eNtC1pm6WpKEttgYywXNF5G8MEgT3TSAlgV4v4XP.png'),
(2, 'Su La', 'suokyes@gmail.com', NULL, '$2y$12$xs6LW.UVhZNdS7svvEHRLeT7IjE7reQMbGJNtOZvIRoxZl0asccbq', NULL, '2024-04-16 18:54:59', '2024-04-25 02:10:41', 'su-la', 'user-/2/TjsD4ZHhWjnShFMP75seJTNtp7VaM4oU05C9ObqB.jpg', 'user-/2/trvt7ptyX10Qaq6ZXWq4MMMAHwujrX0A61mcsoPM.jpg'),
(3, 'admin', 'admin@gmail.com', NULL, '$2y$12$Q6Fqie8ht8BIIzqCQBTwEO/iXlB.JheNOYUfpnmV9sps4HOMi9OBu', NULL, '2024-04-25 02:17:09', '2024-04-25 02:47:32', 'admin', 'user-/3/mLPqKinWVq0nlGjRZ7UyOp5ooTFp6s6VGXMUzUm2.jpg', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followers_user_id_foreign` (`user_id`),
  ADD KEY `followers_follower_id_foreign` (`follower_id`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_user_id_foreign` (`user_id`),
  ADD KEY `groups_deleted_by_foreign` (`deleted_by`);

--
-- Chỉ mục cho bảng `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_users_user_id_foreign` (`user_id`),
  ADD KEY `group_users_group_id_foreign` (`group_id`),
  ADD KEY `group_users_created_by_foreign` (`created_by`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_group_id_foreign` (`group_id`),
  ADD KEY `posts_deleted_by_foreign` (`deleted_by`);

--
-- Chỉ mục cho bảng `post_attachments`
--
ALTER TABLE `post_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_attachments_post_id_foreign` (`post_id`),
  ADD KEY `post_attachments_created_by_foreign` (`created_by`);

--
-- Chỉ mục cho bảng `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_reactions_post_id_foreign` (`post_id`),
  ADD KEY `post_reactions_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `post_attachments`
--
ALTER TABLE `post_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `post_reactions`
--
ALTER TABLE `post_reactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `group_users`
--
ALTER TABLE `group_users`
  ADD CONSTRAINT `group_users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `group_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `post_attachments`
--
ALTER TABLE `post_attachments`
  ADD CONSTRAINT `post_attachments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `post_attachments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Các ràng buộc cho bảng `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD CONSTRAINT `post_reactions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_reactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
