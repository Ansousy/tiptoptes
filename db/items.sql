CREATE DATABASE IF NOT EXISTS `dbthetitop`;
USE `dbthetitop`;


--
-- Base de données : `dbthetitop`
--

-- --------------------------------------------------------

--
-- Structure de la table `gain`
--

DROP TABLE IF EXISTS `gain`;
CREATE TABLE IF NOT EXISTS `gain` (
  `idgain` int(11) NOT NULL AUTO_INCREMENT,
  `idticket` int(11) NOT NULL,
  `taux` int(11) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `dategain` datetime DEFAULT NULL,
  PRIMARY KEY (`idgain`),
  KEY `FK_GAIN_CORRESPON_TICKET` (`idticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

DROP TABLE IF EXISTS `jouer`;
CREATE TABLE IF NOT EXISTS `jouer` (
  `idutilisateur` int(11) NOT NULL,
  `idticket` int(11) NOT NULL,
  KEY `FK_JOUER_CLIENT` (`idutilisateur`),
  KEY `FK_JOUER_TICKET` (`idticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idutilisateur` int(11) NOT NULL,
  `role` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ROLE_AVOIR_UTILISAT` (`idutilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `idutilisateur`, `role`) VALUES
(1, 1, 'ROLE_ADMIN'),
(2, 2, 'ROLE_CLIENT'),
(3, 3, 'ROLE_CLIENT'),
(4, 4, 'ROLE_EMP');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `idticket` int(11) NOT NULL AUTO_INCREMENT,
  `numeroticket` varchar(250) NOT NULL,
  `statut` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idticket`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`idticket`, `numeroticket`, `statut`) VALUES
(1, 'A000000001', 'disponible'),
(2, 'B000000002', 'disponible'),
(3, 'C000000003', 'disponible'),
(4, 'D000000004', 'disponible');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idutilsateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `login` varchar(254) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idutilsateur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilsateur`, `nom`, `prenom`, `login`, `password`) VALUES
(1, 'gueye', 'amath', 'amath@mail.com', 'thetiptop'),
(2, 'sy', 'elhadji', 'sy@mail.com', 'thetiptop'),
(3, 'hana', 'hana', 'hana@mail.com', 'thetiptop'),
(4, 'aurelien', 'aurelien2', 'aurelien@mail.com', 'thetiptop');
