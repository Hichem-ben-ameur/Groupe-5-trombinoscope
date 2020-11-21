-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 21 nov. 2020 à 17:06
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omk`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(2, 'items', 1, 1, 'Boulogne', 'Boulogne\n30 rue Resth\n92100\nBoulogne-Billancourt'),
(3, 'items', 1, 1, 'Garibaldi', 'Garibaldi\n36 boulevard garibaldi\n75015\nParis'),
(4, 'items', 1, 1, 'Courbevoie', 'Courbevoie\n16 rue Thiem\n92400\nCourbevoie'),
(5, 'items', 1, 1, 'Carnot', 'Carnot\n10 rue Carnot\n95300\nPontoise'),
(6, 'items', 1, 1, 'Cergy Préfecture', 'Cergy Préfecture\n3 rue Lebon\n95000\nCergy'),
(7, 'items', 1, 1, 'Bordeaux', 'Bordeaux\n29 rue Magenta\n33000\nBordeaux'),
(8, 'items', 1, 1, 'Ressources Humaines', 'Ressources Humaines\nLa mission principale de ce service est de gérer les compétences du personnel. Il peut donc proposer des formations appropriées pour optimiser l’efficacité des employés au point de garantir l’épanouissement de la firme. Il contribue aussi au recrutement et au licenciement de l’équipe. Parmi ses tâches figure également le dialogue avec le syndicat. Le but d’un tel entretien est souvent l’amélioration des conditions de travail dans la société.\nBordeaux'),
(9, 'items', 1, 1, 'Finances', 'Finances\nLa fonction principale de ce département est d’équilibrer l’état financier de la société. C’est pourquoi il contribue pleinement à la détermination du prix de vente d’un produit. Il s’occupe des tâches liées avec la banque. Concrètement, il entre en scène pendant la demande ou le remboursement d’un emprunt. Par ailleurs, il veille à payer les différentes charges de l’entreprise : loyer, facture d’électricité, salaires des personnels…\nCergy Préfecture'),
(10, 'items', 1, 1, 'Commercial', 'Commercial\nIl vise à garantir la vente des produits et des prestations à la disposition de la compagnie. Pour y parvenir, l’équipe réalise plusieurs tâches. Dans la liste, on peut citer la rédaction des réponses aux appels d’offres des clients, la prospection, le traitement des contrats en cours… Son objectif principal est de générer l’argent nécessaire pour subvenir aux besoins de l’entreprise : rémunération des salariés, factures des fournisseurs, etc.\nCarnot'),
(11, 'items', 1, 1, 'Marketing', 'Marketing\nLe rôle principal de ce service est de créer les besoins chez les potentiels clients. Les membres ont donc comme attribut d’analyser attentivement le marché. Ils doivent être capables de définir les produits qui attirent les cibles. Une fois l’étude terminée, ils rédigent une offre adaptée aux attentes des consommateurs. Notez que l’équipe en question évalue aussi les stratégies des concurrents en termes de marketing. Cette initiative permet de proposer la formule la plus attrayante sur le commerce.\nCourbevoie'),
(12, 'items', 1, 1, 'Juridique', 'Juridique\nL’équipe de ce département doit être au courant des différentes lois qui régissent le domaine de l’entreprise. Elle est susceptible de rédiger un contrat en conformité avec les règlements en vigueur. Elle a également pour mission de trouver une solution aux divers litiges en rapport avec les salariées, les clients, les fournisseurs…\nGaribaldi'),
(13, 'items', 1, 1, 'Systèmes  d\'information', 'Systèmes  d\'information\nLe service des systèmes d\'information, ou service informatique, est le service en charge du parc informatique d\'une entreprise. Les personnes y travaillant ont pour rôle la configuration du serveur, veiller à la sécurité du réseau et des données, la maintenance des postes informatiques et l\'installation des logiciels et mises à jour.\nBoulogne'),
(14, 'items', 1, 1, 'Football', 'Football\nLe football est un sport collectif joué entre deux équipes de onze joueurs (un gardien et dix joueurs de champ) avec un ballon sphérique. Appelé « soccer » en Amérique du Nord, il est pratiqué par 250 millions de joueurs dans plus de 200 pays, ce qui en fait le sport le plus populaire au monde.'),
(15, 'items', 1, 1, 'Musique', 'Musique\nest l\'art de combiner les sons d\'une manière agréable à l\'oreille, disait-on volontiers autrefois. Sans doute mais qui a jamais pu soutenir qu\'elle dût borner là son ambition? Qui se flattera d\'ailleurs de déterminer ce qui est vraiment agréable à l\'oreille? Certaines combinaisons sonores, certains timbres, certains accords qui, considérés isolement, produiraient sur nos sens une impression dure et fâcheuse, ne sont-ils pas employés, avec avantage, en maints endroits d\'oeuvres jugées admirables? Dira-t-on plutôt que c\'est l\'art d\'émouvoir par des combinaisons de sons? Cette définition ne sera pas plus complète et, comme l\'autre, ne présente qu\'un des divers cités par où il convient d\'envisager la question.'),
(16, 'items', 1, 1, 'Rallye', 'Rallye\nCompétition où les concurrents (généralement en voiture) doivent rallier un lieu après avoir satisfait à plusieurs épreuves (consistant notamment à répondre à diverses questions qui les guident). Course automobile comportant des épreuves chronométrées sur routes fermées.'),
(17, 'items', 1, 1, 'Jardinage', 'Jardinage\nJardinage désigne l\'art de cultiver les jardins, de les entretenir, de les arranger, de les orner. Exemple : Depuis que je suis à la retraite, le jardinage est devenu mon passe-temps favori. C\'est bon pour mon jardin et c\'est bon pour mon moral.'),
(18, 'items', 1, 1, 'Cyclisme', 'Cyclisme\nLe cyclisme est l\'ensemble des activités pratiquées à bicyclette. Il recouvre plusieurs catégories allant de la conduite quotidienne permettant de se déplacer, jusqu\'aux compétitions internationales comme les grandes courses, en passant par les activités de randonnées ou de loisirs.'),
(19, 'items', 1, 1, 'Surf', 'Surf\nLe surf est un sport qui consiste à glisser sur les vagues.\nLe surf renforce les muscles et donc affine et tonifie la silhouette. En plus de muscler le corps, le surf est également une très bonne alternative pour évacuer le stress car après un effort physique on sécrète des endorphines qui procurent une sensation de bien-être.'),
(20, 'item_sets', 1, 1, 'Collection loisirs 1', 'Collection loisirs 1\nCollection loisirs pour Hichem'),
(21, 'item_sets', 1, 1, 'Collection loisirs 2', 'Collection loisirs 2\nCollection loisirs pour Tidiane'),
(22, 'item_sets', 1, 1, 'Collection loisirs 3', 'Collection loisirs 3\nCollection loisirs pour Steve'),
(23, 'item_sets', 1, 1, 'Collection loisirs 4', 'Collection loisirs 4\nCollection loisirs pour Sarah'),
(24, 'item_sets', 1, 1, 'Collection loisirs 5', 'Collection loisirs 5\nCollection loisirs pour Mathias'),
(25, 'item_sets', 1, 1, 'Collection loisirs 6', 'Collection loisirs 6\nCollection loisirs Corentin'),
(26, 'items', 1, 1, 'Compte de Hichem', 'hichem\nhichem\nADMINISTRATEUR\nACTIF\nCollection loisirs 1\nCompte de Hichem'),
(27, 'items', 1, 1, 'Compte de Tidiane', 'tidiane\ntidiane\nADMINISTRATEUR\nACTIF\nCollection loisirs 2\nCompte de Tidiane'),
(28, 'items', 1, 1, 'Compte de Steve', 'steve\nsteve\nANIMATEUR\nACTIF\nCollection loisirs 3\nCompte de Steve'),
(29, 'items', 1, 1, 'Compte de Sarah', 'sarah\nsarah\nANIMATEUR\nINACTIF\nCollection loisirs 4\nCompte de Sarah'),
(30, 'items', 1, 1, 'Compte de Mathias', 'mathias\nmathias\nADMINISTRATEUR\nACTIF\nCollection loisirs 5\nCompte de Mathias'),
(31, 'items', 1, 1, 'Compte de Corentin', 'corentin\ncorentin\nANIMATEUR\nINACTIF\nCollection loisirs 6\nCompte de Corentin'),
(32, 'items', 1, 1, 'Porfil employé de Hichem', 'EMP_001\nHichem\nBEN AMEUR\nDirecteur SI\nDescription Hichem\n0658965824\nhichem@gmail.com\n25/09/2019\nCompte de Hichem\nSystèmes  d\'information\nPorfil employé de Hichem'),
(33, 'items', 1, 1, 'Profil employé de Tidiane', 'EMP_002\nCheikh Tidiane\nDIEDHIOU\nAssistant Juridique\nDescription Tidiane\n0678695284\ntidiane@gmail.com\n14/08/2010\nCompte de Tidiane\nJuridique\nProfil employé de Tidiane'),
(34, 'items', 1, 1, 'Profil employé de Steve', 'EMP_003\nSteve\nDJANGO\nChargé marketing\nDescription Steve\n0680469512\nsteve@gmail.com\n20/05/2020\nCompte de Steve\nMarketing\nProfil employé de Steve'),
(35, 'items', 1, 1, 'Profil employé de Sarah', 'EMP_004\nSARAH\nDJENGOU\nDirectrice des finances\nDescription de Sarah\n0705856598\nsarah@gmail.com\n12/05/2018\nCompte de Sarah\nFinances\nProfil employé de Sarah'),
(36, 'items', 1, 1, 'Profil employé de Mathias', 'EMP_005\nMathias\nGOURIOT\nDirecteur des Ressources Humaines\nDescription de Mathias\n0682565896\nmathias@gmail.com\n25/05/2015\nCompte de Mathias\nRessources Humaines\nProfil employé de Mathias'),
(37, 'items', 1, 1, 'Profil employé  de Corentin', 'EMP_006\nCorentin\nMORGAN\nCommercial\nDescription de Corentin\n0658985424\ncorentin@gmail.com\n12/04/2020\nCompte de Corentin\nCommercial\nProfil employé  de Corentin'),
(38, 'item_sets', 1, 1, 'Liste des employés', 'Liste des employés'),
(39, 'item_sets', 1, 1, 'Liste des services', 'Liste des services'),
(40, 'item_sets', 1, 1, 'Liste des centres d\'intérêt', 'Liste des centres d\'intérêt'),
(41, 'item_sets', 1, 1, 'Liste des sites', 'Liste des sites'),
(42, 'item_sets', 1, 1, 'Liste des comptes', 'Liste des comptes'),
(43, 'item_sets', 1, 1, 'Liste des sites à Paris', 'Liste des sites à Paris');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`) VALUES
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(2, 41),
(3, 41),
(3, 43),
(4, 41),
(5, 41),
(6, 41),
(7, 41),
(8, 39),
(9, 39),
(10, 39),
(11, 39),
(12, 39),
(13, 39),
(14, 21),
(14, 23),
(14, 24),
(14, 40),
(15, 21),
(15, 23),
(15, 24),
(15, 25),
(15, 40),
(16, 21),
(16, 22),
(16, 40),
(17, 20),
(17, 22),
(17, 24),
(17, 25),
(17, 40),
(18, 20),
(18, 23),
(18, 40),
(19, 20),
(19, 22),
(19, 25),
(19, 40),
(26, 42),
(27, 42),
(28, 42),
(29, 42),
(30, 42),
(31, 42),
(32, 38),
(33, 38),
(34, 38),
(35, 38),
(36, 38),
(37, 38);

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0);

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'Omeka\\Job\\BatchUpdate', '{\"resource\":\"items\",\"query\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"116\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"site_id\":\"\",\"owner_id\":\"\"},\"data\":[],\"data_remove\":{\"set_value_visibility\":\"\"},\"data_append\":{\"o:item_set\":[\"38\"]}}', '2020-11-21T13:47:03+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2020-11-21T13:47:03+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka\\application\\src\\Controller\\Admin\\ItemController.php(339): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Batch...\', Array)\n#3 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\Admin\\ItemController->batchEditAllAction()\n#4 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2020-11-21 13:47:02', '2020-11-21 13:47:03'),
(2, 1, NULL, 'error', 'Omeka\\Job\\BatchUpdate', '{\"resource\":\"items\",\"query\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"116\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"site_id\":\"\",\"owner_id\":\"\"},\"data\":[],\"data_remove\":{\"o:is_public\":\"1\",\"set_value_visibility\":\"\"},\"data_append\":{\"o:item_set\":[\"38\"]}}', '2020-11-21T13:48:52+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2020-11-21T13:48:52+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka\\application\\src\\Controller\\Admin\\ItemController.php(339): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Batch...\', Array)\n#3 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\Admin\\ItemController->batchEditAllAction()\n#4 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2020-11-21 13:48:52', '2020-11-21 13:48:52');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(200, 1, 8, 'voc.tllpseudo', 'Pseudo', 'Le pseudonym du propriétaire du compte'),
(201, 1, 8, 'voc.tllpassword', 'Password', 'Le mot de passe du propriétaire du compte'),
(202, 1, 8, 'voc.tlltype', 'Type', 'Le type de compte'),
(203, 1, 8, 'voc.tllstatut', 'Statut', 'Le statut du compte Actif/Inactif'),
(204, 1, 8, 'voc.tllposte', 'Poste', 'Poste occupé par l\'employé'),
(205, 1, 8, 'voc.tllhasCompte', 'hasCompte', 'Compte affilié à l\'employé'),
(206, 1, 8, 'voc.tllhasInteret', 'hasInteret', 'Les centres d\'interêt de l\'employé'),
(207, 1, 8, 'voc.tllworkInService', 'service', 'Service d\'affectation de l\'employé'),
(208, 1, 8, 'voc.tllInSite', 'Localisation', 'Lieu de travail de l\'employé ou emplacement du service'),
(209, 1, 8, 'voc.tlladresse', 'Adresse', 'Numéro et libellé de la voie'),
(210, 1, 8, 'voc.tllcodePostal', 'Code Postal', 'Code postal'),
(211, 1, 8, 'voc.tllville', 'Ville', 'Nom de la ville');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(2, 1, 118, 3, NULL, 'Boulogne', 1, '2020-11-21 09:30:02', '2020-11-21 14:33:10', 'Omeka\\Entity\\Item'),
(3, 1, 118, 3, NULL, 'Garibaldi', 1, '2020-11-21 09:33:18', '2020-11-21 14:42:55', 'Omeka\\Entity\\Item'),
(4, 1, 118, 3, NULL, 'Courbevoie', 1, '2020-11-21 09:35:46', '2020-11-21 14:33:10', 'Omeka\\Entity\\Item'),
(5, 1, 118, 3, NULL, 'Carnot', 1, '2020-11-21 09:36:48', '2020-11-21 14:33:10', 'Omeka\\Entity\\Item'),
(6, 1, 118, 3, NULL, 'Cergy Préfecture', 1, '2020-11-21 09:37:23', '2020-11-21 14:33:10', 'Omeka\\Entity\\Item'),
(7, 1, 118, 3, NULL, 'Bordeaux', 1, '2020-11-21 09:38:48', '2020-11-21 14:33:10', 'Omeka\\Entity\\Item'),
(8, 1, 119, 6, NULL, 'Ressources Humaines', 1, '2020-11-21 09:40:43', '2020-11-21 14:29:58', 'Omeka\\Entity\\Item'),
(9, 1, 119, 6, NULL, 'Finances', 1, '2020-11-21 09:42:04', '2020-11-21 14:29:58', 'Omeka\\Entity\\Item'),
(10, 1, 119, 6, NULL, 'Commercial', 1, '2020-11-21 09:46:11', '2020-11-21 14:29:58', 'Omeka\\Entity\\Item'),
(11, 1, 119, 6, NULL, 'Marketing', 1, '2020-11-21 09:47:09', '2020-11-21 14:29:58', 'Omeka\\Entity\\Item'),
(12, 1, 119, 6, NULL, 'Juridique', 1, '2020-11-21 09:48:18', '2020-11-21 14:29:58', 'Omeka\\Entity\\Item'),
(13, 1, 119, 6, NULL, 'Systèmes  d\'information', 1, '2020-11-21 09:50:58', '2020-11-21 14:29:58', 'Omeka\\Entity\\Item'),
(14, 1, 117, 5, NULL, 'Football', 1, '2020-11-21 09:56:17', '2020-11-21 14:31:16', 'Omeka\\Entity\\Item'),
(15, 1, 117, 5, NULL, 'Musique', 1, '2020-11-21 09:58:02', '2020-11-21 14:31:16', 'Omeka\\Entity\\Item'),
(16, 1, 117, 5, NULL, 'Rallye', 1, '2020-11-21 09:58:52', '2020-11-21 14:31:16', 'Omeka\\Entity\\Item'),
(17, 1, 117, 5, NULL, 'Jardinage', 1, '2020-11-21 09:59:38', '2020-11-21 14:31:16', 'Omeka\\Entity\\Item'),
(18, 1, 117, 5, NULL, 'Cyclisme', 1, '2020-11-21 10:02:20', '2020-11-21 14:31:16', 'Omeka\\Entity\\Item'),
(19, 1, 117, 5, NULL, 'Surf', 1, '2020-11-21 10:04:33', '2020-11-21 14:31:16', 'Omeka\\Entity\\Item'),
(20, 1, NULL, NULL, NULL, 'Collection loisirs 1', 1, '2020-11-21 10:11:50', '2020-11-21 10:11:50', 'Omeka\\Entity\\ItemSet'),
(21, 1, NULL, NULL, NULL, 'Collection loisirs 2', 1, '2020-11-21 10:12:17', '2020-11-21 10:12:17', 'Omeka\\Entity\\ItemSet'),
(22, 1, NULL, NULL, NULL, 'Collection loisirs 3', 1, '2020-11-21 10:12:34', '2020-11-21 10:12:34', 'Omeka\\Entity\\ItemSet'),
(23, 1, NULL, NULL, NULL, 'Collection loisirs 4', 1, '2020-11-21 10:12:51', '2020-11-21 10:12:51', 'Omeka\\Entity\\ItemSet'),
(24, 1, NULL, NULL, NULL, 'Collection loisirs 5', 1, '2020-11-21 10:13:20', '2020-11-21 10:13:20', 'Omeka\\Entity\\ItemSet'),
(25, 1, NULL, NULL, NULL, 'Collection loisirs 6', 1, '2020-11-21 10:13:44', '2020-11-21 10:13:44', 'Omeka\\Entity\\ItemSet'),
(26, 1, 115, 2, NULL, 'Compte de Hichem', 1, '2020-11-21 10:32:31', '2020-11-21 14:34:56', 'Omeka\\Entity\\Item'),
(27, 1, 115, 2, NULL, 'Compte de Tidiane', 1, '2020-11-21 10:36:29', '2020-11-21 14:34:56', 'Omeka\\Entity\\Item'),
(28, 1, 115, 2, NULL, 'Compte de Steve', 1, '2020-11-21 10:37:23', '2020-11-21 14:34:56', 'Omeka\\Entity\\Item'),
(29, 1, 115, 2, NULL, 'Compte de Sarah', 1, '2020-11-21 10:38:45', '2020-11-21 14:34:56', 'Omeka\\Entity\\Item'),
(30, 1, 115, 2, NULL, 'Compte de Mathias', 1, '2020-11-21 10:39:54', '2020-11-21 14:34:56', 'Omeka\\Entity\\Item'),
(31, 1, 115, 2, NULL, 'Compte de Corentin', 1, '2020-11-21 10:40:47', '2020-11-21 14:34:56', 'Omeka\\Entity\\Item'),
(32, 1, 116, 4, NULL, 'Porfil employé de Hichem', 1, '2020-11-21 10:44:53', '2020-11-21 13:50:33', 'Omeka\\Entity\\Item'),
(33, 1, 116, 4, NULL, 'Profil employé de Tidiane', 1, '2020-11-21 10:56:02', '2020-11-21 13:50:33', 'Omeka\\Entity\\Item'),
(34, 1, 116, 4, NULL, 'Profil employé de Steve', 1, '2020-11-21 10:58:33', '2020-11-21 13:50:33', 'Omeka\\Entity\\Item'),
(35, 1, 116, 4, NULL, 'Profil employé de Sarah', 1, '2020-11-21 11:00:55', '2020-11-21 13:50:33', 'Omeka\\Entity\\Item'),
(36, 1, 116, 4, NULL, 'Profil employé de Mathias', 1, '2020-11-21 11:03:42', '2020-11-21 13:50:33', 'Omeka\\Entity\\Item'),
(37, 1, 116, 4, NULL, 'Profil employé  de Corentin', 1, '2020-11-21 11:06:52', '2020-11-21 13:50:33', 'Omeka\\Entity\\Item'),
(38, 1, NULL, NULL, NULL, 'Liste des employés', 1, '2020-11-21 13:34:19', '2020-11-21 13:34:19', 'Omeka\\Entity\\ItemSet'),
(39, 1, NULL, NULL, NULL, 'Liste des services', 1, '2020-11-21 14:27:26', '2020-11-21 14:27:26', 'Omeka\\Entity\\ItemSet'),
(40, 1, NULL, NULL, NULL, 'Liste des centres d\'intérêt', 1, '2020-11-21 14:27:50', '2020-11-21 14:27:50', 'Omeka\\Entity\\ItemSet'),
(41, 1, NULL, NULL, NULL, 'Liste des sites', 1, '2020-11-21 14:32:06', '2020-11-21 14:32:06', 'Omeka\\Entity\\ItemSet'),
(42, 1, NULL, NULL, NULL, 'Liste des comptes', 1, '2020-11-21 14:34:14', '2020-11-21 14:34:14', 'Omeka\\Entity\\ItemSet'),
(43, 1, NULL, NULL, NULL, 'Liste des sites à Paris', 1, '2020-11-21 14:38:52', '2020-11-21 14:38:52', 'Omeka\\Entity\\ItemSet');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(115, 1, 8, 'voc.tllCompte', 'Compte', NULL),
(116, 1, 8, 'voc.tllEmploye', 'Employé', NULL),
(117, 1, 8, 'voc.tllInteret', 'Centre d\'intérêt', NULL),
(118, 1, 8, 'voc.tllSite', 'Site', NULL),
(119, 1, 8, 'voc.tllService', 'Service', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(2, 1, 115, NULL, NULL, 'compte'),
(3, 1, 118, NULL, NULL, 'site'),
(4, 1, 116, NULL, NULL, 'employe'),
(5, 1, 117, NULL, NULL, 'centre_interet'),
(6, 1, 119, NULL, NULL, 'service');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(23, 3, 1, 'Nom', NULL, 1, NULL, 0, 0),
(27, 5, 1, 'Libellé', NULL, 1, NULL, 0, 0),
(29, 6, 1, 'Nom', NULL, 1, NULL, 0, 0),
(30, 6, 4, 'Mission', NULL, 2, NULL, 0, 0),
(31, 2, 200, NULL, NULL, 1, NULL, 0, 0),
(32, 2, 201, NULL, NULL, 2, NULL, 0, 0),
(33, 2, 202, NULL, NULL, 3, NULL, 0, 0),
(34, 2, 203, NULL, NULL, 4, NULL, 0, 0),
(35, 6, 208, NULL, NULL, 3, NULL, 0, 0),
(36, 3, 209, NULL, NULL, 2, NULL, 0, 0),
(37, 3, 210, NULL, NULL, 3, NULL, 0, 0),
(38, 3, 211, NULL, NULL, 4, NULL, 0, 0),
(39, 4, 10, 'Référence', NULL, 1, NULL, 0, 0),
(40, 4, 139, 'Prénom', NULL, 2, NULL, 0, 0),
(41, 4, 140, 'Nom', NULL, 3, NULL, 0, 0),
(42, 4, 204, NULL, NULL, 4, NULL, 0, 0),
(43, 4, 4, NULL, NULL, 5, NULL, 0, 0),
(44, 4, 146, 'Téléphone', NULL, 6, NULL, 0, 0),
(45, 4, 123, 'Email', NULL, 7, NULL, 0, 0),
(46, 4, 7, 'Date adhésion', NULL, 8, NULL, 0, 0),
(47, 4, 205, NULL, NULL, 9, NULL, 0, 0),
(48, 4, 207, NULL, NULL, 10, NULL, 0, 0),
(49, 2, 206, NULL, NULL, 5, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('3r0o4j3n0pg9r095mkj0jj2bp9', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353937343733342e3935393439393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226867666976706c726276376a6d346e763461616d663131637667223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353936363439333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353937363933323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353937363234363b7d7d72656469726563745f75726c7c733a32383a22687474703a2f2f6c6f63616c686f73742f6f6d656b612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223266336337663166613566323732653765333033643435383365343962386566223b733a33323a226366613862333464353261346233303534386337633365353666623536666435223b7d733a343a2268617368223b733a36353a2263666138623334643532613462333035343863376333653536666235366664352d3266336337663166613566323732653765333033643435383365343962386566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a31343535333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3137383a7b733a33323a223462663735303130313430636138303236313231623132663632393931316432223b733a33323a223563626639396434653232303263626439616466316263623966633832383666223b733a33323a223336663238343839336537303261303332633461303837376436393536396564223b733a33323a223834616364363162336132623261306432383733343065383534393434366235223b733a33323a223035383066316161353538336232303239653162336636653661636431643432223b733a33323a223563633731306338626238636161306534636262663035366163613135643662223b733a33323a223463363136373961393937626135376461613362396336373139373933303837223b733a33323a223233306563656337376135616435323166336665363066326239646664343434223b733a33323a226332656336613734646565396566386363393039656231343661616232383633223b733a33323a223162393934303037313638623265333037653335626637333161363661633339223b733a33323a223537663863643063623333303263393865316464363138643062323233303637223b733a33323a223133336566373534623038653731616532303163613235656337636333313161223b733a33323a223635656163353162303939353534336135306163613861326631323836366134223b733a33323a223132396162646662613163303535363834613935313865323131373761303366223b733a33323a223330353564646466643266643666353234613565346466306435646332313335223b733a33323a226336336237333735633836616261316636326539366134303466613063613632223b733a33323a226536353034376463363462366564646261323761333531646439356238313634223b733a33323a223062353666363865623233333965366565333065386336656238386266623632223b733a33323a223038303238396132383863616364346662303239383832386564303639343831223b733a33323a226264353562373165643331353762666637363862333037376664393031333237223b733a33323a223030666164306639623139353765333231313335386233336161386532336538223b733a33323a223964616232346139393765326666366161346466653661633139666438313537223b733a33323a223639323037343334663539346366323361653130663862383237313061333934223b733a33323a223339343032616432633236306264356533313733383966633162663565373364223b733a33323a223562376164633537396633386463376636636161656236353261303938303861223b733a33323a223733623330396135383066626161656461623361343465636565323663663634223b733a33323a223364333232383461383763656465383236376631323736346665333261343131223b733a33323a226434623238383434636162323664373238353065636364636266396434383939223b733a33323a223836386434343231306139633233623530393163386433363632373538633334223b733a33323a226634313839633663626336373936666666623435663534653631323661303565223b733a33323a223961366531336633653663636166383830633465343631313463346436306364223b733a33323a223364663530353636376436353963303836666562626461616265626361376430223b733a33323a223439383739636364653635666362366137343065343535616533663933353930223b733a33323a226534613637366132323533643635376464353231643331323333343866646666223b733a33323a226130313836663062623361656263333065626339323632316563626335343334223b733a33323a223761613664303133323362356662646537653636373435306663313937633933223b733a33323a223538346266343936363737343639343866326165633564373461396331353530223b733a33323a226132643130323139353063356139333963373830623338323634323438653339223b733a33323a223639383630333531386432626138353161353332613435356238356431633632223b733a33323a223262326334353761313736303135356263643062336162656163633831613032223b733a33323a226533363766313464633936363435393434633664313862386561346334383033223b733a33323a223739386462663731653765623862623435396362653237643431636662303364223b733a33323a226233306163626332643262623435343734393237313566396164663436363032223b733a33323a223766376332353535616561356138393835666236653334623434383134653264223b733a33323a226563666338636262613238316366383162636130666466626630613237393332223b733a33323a226263353538353535386639393965656266653366653330613530393464313231223b733a33323a223439643263393964353464313734636634343139363533643361366130613865223b733a33323a223439303865343333326664343766383863656233316434303866333836313737223b733a33323a223731646664363339363065393437343531333236383337643365353063336363223b733a33323a223838356232393031653531363663343133383236646266613239626533303531223b733a33323a223031323336306639303437336139383865353664633165393030313263626661223b733a33323a223736666632383266346438623238396633346663363739393038636138623430223b733a33323a223632396362646663616465356135316166393566616636346334346531353738223b733a33323a223933313432316161393565383936363133366366646533343764363232313565223b733a33323a223335343231323061633736396537346266303633396662356138616466323331223b733a33323a223339366233653235613963653161323138393933343634343834386238356537223b733a33323a223432303837656165393531323430343138376338636562363934363536323631223b733a33323a226439663331353930633865623063373336653562316238653932636165323834223b733a33323a226533636230346263366533316239613665643937666664356262616535653431223b733a33323a223266343331373036356336623138313562653866363638333330336532643434223b733a33323a223562636461343932383638383964376533616564303366356538353564353336223b733a33323a223434623239646330326665656337663632636462343335366638316436346135223b733a33323a223664353838396466333932386638373935336133646436643634313361623635223b733a33323a226632643435316334623066396337363965303231363032623664643537653761223b733a33323a223161393266326438323235653036383432383830306566353033333135343839223b733a33323a223633663265306538316137313133656465666635656330613162323136303262223b733a33323a226439383561633932313534363935363063633334336339373364333463313730223b733a33323a223534643861616261663230366664363237383736633763313463663762313262223b733a33323a226164656436316364343565653230333463326437353462383037613135366232223b733a33323a223632366161303463623632636361353463623764626235623364373930646235223b733a33323a223563316463633165323136633937363938383331653835613466383164663937223b733a33323a226536646465373237653330623433343634656239366139353063623330626361223b733a33323a223239663037353234663766623262333639343837316561363564636330363136223b733a33323a226433313530383937333535363266333464323065303064383339353965393834223b733a33323a226465363231306133623235363466653461326461636131613438303533653366223b733a33323a223738663230336365366664373130666664346364656530313664656431373563223b733a33323a223930396365626462393935366132353231666431633538343466386531343536223b733a33323a223339373735386337366237363566356438303737363936316339353762333761223b733a33323a223435373238313266633961316333373637633732306530623264613133346338223b733a33323a223232303134316439643138653466333464333763386166373865343533323938223b733a33323a223561353332333265303231613230353866383937633033363031383538663666223b733a33323a226333313466613936666437646461636362376362383432626461396130313932223b733a33323a223361306534323562303733303764383633316666323862666339643033313330223b733a33323a223733306162303039393730653430623866633163633833353161363735653231223b733a33323a223438663536346236643237313435363363656566343062356564396464396665223b733a33323a226333386138666163623163316135666535323830326662656532386239303162223b733a33323a226235376165323664383331326630376239343165663738323661353437643762223b733a33323a223331666232393833313030633333306363366634333265613766633161356338223b733a33323a226531646431343531383266356333613864653266356137346666666231653662223b733a33323a223634346638666161383731343564343635663530663736336538343765343561223b733a33323a223036343534663562343930313538313736363765363035383430663839326433223b733a33323a223130643037626435376663356566393636303765383538623034333461396138223b733a33323a223461303065646130313566386330663532386139393662333130373634613062223b733a33323a223733636331383233393764376463356338363130666238383939303664323737223b733a33323a223062336533383631323464333561666564386332313566643363366630626565223b733a33323a223966613932303839326636616266663037316239633665636530326561663961223b733a33323a223334386464663336306465633035303730393035373431346633356665623061223b733a33323a226264366633373935306535356165313666663037393561633865613039393066223b733a33323a223838366536373462663831383532313039333634383262616234663064343666223b733a33323a223266616138303764663332356662623263363662313338393130303839356664223b733a33323a226665306463306165616533656537316363653162393866616463323238613363223b733a33323a226339363039663565356130343565356633363863353433643631323638643964223b733a33323a226463346439653136386638643339613736653430303263343839623030303739223b733a33323a223634366339396333356161626432366234393732633264366236343535643061223b733a33323a226530373137366633336535323539376532336237343336366239613332306331223b733a33323a226261323435663435363465373239306631313437323963623534376535623561223b733a33323a226338343463363134363061623765373763646333303666343936643731656665223b733a33323a223932613333653431336430633863653936363765653639626232346433336266223b733a33323a223439366630626364636430643336383133663135323064363630333166323661223b733a33323a226366386363313462373138326134323732386636313233646439383435306130223b733a33323a223233393765363335386438343831653166373839396162396436313062336133223b733a33323a223665636565343631363962626464666230356231303963613639663930653166223b733a33323a226366336136613565656534303438303065313530643030326236623264303330223b733a33323a223935386137613863616661393138613439633064376538633832633432353431223b733a33323a223437616338666361666631653337333963386233363432626565333336326637223b733a33323a226131633132373466613962393934613230633263383766356532633064663439223b733a33323a223739393533396233383963383434323732333830353764303938343064616536223b733a33323a223862366638323636303164623463343538633166666239323465653263396439223b733a33323a226636313461646663313464316639663731636633626462666666346332663730223b733a33323a226636333036663663663536313739303866393233363537336330313735353931223b733a33323a223938393964336530623231653031363631383765383462643930376136623966223b733a33323a226463313866343332633662376536626637393463663864666461643431623466223b733a33323a223465626165343930353564323864663133376532626231353038313537663761223b733a33323a223736643764333762303033323161326363303639323233363133316363303839223b733a33323a223135306234613337313832386564636466393837663332316636633132643137223b733a33323a226565303863366462353864306461623632643636366634366139393237363964223b733a33323a223539326136373065646235633833626433646137343563336665643435353435223b733a33323a223734386433633437343832663565633563613030393436346132326661646165223b733a33323a226137393266663835353661333463653039383538633731383532623338356131223b733a33323a223665363561316638303665393830316464383335303434633361373632383165223b733a33323a223436623930623561653637323663323131363064326666333538626337643461223b733a33323a223266653663326436626661366266616236323938663536333766656563613562223b733a33323a223965613934623435636666656231373338666635366435303462663135356461223b733a33323a223962643132386562626134396565633265663936663234616634623437386233223b733a33323a226461653866326338613264366563343963616465653230303831313937353636223b733a33323a223364383736386330613030393034393931323430666133346237653634303537223b733a33323a223961373831616330363132663334303035633061363561613661616332663365223b733a33323a223630633063616134323432316436326232343362653363663239626534326463223b733a33323a226236636535366537653430663266363330646362623033653139633064656532223b733a33323a226330343033306162373231393766613139646162303062393030636533393331223b733a33323a226465646535346166383763656466616362306533343465313864373561613431223b733a33323a226364663462343636336666306337306436363766353766643630333765326232223b733a33323a223232653633343432646238653934666361613534366661393337656131303562223b733a33323a223461373663616533653834363161653135396166616138616666343831363033223b733a33323a226638653531373737393935613763386534363139663237623238623230363363223b733a33323a226133376666343232623166373863663463316439333635383863646161356138223b733a33323a223633613362643333366133313363383535363164613266343564623937303631223b733a33323a223036353136306462636438353437366332336638666437663533633434343032223b733a33323a223766316330616536383963326366373563383039613539663064643438383438223b733a33323a223635326666313366353163313838333565306133363335376234363566626566223b733a33323a226131623437623131643134633661363536376563646337343961366634343664223b733a33323a226437386534666234643031386230353062666364303435333861346237363439223b733a33323a226261653537623063623732386438663863613862653234663562626537633964223b733a33323a226161343062613963373938323564366565386537623131346166343266393661223b733a33323a226263303135643830643661636534376464316266666337613532343736356434223b733a33323a226532613064386562633330663737666336616463656162653332373832626263223b733a33323a226534353032616364353365643739393439353935336633303735376366383261223b733a33323a223532643936346538313866363264393339333933653736626239346136326563223b733a33323a223333313139366437613535303962376634383966613866356538656135353934223b733a33323a223236613037323061356439383537626533316330333132313966303636366339223b733a33323a223862383462643730386538326335663237376332313937333163666139303462223b733a33323a223132356436613962633966373062313364303530393534376266643331666636223b733a33323a223437303363633163303732633334366631306139383837613133393262376639223b733a33323a226262396232633861353830393264613131356632393636373762626665326133223b733a33323a226665656333313266386433366337346235613030366131373630373964303866223b733a33323a223437633738363364313231373466613338376331336163393061323538366334223b733a33323a226666336533376264326465373765643863663365643431653836376435386434223b733a33323a223639383865396565633862336533663461663638653532353931386564366632223b733a33323a223338626235373736393132356433316138336162323835316262366333366531223b733a33323a226237373732383332633432326261306236626335313363626433333135333365223b733a33323a223136366564373463383030663237396137396539613366613930653363366331223b733a33323a226663303935303034383737646630616665626665663339393034666532353865223b733a33323a223666336462303764383131363935326233623466303734396334363562323664223b733a33323a223137333037373832393636636535633530653331393963366364633933303730223b733a33323a226563356439633239626634326535336535333666326231376537353738333932223b733a33323a223039353331393134633033333736323537613263616265623634656432396135223b733a33323a223535643664356663613565306436343132313436363433326361333739376663223b733a33323a226332623262366562343465313637313239656237373839376332643239343733223b733a33323a226164363636363265613737306430633666306465303963396261626663333738223b733a33323a223435316534376666663464626634353036346466323366333562333734633264223b733a33323a223638656138393761633763373764373330613561356138306237373938623637223b733a33323a226565363464663331383265383830613561626564633833626433656434663465223b733a33323a223231643037623235333334306363303064343535643636313363333238353636223b733a33323a223839613233303462643165396666316531323733346466643039616639326636223b733a33323a226464643033623837303632353239386239343363623563633531346561626563223b733a33323a226236386336303337356432303331396566643663636439326235353433313030223b733a33323a223932646163623665363035646466393730363834663765323939353064623761223b733a33323a223231653937643065626232663838663366643364316161653830326539346563223b733a33323a223461636336663131313230366566306335633566633461306463636137313661223b733a33323a223065336234346238616630356238393535363933623139393066666532343434223b733a33323a223462363564336232373630383935356266343662623162356539363836323336223b733a33323a226263636235386432656265623638356537383230363564656337623433383065223b733a33323a223164336133383531346162396334353362393962623939346538383662326239223b733a33323a223534323436363633313231373836393662663939383235343565333933386534223b733a33323a223566653164633238643937343233653934343133356231316433326564333166223b733a33323a223536373064343335633530336630653634363230616332356662383732636462223b733a33323a223866323638633732396664653663656439643964303761303531306562373461223b733a33323a223230613564663932623336316632383461346466306432656631393136623763223b733a33323a223732633165393138663935653161363034326433393166303166613463373762223b733a33323a223232303133356662333830383734306435663434373835643639366438643035223b733a33323a223265353631633963336135343961373038343630336662633633373931303734223b733a33323a223435643739323939623237363961366364356232393834613161353033316638223b733a33323a226134643836633631396434666334323337363230313233613166313836316162223b733a33323a226132663631396634343463353338343339396436623361653064366439386565223b733a33323a223833306131303634383435623334643563323335366466336234353734353161223b733a33323a223137373239323134343339633130363436383863333162346634653531663732223b733a33323a223462363232306363646537346334346335663935376136343432663638313462223b733a33323a226330373237643030613766646262653635373638343834303732366563633736223b733a33323a223931643866616135623864393834623539346233656633636463376332323763223b733a33323a226133383965333336353833663136626562386365323634376435613135333130223b733a33323a223230626464336166313561326239373539396435653365376432633136383837223b733a33323a226131666431383736646435343464326364333139366264373338623434646133223b733a33323a223131346437383661386562643339343934323462613233303161333063636632223b733a33323a226338373232623966363866626636386233653964386361656533396637383532223b733a33323a223039353937393039343762626132373833616136366538393566623266626562223b733a33323a223936366230383163353361313363333836326163373637666538626133643539223b733a33323a226163663338363637353337333635646530636361653261353739343763616662223b733a33323a223835663039646466373532636236623166343264663666666662623664353765223b733a33323a223439303065643039356265626432343836616230353365613634373931323039223b733a33323a223735323135376231636338383262636631356337376231383035363666303639223b733a33323a223561333832326536366332666561353832643236363938646466623263366439223b733a33323a223364626164636365646537343334613235323735633734303766383632353031223b733a33323a226131323438326332373830636538346234646164633063316430353363663036223b733a33323a226536326632313661396166303539383531333163383830326338313331343834223b733a33323a223562356561313161656235656438636330356238623431373233623061393866223b733a33323a223066386232623662613062306363626431303633623732613437393063373331223b733a33323a226337383835663661393962336261633335656432366435643763313031343266223b733a33323a223732373233383734373536343664653237313866383361323533363239393330223b733a33323a223037313035353464386237313366373436663363663436313035326363306134223b733a33323a223332633537396334333938323330623362613539643265393436373564653034223b733a33323a223838306137396537356230656338616331626431303034326335316135346138223b733a33323a223138636536393565346234633765613561316239303565633663376465643633223b733a33323a223962623761323261393139333864363461663231663234613531633937353234223b733a33323a223633356638303832613962313565306564326330306437323134326237363136223b733a33323a223738613435653966623439636439653534386135383830623063383031643632223b733a33323a226234313633616264613632323337623065353564646131643866633638636530223b733a33323a223466356639306463393361623034626539396462643931613866306266646138223b733a33323a223365373064373163353666376133643739653062383939633064633837346235223b733a33323a223435316430306366346464656331303966383031336365663064666533653831223b733a33323a223435353630306437343162373934653330633734633638396431373763636435223b733a33323a223137343965633461386235346538303165333832633861333631383438336263223b733a33323a223932346539313439633763653336643632623431373934366339326165396339223b733a33323a226462383930636338393835626262393438383738613361383538306330383564223b733a33323a226434656236633432643235666234353134616631663130383738623933303130223b733a33323a223761633565326461336265323939343163383938653837396330373635376433223b733a33323a223563326461613734323339633166326536636436326230663437356632386433223b733a33323a226262306631383235663937363931326665313537653139363631323362636431223b733a33323a223565613732396434383562326133306237646233646139393461333063633861223b733a33323a226536393631613961663261313836636336393465366432633663396234616132223b733a33323a223836303435393131343335613737643630366564336430333136656232343138223b733a33323a223536343639393163336336346631656261663636656436643937333862323430223b733a33323a223630303139633766623637313639663462653063666165613137313035633338223b733a33323a223838656162626366336231383664353630303365343232336131616639363833223b733a33323a226633393939643035643033613733363536303335313265383937366331663636223b733a33323a226561393539613533623730393064333638613938323230313436373361383532223b733a33323a223765333164386366323333373135353035386435323763356537663639366162223b733a33323a226536666664613262616636626339366235623031316634373933633738643336223b733a33323a226562643435336261653438623235636537626439393537396166633637383661223b733a33323a223738303133313133653938323534396136383530643734613237333433616333223b733a33323a223637666131343439323037623739663731396131636163316535306538333036223b733a33323a223935376462613838613738333065623237383363313364343236353365313732223b733a33323a223831333461663931313535386131396264663837356532343865636633353735223b733a33323a223630633064613761363637316466363461633763643939303737353331656438223b733a33323a226236363432643164623461623838353330643633303866656539653864376139223b733a33323a223132653237646235366435653532363937663132393137636432333130323064223b733a33323a223835653430333031366361373261383566386134626235386239396131623865223b733a33323a226636303264386233333263303638376436663161386231666463346166623737223b733a33323a226437613063666163386237363365633161626364656338306439373431663539223b733a33323a223833363666306138613038346239363830383164393033653034386438373133223b733a33323a223962346461343462333130303266656664653330616466613766336637663661223b733a33323a226537393364616664306533353561636166346535363938373631616130646237223b733a33323a226330346131346264396434373631636664393538383261383062633738313234223b733a33323a223464326630643838656431336137346264666531363234316665393032666664223b733a33323a223166623333646133393062336331333733303738376438633438646237363233223b733a33323a223462653732396533336562633431376263303934633361383132323164396564223b733a33323a223764353936386565636162383966646563333936646538363034366161333164223b733a33323a223138636137666139616163306632623961303365633430653965376263653336223b733a33323a226264383963383037623166333562333164396639626565346239313536366130223b733a33323a226435633561613461383161656239356630383536313235376663353936363230223b733a33323a223766636435316531353935303338393533363832383665313461383763393166223b733a33323a223963646331363761393464316161346431346366393262626539353566646338223b733a33323a226336643230313266316133383063376230373433373363303764653762356564223b733a33323a223831343465333730626366323665326463383164306635366166356134666366223b733a33323a226133346537373537303264313662666432313736626335343733313736393234223b733a33323a223261616366396663333036363231333266626461313336633263353036666439223b733a33323a223735656238376436356362623631346366373336643331643833313032663463223b733a33323a226632663937353034656166636437373230623830613862663934393863663865223b733a33323a223937383665633661386637346539363865653063623732353335613233313737223b733a33323a223965396165313139303334306532663138646530633561663331386435316332223b733a33323a226338363066373663626163623735373030363337363562663862636566333830223b733a33323a223238323462363632336238643331333866393961323230643335333966333232223b733a33323a226430343633316438316536636364353263363330383066653062313930623637223b733a33323a223135633463316363633136633334623137303930303934653865663963363963223b733a33323a223335656539383734313332383439663463343932386239303231393933616531223b733a33323a223363613039643764303631656636323130626163616263653935303035343330223b733a33323a226534396466653432663566343336353935633138653963653565646133326561223b733a33323a223530316364393133326565613765356333323964393363653536373266343130223b733a33323a223237653962326635613035663863623430326666646339613832383134393238223b733a33323a223666643734643633366639613964353666616530306539326361613539643836223b733a33323a223838383536303037353431653038376435376562613163653831666536313462223b733a33323a226366646430386537363464323562363166343130633563316639383536373836223b733a33323a223865393365376334303439353434383630376539326436623134333338616134223b733a33323a223961333466333033346537386466306665383436353737326535373233376465223b733a33323a223438383230383766323063623230343736626665373732343331653563626132223b733a33323a223631353364353935623132346637616663323266326262353630323033343739223b733a33323a226233323537366166316630623535653461373133653231316461386231633161223b733a33323a223239336330373635636237656231376634306563353836376464373639636632223b733a33323a223262626635353634663134636335376466363764663634383765623134623133223b733a33323a223438653633636236393338633436653761653239393430656439363066653465223b733a33323a223765326433633132356530343262626537353131666239643837333663313061223b733a33323a223764313366323764336235333965626631383463653135636630363339363436223b733a33323a226161396563656633343234643961643164653165633834306339363734623061223b733a33323a223836613465333963326139396230356536313039373235616233343230623337223b733a33323a223138313438616664313166623137376332356538353032323132313533356161223b733a33323a223931303432353861623232316133646562323061313264373465363930366231223b733a33323a223530303736616637363336663039316234383934333762373935303332343738223b733a33323a223535666532633637646363396431613865306235613934643233393863613062223b733a33323a226231356437623939373239636635326630333062323631646330306262376461223b733a33323a226165663932623535383837343331633462376633386234343536633866383136223b733a33323a223039306533646337393232653831363039323733653237643733303831323938223b733a33323a226238633435333266313662383939356366313665316237333237666538386566223b733a33323a226364356663666532303433353439343465653261326539623037636239383663223b733a33323a223037623134363438313961326364343865653663316564303432613539363861223b733a33323a223862343461386163313139623362316333303031376363373230373935656138223b733a33323a226638383462393135346530653331313363353864643864333432333661303437223b733a33323a223939316537613737613338636438623464663765333032316635373162326430223b733a33323a223738303761313539323865383636346533613837613434623930343033313061223b733a33323a223831643237613631303834313934323232366336633065336236666166326439223b733a33323a226239346161663061363563383437656330326232613662353635616563346362223b733a33323a223731393433373132353661633137366565373038353735376665333466306239223b733a33323a223266366133313433323064393638353466623866363461363033623534356164223b733a33323a223239636433373938663637386532383932343936336363353064653133653838223b733a33323a226334313365643965383364336166346234363938346363363237653131303231223b733a33323a226534393730346334636231336439643635666634663764356638636333613139223b733a33323a223938663465376235393138633934396339623433613933386330643637626237223b733a33323a226464353630623036373834376537633962623264643564623539396533393335223b733a33323a223535333262636438336363303261306536316431656438623864393036336661223b733a33323a223061363063346237643235376562666665613632393435633432376137303332223b733a33323a223539313233633932366463623061643761373732383133376636333463343364223b733a33323a226230303565646566633266623338316439396234373733666162373237306634223b733a33323a226362373863636461376638343162626637343231666265396566663235343233223b733a33323a226535333737666435373364356538663063653036333731343939313161646563223b733a33323a223634316162613564336634323065373839343631346636333637613561623362223b733a33323a223336646439613632303261363130636362343234363166663562383463616238223b733a33323a223565393831316237643236343465336132326331653138653565616430326363223b733a33323a223034386236636466373363346561376436616266393065343331343730353630223b733a33323a223562306238623331663962343335343230653163333732323233363635393237223b733a33323a226132633330393561306336313338616131383232316235313061386137666466223b733a33323a223430353232653539303339376265373835303836346531373761616466306638223b733a33323a223061643737353232643863343938643437613934366664633338623463656633223b733a33323a226631333138353232653038343531666133643365346362323032616262323932223b733a33323a223634623438653564336231323966313932303735383438643062396661373939223b733a33323a223630336630656132323838653735613466616266343631633363393066343431223b733a33323a223861363365343638343463336661613037363264616234336362653837353830223b733a33323a223266653930353861636165366430666632663432306665333135666137316430223b733a33323a226138373436393338333135333639326530643835376538626537306532623630223b7d733a343a2268617368223b733a36353a2261383734363933383331353336393265306438353765386265373065326236302d3266653930353861636165366430666632663432306665333135666137316430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313931323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223531643963306537363735333965396532633339393536313337303834653832223b733a33323a223232633531636638343930663139373461306661313365383636353135666266223b733a33323a226261313538343138373363363564363139616462646332306230626232343231223b733a33323a226634326430633534383535313561353036326334343066663434336361626262223b733a33323a223137643335353931323461613333336464663862356137393061303663626139223b733a33323a223030656539353330376431636430316638366366353162653565633937396466223b733a33323a223338653031336463653962643737613839343862326561666233636335643934223b733a33323a226139303963336432646131336261343838323366383566396631316564656531223b733a33323a226533383931373061633039303664353361626530656663613765383534643635223b733a33323a223233356263303166363139323763626436633839333133343830613264313231223b733a33323a226136366438373039396634373965613964376630373134653033396238663339223b733a33323a223737663835373561393862353365333963326238323639353330656264356431223b733a33323a223631326537633666323465303336303663386637303138633962666663653761223b733a33323a226532313039376462656262633631636130613538303830656635633963323432223b733a33323a223430363335366262623634326166313130316331363235633366623036303666223b733a33323a226631303566643065626533613039306130663535383163656536306536623933223b733a33323a223437653737633864353236366166346562313931336137393237626261393133223b733a33323a223036356265303266613761346533313536396665343436326564653062393566223b733a33323a223638623139616465376531303431616265333064656336333061653334386530223b733a33323a226534313330396261346365333934393730326661343565663763656539306165223b733a33323a223464343039646337326230626338636134663339346537343361356462663434223b733a33323a223139656631373138663630633030653030643964336233333236636236666632223b733a33323a226135663739643631623664666564303532633534343664366335636664343831223b733a33323a223932373231386433633565336239346362633466393566613137323564643933223b733a33323a223330666166626161363730326166393737326432653932346637313131623065223b733a33323a226330333731376436373339303137646538393263316363623766393537613434223b733a33323a226362383339633030346238653935383466306637623130613365393838666335223b733a33323a226539383730323934636537646431326134383336646566396635616232326663223b733a33323a223730616637306531313939663836636335633766336464663832636536653361223b733a33323a223961383835313836353237373731373062393863613938383233333737666462223b733a33323a223531373131303666376632643630656333636430366534653937623663663736223b733a33323a226139376664336637636361636431376631376338656137306461623639383665223b733a33323a223163323761316337396263353635633832306362623031633533336261366434223b733a33323a223334333263353935663733653439373239616130373732353931633235376335223b733a33323a223634636365303831373266663932343765396166303331616366326430636539223b733a33323a223936386631303066633533623861393165366133623936333064343264313737223b733a33323a223433636633646166646665613866623133303538666665353165623930306233223b733a33323a223566323862383834626436373563643837353232343963393862363230633662223b733a33323a223935393961393733623536316462393534636361303130393965653337396235223b733a33323a226639323433373135336432323735653830646635626364376239353163343335223b7d733a343a2268617368223b733a36353a2266393234333731353364323237356538306466356263643762393531633433352d3935393961393733623536316462393534636361303130393965653337396235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605974735),
('87oqomnofuqrrhmj7a7vvt4o70', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353536323433382e3132313234373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276396b7466366568333936353632697530683267646630757070223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353536363030303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223562616335363130393661663634623931323763623938323866646430303630223b733a33323a226533633539356565666164646561626265353933316662656264333433323434223b7d733a343a2268617368223b733a36353a2265336335393565656661646465616262653539333166626562643334333234342d3562616335363130393661663634623931323763623938323866646430303630223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b, 1605562438),
('crjke0kr7etv4f442nj68c6uro', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353936323838322e3937393836383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263726a6b65306b723765747634663434326e6a3638633675726f223b7d7d, 1605962887);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('gl4jnr17efui8erguctf2aleaa', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353935383236342e3431303033343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226934766a6372383735353271683632626c696f64367169636d6f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353832323338393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353936313836323b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353931313838323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353935383433373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353936303232373b7d7d72656469726563745f75726c7c733a32383a22687474703a2f2f6c6f63616c686f73742f6f6d656b612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223864323233393539366663363032366231393038643263333030373237323439223b733a33323a223737623063666637343635323138363837333335633335346230363862653166223b7d733a343a2268617368223b733a36353a2237376230636666373436353231383638373333356333353462303638626531662d3864323233393539366663363032366231393038643263333030373237323439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a31303731333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3133303a7b733a33323a223834626461643465326665633930336263383665623636393965613166373362223b733a33323a223733396562646361353133386562353031333066373431343231326432393635223b733a33323a223537383230386637623237643330396230663835613330646437616464393339223b733a33323a223864643065633837393634656263326566316431323538623162346235343264223b733a33323a223866396132616332623237663564343163393862646631303762383462626538223b733a33323a226461353864346630396130343633366364343761396666656430393461623464223b733a33323a226538306363386364636466323066363831653564383537373763386261363132223b733a33323a223764326539643635613832393066656537616665363165346634303133383235223b733a33323a223434616335366166643062353638633635663830323437323765306134643335223b733a33323a223536306365663262633063383833356462646334623066323661623364653537223b733a33323a223865626232643662633030633136643664653466343261333130373333306266223b733a33323a223230616663386465333234313362393062326339666437306366303536373237223b733a33323a226463653765393466393337346361376466356139356437653939323637363135223b733a33323a223436646137643933363830383933323834326336626330366333326231316438223b733a33323a223738313334396365316531613233623565613539393638386233616664376439223b733a33323a223933343431323633333262653931363662393464303638313035393662306332223b733a33323a223931663335663661653137653235386430646638383063316462626431363636223b733a33323a223865313664346164356432636162626633373664356235313738353161393461223b733a33323a223061633265636431613333353735343639383532313537323962333135373330223b733a33323a226561366562663736643765386131363335333562366539333161336564646366223b733a33323a223466623238336164663334313265316666663166316566333032373739356230223b733a33323a223732343432643130663035313534336130623464653038356431643433303963223b733a33323a226337666331616636323135383830303933326433353131306338346362333161223b733a33323a226431343066323831363663346266623564366465346661376430316662386532223b733a33323a223834333461316439306161643661643232393037333731666237626639353431223b733a33323a223039373533613766366165656361613934636361353261663537346230336566223b733a33323a226434666634656463656436373164303065383865303533363863386262326534223b733a33323a223736376466363366643462373766383063346639613338313134613035336561223b733a33323a226162666238613634626233633162383933386338643164656538656163663063223b733a33323a226162666263656261663533313439623039663831363966653962613238626436223b733a33323a223163373761393636343062633838383464663337613930363964396130353261223b733a33323a223937623531376564373136333037323566333839626132626230313662333035223b733a33323a226364666363363764643330383462643463373263333733333366376638343237223b733a33323a226431613964356530313233316664363931343261633532386461373037386136223b733a33323a226131353733666263663338393537623662663834643064383332313866346235223b733a33323a223261666162303935613363316566333037623866623634323763383832376663223b733a33323a223761366365363764376631363034396532616438383963303061393531336465223b733a33323a223730363339393539343064383537376665623032303335633638636131316233223b733a33323a223962376332343938613234303865633936613836333264656630383133306565223b733a33323a223361636338393832326136333733623762313438396536313031656236323832223b733a33323a223661663931336433366437623030616430643161316430653262303666363535223b733a33323a223231646139333436336137323836356438616434633165393063396632336637223b733a33323a223362393431643137323438633736663466643738323834636130633863643664223b733a33323a226262633031383233386332353064326230343565613732656462633331343839223b733a33323a223264353739663935393931353334376462633339346633633338623162633962223b733a33323a223064386265383736643632623364356235346163363535653362353964326633223b733a33323a223539323737356531303933393232623565383564323966333631306338323536223b733a33323a226239353664353461323438656632356366303964313965303538373965663964223b733a33323a223530366464383632376561353063616333303831396661663263303830633064223b733a33323a226235323865326134623061653235386233323033313537363061643666343334223b733a33323a226632643835623264633530643339303737323466323133323837663834353765223b733a33323a226235323563363663626165343461646464623262333563386164643336326236223b733a33323a223138356236386166636432366231306634326438333837396231376637396266223b733a33323a226538663764646661633564393564323833333439396661376562356235383966223b733a33323a226533373635313531633035376435323764656237656362626437333861663066223b733a33323a223263303566306337316465336535313534313739373333383761313164613537223b733a33323a226237653964653265643261396333383961393838306361326233373830373366223b733a33323a226133316436316134376435373531623666613535383163343332623239623564223b733a33323a223433356135663862633362333639316132313730396637613663616561383135223b733a33323a223165323737653233353030326139333261636130623361343166633832326330223b733a33323a223438643462366231303731333237303038623132616435653233616132643263223b733a33323a226362666630663261643832303163356633623963333937383639653731306535223b733a33323a223566393330323865326634306631373161386232366632333663303131656136223b733a33323a223166616165636335363636613765333938396461396131653134356630393630223b733a33323a223161646432623466333838313966393737336135303031316537343038653666223b733a33323a223461663636306563396365626364386339393137323763363839306135626633223b733a33323a223738313336346436363264356534646439616231643061616433653663333630223b733a33323a223638336336366536386239653334626239363534326435643330643534636163223b733a33323a223465653865626638663334303939653133346236313166313935626564656161223b733a33323a223363656132326464663338636666353532663734313866313937353931343061223b733a33323a223035633061363061353936623639393736353266306162366565393665303136223b733a33323a226635353731323236393835356662633536343362643434393266393534363632223b733a33323a223339636334333465303438393036396632646138613632666265376539373565223b733a33323a226434646530653833636238383037626533363733626234373936636232663536223b733a33323a226466663035653136376361366236386464633262616135646337333833313239223b733a33323a223938346438613434656533393736323039313363313630663962323932373433223b733a33323a226130653336353766393935383062303963366363346234363230343038656434223b733a33323a223366636538303938363436643863316532626332333864643761313836626139223b733a33323a226332316162363362373361323962663135316564303937633363653335333661223b733a33323a226339306365393131626362376630386337613863373235623937343864336462223b733a33323a223961366332363663636266393339623234373365643166656265653963666566223b733a33323a223330363934356632663563653730656666313330356634623438383039333162223b733a33323a226164346235306362343937656531643534646135376563636661346136383161223b733a33323a226364333964326135633531373139313331373766393635303164303434336434223b733a33323a223130626363326135393561303230353666643762356362636661376336373364223b733a33323a223237623838643863396331363635336364643332386337363036363061353237223b733a33323a226633323530333035336238396662333139633833383563323261633434313338223b733a33323a223037653839313330386363346139633166613535336330383564323162656665223b733a33323a223631376537313838313664386630313166393038613139383736326564383133223b733a33323a223839366335366639303766356162333463633235653039316134373162366263223b733a33323a223934313935666365323433393438323137393062373961376230323437386439223b733a33323a226366663331653530303936653438663366383137303634643666333466643535223b733a33323a223965373231623231396633336636353833393839306138356162633531633332223b733a33323a223535366262646536386138396331363861656366336661346439623930613233223b733a33323a226361366362323632343032613538306538306131313262396333373039653766223b733a33323a226434383964313033383731316536626164613562386438346639626233366339223b733a33323a223339386664393639616533323933346262616535383932333233653434363934223b733a33323a223838303266653835343738643564623030303364333861373336653965616236223b733a33323a226437666239326262326234623462323863313331653665653634636633343130223b733a33323a223936633836323130373930383132616137353362646130666664363636393336223b733a33323a223835613139336231366632383636353239306561383134663464623263333335223b733a33323a223339333564333639646337663738636366363235366164666437633538336362223b733a33323a223839323932626537323864333362393039373838303761336634353535623738223b733a33323a226138623533376535306131333461646530363834653230633038636331303434223b733a33323a223065636630383136386465343833326464323731653065663563343938343263223b733a33323a223738343566313464663839386265313933626337316338306534633861333365223b733a33323a223662666665326638303062376532366333646432386162336163393865663663223b733a33323a223030663661393834633333663638643539616665373165376433646337653435223b733a33323a223433633934326235393433613036633665333637333435326665393034656561223b733a33323a226134616666336163396530356431666335373836363333643437356564313130223b733a33323a226439376433343935343961333065353366626430306462633236663933393130223b733a33323a223133396434383331623565373661333165656362633439633962333661373165223b733a33323a223034373265613863646438663333303564613663313335623030623163666162223b733a33323a226635353662323362653165643831616162376434346465656266613439653139223b733a33323a223761633438326164316162643563356161653233643536316164383231633531223b733a33323a223161623739643530386464643336336465303636316236343264303133636239223b733a33323a223635313165616466353932643837383330393763366263656435633861303036223b733a33323a223937653761356665333932363164333262303466353462666161613733333233223b733a33323a226438373035363765623263353031653534303239626162366366373532336665223b733a33323a223838623332343532613935393163663261666565383331396435623465376334223b733a33323a226239636139316239633533363836643865376561313239353839396332366430223b733a33323a223330366566336236626164623965613333386335333866336663386531643964223b733a33323a223631396434623266356635653737633861373965353833633665313664353961223b733a33323a223034373361323865663731666164353061346364383234313232623364323634223b733a33323a223465653134356432336162616639336538376265306666306433656339336237223b733a33323a223862633538386230326537643864383335316661636231343438383862633233223b733a33323a223966306264383438363961626465656663633634356639623135393963383931223b733a33323a223261326536386661313666646238313364633263626538316332666139613964223b733a33323a223365393931373666626534316338663033323039663130373838303533393861223b733a33323a223334633662653933653061626634363761326230643932343239633937353239223b733a33323a223439313666653735393332313265653433346561323966336233333035323736223b733a33323a223631303635373838653136653334393333666261353238653165366639366439223b733a33323a223634656639343435653039396262343264323031386633313261346530313738223b733a33323a226236373432313263393532363136336135613532383663333733666239393235223b733a33323a223239343439393266366634383832373564356330376563666361386639653636223b733a33323a226239643062363337653835633433613666616438343536303961393631616236223b733a33323a223639373932623532613232346238623566666166303036653666396261643837223b733a33323a223366373663653566636133356463623533616361646364373638656663353132223b733a33323a223965623261626462343535663235313661623238613261343733643230356461223b733a33323a223536353134333862613939396165313565393930366365386536396163386230223b733a33323a226564386338666239613835333863626333396636663633613732363665366161223b733a33323a223663366232636132393361323236663665306363663639313561633466393065223b733a33323a226366326264353336396535343338303136373239653264303033363635383731223b733a33323a226537353332393933656136303233346462313139386635343961383666666266223b733a33323a226631396462386531663136356637636538393135633635313836643735623632223b733a33323a223830616334656238323531316536356261313361613733366234343362653633223b733a33323a226165303835396232353362643439396430336535343334353161333566633163223b733a33323a223162623666353331666438396235373835393339393934326363336665623762223b733a33323a223434393966613264353436363361623863313636656539666262373035356533223b733a33323a223531636464613537326136613865633665643132353061636230626562623033223b733a33323a223166643030313562656132663735643031613139333834666131303536303736223b733a33323a223266336230633839646334353265313831383530353038663965643137353639223b733a33323a223633653932643865653931656131643263373538373464623734663062653835223b733a33323a226135383532663464336636363862626362643466643433333036386532393562223b733a33323a223363366533656131353733323964326461656338656165386262666537393065223b733a33323a226665316431396336643939326263653863383964636639633363353635623138223b733a33323a223365366532356431383138643066373866623565616436316263326535663661223b733a33323a223937373466326233383362393563626666316333656665613837313532323931223b733a33323a226334393036316434353233383332303737303038626237353662663232383832223b733a33323a223731303737633635373838303530623633393664336133383261343339666339223b733a33323a226230333963313365386133623336303065653761323634393133386432623564223b733a33323a226539396463656230346438646333383966323836623865386662336333633033223b733a33323a223661386634303230306535666662346135636264333231393831633733643262223b733a33323a223164343932636639626163333666313136373635353564353030343563383332223b733a33323a223936333162633735643061343264373531616238646336326131393830623239223b733a33323a223266336362373635366334373664373363613937303132656538313664356364223b733a33323a223465366630663732303837353164303335326139333037613865356233663035223b733a33323a223338303466393464643066353466616133373161643438626330613830626562223b733a33323a226562303130386635316135653665613065353939653762646431623635383532223b733a33323a226661613866393464633231313130353238346439313930326139363139643666223b733a33323a226564613431653036303231636531383962663035373464646532386138353034223b733a33323a223435643532303331306334346162366163396639353438636337366565343136223b733a33323a223331663530303166376565316164383463356630633939356435633130666162223b733a33323a223332656534353133353864353930333636613531303035636330646666393538223b733a33323a226131306464353530356430653261323864643661333833306138623762333431223b733a33323a226137346237356335323562333435643266383465323531303430646538653665223b733a33323a226232643133373138646131663536366263333130323361343338663830643931223b733a33323a223031623236323630646131313863373435643136393332316333326139353037223b733a33323a223530393432383537623365663338643839306232646235666365653839393433223b733a33323a226238363931326137656332383031383330333531633332613437623230336363223b733a33323a223561356132633566656535393661626435613938653066313331353662396162223b733a33323a223131633332663030613562393662353334373733333839646633356231393231223b733a33323a223763613430396231393566633135363133643563396633613831313362653735223b733a33323a223265633737383431353832666530313864366263343733353262616661663265223b733a33323a223732386331613735383635306562306132613733633734363233363662643532223b733a33323a223037646562623065363836373638376330373966386639366337303161633337223b733a33323a223939366264356261656139343130316334316165396639653139313433336361223b733a33323a223164393831396261663731346331636165336161363765363439346466303533223b733a33323a226634626139643462656232386666613135323435396532356563613932386166223b733a33323a226136383339623531653534316563326264633334646565643163663335636664223b733a33323a223364346533613766353465363633643732663165353262383634376162653836223b733a33323a223233333733333233356561646630333961313466366330653331316563623033223b733a33323a226265333465626432353964626465393461303835363835653163623265383036223b733a33323a226564373430316337373836396438373330326335643439613538303962626565223b733a33323a226234633235336465373465663931313364323866353530633965353765306530223b733a33323a226437656161613566363336616430353438336162666463303238653362323965223b733a33323a223062613636316166616333343462383734383366626332656435363465373339223b733a33323a223530613834306231396263663866343261643463376234333861623030636638223b733a33323a223134363630616265373466353438633632323565333564653166646631633432223b733a33323a226530343338333966383066306234656436653838316533633535656131313236223b733a33323a223264613663663832306561373630646261313435373930393466306136366164223b733a33323a223432303630373032313266303738626632323934636133376166323363386661223b733a33323a223132613830646531386133366133383834343261396132653861323833306533223b733a33323a226565323864616262633532666264313836643930653063323562613337613130223b733a33323a223166386663383238623232346133666435373166383033633764393863353462223b733a33323a226337623831396330343037666165306365306634656364333336666434633263223b733a33323a226462636331626130623835356264316139303664303361313536393839393035223b733a33323a226439376234313633383563326665333965633434613237663831306435323931223b733a33323a223861623766396261333233326439653638613238343066373635386562373637223b733a33323a226235363266626132333164323833323338666361643664336161666235393339223b733a33323a223762316461326639646132356439343530306332336263663066326131623738223b733a33323a223661333863373866353636313864373761626133363438333430303965623834223b733a33323a226335356262653863316430343265363765666661643136366334396566333334223b733a33323a223863666231336236363830653163343164323236323033366366323065356462223b733a33323a223863346232393434363063353236613238313064613631383339346563303763223b733a33323a223130326261346465623461633762643537373236616132353538343032386235223b733a33323a226435363136663033666335386337613661386331333432383737363537346164223b733a33323a226466633539343634316637616334373861633636303732303439316166396233223b733a33323a223064313139373131363966356437386636633562626262373765646430653431223b733a33323a223166653639663734636330353133396562383565663062393434333462353965223b733a33323a226566323366323330343232336464393234353464633731363533393631383031223b733a33323a223433313634363162393335626330653964646534383834633763643264633564223b733a33323a223065393533653065353164303931663736363639373330373037326161313133223b733a33323a223631353366613038376662656130346665313861353863653966663837646636223b733a33323a223239366637623737636333323837383132636432663736643638383666376134223b733a33323a226432356534346536363564643833323532313765356563656438346465393434223b733a33323a223033323966626138393437366539386463313431366631356539376530376436223b733a33323a226665336630316132636130626134383737633861653336646562363466396534223b733a33323a226565656531396261363636333430333563393566386563373062306263653132223b733a33323a226662323833636130626134353233343933353537343037333736393536343430223b733a33323a226361333335663739383864616230373237313035313065633563323731376665223b733a33323a226233363836653230656134386232613638393964656132343431366265363034223b733a33323a223430613463376663616233643130316234303239373331656130353266343539223b733a33323a223365633866613933333030663061343430653834383364366362643936313236223b733a33323a223933346638323734333939376137306332376165303534623063636533313030223b733a33323a223930383663353062366564393863356563373237613466363738353162316263223b733a33323a223631363265313238383831343732346365656366663836363263323536326261223b733a33323a226534376538306161653737383938396235373630616636356432373138326233223b733a33323a223063396465386238666134336336626466626434393763336333326337366564223b733a33323a223236633561326335396662396632653262346234663130313239643563376464223b733a33323a223763326237383130653361303931316335373239306666636563343964643937223b733a33323a226538323166643035393130366539366463363231636134623938616439396662223b733a33323a223932633639613437626534303537653865316263313833623537613631343062223b733a33323a226266323065643631383363373733623366353234663532653932303937333637223b733a33323a223037653839373162316562636134336334653539316438356531316436616130223b733a33323a223938306265323463356636343666626561663339376565393339356632626164223b733a33323a226136346335616261646137666362336238646138646333303736393237636431223b733a33323a223264396434343335373039623733633466306465383733366238316361363930223b733a33323a226437623939323833386534646130633038303831653034623030346564343736223b733a33323a223061356337633736393165376231373930303964613866383431616136616236223b733a33323a223762366432353064333439626466616136616433303133343435376330363137223b733a33323a226133616333346334656661393961333035663636386330303561343762356238223b733a33323a223834373866326134363062343638363735313065383662636638396232656362223b733a33323a223863303038383539363266656565316439366162653561336365396330396261223b733a33323a223762383735356533323231323065383962653663373562343663623637316536223b733a33323a226264366534626336323962613263333036333765343864383962363065613338223b733a33323a223432363162323961343066373936366639653966383430326337326535303130223b733a33323a223733363336343262663364313039663864366639616431636430366463313637223b733a33323a223062616365336562303030663863623233393965313435396539653164653034223b733a33323a223030663637356234373864396663633562363931303834353635373264396330223b7d733a343a2268617368223b733a36353a2230306636373562343738643966636335623639313038343536353732643963302d3062616365336562303030663863623233393965313435396539653164653034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226533653937346161636431316632356538626661366139626462393430656462223b733a33323a223034616366383435626435373933366337636462353364356134626239343666223b733a33323a226163666461343837643336373265356533343634663063386130396633386239223b733a33323a223432656139333231313531393435323563333964376135383961646537353266223b733a33323a226134646362633436333461656136616332646562393563633963306534633938223b733a33323a223966663062316538393637613566383235316130333739346465643930663833223b733a33323a226235346131363833623533373432363533623836316265353238616531336135223b733a33323a226133656661346238306633656230353961626635633539336335656232643865223b733a33323a226332623638646431393030373831303862656561646166383634323236623639223b733a33323a226530303966363632656135376664366531623863383331346539383565393965223b733a33323a223031373333356461366231333233613631383266303865366165303032386633223b733a33323a223466636434326532343863613065383263646563313839346263363934373632223b7d733a343a2268617368223b733a36353a2234666364343265323438636130653832636465633138393462633639343736322d3031373333356461366231333233613631383266303865366165303032386633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226437336338356438313430313035356332373030663763313334376466383561223b733a33323a226437383337306536313737633461346433306439323264303734363831343566223b7d733a343a2268617368223b733a36353a2264373833373065363137376334613464333064393232643037343638313435662d6437336338356438313430313035356332373030663763313334376466383561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a353139323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36313a7b733a33323a223935666366636664303062313963303733356565663663316537663431613061223b733a33323a223032663562633039316336643136623265626333633333633231663530633537223b733a33323a226662383235353536636238333162656534316163643733616632343835383236223b733a33323a223031333731346665646163306331353861396639663936363131643434336239223b733a33323a226638613034323934306265613466356635656336396266333131393432383034223b733a33323a223562636230386230306539396636623238363731656332343061303466313131223b733a33323a223566376166306531653731343535343165633366316535643239346636393066223b733a33323a223264306338316165323761656465326461623634623235393833646636643062223b733a33323a223239336233623437323939623838316466363636663664306632653436356231223b733a33323a226563336130653235373435616265376239373634313334393663326138323635223b733a33323a223164303532663834393334653561663232343364303531373163616234383034223b733a33323a226534346138653336343165393666633733613536383232613763333130633865223b733a33323a223461646264623130373132346565313464653638626165346634386562353239223b733a33323a226336656539373630396562373732623833643339313864636437366165383332223b733a33323a226463393065336463303261356337346466376263333131343934393763653339223b733a33323a223633646262653931353432643632376633353935623864643130313230356134223b733a33323a223836303363613331623039363537646665663965306234393636343063666335223b733a33323a223531393966303736326461343038623061313935306636316461653163646265223b733a33323a223133396538626136613563356466633361643630363838373933653165663635223b733a33323a226163306166646261333731666463333132636638306431333936613732363436223b733a33323a226331626230636264343666623139316164623861353962303662333432343137223b733a33323a223438323536353235386166643932333732353835373537386337383166333139223b733a33323a223033323135613734306133373561343666343666386531383435333635383733223b733a33323a223331303863613131373366353266373966326164653239323761616133303466223b733a33323a226262316633343465383937353361313139393734373132616530646563366265223b733a33323a223865626365313164663937616139353235653830356664393865626161343538223b733a33323a226566366161656161313166316166663934333565613264353930363338323136223b733a33323a226134326530363536313166373566346632366538663733326634646261663963223b733a33323a226166643833363166643239353335663664643763373164356666363437323934223b733a33323a226464623962353232633561326665636237663061326238306532333639363038223b733a33323a223066623861623863336532356538363533353730303963666639373830663130223b733a33323a223737623439643938653462386564613238383165646134353337643566396433223b733a33323a226333323865306637333935653633313738353037626639383237343366643131223b733a33323a226266613936616336383939323464316536396436306266336461663964623538223b733a33323a223066336337363031383232646263343434303766393235303362356265303836223b733a33323a223937373233376263643635353834383962383135613830306137663738353138223b733a33323a226535613833653130623933656537376232616430396531373538393431316663223b733a33323a223230313730333065323831326365646566663566343630363865626465663431223b733a33323a223665373361353738383466613838383139643139353431396263343535373962223b733a33323a226262633065383263336231636264653461386237653837373036306133386166223b733a33323a223433373332373639353661653261336630646364313433613033376261383635223b733a33323a226137333363343032663733356435396437653030656262656538656361656635223b733a33323a226665353331356634633933663738333735633561626339396235623566663366223b733a33323a226538396563383262353231323335363636663266316461643361366236306532223b733a33323a223335666438323236313833643235626462313335656131316461393666383266223b733a33323a223466393639646330643539336663316266396532366531646461346531396437223b733a33323a223631323539343136316464306139313931373731616165386239313630303539223b733a33323a223836396464366134383730323564633538616637393066636664303866316430223b733a33323a223966636232306662376435326462646236323661303836623061633863623962223b733a33323a223132363039303236643634386635346166316365333136393137646662636464223b733a33323a223930643934643766653861383563316461633562313334396661303636316333223b733a33323a223839393862356535653530623735336433666565366338306238326561666139223b733a33323a226235386461623739366362653963373364373563353934323639653733346338223b733a33323a223761343139343537623966373934626332356438316230373637393331313330223b733a33323a223966396563663634393366376461646363353734643833313939646662346338223b733a33323a223164636635333638356566326364363233346338356165653431363438616437223b733a33323a226338663661616533623333656164343031353838613238303863633738633830223b733a33323a226266363162663536653335656432666535346363323562313761626137643866223b733a33323a223061353237363333313865646238373137356336326139666437646339333837223b733a33323a223837643233663363646237396233336535333933343865313934613838633333223b733a33323a226233323834633862386235383265376135313765386537333539353831613930223b733a33323a223936383130313034303639623537633537626166363363396462323666363533223b733a33323a226136383166623661663538616266613461363639316132633937653962353635223b733a33323a223534613866373239303761393436373231653438343231613635666562653933223b733a33323a226464306133376361353963393263333035633437623765336537363639656332223b733a33323a223666343030343366633033373939623033633761626535363863646466376634223b733a33323a223334613733643834616638666635326338333735393063303733636362333931223b733a33323a223865663763393531316437633661666365383832313363656162356463653065223b733a33323a223162656333316334306237336338643833633938313063336633636133666162223b733a33323a223939663130313935373436616663333038616463356233376561393931366339223b733a33323a223964346165626635306339336439623732623466656164313238636634346237223b733a33323a223236316661346665343235653664646266306239656336383732633234336234223b733a33323a226131363039373434396336633039346532346538376236303836343132323234223b733a33323a223534323132616137396164633738343033616164376137633533616665373765223b733a33323a223731373332346635333538373031323635363061616465393334633262373364223b733a33323a223461616234656661383332366134326135393130613761386433326330373364223b733a33323a226132306365346366626332393935316664386666616636353865646564323338223b733a33323a226139656336383639646333306361326331376334373436623731643333663932223b733a33323a226630643431643462393639623137346164366330363732653730633538316633223b733a33323a226234383433303062376563383730663865393839326139383832613962643139223b733a33323a226231303636633737636534336638643930356638323532363931313236326631223b733a33323a223763386633316365653432356464303666336262373737326538333338616130223b733a33323a223535386237613863376339343162623832393761336166373230336433636165223b733a33323a226666383236343439373765626332613566666331623733376633326331623430223b733a33323a226339396265643238623235316463643936653062323833373733346161303634223b733a33323a226264393431643838366237646330353365663834386165646631386264383864223b733a33323a226264313861616236323466363039363939653261653234323039393661323337223b733a33323a226366393936323533306232393164366532633734373136396661313734363530223b733a33323a223936646136626665633831666465383232633066363461323737653161303030223b733a33323a223438313739613064356564363230333530336266323834653732313437333132223b733a33323a223066303066613264323036396138326663353436663634656466373830633336223b733a33323a223139396363343163343065613764393930373936393838343338643965333162223b733a33323a223931333361366432323064393131343461616462356263303465326233316137223b733a33323a223231633766393164353637643631626339666138343239326332633163346633223b733a33323a223464383233373031616233613939363931396264306531316364356239616439223b733a33323a223737346436326638666634636536656637346563313139636331396136313864223b733a33323a226366396262623966633333623466636432393533363536623837636339393239223b733a33323a223538313735306664373637323134353662393663333933303465373439646539223b733a33323a223064373964646266366366643961626666653263653738333533346133626236223b733a33323a223263656166303465336363386161623834613966393537313330383731343965223b733a33323a223266336661356434613836396462306634636630303039353365366434323238223b733a33323a226564656531333837323133666232656565656233623865616335366566336561223b733a33323a223463363039306663636664316632643133316231383961626238373465333161223b733a33323a226663396436333634616531383433653163623165653530376166623538663962223b733a33323a223362326665343463346136336465306438643837653039623335633663633862223b733a33323a223266346362346664303736363763386139616266376361386532373863316435223b733a33323a226564643236633464303464346331666132663032633734383831336530393830223b733a33323a223763633235623764386337626561306534353838613663356464616361623061223b733a33323a223562613335353765626331346638316331613337356134343065326566363565223b733a33323a223635363730353061363837616263316337643336366330383964326434326439223b733a33323a223465366263646361353230303761623664343664356463346239336662636563223b733a33323a226637663039633232393035306364626135356230313031313262613161643934223b733a33323a223964376462323435326165356639323537346330326634333635643732353830223b733a33323a223332393935656532343136323935626636326466663066646662653762376361223b733a33323a226236656531316138306564353131313134633437323536383561396366633166223b733a33323a226561636537363966636334663137353235653432643539613739626266353933223b733a33323a223366346262383833316265383733376533623136376536396561623738343864223b733a33323a223435646231316334366631383361623566643361666133383261373364303230223b733a33323a226261643363323338343037663432653433613636326464373132613237313066223b733a33323a226438633466326432353134393461303430373332346539636232313032643262223b733a33323a226233383130303732616165346233663732636236386364623566613264343031223b733a33323a223735326364326132656632616631633731313766313832663631376564623561223b7d733a343a2268617368223b733a36353a2237353263643261326566326166316337313137663138326636313765646235612d6233383130303732616165346233663732636236386364623566613264343031223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605958264);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('u7e7564bo2vmhkuduo7p3lb2mq', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353733333839362e3731383233363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236627630377536626161397571726b7272686a6b35306d6b3531223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353733303735323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353733373439363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353733373439373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353733363535393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353733363433343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353733373330343b7d7d72656469726563745f75726c7c733a32383a22687474703a2f2f6c6f63616c686f73742f6f6d656b612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226138636332306539643962326438313761633530313437306334383337656663223b733a33323a223730353635643333303837666662303465333264363537623963366363666663223b7d733a343a2268617368223b733a36353a2237303536356433333038376666623034653332643635376239633663636666632d6138636332306539643962326438313761633530313437306334383337656663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313539323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a226432356464333638326662636362623733393930303139356662316431643161223b733a33323a223931666230373937393936623736643131373465336437346538313937396435223b733a33323a223232373931376365343334323732363236393330383431663262643762393366223b733a33323a223138633933393933613834316234303435316239663435663131663165643334223b733a33323a226634343334373061313131396532643934313136303038633237643166666238223b733a33323a226666623965306331303232633035623139646336643938353931306633353333223b733a33323a223363356634656433323039353763393363626631336434366534653632636235223b733a33323a223936373466393065343230623438353738313065393337363232633338323537223b733a33323a226337386436636261306563633036396336356534363064653830356638343461223b733a33323a223831623936663964313663626336323166373030353166376565306235303035223b733a33323a223765353737316265636138656436353461663234386463383366363134326630223b733a33323a223936323536313639323766373831373765343634656339666665376262613737223b733a33323a223233333863636336343232356632633532653963613534386266396464616261223b733a33323a223036626564316166393330393433353737323138353162313733313166643132223b733a33323a223533653132306436316632313065363832323539393737303139633830646136223b733a33323a223537316631653862383231373239353435353231363262653662373963343335223b733a33323a223232336632303639663462346639383636356163343039376361646166323766223b733a33323a226166373330376461356331306365366266383162643432633438373638343064223b733a33323a223838643963366266353065353932633735363638633662363534353439303033223b733a33323a223837646666623931343537333731313862613932316666643639353632636464223b733a33323a223861346662336265626138616632613563343638626564313531646461353832223b733a33323a223263653338323465383033326363613264353163353139383036376364613066223b733a33323a223736643839303564626131326664646638626565343863626533326232396666223b733a33323a226264666630663536356264376335373639313335393965373134356233343563223b733a33323a223338323065303763616262663530346133336539376235333865633762333034223b733a33323a226362306437373432656564383065346230396436386137396136663432366233223b733a33323a226335353164333934346538623934316232343039313737393835316232613362223b733a33323a223565656635616364633561366535613462643634623866633738633239323632223b733a33323a223030363637316161383639613462666438653236393832363232626164353635223b733a33323a223833336134383866376431373266323631323662306233396431643764613862223b733a33323a226437303533323231663730373637346361333662393363303932346266353731223b733a33323a226563656636653265333933316361633435353536363432356632363634666563223b7d733a343a2268617368223b733a36353a2265636566366532653339333163616334353535363634323566323636346665632d6437303533323231663730373637346361333662393363303932346266353731223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313433323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226239313835376332383835616431613435376265306536646638363730306364223b733a33323a223864393536363165653139613066643734636530636638666261376231623037223b733a33323a223237653064363264393133353037323063376265633964396262636538623034223b733a33323a223136396234663166633363643237383337663335616264383434643834316262223b733a33323a223666656363333466306635653736633838356165643835313561313731343731223b733a33323a226262343635396165396137623238666136303031386561656463396234333034223b733a33323a223134613932666238616561353337616438653263636437323330303132326231223b733a33323a223366333263666561653331643639666639626363633135613265633831316566223b733a33323a223738373831366535623737396566613636643330313363656536626363343861223b733a33323a223964656433366239333736343463333538646432643764313738383864356630223b733a33323a223663626436643963643862303863636533323966323832613932356665373236223b733a33323a223066613232646237303732623032326236313463303763613262386130643966223b733a33323a223664313762363466646238383334323863316334346135366133633534353439223b733a33323a223164653037393032323132373135366330333764343663626236386130623065223b733a33323a223366303963653330356366636462313562386632633537613933323730313064223b733a33323a226163636637336534633231386565616161303035363864383262633963306132223b733a33323a223633376465663636363433626335383736356338376662643538323666663264223b733a33323a223930653166396330346563373030326538666238313164343636663433363336223b733a33323a226131613133336262386636303735313466363232386133616436383066393566223b733a33323a223865376131643832633530346130633963623736643262353037336561323233223b733a33323a223461376665616461366433666337666564666566656430656163623534613463223b733a33323a223837386338653362383534646333336333633365386562653836653665616332223b733a33323a223430396338643539656264393361656239326533633363346536326539346532223b733a33323a223463333765643330316661363461633635333666643132303631643030623738223b733a33323a223139643733343537326233653966386661656633393065386564393139663761223b733a33323a226161363365653833663266633537626432366436393630633565323436366330223b733a33323a226265656534663561626663333837333361356131386236363236663636313036223b733a33323a226565623065323366643132643462626638373037656431633366356634306233223b7d733a343a2268617368223b733a36353a2265656230653233666431326434626266383730376564316333663566343062332d6265656534663561626663333837333361356131386236363236663636313036223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a226536366165616564343734323536393338643862353337366236626564353835223b733a33323a226564303062363531396663616637613631346261643165313035663061656533223b733a33323a223130393162646438323962323761376438356666393333333439666163663663223b733a33323a223061643061326165343931373831326331313432333862626362396662326466223b733a33323a223963333366333466356231366662663732643533386639346166323732343934223b733a33323a223834323238613938366138306139663633343434383936373262376536363733223b733a33323a223761363262343166646164363334666636323332373839653465313331393731223b733a33323a226139346331313738363034633163303461636364393030323832623636303037223b733a33323a223134306364343033623564303537313031346239393939353639316230333266223b733a33323a223562303365663434306439613337383234323965303763383530643737373364223b733a33323a226232623639316137316436353061643438336665363164613638363335356163223b733a33323a223739313636373062313461666537343130353563323632646664663839646135223b733a33323a223931343939373438373461633731373663646366366336636430613031366265223b733a33323a223630623930333030313337393134396431653133623332353332633032373764223b733a33323a223735393662323935653138373233303366383431633633643433363562633630223b733a33323a223837343164373030616561663037303066316665306435663137336466383764223b733a33323a223735613163656566333939373165316264386537366232396438313239313864223b733a33323a223237333539333731613762626531313565376634633065353163336230383736223b733a33323a223562643231306433343039613661646364306564346666616131646334613561223b733a33323a223830646538356238613266323730336533323638326665663265323632353565223b733a33323a223638353961656462663335393765643938353362363938323931663739313761223b733a33323a223130663838383966386438663964306162356662306432323135333831383939223b733a33323a223963373632383531633863393534613862616633653532386565326636366662223b733a33323a226139303738663937316133636635306133313461643666613263336666313163223b733a33323a226663656332346132353061333831633762616466376465386534343535353938223b733a33323a223234613062393438383663393637353139643139653866333337393633336235223b733a33323a226637313035623463643064646237336332306566666135383735643363383865223b733a33323a223433626634623463376330343336666532343538386264326462363734633162223b733a33323a226363333463623831376666623137643737316533666139306463646433303765223b733a33323a223439313863383537333432363433626632383239623435336139393931376637223b7d733a343a2268617368223b733a36353a2234393138633835373334323634336266323832396234353361393939313766372d6363333463623831376666623137643737316533666139306463646433303765223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226431393665653063616666653430393838643139623561623762666463346139223b733a33323a226138646336373263643738353033333033626634653264616439646264356466223b7d733a343a2268617368223b733a36353a2261386463363732636437383530333330336266346532646164396462643564662d6431393665653063616666653430393838643139623561623762666463346139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226239343331626564303964616665663066316436623231303861616265343964223b733a33323a226530373536356265633133396439343439376636393132643562656466363035223b7d733a343a2268617368223b733a36353a2265303735363562656331333964393434393766363931326435626564663630352d6239343331626564303964616665663066316436623231303861616265343964223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605733897);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"cheikht2011@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"omk\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Berlin\"'),
('version', '\"3.0.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'cheikht2011@gmail.com', 'Cheikh Tidiane DIEDHIOU', '2020-11-16 21:33:19', '2020-11-16 21:33:19', '$2y$10$lkNoaiQ6ld9LMQ9b5.Mzme55iHIYefrhr/8xEm2XEs1Mup8mgi08S', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(2, 2, 1, NULL, 'literal', '', 'Boulogne', NULL, 1),
(3, 2, 209, NULL, 'literal', '', '30 rue Resth', NULL, 1),
(5, 2, 210, NULL, 'literal', '', '92100', NULL, 1),
(7, 2, 211, NULL, 'literal', '', 'Boulogne-Billancourt', NULL, 1),
(9, 3, 1, NULL, 'literal', '', 'Garibaldi', NULL, 1),
(10, 3, 209, NULL, 'literal', '', '36 boulevard garibaldi', NULL, 1),
(11, 3, 210, NULL, 'literal', '', '75015', NULL, 1),
(12, 3, 211, NULL, 'literal', '', 'Paris', NULL, 1),
(13, 4, 1, NULL, 'literal', '', 'Courbevoie', NULL, 1),
(14, 4, 209, NULL, 'literal', '', '16 rue Thiem', NULL, 1),
(15, 4, 210, NULL, 'literal', '', '92400', NULL, 1),
(16, 4, 211, NULL, 'literal', '', 'Courbevoie', NULL, 1),
(17, 5, 1, NULL, 'literal', '', 'Carnot', NULL, 1),
(18, 5, 209, NULL, 'literal', '', '10 rue Carnot', NULL, 1),
(19, 5, 210, NULL, 'literal', '', '95300', NULL, 1),
(20, 5, 211, NULL, 'literal', '', 'Pontoise', NULL, 1),
(21, 6, 1, NULL, 'literal', '', 'Cergy Préfecture', NULL, 1),
(22, 6, 209, NULL, 'literal', '', '3 rue Lebon', NULL, 1),
(23, 6, 210, NULL, 'literal', '', '95000', NULL, 1),
(24, 6, 211, NULL, 'literal', '', 'Cergy', NULL, 1),
(25, 7, 1, NULL, 'literal', '', 'Bordeaux', NULL, 1),
(26, 7, 209, NULL, 'literal', '', '29 rue Magenta', NULL, 1),
(27, 7, 210, NULL, 'literal', '', '33000', NULL, 1),
(28, 7, 211, NULL, 'literal', '', 'Bordeaux', NULL, 1),
(29, 8, 1, NULL, 'literal', '', 'Ressources Humaines', NULL, 1),
(30, 8, 4, NULL, 'literal', '', 'La mission principale de ce service est de gérer les compétences du personnel. Il peut donc proposer des formations appropriées pour optimiser l’efficacité des employés au point de garantir l’épanouissement de la firme. Il contribue aussi au recrutement et au licenciement de l’équipe. Parmi ses tâches figure également le dialogue avec le syndicat. Le but d’un tel entretien est souvent l’amélioration des conditions de travail dans la société.', NULL, 1),
(31, 8, 208, 7, 'resource', NULL, NULL, NULL, 1),
(32, 9, 1, NULL, 'literal', '', 'Finances', NULL, 1),
(33, 9, 4, NULL, 'literal', '', 'La fonction principale de ce département est d’équilibrer l’état financier de la société. C’est pourquoi il contribue pleinement à la détermination du prix de vente d’un produit. Il s’occupe des tâches liées avec la banque. Concrètement, il entre en scène pendant la demande ou le remboursement d’un emprunt. Par ailleurs, il veille à payer les différentes charges de l’entreprise : loyer, facture d’électricité, salaires des personnels…', NULL, 1),
(34, 9, 208, 6, 'resource', NULL, NULL, NULL, 1),
(35, 10, 1, NULL, 'literal', '', 'Commercial', NULL, 1),
(36, 10, 4, NULL, 'literal', '', 'Il vise à garantir la vente des produits et des prestations à la disposition de la compagnie. Pour y parvenir, l’équipe réalise plusieurs tâches. Dans la liste, on peut citer la rédaction des réponses aux appels d’offres des clients, la prospection, le traitement des contrats en cours… Son objectif principal est de générer l’argent nécessaire pour subvenir aux besoins de l’entreprise : rémunération des salariés, factures des fournisseurs, etc.', NULL, 1),
(37, 10, 208, 5, 'resource', NULL, NULL, NULL, 1),
(38, 11, 1, NULL, 'literal', '', 'Marketing', NULL, 1),
(39, 11, 4, NULL, 'literal', '', 'Le rôle principal de ce service est de créer les besoins chez les potentiels clients. Les membres ont donc comme attribut d’analyser attentivement le marché. Ils doivent être capables de définir les produits qui attirent les cibles. Une fois l’étude terminée, ils rédigent une offre adaptée aux attentes des consommateurs. Notez que l’équipe en question évalue aussi les stratégies des concurrents en termes de marketing. Cette initiative permet de proposer la formule la plus attrayante sur le commerce.', NULL, 1),
(40, 11, 208, 4, 'resource', NULL, NULL, NULL, 1),
(41, 12, 1, NULL, 'literal', '', 'Juridique', NULL, 1),
(42, 12, 4, NULL, 'literal', '', 'L’équipe de ce département doit être au courant des différentes lois qui régissent le domaine de l’entreprise. Elle est susceptible de rédiger un contrat en conformité avec les règlements en vigueur. Elle a également pour mission de trouver une solution aux divers litiges en rapport avec les salariées, les clients, les fournisseurs…', NULL, 1),
(43, 12, 208, 3, 'resource', NULL, NULL, NULL, 1),
(44, 13, 1, NULL, 'literal', '', 'Systèmes  d\'information', NULL, 1),
(45, 13, 4, NULL, 'literal', '', 'Le service des systèmes d\'information, ou service informatique, est le service en charge du parc informatique d\'une entreprise. Les personnes y travaillant ont pour rôle la configuration du serveur, veiller à la sécurité du réseau et des données, la maintenance des postes informatiques et l\'installation des logiciels et mises à jour.', NULL, 1),
(46, 13, 208, 2, 'resource', NULL, NULL, NULL, 1),
(47, 14, 1, NULL, 'literal', '', 'Football', NULL, 1),
(48, 14, 4, NULL, 'literal', '', 'Le football est un sport collectif joué entre deux équipes de onze joueurs (un gardien et dix joueurs de champ) avec un ballon sphérique. Appelé « soccer » en Amérique du Nord, il est pratiqué par 250 millions de joueurs dans plus de 200 pays, ce qui en fait le sport le plus populaire au monde.', NULL, 1),
(49, 15, 1, NULL, 'literal', '', 'Musique', NULL, 1),
(50, 15, 4, NULL, 'literal', '', 'est l\'art de combiner les sons d\'une manière agréable à l\'oreille, disait-on volontiers autrefois. Sans doute mais qui a jamais pu soutenir qu\'elle dût borner là son ambition? Qui se flattera d\'ailleurs de déterminer ce qui est vraiment agréable à l\'oreille? Certaines combinaisons sonores, certains timbres, certains accords qui, considérés isolement, produiraient sur nos sens une impression dure et fâcheuse, ne sont-ils pas employés, avec avantage, en maints endroits d\'oeuvres jugées admirables? Dira-t-on plutôt que c\'est l\'art d\'émouvoir par des combinaisons de sons? Cette définition ne sera pas plus complète et, comme l\'autre, ne présente qu\'un des divers cités par où il convient d\'envisager la question.', NULL, 1),
(51, 16, 1, NULL, 'literal', '', 'Rallye', NULL, 1),
(52, 16, 4, NULL, 'literal', '', 'Compétition où les concurrents (généralement en voiture) doivent rallier un lieu après avoir satisfait à plusieurs épreuves (consistant notamment à répondre à diverses questions qui les guident). Course automobile comportant des épreuves chronométrées sur routes fermées.', NULL, 1),
(53, 17, 1, NULL, 'literal', '', 'Jardinage', NULL, 1),
(54, 17, 4, NULL, 'literal', '', 'Jardinage désigne l\'art de cultiver les jardins, de les entretenir, de les arranger, de les orner. Exemple : Depuis que je suis à la retraite, le jardinage est devenu mon passe-temps favori. C\'est bon pour mon jardin et c\'est bon pour mon moral.', NULL, 1),
(55, 18, 1, NULL, 'literal', '', 'Cyclisme', NULL, 1),
(56, 18, 4, NULL, 'literal', '', 'Le cyclisme est l\'ensemble des activités pratiquées à bicyclette. Il recouvre plusieurs catégories allant de la conduite quotidienne permettant de se déplacer, jusqu\'aux compétitions internationales comme les grandes courses, en passant par les activités de randonnées ou de loisirs.', NULL, 1),
(57, 19, 1, NULL, 'literal', '', 'Surf', NULL, 1),
(58, 19, 4, NULL, 'literal', '', 'Le surf est un sport qui consiste à glisser sur les vagues.\nLe surf renforce les muscles et donc affine et tonifie la silhouette. En plus de muscler le corps, le surf est également une très bonne alternative pour évacuer le stress car après un effort physique on sécrète des endorphines qui procurent une sensation de bien-être.', NULL, 1),
(59, 20, 1, NULL, 'literal', '', 'Collection loisirs 1', NULL, 1),
(60, 20, 4, NULL, 'literal', '', 'Collection loisirs pour Hichem', NULL, 1),
(61, 21, 1, NULL, 'literal', '', 'Collection loisirs 2', NULL, 1),
(62, 21, 4, NULL, 'literal', '', 'Collection loisirs pour Tidiane', NULL, 1),
(63, 22, 1, NULL, 'literal', '', 'Collection loisirs 3', NULL, 1),
(64, 22, 4, NULL, 'literal', '', 'Collection loisirs pour Steve', NULL, 1),
(65, 23, 1, NULL, 'literal', '', 'Collection loisirs 4', NULL, 1),
(66, 23, 4, NULL, 'literal', '', 'Collection loisirs pour Sarah', NULL, 1),
(67, 24, 1, NULL, 'literal', '', 'Collection loisirs 5', NULL, 1),
(68, 24, 4, NULL, 'literal', '', 'Collection loisirs pour Mathias', NULL, 1),
(69, 25, 1, NULL, 'literal', '', 'Collection loisirs 6', NULL, 1),
(70, 25, 4, NULL, 'literal', '', 'Collection loisirs Corentin', NULL, 1),
(71, 26, 200, NULL, 'literal', '', 'hichem', NULL, 1),
(72, 26, 201, NULL, 'literal', '', 'hichem', NULL, 1),
(73, 26, 202, NULL, 'literal', '', 'ADMINISTRATEUR', NULL, 1),
(74, 26, 203, NULL, 'literal', '', 'ACTIF', NULL, 1),
(75, 26, 206, 20, 'resource', NULL, NULL, NULL, 1),
(76, 27, 200, NULL, 'literal', '', 'tidiane', NULL, 1),
(77, 27, 201, NULL, 'literal', '', 'tidiane', NULL, 1),
(78, 27, 202, NULL, 'literal', '', 'ADMINISTRATEUR', NULL, 1),
(79, 27, 203, NULL, 'literal', '', 'ACTIF', NULL, 1),
(80, 27, 206, 21, 'resource', NULL, NULL, NULL, 1),
(81, 28, 200, NULL, 'literal', '', 'steve', NULL, 1),
(82, 28, 201, NULL, 'literal', '', 'steve', NULL, 1),
(83, 28, 202, NULL, 'literal', '', 'ANIMATEUR', NULL, 1),
(84, 28, 203, NULL, 'literal', '', 'ACTIF', NULL, 1),
(85, 28, 206, 22, 'resource', NULL, NULL, NULL, 1),
(86, 29, 200, NULL, 'literal', '', 'sarah', NULL, 1),
(87, 29, 201, NULL, 'literal', '', 'sarah', NULL, 1),
(88, 29, 202, NULL, 'literal', '', 'ANIMATEUR', NULL, 1),
(89, 29, 203, NULL, 'literal', '', 'INACTIF', NULL, 1),
(90, 29, 206, 23, 'resource', NULL, NULL, NULL, 1),
(91, 30, 200, NULL, 'literal', '', 'mathias', NULL, 1),
(92, 30, 201, NULL, 'literal', '', 'mathias', NULL, 1),
(93, 30, 202, NULL, 'literal', '', 'ADMINISTRATEUR', NULL, 1),
(94, 30, 203, NULL, 'literal', '', 'ACTIF', NULL, 1),
(95, 30, 206, 24, 'resource', NULL, NULL, NULL, 1),
(96, 31, 200, NULL, 'literal', '', 'corentin', NULL, 1),
(97, 31, 201, NULL, 'literal', '', 'corentin', NULL, 1),
(98, 31, 202, NULL, 'literal', '', 'ANIMATEUR', NULL, 1),
(99, 31, 203, NULL, 'literal', '', 'INACTIF', NULL, 1),
(100, 31, 206, 25, 'resource', NULL, NULL, NULL, 1),
(101, 32, 10, NULL, 'literal', '', 'EMP_001', NULL, 1),
(102, 32, 139, NULL, 'literal', '', 'Hichem', NULL, 1),
(103, 32, 140, NULL, 'literal', '', 'BEN AMEUR', NULL, 1),
(104, 32, 204, NULL, 'literal', '', 'Directeur SI', NULL, 1),
(105, 32, 4, NULL, 'literal', '', 'Description Hichem', NULL, 1),
(106, 32, 146, NULL, 'literal', '', '0658965824', NULL, 1),
(107, 32, 123, NULL, 'literal', '', 'hichem@gmail.com', NULL, 1),
(108, 32, 7, NULL, 'literal', '', '25/09/2019', NULL, 1),
(109, 32, 205, 26, 'resource', NULL, NULL, NULL, 1),
(110, 32, 207, 13, 'resource', NULL, NULL, NULL, 1),
(111, 31, 1, NULL, 'literal', '', 'Compte de Corentin', NULL, 1),
(112, 30, 1, NULL, 'literal', '', 'Compte de Mathias', NULL, 1),
(113, 29, 1, NULL, 'literal', '', 'Compte de Sarah', NULL, 1),
(114, 28, 1, NULL, 'literal', '', 'Compte de Steve', NULL, 1),
(115, 27, 1, NULL, 'literal', '', 'Compte de Tidiane', NULL, 1),
(116, 26, 1, NULL, 'literal', '', 'Compte de Hichem', NULL, 1),
(117, 32, 1, NULL, 'literal', '', 'Porfil employé de Hichem', NULL, 1),
(118, 33, 10, NULL, 'literal', '', 'EMP_002', NULL, 1),
(119, 33, 139, NULL, 'literal', '', 'Cheikh Tidiane', NULL, 1),
(120, 33, 140, NULL, 'literal', '', 'DIEDHIOU', NULL, 1),
(121, 33, 204, NULL, 'literal', '', 'Assistant Juridique', NULL, 1),
(122, 33, 4, NULL, 'literal', '', 'Description Tidiane', NULL, 1),
(123, 33, 146, NULL, 'literal', '', '0678695284', NULL, 1),
(124, 33, 123, NULL, 'literal', '', 'tidiane@gmail.com', NULL, 1),
(125, 33, 7, NULL, 'literal', '', '14/08/2010', NULL, 1),
(126, 33, 205, 27, 'resource', NULL, NULL, NULL, 1),
(127, 33, 207, 12, 'resource', NULL, NULL, NULL, 1),
(128, 33, 1, NULL, 'literal', '', 'Profil employé de Tidiane', NULL, 1),
(129, 34, 10, NULL, 'literal', '', 'EMP_003', NULL, 1),
(130, 34, 139, NULL, 'literal', '', 'Steve', NULL, 1),
(131, 34, 140, NULL, 'literal', '', 'DJANGO', NULL, 1),
(132, 34, 204, NULL, 'literal', '', 'Chargé marketing', NULL, 1),
(133, 34, 4, NULL, 'literal', '', 'Description Steve', NULL, 1),
(134, 34, 146, NULL, 'literal', '', '0680469512', NULL, 1),
(135, 34, 123, NULL, 'literal', '', 'steve@gmail.com', NULL, 1),
(136, 34, 7, NULL, 'literal', '', '20/05/2020', NULL, 1),
(137, 34, 205, 28, 'resource', NULL, NULL, NULL, 1),
(138, 34, 207, 11, 'resource', NULL, NULL, NULL, 1),
(139, 34, 1, NULL, 'literal', '', 'Profil employé de Steve', NULL, 1),
(140, 35, 10, NULL, 'literal', '', 'EMP_004', NULL, 1),
(141, 35, 139, NULL, 'literal', '', 'SARAH', NULL, 1),
(142, 35, 140, NULL, 'literal', '', 'DJENGOU', NULL, 1),
(143, 35, 204, NULL, 'literal', '', 'Directrice des finances', NULL, 1),
(144, 35, 4, NULL, 'literal', '', 'Description de Sarah', NULL, 1),
(145, 35, 146, NULL, 'literal', '', '0705856598', NULL, 1),
(146, 35, 123, NULL, 'literal', '', 'sarah@gmail.com', NULL, 1),
(147, 35, 7, NULL, 'literal', '', '12/05/2018', NULL, 1),
(148, 35, 205, 29, 'resource', NULL, NULL, NULL, 1),
(149, 35, 207, 9, 'resource', NULL, NULL, NULL, 1),
(150, 35, 1, NULL, 'literal', '', 'Profil employé de Sarah', NULL, 1),
(151, 36, 10, NULL, 'literal', '', 'EMP_005', NULL, 1),
(152, 36, 139, NULL, 'literal', '', 'Mathias', NULL, 1),
(153, 36, 140, NULL, 'literal', '', 'GOURIOT', NULL, 1),
(154, 36, 204, NULL, 'literal', '', 'Directeur des Ressources Humaines', NULL, 1),
(155, 36, 4, NULL, 'literal', '', 'Description de Mathias', NULL, 1),
(156, 36, 146, NULL, 'literal', '', '0682565896', NULL, 1),
(157, 36, 123, NULL, 'literal', '', 'mathias@gmail.com', NULL, 1),
(158, 36, 7, NULL, 'literal', '', '25/05/2015', NULL, 1),
(159, 36, 205, 30, 'resource', NULL, NULL, NULL, 1),
(160, 36, 207, 8, 'resource', NULL, NULL, NULL, 1),
(161, 36, 1, NULL, 'literal', '', 'Profil employé de Mathias', NULL, 1),
(162, 37, 10, NULL, 'literal', '', 'EMP_006', NULL, 1),
(163, 37, 139, NULL, 'literal', '', 'Corentin', NULL, 1),
(164, 37, 140, NULL, 'literal', '', 'MORGAN', NULL, 1),
(165, 37, 204, NULL, 'literal', '', 'Commercial', NULL, 1),
(166, 37, 4, NULL, 'literal', '', 'Description de Corentin', NULL, 1),
(167, 37, 146, NULL, 'literal', '', '0658985424', NULL, 1),
(168, 37, 123, NULL, 'literal', '', 'corentin@gmail.com', NULL, 1),
(169, 37, 7, NULL, 'literal', '', '12/04/2020', NULL, 1),
(170, 37, 205, 31, 'resource', NULL, NULL, NULL, 1),
(171, 37, 207, 10, 'resource', NULL, NULL, NULL, 1),
(172, 37, 1, NULL, 'literal', '', 'Profil employé  de Corentin', NULL, 1),
(173, 38, 1, NULL, 'literal', '', 'Liste des employés', NULL, 1),
(174, 39, 1, NULL, 'literal', '', 'Liste des services', NULL, 1),
(175, 40, 1, NULL, 'literal', '', 'Liste des centres d\'intérêt', NULL, 1),
(176, 41, 1, NULL, 'literal', '', 'Liste des sites', NULL, 1),
(177, 42, 1, NULL, 'literal', '', 'Liste des comptes', NULL, 1),
(178, 43, 1, NULL, 'literal', '', 'Liste des sites à Paris', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(8, 1, 'https://github.com/Hichem-ben-ameur/Groupe-5-trombinoscope/blob/main/bdd/voc.tll', 'account', 'Trombinoscope Entreprise', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
