
-- BASE DE DONNÉES DU ROBERT : init --
-- DATE (AA-MM-JJ): 2012-12-27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- ----------------- TABLE benef_interlocuteurs ------------------------

DROP TABLE IF EXISTS `robert_benef_interlocuteurs`;

CREATE TABLE `robert_benef_interlocuteurs` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) DEFAULT "",
  `idStructure` int(4) DEFAULT "",
  `nomPrenom` varchar(64) DEFAULT "",
  `adresse` varchar(128) DEFAULT "",
  `codePostal` varchar(10) DEFAULT "",
  `ville` varchar(64) DEFAULT "",
  `email` varchar(128) DEFAULT "",
  `tel` varchar(14) DEFAULT "",
  `poste` varchar(128) DEFAULT "",
  `remarque` text DEFAULT "",
  `nomStruct` varchar(64) DEFAULT "",
  `typeRetour` varchar(64) DEFAULT "",
  PRIMARY KEY (`id`),
  KEY `label` (`label`),
  KEY `nomPrenom` (`nomPrenom`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------- TABLE benef_structure ------------------------

DROP TABLE IF EXISTS `robert_benef_structure`;

CREATE TABLE `robert_benef_structure` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) DEFAULT "",
  `SIRET` varchar(64) DEFAULT "",
  `type` varchar(64) DEFAULT "",
  `NomRS` varchar(128) DEFAULT "",
  `interlocteurs` varchar(256) DEFAULT "",
  `adresse` varchar(128) DEFAULT "",
  `codePostal` varchar(8) DEFAULT "",
  `ville` varchar(64) DEFAULT "",
  `email` varchar(64) DEFAULT "",
  `tel` varchar(14) DEFAULT "",
  `nbContrats` int(3) DEFAULT "",
  `listePlans` varchar(512) DEFAULT "",
  `decla` varchar(256) DEFAULT "",
  `remarque` text DEFAULT "",
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`),
  KEY `SIRET` (`SIRET`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------- TABLE devis ------------------------

DROP TABLE IF EXISTS `robert_devis`;

CREATE TABLE `robert_devis` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_plan` int(6) DEFAULT "",
  `numDevis` int(3) DEFAULT "",
  `fichier` varchar(128) DEFAULT "",
  `matos` varchar(1024) DEFAULT "",
  `tekos` varchar(256) DEFAULT "",
  `total` float DEFAULT "",
  PRIMARY KEY (`id`),
  KEY `fichier` (`fichier`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------- TABLE matos_detail ------------------------

DROP TABLE IF EXISTS `robert_matos_detail`;

CREATE TABLE `robert_matos_detail` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) DEFAULT "",
  `ref` varchar(128) DEFAULT "",
  `panne` int(3) DEFAULT "",
  `externe` tinyint(1) DEFAULT "",
  `categorie` varchar(128) DEFAULT "",
  `sousCateg` int(4) DEFAULT "",
  `Qtotale` int(4) DEFAULT "",
  `tarifLoc` float DEFAULT "",
  `valRemp` float DEFAULT "",
  `dateAchat` date DEFAULT "",
  `ownerExt` varchar(256) DEFAULT "",
  `remarque` text DEFAULT "",
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref` (`ref`),
  KEY `sousCateg` (`sousCateg`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------- TABLE matos_packs ------------------------

DROP TABLE IF EXISTS `robert_matos_packs`;

CREATE TABLE `robert_matos_packs` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) DEFAULT "",
  `ref` varchar(128) DEFAULT "",
  `categorie` varchar(128) DEFAULT "",
  `externe` tinyint(1) DEFAULT "",
  `tarifLoc` float DEFAULT "",
  `valRemp` float DEFAULT "",
  `detail` varchar(256) DEFAULT "",
  `remarque` text DEFAULT "",
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------- TABLE matos_sous_cat ------------------------

DROP TABLE IF EXISTS `robert_matos_sous_cat`;

CREATE TABLE `robert_matos_sous_cat` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) DEFAULT "",
  `ordre` int(4) DEFAULT "",
  PRIMARY KEY (`id`),
  KEY `ordre` (`ordre`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO `robert_matos_sous_cat` VALUES
('1','Amplificateurs','1'),
('2','Enceintes','2'),
('3','Consoles son','3'),
('4','Périphériques son','5'),
('5','Cables son','9'),
('6','Projecteurs','17'),
('7','Gradateurs','18'),
('8','Divers Lumière','20'),
('9','Microphones','6'),
('10','Divers elec','15'),
('12','Divers son','7'),
('13','Divers transport','23'),
('14','Pieds enceinte et lumiere','10'),
('15','Divers structure','13'),
('17','Structure','11'),
('18','Véhicules','22'),
('19','Divers','21'),
('20','Distribution Electrique','14'),
('21','Pieds Micro','8'),
('23','Console Lumiere','16'),
('26','Pendrillons','12'),
('27','Cables Lumière','19');


-- ----------------- TABLE notes ------------------------

DROP TABLE IF EXISTS `robert_notes`;

CREATE TABLE `robert_notes` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `date` int(10) DEFAULT "",
  `texte` text DEFAULT "",
  `createur` varchar(128) DEFAULT "",
  `important` tinyint(1) DEFAULT "",
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




-- ----------------- TABLE plans ------------------------

DROP TABLE IF EXISTS `robert_plans`;

CREATE TABLE `robert_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGroup` int(11) DEFAULT "",
  `titre` varchar(64) DEFAULT "",
  `lieu` varchar(128) DEFAULT "",
  `date_start` tinytext DEFAULT "",
  `date_end` tinytext DEFAULT "",
  `createur` varchar(256) DEFAULT "",
  `beneficiaire` varchar(64) DEFAULT "",
  `techniciens` varchar(64) DEFAULT "",
  `materiel` text DEFAULT "",
  `confirm` varchar(15) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `titre` (`titre`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------- TABLE plans_details ------------------------

DROP TABLE IF EXISTS `robert_plans_details`;

CREATE TABLE `robert_plans_details` (
  `id_plandetails` int(11) NOT NULL AUTO_INCREMENT,
  `id_plan` int(11) DEFAULT "",
  `jour` varchar(64) DEFAULT "",
  `techniciens` varchar(100) DEFAULT "",
  `materiel` text DEFAULT "",
  `details_remarque` mediumtext DEFAULT "",
  PRIMARY KEY (`id_plandetails`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------- TABLE tekos ------------------------

DROP TABLE IF EXISTS `robert_tekos`;

CREATE TABLE `robert_tekos` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `idUser` smallint(3) DEFAULT "",
  `surnom` varchar(128) DEFAULT "",
  `nom` varchar(128) DEFAULT "",
  `prenom` varchar(128) DEFAULT "",
  `email` varchar(128) DEFAULT "",
  `tel` varchar(20) DEFAULT "",
  `GUSO` varchar(128) DEFAULT "",
  `CS` varchar(128) DEFAULT "",
  `birthDay` date DEFAULT "",
  `birthPlace` varchar(256) DEFAULT "",
  `habilitations` varchar(256) DEFAULT "",
  `categorie` varchar(128) DEFAULT "",
  `SECU` varchar(128) DEFAULT "",
  `SIRET` varchar(128) DEFAULT "",
  `assedic` varchar(64) DEFAULT "",
  `intermittent` tinyint(1) DEFAULT "",
  `adresse` varchar(64) DEFAULT "",
  `cp` varchar(64) DEFAULT "",
  `ville` varchar(64) DEFAULT "",
  `diplomes_folder` varchar(64) DEFAULT "",
  PRIMARY KEY (`id`),
  UNIQUE KEY `surnom` (`surnom`),
  KEY `GUSO` (`GUSO`),
  KEY `CS` (`CS`),
  KEY `SECU` (`SECU`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------- TABLE users ------------------------

DROP TABLE IF EXISTS `robert_users`;

CREATE TABLE `robert_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT "",
  `password` varchar(32) DEFAULT "",
  `nom` char(30) DEFAULT "",
  `prenom` char(30) DEFAULT "",
  `level` int(1) NOT NULL DEFAULT '1',
  `date_inscription` int(10) DEFAULT "",
  `date_last_action` int(10) DEFAULT "",
  `date_last_connexion` int(10) DEFAULT "",
  `theme` varchar(32) DEFAULT "",
  `yeux` varchar(64) DEFAULT "",
  `cheveux` varchar(64) DEFAULT "",
  `age` int(2) DEFAULT "",
  `taille` float DEFAULT "",
  `idTekos` smallint(3) DEFAULT "",
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `robert_users` VALUES
('1','root@robertmanager.org','8351aaf8480d8135bc77af590c93c1e2','DEBUGGER','Root','9','1325615980','1356632988','1356620371','human','blancs','rouges','31','1.73','0');


