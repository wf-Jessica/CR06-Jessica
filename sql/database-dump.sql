-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Jan 2020 um 11:22
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr6`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `class`
--

CREATE TABLE `class` (
  `id` bigint(20) NOT NULL,
  `classname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `class`
--

INSERT INTO `class` (`id`, `classname`) VALUES
(1, '1a'),
(2, '1b'),
(3, '1c'),
(4, '1d');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enroll`
--

CREATE TABLE `enroll` (
  `enrollID` bigint(20) NOT NULL,
  `studentID` bigint(20) NOT NULL,
  `classID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `enroll`
--

INSERT INTO `enroll` (`enrollID`, `studentID`, `classID`) VALUES
(1, 2, 2),
(2, 4, 4),
(3, 4, 4),
(4, 2, 3),
(5, 2, 3),
(6, 5, 4),
(7, 5, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `student`
--

INSERT INTO `student` (`id`, `name`, `surname`, `email`) VALUES
(1, 'Julia', 'Bauer', 'julia.bauer@hotmail.com'),
(2, 'Isabella', 'triltsch', 'triltsch.isi@hotmail.com'),
(3, 'Jessica', 'Triltsch', 'triltsch.jessica@hotmail.com'),
(4, 'Christian', 'Keinz', 'keinz.c@hotmail.com'),
(5, 'Manuela', 'Bauer', 'manuela.b@hotmail.com'),
(6, 'Franziska', 'Faul', 'f.fr@hotmail.com'),
(7, 'Julian', 'Springer', 'julian.Springer@hotmail.com'),
(8, 'Waltraud', 'Nawar', 'walt.naw@hotmail.com'),
(9, 'Helene', 'Fischer', 'fischer.hel@hotmail.com'),
(10, 'Max', 'Musti', 'Musti.Max@hotmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher`
--

CREATE TABLE `teacher` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `surname`, `email`) VALUES
(1, 'Prof.Helmut', 'Wagner', 'helmut.wagner@hotmail.com'),
(2, 'Prof.Jasmine', 'Mayer', 'Mayer.Jasmine@hotmail.com'),
(3, 'Prof.Rudolf', 'Rudi', 'rudolf.rudi@hotmail.com'),
(4, 'Prof.arkus', 'Martin', 'arkus.martin@hotmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacherenroll`
--

CREATE TABLE `teacherenroll` (
  `teacherenrollID` bigint(20) NOT NULL,
  `teacherID` bigint(20) NOT NULL,
  `teacherclassID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `teacherenroll`
--

INSERT INTO `teacherenroll` (`teacherenrollID`, `teacherID`, `teacherclassID`) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 2, 3),
(4, 2, 3),
(5, 1, 3),
(6, 1, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`enrollID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `classID` (`classID`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teacherenroll`
--
ALTER TABLE `teacherenroll`
  ADD PRIMARY KEY (`teacherenrollID`),
  ADD KEY `teacherID` (`teacherID`),
  ADD KEY `teacherclassID` (`teacherclassID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `class`
--
ALTER TABLE `class`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `enroll`
--
ALTER TABLE `enroll`
  MODIFY `enrollID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `teacherenroll`
--
ALTER TABLE `teacherenroll`
  MODIFY `teacherenrollID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`classID`) REFERENCES `class` (`id`);

--
-- Constraints der Tabelle `teacherenroll`
--
ALTER TABLE `teacherenroll`
  ADD CONSTRAINT `teacherenroll_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`id`),
  ADD CONSTRAINT `teacherenroll_ibfk_2` FOREIGN KEY (`teacherclassID`) REFERENCES `class` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
