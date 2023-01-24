-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 05 août 2020 à 15:55
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `splife`
--

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `imglink` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `imglink`) VALUES
('Adder', 'adder', 900000, 'super', 'Adder.jpg'),
('Alpha', 'alpha', 60000, 'sports', 'Alpha.png'),
('Ardent', 'ardent', 1150000, 'sportsclassics', 'Ardent.png'),
('Asea', 'asea', 5500, 'sedans', 'Asea.jpg'),
('Autarch', 'autarch', 1955000, 'super', 'Autarch.png'),
('Baller', 'baller2', 40000, 'suvs', 'Baller.png'),
('Banshee', 'banshee', 70000, 'sports', 'Banshee.png'),
('Banshee 900R', 'banshee2', 255000, 'super', 'Banshee900R.png'),
('Bestia GTS', 'bestiagts', 55000, 'sports', 'Bestiagts.png'),
('Bf Injection', 'bfinjection', 16000, 'offroad', 'Injection.png'),
('Bifta', 'bifta', 12000, 'offroad', 'Bifta.png'),
('Bison', 'bison', 45000, 'vans', 'Bison.png'),
('Blade', 'blade', 15000, 'muscle', 'Blade.png'),
('Blazer', 'blazer', 6500, 'offroad', 'blazer.png'),
('Blazer Sport ', 'blazer4', 8500, 'offroad', 'StreetBlazer.png'),
('Blista', 'blista', 8000, 'compacts', 'Blista.png'),
('Bobcat XL', 'bobcatxl', 32000, 'vans', 'bobcatxl.png'),
('Brawler', 'brawler', 45000, 'offroad', 'Brawler.png'),
('Brioso R/A', 'brioso', 18000, 'compacts', 'brisio.png'),
('Btype', 'btype', 62000, 'sportsclassics', 'Btype.png'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics', 'BtypeHotroad.png'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics', 'BtypeLuxe.png'),
('Buccaneer', 'buccaneer', 18000, 'muscle', 'Buccaneer.png'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle', 'BuccaneerRider.png'),
('Buffalo', 'buffalo', 12000, 'sports', 'Buffalo.png'),
('Buffalo S', 'buffalo2', 20000, 'sports', 'BuffaloS.jpg'),
('Bullet', 'bullet', 90000, 'super', 'Bullet.jpg'),
('Burrito', 'burrito3', 19000, 'vans', 'Burrito.png'),
('Camper', 'camper', 42000, 'vans', 'Camper.png'),
('Carbonizzare', 'carbonizzare', 75000, 'sports', 'carbonizzare.jpg'),
('Casco', 'casco', 30000, 'sportsclassics', 'Casco.png'),
('Cavalcade', 'cavalcade2', 55000, 'suvs', 'Cavalcade.jpg'),
('Cheetah', 'cheetah', 375000, 'super', 'Banshee900R.png'),
('Chino', 'chino', 15000, 'muscle', 'Chino.png'),
('Chino Luxe', 'chino2', 19000, 'muscle', 'ChinoLuxe.png'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes', 'cogcabrio.png'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans', 'cognoscenti.png'),
('Comet', 'comet2', 65000, 'sports', 'Comet.png'),
('Contender', 'contender', 70000, 'suvs', 'Contender.png'),
('Coquette', 'coquette', 65000, 'sports', 'Coquette.png'),
('Cyclone', 'cyclone', 1890000, 'super', 'Cyclone.png'),
('Dominator', 'dominator', 35000, 'muscle', 'Dominator.jpg'),
('Dubsta', 'dubsta', 45000, 'suvs', 'BenefactorDubsta.png'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad', 'Bubsta6x6.png'),
('Dukes', 'dukes', 28000, 'muscle', 'Dukes.jpg'),
('Elegy', 'elegy2', 38500, 'sports', 'Elegy.jpg'),
('Emperor', 'emperor', 8500, 'sedans', 'Emperor.png'),
('Entity XF', 'entityxf', 425000, 'super', 'EntityXF.png'),
('Exemplar', 'exemplar', 32000, 'coupes', 'Exemplar.png'),
('F620', 'f620', 40000, 'coupes', 'F620.png'),
('Faction', 'faction', 20000, 'muscle', 'Faction.png'),
('Felon GT', 'felon2', 55000, 'coupes', 'FelonGT.png'),
('Feltzer', 'feltzer2', 55000, 'sports', 'Feltzer.png'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics', 'StirlingGT.png'),
('FMJ', 'fmj', 185000, 'super', 'FMJ.png'),
('Fugitive', 'fugitive', 12000, 'sedans', 'Fugitive.png'),
('Furore GT', 'furoregt', 45000, 'sports', 'furoregt.png'),
('Fusilade', 'fusilade', 40000, 'sports', 'fusilade.jpg'),
('Gauntlet', 'gauntlet', 30000, 'muscle', 'gauntlet.png'),
('Gang Burrito', 'gburrito', 45000, 'vans', 'gburrito.png'),
('Glendale', 'glendale', 6500, 'sedans', 'Glendale.png'),
('Grabger', 'granger', 50000, 'suvs', 'Grabger.png'),
('Gresley', 'gresley', 47500, 'suvs', 'Gresley.png'),
('GT 500', 'gt500', 785000, 'sportsclassics', 'GT500.png'),
('Guardian', 'guardian', 45000, 'offroad', 'guardian.png'),
('Hermes', 'hermes', 535000, 'muscle', 'hermes.png'),
('Hotknife', 'hotknife', 125000, 'muscle', 'hotknife.png'),
('Huntley S', 'huntley', 40000, 'suvs', 'huntley.png'),
('Hustler', 'hustler', 625000, 'muscle', 'Hustler.png'),
('Infernus', 'infernus', 180000, 'super', 'Infernus.jpg'),
('Intruder', 'intruder', 7500, 'sedans', 'intruder.png'),
('Issi', 'issi2', 10000, 'compacts', 'Issi.png'),
('Jackal', 'jackal', 38000, 'coupes', 'jackal.png'),
('Jester', 'jester', 65000, 'sports', 'jester.png'),
('Jester(Racecar)', 'jester2', 135000, 'sports', 'JesterRacecar.png'),
('Journey', 'journey', 6500, 'vans', 'Journey.png'),
('Kamacho', 'kamacho', 345000, 'offroad', 'kamacho.png'),
('Khamelion', 'khamelion', 38000, 'sports', 'khamelion.png'),
('Kuruma', 'kuruma', 30000, 'sports', 'kuruma.png'),
('Landstalker', 'landstalker', 35000, 'suvs', 'landstalker.png'),
('RE-7B', 'le7b', 325000, 'super', 'RE-7B.png'),
('Lynx', 'lynx', 40000, 'sports', 'lynx.png'),
('Mamba', 'mamba', 70000, 'sports', 'Mamba.png'),
('Manana', 'manana', 12800, 'sportsclassics', 'Manana.png'),
('Massacro', 'massacro', 65000, 'sports', 'Massacro.png'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports', 'MassacroRacecar.png'),
('Mesa', 'mesa', 16000, 'suvs', 'Mesa.png'),
('Minivan', 'minivan', 13000, 'vans', 'minivan.png'),
('Monroe', 'monroe', 55000, 'sportsclassics', 'monroe.png'),
('The Liberator', 'monster', 210000, 'offroad', 'TheLiberator.png'),
('Moonbeam', 'moonbeam', 18000, 'vans', 'moonbeam.png'),
('Neon', 'neon', 1500000, 'sports', 'neon.png'),
('Nightshade', 'nightshade', 65000, 'muscle', 'Nightshade.png'),
('9F', 'ninef', 65000, 'sports', '9F.png'),
('Omnis', 'omnis', 35000, 'sports', 'Omnis.png'),
('Oracle XS', 'oracle2', 35000, 'coupes', 'OracleXS.png'),
('Osiris', 'osiris', 160000, 'super', 'Osiris.png'),
('Panto', 'panto', 10000, 'compacts', 'Panto.png'),
('Paradise', 'paradise', 19000, 'vans', 'Paradise.png'),
('Pariah', 'pariah', 1420000, 'sports', 'pariah.png'),
('Patriot', 'patriot', 55000, 'suvs', 'patriot.png'),
('Penumbra', 'penumbra', 28000, 'sports', 'penumbra.png'),
('Pfister', 'pfister811', 85000, 'super', '811.jpg'),
('Phoenix', 'phoenix', 12500, 'muscle', 'phoenix.png'),
('Picador', 'picador', 18000, 'muscle', 'picador.png'),
('Pigalle', 'pigalle', 20000, 'sportsclassics', 'pigalle.png'),
('Prairie', 'prairie', 12000, 'compacts', 'prairie.png'),
('Premier', 'premier', 8000, 'sedans', 'premier.png'),
('Primo Custom', 'primo2', 14000, 'sedans', 'PrimoCustom.png'),
('X80 Proto', 'prototipo', 2500000, 'super', 'X80.png'),
('Radius', 'radi', 29000, 'suvs', 'Radius.png'),
('raiden', 'raiden', 1375000, 'sports', 'raiden.png'),
('Rapid GT', 'rapidgt', 35000, 'sports', 'RapidGT.png'),
('Reaper', 'reaper', 150000, 'super', 'reaper.jpg'),
('Rebel', 'rebel2', 35000, 'offroad', 'Rebel.png'),
('Regina', 'regina', 5000, 'sedans', 'Regina.png'),
('Retinue', 'retinue', 615000, 'sportsclassics', 'retinue.png'),
('Revolter', 'revolter', 1610000, 'sports', 'revolter.png'),
('riata', 'riata', 380000, 'offroad', 'riata.png'),
('Rocoto', 'rocoto', 45000, 'suvs', 'rocoto.png'),
('Rumpo', 'rumpo', 15000, 'vans', 'Rumpo.png'),
('Sabre Turbo', 'sabregt', 20000, 'muscle', 'SabreTurbo.png'),
('Sandking', 'sandking', 55000, 'offroad', 'Sandking.png'),
('Savestra', 'savestra', 990000, 'sportsclassics', 'savestra.png'),
('SC 1', 'sc1', 1603000, 'super', 'sc1.jpg'),
('Schafter V12', 'schafter3', 50000, 'sports', 'Schafter.png\r\n'),
('Seminole', 'seminole', 25000, 'suvs', 'Seminole.png'),
('Sentinel', 'sentinel', 32000, 'coupes', 'Sentinel.png'),
('Sentinel XS', 'sentinel2', 40000, 'coupes', 'SentinelXS.png'),
('Seven 70', 'seven70', 39500, 'sports', 'Seven70.png'),
('ETR1', 'sheava', 220000, 'super', 'ETR1.png'),
('Slam Van', 'slamvan3', 11500, 'muscle', 'SlamVan.png'),
('Stinger', 'stinger', 80000, 'sportsclassics', 'Stinger.png'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics', 'StingerGT.png'),
('Streiter', 'streiter', 500000, 'sports', 'Streiter.png'),
('Sultan', 'sultan', 15000, 'sports', 'Sultan.png'),
('Sultan RS', 'sultanrs', 65000, 'super', 'SultanRS.png'),
('Super Diamond', 'superd', 130000, 'sedans', 'Super_Diamond.png'),
('Surano', 'surano', 50000, 'sports', 'Surano.png'),
('Surfer', 'surfer', 12000, 'vans', 'Surfer.png'),
('T20', 't20', 300000, 'super', 't20.jpg'),
('Tailgater', 'tailgater', 30000, 'sedans', 'tailgater.png'),
('Tampa', 'tampa', 16000, 'muscle', 'Tampa.png'),
('Drift Tampa', 'tampa2', 80000, 'sports', 'TampaD.png'),
('Trophy Truck', 'trophytruck', 60000, 'offroad', 'TrophyTruck.png'),
('Tropos', 'tropos', 40000, 'sports', 'Tropos.png'),
('Turismo R', 'turismor', 350000, 'super', 'turismor.jpg'),
('Tyrus', 'tyrus', 600000, 'super', 'tyrus.jpg'),
('Vacca', 'vacca', 120000, 'super', 'vacca.jpg'),
('Verlierer', 'verlierer2', 70000, 'sports', 'Verlierer.png'),
('Vigero', 'vigero', 12500, 'muscle', 'Vigero.png'),
('Virgo', 'virgo', 14000, 'muscle', 'Virgo.png'),
('Viseris', 'viseris', 875000, 'sportsclassics', 'Viseris.png'),
('Visione', 'visione', 2250000, 'super', 'visione.jpg'),
('Voltic', 'voltic', 90000, 'super', 'voltic.jpg'),
('Voodoo', 'voodoo', 7200, 'muscle', 'Voodoo.png'),
('Warrener', 'warrener', 4000, 'sedans', 'Warrener.jpg'),
('Washington', 'washington', 9000, 'sedans', 'Washington.png'),
('Windsor', 'windsor', 95000, 'coupes', 'Windsor.png'),
('Windsor Drop', 'windsor2', 125000, 'coupes', 'WindsorDrop.png'),
('XLS', 'xls', 32000, 'suvs', 'XLS.png'),
('Yosemite', 'yosemite', 485000, 'muscle', 'Yosemite.png'),
('Youga', 'youga', 10800, 'vans', 'Youga.png'),
('Youga Luxuary', 'youga2', 14500, 'vans', 'YougaL.png'),
('Z190', 'z190', 900000, 'sportsclassics', 'Z190.png'),
('Zentorno', 'zentorno', 1500000, 'super', 'Zentorno.png'),
('Zion Cabrio', 'zion2', 45000, 'coupes', 'Zion.png'),
('Z-Type', 'ztype', 220000, 'sportsclassics', 'Z-Type.png');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
