-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Cze 06, 2024 at 01:26 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megusta`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opinie`
--

CREATE TABLE `opinie` (
  `id` int(11) NOT NULL,
  `opinia` int(11) NOT NULL,
  `komentarz` varchar(255) NOT NULL,
  `konsument_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opisy`
--

CREATE TABLE `opisy` (
  `id` int(11) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `produkt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opisy`
--

INSERT INTO `opisy` (`id`, `opis`, `produkt_id`) VALUES
(1, 'Super mleko pasteryzowane wielokrotnie tylko 2 procent tluszczu', 1),
(2, 'super mleko pasteryzowane aż 3,2 % tłuszczu', 2),
(7, 'git', 9),
(8, 'Mega mleko sojowe dla baristów', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `nazwa`, `cena`) VALUES
(1, 'mleko UHT 2%', 2),
(2, 'mleko UHT 3.2%', 2),
(9, 'mleko kokosowe', 10),
(10, 'Mleko sojowe', 68);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(100) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`, `confirmed`, `reg_date`) VALUES
(21, 'admin', 'kierownikprojektu12@gmail.com', '$2y$10$z4shdWtzDeDoa1NbN5ouUuzOBjrWfbV08NFwUmblety5d3ZqGTn4.', 'b8a74d6813153a212f57dfdf937f9b29839b376718184fdfda5e5cd32531e89f0c54bb044897724136da94cdffd5bcda3e72', 2, '2024-06-03 21:02:59');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `verify`
--

CREATE TABLE `verify` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `verify_token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdjecia`
--

CREATE TABLE `zdjecia` (
  `id` int(11) NOT NULL,
  `img` varchar(20) NOT NULL,
  `produkt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zdjecia`
--

INSERT INTO `zdjecia` (`id`, `img`, `produkt_id`) VALUES
(1, 'mleko32.jpg', 2),
(2, 'mleko2.jpg', 1),
(5, 'plik_1717452689.webp', 9),
(6, 'plik_17174528545.jpg', 10);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `opinie`
--
ALTER TABLE `opinie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsument_id` (`konsument_id`),
  ADD KEY `produkt_id` (`produkt_id`);

--
-- Indeksy dla tabeli `opisy`
--
ALTER TABLE `opisy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produkt_id` (`produkt_id`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `verify`
--
ALTER TABLE `verify`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produkt_id` (`produkt_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `opinie`
--
ALTER TABLE `opinie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `opisy`
--
ALTER TABLE `opisy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `verify`
--
ALTER TABLE `verify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `zdjecia`
--
ALTER TABLE `zdjecia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `opinie`
--
ALTER TABLE `opinie`
  ADD CONSTRAINT `opinie_ibfk_1` FOREIGN KEY (`konsument_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `opinie_ibfk_2` FOREIGN KEY (`produkt_id`) REFERENCES `produkty` (`id`);

--
-- Constraints for table `opisy`
--
ALTER TABLE `opisy`
  ADD CONSTRAINT `opisy_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkty` (`id`);

--
-- Constraints for table `verify`
--
ALTER TABLE `verify`
  ADD CONSTRAINT `verify_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `zdjecia`
--
ALTER TABLE `zdjecia`
  ADD CONSTRAINT `zdjecia_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkty` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
