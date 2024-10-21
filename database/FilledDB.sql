-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 21. 11:47
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

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `gamevariants`
--
ALTER TABLE `gamevariants`
  ADD PRIMARY KEY (`gameId`,`variantId`),
  ADD KEY `fk_game_variant_variant` (`variantId`),
  ADD KEY `typeId` (`typeId`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
