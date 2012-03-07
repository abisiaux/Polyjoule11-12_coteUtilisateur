-- phpMyAdmin SQL Dump
-- version 3.4.3.2
-- http://www.phpmyadmin.net
--
-- Client: instance6964.db.xeround.com.:5214
-- Généré le : Mer 07 Mars 2012 à 22:06
-- Version du serveur: 5.1.42
-- Version de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `polyjoule`
--

-- --------------------------------------------------------

--
-- Structure de la table `affiche`
--

CREATE TABLE IF NOT EXISTS `affiche` (
  `id_photo` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  PRIMARY KEY (`id_photo`,`id_article`),
  KEY `FK_AFFICHE_id_article` (`id_article`)
) ENGINE=Xeround DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `nom_album` varchar(30) DEFAULT NULL,
  `date_album` date DEFAULT NULL,
  PRIMARY KEY (`id_album`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `album`
--

INSERT INTO `album` (`id_album`, `nom_album`, `date_album`) VALUES
(1, 'Shell Eco Marathon 2011', '2011-06-01'),
(2, 'Shell Eco Marathon 2010', '2010-06-01');

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE IF NOT EXISTS `appartient` (
  `id_participant` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  PRIMARY KEY (`id_participant`,`id_formation`),
  KEY `FK_APPARTIENT_id_formation` (`id_formation`)
) ENGINE=Xeround DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `id_rubrique` int(11) DEFAULT NULL,
  `titreFR_article` text,
  `titreEN_article` text,
  `contenuFR_article` text,
  `contenuEN_article` text,
  `autorisation_com` tinyint(1) DEFAULT NULL,
  `date_article` datetime NOT NULL,
  PRIMARY KEY (`id_article`),
  KEY `FK_ARTICLE_id_rubrique` (`id_rubrique`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id_article`, `id_rubrique`, `titreFR_article`, `titreEN_article`, `contenuFR_article`, `contenuEN_article`, `autorisation_com`, `date_article`) VALUES
(2, 2, 'titreFR-2', 'titleEN-2', 'blablablaFR-2', 'blablablaEN-2', 1, '2012-01-18 00:00:00'),
(1, 3, 'titreFR-1', 'titleEN-1', 'blablablaFR-1', 'blablablaEN-1', 1, '2012-02-01 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `id_commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_article` int(11) NOT NULL,
  `date_commentaire` datetime DEFAULT NULL,
  `posteur_commentaire` varchar(30) DEFAULT NULL,
  `mail_commentaire` varchar(50) DEFAULT NULL,
  `message_commentaire` text,
  PRIMARY KEY (`id_commentaire`),
  KEY `FK_COMMENTAIRE_id_article` (`id_article`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `compose`
--

CREATE TABLE IF NOT EXISTS `compose` (
  `id_participant` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  PRIMARY KEY (`id_participant`,`id_equipe`),
  KEY `FK_COMPOSE_id_equipe` (`id_equipe`)
) ENGINE=Xeround DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id_course` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipe` int(11) NOT NULL,
  `date_course` date DEFAULT NULL,
  `lieu_course` varchar(30) DEFAULT NULL,
  `img_course` varchar(100) DEFAULT NULL,
  `descFR_course` text,
  `descEN_course` text,
  PRIMARY KEY (`id_course`),
  KEY `FK_COURSE_id_equipe` (`id_equipe`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

CREATE TABLE IF NOT EXISTS `ecole` (
  `id_ecole` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ecole` varchar(30) DEFAULT NULL,
  `adresse_ecole` varchar(100) DEFAULT NULL,
  `photo_ecole` varchar(100) DEFAULT NULL,
  `descFR_ecole` text,
  `descEN_ecole` text,
  PRIMARY KEY (`id_ecole`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `id_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `annee_equipe` int(4) DEFAULT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `equipe`
--

INSERT INTO `equipe` (`id_equipe`, `annee_equipe`) VALUES
(2, 2011),
(1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `id_formation` int(11) NOT NULL AUTO_INCREMENT,
  `id_ecole` int(11) NOT NULL,
  `titreFR_formation` varchar(100) DEFAULT NULL,
  `titreEN_formation` varchar(100) DEFAULT NULL,
  `lien_formation` varchar(100) DEFAULT NULL,
  `descFR_formation` text,
  `descEN_formation` text,
  PRIMARY KEY (`id_formation`),
  KEY `FK_FORMATION_id_ecole` (`id_ecole`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `livre_or`
--

CREATE TABLE IF NOT EXISTS `livre_or` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `posteur_post` varchar(30) DEFAULT NULL,
  `mail_post` varchar(100) DEFAULT NULL,
  `date_post` datetime DEFAULT NULL,
  `message_post` text,
  `accept_post` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_post`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `livre_or`
--

INSERT INTO `livre_or` (`id_post`, `posteur_post`, `mail_post`, `date_post`, `message_post`, `accept_post`) VALUES
(5, 'Brice', 'brice@gmail.com', '2012-02-09 10:49:07', 'abruti', 0),
(1, 'Jon Lajoie', 'jonLajoie@free.fr', '2012-01-02 19:17:32', 'Thank you very much for this fucking website, Polyjoule rocks a lot and every people is so amazing, I''d love to meet them. Besides they will got a brain new prorotype that''s why they are fucking awesome, I present my sincere congratulation to all the team they did a fucking dam so good job. Best whises, Jon.', 1),
(2, 'Barack Obama', 'barackObama@free.fr', '2010-12-08 19:20:08', 'My congratulation for fulfilling your dreams. I''m sorry for not to be here for your celebration, but I have to prepare my campaigning. I will take as soon as possible my Air Force One plane to Nantes to shake the hand of all of you. Looking forward to hearing from you. Best regards. Barack Obama President of the United States of America.', 1),
(3, 'Oliver', 'moi@toto.com', '2012-01-28 21:13:57', 'ceci est un test pour voir si l''ajout fonctionnce correctement', 0),
(4, 'Oliver', 'moi@toto.com', '2012-02-08 11:00:44', 'test encore', 1);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
  `id_membre` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo_membre` varchar(30) NOT NULL DEFAULT '',
  `mdp_membre` varchar(30) DEFAULT NULL,
  `mail_membre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_membre`,`pseudo_membre`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `obtient`
--

CREATE TABLE IF NOT EXISTS `obtient` (
  `id_equipe` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `id_resultat` int(11) NOT NULL,
  PRIMARY KEY (`id_equipe`,`id_course`,`id_resultat`),
  KEY `FK_OBTIENT_id_course` (`id_course`),
  KEY `FK_OBTIENT_id_resultat` (`id_resultat`)
) ENGINE=Xeround DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

CREATE TABLE IF NOT EXISTS `partenaire` (
  `id_partenaire` int(11) NOT NULL AUTO_INCREMENT,
  `nom_partenaire` varchar(30) DEFAULT NULL,
  `logo_partenaire` varchar(100) DEFAULT NULL,
  `site_partenaire` varchar(100) DEFAULT NULL,
  `descFR_partenaire` text,
  `descEN_partenaire` text,
  PRIMARY KEY (`id_partenaire`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `partenaire`
--

INSERT INTO `partenaire` (`id_partenaire`, `nom_partenaire`, `logo_partenaire`, `site_partenaire`, `descFR_partenaire`, `descEN_partenaire`) VALUES
(1, 'DCNS', '/Users/olivier/Pictures/DSCN7208.JPG', 'http://fr.dcnsgroup.com/', 'L''entreprise\r\nAvec championship, DNCS vise une croissance de son chiffre d''affaires de 50% à 100% dans les dix prochaines années. Pour atteindre cet objectif, le Groupe demeurera le partenaire de référence de la Marine nationale.\r\n\r\nSon aide\r\nDNCS est un des premiers sponsors de Polyjoule. Depuis 2006 son soutien constant pour notre projet a été un levier indispensable pour relever les défis techniques.', 'The company\r\nWith championship, DNCS aims at a growth of its turnover(sales) from 50 % to 100 % in the next ten years. To reach(affect) this objective, the Group will remain the reference partner of the Navy.\r\n\r\nHis(Her,Its) help(assistant)\r\nDNCS is one of first sponsors of Polyjoule. Since 2006 his(her,its) constant support for our project was an indispensable lever to meet the technical challenges.'),
(2, 'partenaire2', 'cheminVersLogo2', 'lienVersPartenaire2', 'partenaire2', 'partnership2');

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `id_participant` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipe` int(11) NOT NULL,
  `nom_participant` varchar(30) DEFAULT NULL,
  `prenom_participant` varchar(30) DEFAULT NULL,
  `photo_participant` varchar(100) DEFAULT NULL,
  `mail_participant` varchar(100) DEFAULT NULL,
  `role_participant` varchar(100) DEFAULT NULL,
  `bioFR_participant` text,
  `bioEN_participant` text,
  PRIMARY KEY (`id_participant`),
  KEY `FK_PARTICIPANT_id_equipe` (`id_equipe`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `participant`
--

INSERT INTO `participant` (`id_participant`, `id_equipe`, `nom_participant`, `prenom_participant`, `photo_participant`, `mail_participant`, `role_participant`, `bioFR_participant`, `bioEN_participant`) VALUES
(2, 2, 'AUVITY', 'Bruno', NULL, 'bruno.auvity@abc.fr', 'Encadrant sur la pile à combustible', 'Jean-Baptiste Joseph Fourier naît à Auxerre le 21 mars 1768. Grand mathématicien et physicien français, il est à l''origine des séries Fourier sur la décomposition de fonctions périodiques en séries trigonométriques, qui s''appliquent à la propagation de la chaleur. Professeur à 16 ans, titulaire d''une chaire à Polytechnique en 1797, il fonda l''université royale de Grenoble en 1810, et entra à l''Académie française en 1826. Il meurt le 16 mai 1830.', 'ANGLAIS : Jean-Baptiste Joseph Fourier naît à Auxerre le 21 mars 1768. Grand mathématicien et physicien français, il est à l''origine des séries Fourier sur la décomposition de fonctions périodiques en séries trigonométriques, qui s''appliquent à la propagation de la chaleur. Professeur à 16 ans, titulaire d''une chaire à Polytechnique en 1797, il fonda l''université royale de Grenoble en 1810, et entra à l''Académie française en 1826. Il meurt le 16 mai 1830.'),
(1, 2, 'MAINDRU', 'Philippe', NULL, 'philippe.maindru@abc.fr', 'Coordinateur Polyjoule-Microjoule', 'Physicien américain d’origine allemande, auteur de la célèbre formule E=mc², Albert Einstein a joui d’une renommée internationale. Malgré des débuts difficiles, ses théories sur les relativités restreinte et générale ont bouleversé le monde de la physique et lui ont valu la reconnaissance de ses pairs. Médiatisé à outrance, il s’est fait aussi le défenseur de la paix et a toujours regretté sa part de responsabilité dans l’élaboration de la bombe atomique. Instigateur d’une nouvelle ère de la physique, Einstein, par son approche de la recherche et sa personnalité marquante, est devenu, aujourd’hui, une figure mythique de la science. ', 'Physicien américain d’origine allemande, auteur de la célèbre formule E=mc², ANGLAIS : Albert Einstein a joui d’une renommée internationale. Malgré des débuts difficiles, ses théories sur les relativités restreinte et générale ont bouleversé le monde de la physique et lui ont valu la reconnaissance de ses pairs. Médiatisé à outrance, il s’est fait aussi le défenseur de la paix et a toujours regretté sa part de responsabilité dans l’élaboration de la bombe atomique. Instigateur d’une nouvelle ère de la physique, Einstein, par son approche de la recherche et sa personnalité marquante, est devenu, aujourd’hui, une figure mythique de la science. ');

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `id_album` int(11) DEFAULT NULL,
  `titreFR_photo` varchar(50) DEFAULT NULL,
  `titreEN_photo` varchar(50) DEFAULT NULL,
  `lien_photo` varchar(100) DEFAULT NULL,
  `date_photo` date DEFAULT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `FK_PHOTO_id_album` (`id_album`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE IF NOT EXISTS `resultat` (
  `id_resultat` int(11) NOT NULL AUTO_INCREMENT,
  `position_resultat` int(11) DEFAULT NULL,
  `record_resultat` text,
  PRIMARY KEY (`id_resultat`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE IF NOT EXISTS `rubrique` (
  `id_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `id_mere` int(11) DEFAULT NULL,
  `titreFR_rubrique` varchar(100) DEFAULT NULL,
  `titreEN_rubrique` varchar(100) DEFAULT NULL,
  `albumId` int(11) DEFAULT NULL,
  `personneId` int(11) DEFAULT NULL,
  `isLivreOr` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id_rubrique`)
) ENGINE=Xeround DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `rubrique`
--

INSERT INTO `rubrique` (`id_rubrique`, `id_mere`, `titreFR_rubrique`, `titreEN_rubrique`, `albumId`, `personneId`, `isLivreOr`) VALUES
(12, 1, 'Personnages Clés', 'Key Persons', NULL, 1, 0),
(1, NULL, 'Notre association', 'Our association', NULL, NULL, 0),
(5, 3, 'sous-sous-categorie1-3-1', 'sub-sub-category1-3-1', NULL, NULL, 0),
(2, NULL, 'Shell Eco 2012', 'Shell Eco 2012', NULL, NULL, 0),
(7, NULL, 'Actualites H2', 'News H2', NULL, NULL, 0),
(3, 1, 'sous-categorie1-1', 'sub-category1-1', NULL, NULL, 0),
(9, NULL, 'Actu Polyjoule', 'News Polyjoule', NULL, NULL, 0),
(8, NULL, 'Urban Concept', 'Urban Concept', NULL, NULL, 0),
(4, 1, 'sous-categorie1-2', 'sub-category1-2', NULL, NULL, 0),
(11, NULL, 'Album photo', 'Photograph album', 1, NULL, 0),
(6, NULL, 'Partenaires', 'Partners', NULL, NULL, 0),
(10, 1, 'Livre d''or', 'Guest book', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sponsorise`
--

CREATE TABLE IF NOT EXISTS `sponsorise` (
  `id_equipe` int(11) NOT NULL,
  `id_partenaire` int(11) NOT NULL,
  PRIMARY KEY (`id_equipe`,`id_partenaire`),
  KEY `FK_SPONSORISE_id_partenaire` (`id_partenaire`)
) ENGINE=Xeround DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
