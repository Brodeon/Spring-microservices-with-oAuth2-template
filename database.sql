-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               10.1.37-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Zrzut struktury bazy danych shopping_list
CREATE DATABASE IF NOT EXISTS `shopping_list` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;
USE `shopping_list`;

-- Zrzut struktury tabela shopping_list.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_string` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli shopping_list.role: ~1 rows (około)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `role_string`) VALUES
	(1, 'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Zrzut struktury tabela shopping_list.shopping_lists
CREATE TABLE IF NOT EXISTS `shopping_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_name` text COLLATE utf8_polish_ci,
  `creation_date` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_shopping_lists_users` (`user_id`),
  CONSTRAINT `FK_shopping_lists_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli shopping_list.shopping_lists: ~0 rows (około)
/*!40000 ALTER TABLE `shopping_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_lists` ENABLE KEYS */;

-- Zrzut struktury tabela shopping_list.shopping_lists_items
CREATE TABLE IF NOT EXISTS `shopping_lists_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL,
  `item_name` text COLLATE utf8_polish_ci,
  `is_bought` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_shopping_lists_items_shopping_lists` (`list_id`),
  CONSTRAINT `FK_shopping_lists_items_shopping_lists` FOREIGN KEY (`list_id`) REFERENCES `shopping_lists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli shopping_list.shopping_lists_items: ~0 rows (około)
/*!40000 ALTER TABLE `shopping_lists_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_lists_items` ENABLE KEYS */;

-- Zrzut struktury tabela shopping_list.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text COLLATE utf8_polish_ci,
  `password` text COLLATE utf8_polish_ci,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_roles` (`role_id`),
  CONSTRAINT `FK_users_roles` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli shopping_list.users: ~1 rows (około)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `role_id`) VALUES
	(1, 'User1', '$2a$10$QQTg9DtOa/3djXS2WwWIYu9l9UCJphhqxgi1kWEqxQ4OuL1OBJcxO', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
