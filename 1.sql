-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 05 2022 г., 21:37
-- Версия сервера: 5.7.39
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lunado`
--

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bet` double(255,2) NOT NULL,
  `chance` double(255,2) NOT NULL,
  `win` double(255,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fake` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jackpots`
--

CREATE TABLE `jackpots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `winner_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winner_ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `random` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jackpot_bets`
--

CREATE TABLE `jackpot_bets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(32,2) NOT NULL,
  `ticket_from` bigint(20) NOT NULL,
  `ticket_to` bigint(20) NOT NULL,
  `chance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `mines`
--

CREATE TABLE `mines` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `bombs` int(11) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `grid` json DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `fake` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sum` double(255,2) NOT NULL,
  `bonus` double(16,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `profit`
--

CREATE TABLE `profit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_dice` double(16,2) NOT NULL DEFAULT '0.00',
  `bank_mines` double(16,2) NOT NULL DEFAULT '0.00',
  `bank_bubbles` double(16,2) NOT NULL DEFAULT '0.00',
  `earn_bubbles` double(16,2) NOT NULL DEFAULT '0.00',
  `comission` int(11) NOT NULL DEFAULT '0',
  `earn_dice` double(16,2) NOT NULL DEFAULT '0.00',
  `earn_mines` double(16,2) NOT NULL DEFAULT '0.00',
  `earn_wheel` double(16,2) DEFAULT '0.00',
  `bank_wheel` double(16,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `profit`
--

INSERT INTO `profit` (`id`, `bank_dice`, `bank_mines`, `bank_bubbles`, `earn_bubbles`, `comission`, `earn_dice`, `earn_mines`, `earn_wheel`, `bank_wheel`, `created_at`, `updated_at`) VALUES
(1, 1000.00, 1000.00, 1000.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, '2022-10-16 01:14:51');

-- --------------------------------------------------------

--
-- Структура таблицы `promocodes`
--

CREATE TABLE `promocodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sum` double(255,2) NOT NULL,
  `activation` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `promocode_activations`
--

CREATE TABLE `promocode_activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `referral_payments`
--

CREATE TABLE `referral_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `referral_id` bigint(20) UNSIGNED NOT NULL,
  `sum` double(255,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `referral_profits`
--

CREATE TABLE `referral_profits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kassa_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kassa_secret1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kassa_secret2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kassa_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_secret` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_desc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xmpay_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xmpay_public` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xmpay_secret` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_payment_sum` double(8,2) DEFAULT NULL,
  `min_bonus_sum` double(8,2) DEFAULT NULL,
  `min_withdraw_sum` double(8,2) DEFAULT NULL,
  `min_dep_withdraw` int(11) DEFAULT NULL,
  `withdraw_request_limit` int(11) DEFAULT NULL,
  `vk_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tg_channel` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tg_bot` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vk_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vk_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_perc` int(11) DEFAULT NULL,
  `ref_price` float NOT NULL DEFAULT '0',
  `bot_timer` double(8,2) DEFAULT NULL,
  `file_version` int(11) NOT NULL DEFAULT '1',
  `connect_bonus` int(11) NOT NULL DEFAULT '0',
  `antiminus` int(11) NOT NULL DEFAULT '0',
  `recapctha_site` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recapctha_secret` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vk_support_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `title`, `description`, `keywords`, `kassa_id`, `kassa_secret1`, `kassa_secret2`, `kassa_key`, `wallet_id`, `wallet_secret`, `wallet_desc`, `xmpay_id`, `xmpay_public`, `xmpay_secret`, `min_payment_sum`, `min_bonus_sum`, `min_withdraw_sum`, `min_dep_withdraw`, `withdraw_request_limit`, `vk_url`, `tg_channel`, `tg_bot`, `vk_id`, `vk_token`, `ref_perc`, `ref_price`, `bot_timer`, `file_version`, `connect_bonus`, `antiminus`, `recapctha_site`, `recapctha_secret`, `vk_support_url`, `created_at`, `updated_at`) VALUES
(1, 'Title', NULL, NULL, '', '', '', '', '', '', NULL, '', '', '', 0.00, NULL, 0.00, NULL, 1, '', '', '', '', '', 0, 0, 0.00, 0, 5, 1, '', '', '', NULL, '2022-10-14 11:25:14');

-- --------------------------------------------------------

--
-- Структура таблицы `slots`
--

CREATE TABLE `slots` (
  `id` int(11) NOT NULL,
  `game_id` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `provider` varchar(150) NOT NULL,
  `icon` varchar(150) NOT NULL,
  `show` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_200` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://vk.com/images/camera_200.png',
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double(255,2) NOT NULL DEFAULT '0.00',
  `wager` double(16,2) NOT NULL DEFAULT '0.00',
  `wager_status` int(11) NOT NULL DEFAULT '1',
  `is_vk` tinyint(1) NOT NULL,
  `vk_id` bigint(20) DEFAULT NULL,
  `tg_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vk_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dice` double(16,2) NOT NULL DEFAULT '0.00',
  `mines` double(16,2) NOT NULL DEFAULT '0.00',
  `slots` double(16,2) NOT NULL DEFAULT '0.00',
  `bubbles` double(16,2) NOT NULL DEFAULT '0.00',
  `hid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mines_game` json DEFAULT NULL,
  `referral_use` json DEFAULT NULL,
  `referral_percent` double(16,2) NOT NULL DEFAULT '0.00',
  `referral_send` int(11) NOT NULL DEFAULT '0',
  `mines_is_active` tinyint(1) NOT NULL DEFAULT '0',
  `referral_use_promo` timestamp NULL DEFAULT NULL,
  `is_bot` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `is_moderator` int(11) NOT NULL DEFAULT '0',
  `is_promocoder` int(11) NOT NULL DEFAULT '0',
  `is_youtuber` int(11) NOT NULL DEFAULT '0',
  `is_worker` int(11) NOT NULL DEFAULT '0',
  `privacy_hide` int(11) NOT NULL DEFAULT '0',
  `privacy_hide_transfer` int(11) NOT NULL DEFAULT '0',
  `ban` int(11) NOT NULL DEFAULT '0',
  `bonus_use` int(11) NOT NULL DEFAULT '0',
  `vk_bonus_use` int(11) NOT NULL DEFAULT '0',
  `tg_bonus_use` int(11) NOT NULL DEFAULT '0',
  `created_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_ban` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_ban_reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_token` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_token_date` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sum` double(255,2) NOT NULL,
  `sumWithCom` double(16,2) NOT NULL DEFAULT '0.00',
  `wallet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system` int(11) NOT NULL,
  `system_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `fake` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jackpots`
--
ALTER TABLE `jackpots`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jackpot_bets`
--
ALTER TABLE `jackpot_bets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mines`
--
ALTER TABLE `mines`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profit`
--
ALTER TABLE `profit`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `promocode_activations`
--
ALTER TABLE `promocode_activations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `referral_payments`
--
ALTER TABLE `referral_payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `referral_profits`
--
ALTER TABLE `referral_profits`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jackpots`
--
ALTER TABLE `jackpots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jackpot_bets`
--
ALTER TABLE `jackpot_bets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mines`
--
ALTER TABLE `mines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `profit`
--
ALTER TABLE `profit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `promocode_activations`
--
ALTER TABLE `promocode_activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `referral_payments`
--
ALTER TABLE `referral_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `referral_profits`
--
ALTER TABLE `referral_profits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `slots`
--
ALTER TABLE `slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
