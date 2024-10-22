-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 22. 13:00
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pollakbackend`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `playerCount` int(11) NOT NULL,
  `playerPerTeam` int(11) DEFAULT NULL,
  `requiredForPrize` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `game`
--

INSERT INTO `game` (`id`, `name`, `playerCount`, `playerPerTeam`, `requiredForPrize`, `createdAt`, `updatedAt`) VALUES
(1, 'Valorant Game', 20, 5, 50000, '2024-10-17 20:42:33', '2024-10-17 20:42:33'),
(2, 'R6 Game', 20, 5, 50000, '2024-10-17 20:43:36', '2024-10-17 20:43:36'),
(3, 'LOL Game', 20, 5, 50000, '2024-10-17 20:43:45', '2024-10-17 20:43:45'),
(5, 'ValorantGame', 20, 20, 50000, '2024-10-22 10:43:05', '2024-10-22 10:43:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gamevariants`
--

CREATE TABLE `gamevariants` (
  `gameId` int(11) NOT NULL,
  `variantId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `typeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `gamevariants`
--

INSERT INTO `gamevariants` (`gameId`, `variantId`, `createdAt`, `updatedAt`, `typeId`) VALUES
(1, 1, '2024-10-17 20:43:23', '2024-10-21 09:30:09', 1),
(2, 2, '2024-10-17 20:43:56', '2024-10-21 09:46:55', 5),
(3, 3, '2024-10-17 20:44:01', '2024-10-21 09:30:17', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `matchtype`
--

CREATE TABLE `matchtype` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `matchtype`
--

INSERT INTO `matchtype` (`id`, `type`) VALUES
(1, '1v1'),
(2, '2v2'),
(3, '3v3'),
(4, '4v4'),
(5, '5v5');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `round`
--

CREATE TABLE `round` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `round`
--

INSERT INTO `round` (`id`, `number`, `title`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Valorant', '2024-10-17 20:45:00', '2024-10-21 10:48:50'),
(2, 2, 'Valorant', '2024-10-17 20:45:11', '2024-10-21 10:49:06'),
(3, 3, 'Valorant', '2024-10-17 20:45:22', '2024-10-21 10:49:10'),
(4, 4, 'Valorant', '2024-10-17 20:45:32', '2024-10-21 10:49:12'),
(5, 1, 'R6', '2024-10-17 20:47:25', '2024-10-21 10:49:31'),
(6, 2, 'R6', '2024-10-17 20:47:44', '2024-10-21 10:49:34'),
(7, 3, 'R6', '2024-10-17 20:47:44', '2024-10-21 10:49:37'),
(8, 4, 'R6', '2024-10-17 20:47:44', '2024-10-21 10:49:38'),
(9, 1, 'LOL', '2024-10-17 20:48:51', '2024-10-21 10:49:42'),
(10, 2, 'LOL', '2024-10-17 20:48:51', '2024-10-21 10:49:45'),
(11, 3, 'LOL', '2024-10-17 20:48:51', '2024-10-21 10:49:47'),
(12, 4, 'LOL', '2024-10-17 20:48:51', '2024-10-21 10:49:51');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roundsongame`
--

CREATE TABLE `roundsongame` (
  `roundId` int(11) NOT NULL,
  `gameId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `roundsongame`
--

INSERT INTO `roundsongame` (`roundId`, `gameId`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2024-10-17 20:49:53', '2024-10-17 20:49:53'),
(2, 1, '2024-10-17 20:50:09', '2024-10-17 20:50:09'),
(3, 1, '2024-10-17 20:50:09', '2024-10-17 20:50:09'),
(4, 1, '2024-10-17 20:50:09', '2024-10-17 20:50:09'),
(5, 2, '2024-10-17 20:50:20', '2024-10-17 20:50:20'),
(6, 2, '2024-10-17 20:50:34', '2024-10-17 20:50:34'),
(7, 2, '2024-10-17 20:50:34', '2024-10-17 20:50:34'),
(8, 2, '2024-10-17 20:50:34', '2024-10-17 20:50:34'),
(9, 3, '2024-10-17 20:50:55', '2024-10-17 20:50:55'),
(10, 3, '2024-10-17 20:50:55', '2024-10-17 20:50:55'),
(11, 3, '2024-10-17 20:50:55', '2024-10-17 20:50:55'),
(12, 3, '2024-10-17 20:50:55', '2024-10-17 20:50:55');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `seed`
--

CREATE TABLE `seed` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `roundId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `seed`
--

INSERT INTO `seed` (`id`, `date`, `roundId`, `createdAt`, `updatedAt`) VALUES
(1, '2024-10-17 21:11:07', 1, '2024-10-17 21:11:07', '2024-10-17 21:11:07'),
(2, '2024-10-17 21:11:17', 2, '2024-10-17 21:11:17', '2024-10-17 21:11:17'),
(4, '2024-10-17 21:11:17', 4, '2024-10-17 21:11:17', '2024-10-17 21:11:17'),
(5, '2024-10-17 21:11:47', 5, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(6, '2024-10-17 21:11:47', 6, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(7, '2024-10-17 21:11:47', 7, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(8, '2024-10-17 21:11:47', 8, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(9, '2024-10-17 21:11:47', 9, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(10, '2024-10-17 21:11:47', 10, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(11, '2024-10-17 21:11:47', 11, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(12, '2024-10-17 21:11:47', 12, '2024-10-17 21:11:47', '2024-10-17 21:11:47'),
(13, '0000-00-00 00:00:00', 3, '2024-10-22 09:44:31', '2024-10-22 09:44:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `team`
--

INSERT INTO `team` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(3, 'Kiralyok1', '2024-10-17 20:59:28', '2024-10-17 20:59:43'),
(4, 'Kiralyok2', '2024-10-17 20:59:39', '2024-10-17 20:59:39'),
(5, 'Kiralyok3', '2024-10-17 20:59:39', '2024-10-17 20:59:39'),
(6, 'Kiralyok4', '2024-10-17 20:59:39', '2024-10-17 20:59:39');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `teamsonseed`
--

CREATE TABLE `teamsonseed` (
  `teamOneId` int(11) NOT NULL,
  `teamTwoId` int(11) NOT NULL,
  `seedId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `teamsonseed`
--

INSERT INTO `teamsonseed` (`teamOneId`, `teamTwoId`, `seedId`, `createdAt`, `updatedAt`) VALUES
(3, 4, 1, '2024-10-17 21:25:34', '2024-10-17 21:25:34'),
(3, 5, 2, '2024-10-17 21:26:35', '2024-10-17 21:26:35'),
(5, 6, 1, '2024-10-17 21:26:21', '2024-10-17 21:26:21');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `om` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `om`, `password`, `createdAt`, `updatedAt`) VALUES
(1, '1janipatrik138@gmail.com', 'Kajcso1', '123455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:38:49'),
(10, '2janipatrik138@gmail.com', 'Kajcso2', '223455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(11, '3janipatrik138@gmail.com', 'Kajcso3', '323455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(12, '4janipatrik138@gmail.com', 'Kajcso4', '423455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(13, '5janipatrik138@gmail.com', 'Kajcso5', '523455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(14, '6janipatrik138@gmail.com', 'Kajcso6', '623455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(15, '7janipatrik138@gmail.com', 'Kajcso7', '723455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(16, '8janipatrik138@gmail.com', 'Kajcso8', '823455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(17, '9janipatrik138@gmail.com', 'Kajcso9', '923455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(18, '10janipatrik138@gmail.com', 'Kajcso10', '123455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(19, '11janipatrik138@gmail.com', 'Kajcso11', '223455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(20, '12janipatrik138@gmail.com', 'Kajcso12', '323455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(21, '13janipatrik138@gmail.com', 'Kajcso13', '423455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(22, '14janipatrik138@gmail.com', 'Kajcso14', '523455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(23, '15janipatrik138@gmail.com', 'Kajcso15', '623455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(24, '16janipatrik138@gmail.com', 'Kajcso16', '723455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(25, '17janipatrik138@gmail.com', 'Kajcso17', '823455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(26, '18janipatrik138@gmail.com', 'Kajcso18', '923455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(27, '19janipatrik138@gmail.com', 'Kajcso19', '123455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27'),
(28, '20janipatrik138@gmail.com', 'Kajcso20', '223455678', 'IDK', '2024-10-17 20:34:27', '2024-10-17 20:34:27');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `usersonteam`
--

CREATE TABLE `usersonteam` (
  `teamId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `usersonteam`
--

INSERT INTO `usersonteam` (`teamId`, `userId`, `createdAt`, `updatedAt`) VALUES
(3, 1, '2024-10-17 21:00:12', '2024-10-17 21:00:12'),
(3, 10, '2024-10-17 21:01:48', '2024-10-17 21:01:48'),
(3, 11, '2024-10-17 21:01:48', '2024-10-17 21:01:48'),
(3, 12, '2024-10-17 21:01:48', '2024-10-17 21:01:48'),
(3, 13, '2024-10-17 21:01:48', '2024-10-17 21:01:48'),
(4, 1, '2024-10-22 10:06:26', '2024-10-22 10:06:26'),
(4, 14, '2024-10-17 21:02:32', '2024-10-17 21:02:32'),
(4, 15, '2024-10-17 21:02:32', '2024-10-17 21:02:32'),
(4, 16, '2024-10-17 21:02:32', '2024-10-17 21:02:32'),
(4, 17, '2024-10-17 21:02:32', '2024-10-17 21:02:32'),
(4, 18, '2024-10-17 21:02:32', '2024-10-17 21:02:32'),
(5, 19, '2024-10-17 21:03:03', '2024-10-17 21:03:03'),
(5, 20, '2024-10-17 21:03:03', '2024-10-17 21:03:03'),
(5, 21, '2024-10-17 21:03:03', '2024-10-17 21:03:03'),
(5, 22, '2024-10-17 21:03:03', '2024-10-17 21:03:03'),
(5, 23, '2024-10-17 21:03:03', '2024-10-17 21:03:03'),
(6, 24, '2024-10-17 21:03:38', '2024-10-17 21:03:38'),
(6, 25, '2024-10-17 21:03:38', '2024-10-17 21:03:38'),
(6, 26, '2024-10-17 21:03:38', '2024-10-17 21:03:38'),
(6, 27, '2024-10-17 21:03:38', '2024-10-17 21:03:38'),
(6, 28, '2024-10-17 21:03:38', '2024-10-17 21:03:38');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `variant`
--

CREATE TABLE `variant` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `variant`
--

INSERT INTO `variant` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Valorant', '2024-10-17 20:42:45', '2024-10-17 20:42:45'),
(2, 'R6', '2024-10-17 20:42:54', '2024-10-17 20:42:54'),
(3, 'LOL', '2024-10-17 20:43:03', '2024-10-21 10:42:38');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `gamevariants`
--
ALTER TABLE `gamevariants`
  ADD PRIMARY KEY (`gameId`),
  ADD KEY `fk_game_variant_variant` (`variantId`),
  ADD KEY `typeId` (`typeId`),
  ADD KEY `gameId` (`gameId`);

--
-- A tábla indexei `matchtype`
--
ALTER TABLE `matchtype`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gameId` (`title`);

--
-- A tábla indexei `roundsongame`
--
ALTER TABLE `roundsongame`
  ADD PRIMARY KEY (`roundId`,`gameId`),
  ADD KEY `fk_round_game_game` (`gameId`);

--
-- A tábla indexei `seed`
--
ALTER TABLE `seed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seed_round` (`roundId`);

--
-- A tábla indexei `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `teamsonseed`
--
ALTER TABLE `teamsonseed`
  ADD PRIMARY KEY (`teamOneId`,`seedId`),
  ADD KEY `fk_team_seed_seed` (`seedId`),
  ADD KEY `fk_team_seed_team_two` (`teamTwoId`),
  ADD KEY `teamOneId` (`teamOneId`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `usersonteam`
--
ALTER TABLE `usersonteam`
  ADD PRIMARY KEY (`teamId`,`userId`),
  ADD KEY `fk_user_team_user` (`userId`);

--
-- A tábla indexei `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `matchtype`
--
ALTER TABLE `matchtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `round`
--
ALTER TABLE `round`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `seed`
--
ALTER TABLE `seed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT a táblához `variant`
--
ALTER TABLE `variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `gamevariants`
--
ALTER TABLE `gamevariants`
  ADD CONSTRAINT `fk_game_variant_game` FOREIGN KEY (`gameId`) REFERENCES `game` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_game_variant_variant` FOREIGN KEY (`variantId`) REFERENCES `variant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gamevariants_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `matchtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `roundsongame`
--
ALTER TABLE `roundsongame`
  ADD CONSTRAINT `fk_round_game_game` FOREIGN KEY (`gameId`) REFERENCES `game` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_round_game_round` FOREIGN KEY (`roundId`) REFERENCES `round` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `seed`
--
ALTER TABLE `seed`
  ADD CONSTRAINT `fk_seed_round` FOREIGN KEY (`roundId`) REFERENCES `round` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `teamsonseed`
--
ALTER TABLE `teamsonseed`
  ADD CONSTRAINT `fk_team_seed_seed` FOREIGN KEY (`seedId`) REFERENCES `seed` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_team_seed_team_one` FOREIGN KEY (`teamOneId`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_team_seed_team_two` FOREIGN KEY (`teamTwoId`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teamsonseed_ibfk_1` FOREIGN KEY (`teamOneId`) REFERENCES `team` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `usersonteam`
--
ALTER TABLE `usersonteam`
  ADD CONSTRAINT `fk_user_team_team` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_team_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
