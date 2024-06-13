-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 01, 2023 alle 10:47
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grunge`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `prenota`
--

CREATE TABLE `prenota` (
  `id_prenotazione` int(11) NOT NULL,
  `nominativo` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `data` date NOT NULL,
  `orario_inizio` int(11) NOT NULL,
  `numeroPersone` int(10) NOT NULL,
  `orario_fine` int(11) NOT NULL,
  `produttore` varchar(30) NOT NULL,
  `room` int(3) NOT NULL,
  `id_servizio` int(11) NOT NULL,
  `costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prenota`
--

INSERT INTO `prenota` (`id_prenotazione`, `nominativo`, `email`, `data`, `orario_inizio`, `numeroPersone`, `orario_fine`, `produttore`, `room`, `id_servizio`, `costo`) VALUES
(1, 'Rigamonti', 'lucarigamonti23@gmail.com', '2023-06-01', 16, 4, 18, '', 1, 1, 46),
(3, 'franco', 'lucarigamonti23@gmail.com', '2023-05-05', 10, 6, 12, '', 2, 1, 40),
(5, 'Rigamonti', 'lucarigamonti23@gmail.com', '2023-06-01', 16, 3, 18, '', 4, 2, 160),
(9, 'Rigamonti', 'lucarigamonti23@gmail.com', '2023-06-01', 16, 0, 18, 'Michelangelo', 5, 3, 160),
(10, 'Rigamonti', 'lucarigamonti23@gmail.com', '2023-10-01', 0, 0, 0, '', 6, 4, 1200),
(11, 'Rigamonti', 'lucarigamonti23@gmail.com', '2023-10-01', 0, 0, 0, '', 8, 4, 1200);

-- --------------------------------------------------------

--
-- Struttura della tabella `servizi`
--

CREATE TABLE `servizi` (
  `id_servizio` int(11) NOT NULL,
  `tipo` varchar(256) NOT NULL,
  `etichetta` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `servizi`
--

INSERT INTO `servizi` (`id_servizio`, `tipo`, `etichetta`) VALUES
(1, 'Sessione', 'Grunge'),
(2, 'Registrazione', 'Grunge'),
(3, 'Produzione', 'Grunge'),
(4, 'Campus', 'Grunge');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `nome` varchar(25) DEFAULT NULL,
  `cognome` varchar(25) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `psw` varchar(256) DEFAULT NULL,
  `ruolo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`nome`, `cognome`, `email`, `psw`, `ruolo`) VALUES
('giulio', 'marchi', 'giulio.marchi@itismonza.it', '$2y$10$PjbyAcW2VAZD7XwAcrhrLuiiT/a8toaJ3ybhJPGfypD8HZQKmSKwa', 0),
('Luca', 'Rigamonti', 'luca.rigamonti@itismonza.it', '$2y$10$8SI5kFVwIo8kBGSxL3kTqeylP9DHWLQi22xEPTA7yD79SFSd9Hkmm', 2),
('Luca', 'Rigamonti', 'lucarigamonti23@gmail.com', '$2y$10$eYSZyA3cFjFLJXI08Tt7nufloJopJ5KLVLbOWiKDu0Rm1FTfcVwQy', 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `prenota`
--
ALTER TABLE `prenota`
  ADD PRIMARY KEY (`id_prenotazione`),
  ADD KEY `email` (`email`),
  ADD KEY `id_servizio` (`id_servizio`);

--
-- Indici per le tabelle `servizi`
--
ALTER TABLE `servizi`
  ADD PRIMARY KEY (`id_servizio`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prenota`
--
ALTER TABLE `prenota`
  MODIFY `id_prenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenota`
--
ALTER TABLE `prenota`
  ADD CONSTRAINT `prenota_ibfk_1` FOREIGN KEY (`email`) REFERENCES `utente` (`email`),
  ADD CONSTRAINT `prenota_ibfk_2` FOREIGN KEY (`id_servizio`) REFERENCES `servizi` (`id_servizio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
