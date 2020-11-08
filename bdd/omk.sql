-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 08 nov. 2020 à 21:37
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka`
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

--
-- Déchargement des données de la table `asset`
--

INSERT INTO `asset` (`id`, `owner_id`, `name`, `media_type`, `storage_id`, `extension`) VALUES
(1, 1, 'bdd.png', 'image/png', '585fd44355480aa5e58cade7f48b624646da0134', 'png');

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
(10, 'item_sets', 1, 1, 'Employe', 'ubgg\nEmploye'),
(12, 'items', 1, 1, NULL, '');

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
(12);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(10, 0);

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(12, 1);

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
(188, 1, 12, 'mission', 'αποστολή', NULL),
(189, 1, 13, 'city', 'ville', NULL),
(190, 1, 14, 'postalCode', 'code postal', 'A postal code (known in various countries as a post code, postcode, or ZIP code) is a series of letters and/or digits appended to a postal address for the purpose of sorting mail.'),
(191, 1, 15, 'address', 'adresse', 'Address of something as literal. Usually Building, but we also use it for the address of a Region\'s or Settlement\'s government'),
(192, 1, 18, 'pseudonym', 'Pseudonym', NULL),
(193, 1, 21, 'url', 'url', NULL);

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
(10, 1, 94, 5, NULL, 'Employe', 1, '2020-11-08 19:29:41', '2020-11-08 19:30:23', 'Omeka\\Entity\\ItemSet'),
(12, 1, 101, 5, NULL, NULL, 1, '2020-11-08 20:33:03', '2020-11-08 20:33:03', 'Omeka\\Entity\\Item');

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
(114, 1, 19, 'Pass', 'Pass', 'the class of outcomes to denote passing a test');

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
(5, 1, 101, NULL, NULL, 'Employe'),
(6, 1, 28, NULL, NULL, 'Service'),
(7, 1, 91, NULL, NULL, 'site'),
(8, 1, 102, NULL, NULL, 'Compte'),
(9, 1, 27, NULL, NULL, 'centre_interet'),
(10, 1, 26, NULL, NULL, 'Media');

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
(29, 5, 144, NULL, NULL, 1, NULL, 0, 0),
(30, 5, 139, NULL, NULL, 2, NULL, 0, 0),
(31, 5, 4, NULL, NULL, 3, NULL, 0, 0),
(32, 5, 146, NULL, NULL, 4, NULL, 0, 0),
(33, 5, 123, NULL, NULL, 5, NULL, 0, 0),
(34, 5, 43, NULL, NULL, 6, NULL, 0, 0),
(35, 6, 138, NULL, NULL, 1, NULL, 0, 0),
(36, 6, 188, NULL, NULL, 2, NULL, 0, 0),
(37, 7, 138, NULL, NULL, 1, NULL, 0, 0),
(38, 7, 189, NULL, NULL, 2, NULL, 0, 0),
(39, 7, 190, NULL, NULL, 3, NULL, 0, 0),
(40, 7, 191, NULL, NULL, 4, NULL, 0, 0),
(41, 8, 8, NULL, NULL, 1, NULL, 0, 0),
(42, 8, 184, NULL, NULL, 2, NULL, 0, 0),
(43, 8, 192, NULL, NULL, 3, NULL, 0, 0),
(44, 8, 98, NULL, NULL, 4, NULL, 0, 0),
(45, 9, 10, NULL, NULL, 1, NULL, 0, 0),
(46, 9, 1, NULL, NULL, 2, NULL, 0, 0),
(47, 9, 192, NULL, NULL, 3, NULL, 0, 0),
(50, 10, 193, NULL, NULL, 1, NULL, 0, 0),
(51, 10, 192, NULL, NULL, 2, NULL, 0, 0),
(52, 5, 192, NULL, NULL, 7, NULL, 0, 0),
(53, 5, 188, NULL, NULL, 8, NULL, 0, 0);

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
('arlga7o90lfhk47igk6ok9vdig', 0x5f5f4c616d696e61737c613a31313a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343836373737342e3535353338393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235686739676f3731666e316f396e31336c6a646e66626f716961223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343835393439353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630343837313231383b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343836363737323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343837303836393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343837313336363b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343836363036343b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343836313936313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343837313336363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343836393530363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223061653032613865336666646133306634666231313466326465383232643438223b733a33323a226666613762373932343661616466323266343864636231323935663430326639223b7d733a343a2268617368223b733a36353a2266666137623739323436616164663232663438646362313239356634303266392d3061653032613865336666646133306634666231313466326465383232643438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343935323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35383a7b733a33323a226363306537646633623262633135373735303638363364643936613331326437223b733a33323a223834343262333166333737313461303333313732663834303863633162346237223b733a33323a226534373661363231616532323361376264656539306333623235396166373161223b733a33323a223930613162646437303964653333303433333533323532653162626130373231223b733a33323a223266346139653663343366643235643836643930653363306437643864646366223b733a33323a223634613465373335323332653438613563353463643466343830663938653835223b733a33323a223230613134336430373663333532373036653233363034363934333534333063223b733a33323a223436333962373835666264376630383635323431633532373066663637313730223b733a33323a226537633034616537326639323063653361623366396338646261646166336463223b733a33323a226165316437626364356632353763653763656363346261353936343732326535223b733a33323a223565343263633761663863316636666434396533633837346430613339383837223b733a33323a223332613932303731353738303164326361313939316366363464613566343461223b733a33323a223434353437616562393531393661366465393730336465656266646535326236223b733a33323a223865646365373730633765353735326362656663323663663265316463366430223b733a33323a223666313136386666373937656339626234336562333933653831303732373131223b733a33323a223066363239613163626666633739646664353237643265343362663138313464223b733a33323a226363343737323737363033313966653465393664316538333163373533666438223b733a33323a223937656636666631373231393630373332353264336334303135346237363365223b733a33323a223366376633343365376232643635303238313166623435336434373830616631223b733a33323a226635626335373230326432663635373337643531343335343734666136346139223b733a33323a226231343762616134313333633538626566353138383364613334366665336133223b733a33323a223534343837393634626562643838613362393634303031333931323331636636223b733a33323a226262663432633630356161303637353830323234323663343732636138613331223b733a33323a226238346365326236633164356430643061666564653461663461643438303038223b733a33323a223365396365363964323362393164323666353164383433643930383437616338223b733a33323a223964623035653364346162343838623462626237653239653432623238303937223b733a33323a226336646662313466653132343638343161653037323561323937383164323933223b733a33323a223435366662663531613139366135626532356533633439336461306335633663223b733a33323a223838633664366331656263316261643136393866356236356634326661323261223b733a33323a226631393130366430333231366433373036326265623938356431383265383131223b733a33323a223933323935333535623331363262653736333536396331356464633031663333223b733a33323a223531376535663933396263643731396366336530326233386638326338356162223b733a33323a226439613566376136323936333237373839316638666433356163626631623537223b733a33323a223439393134316161643763326237636439316234336563333838643334346439223b733a33323a226531393263656534613465626439393736623366373961646365623231306464223b733a33323a223762326531616633653962333533623361643866613733666333383763356663223b733a33323a226265623338313732386565636566393738663264363438613232303833356263223b733a33323a223032646465623236366133336161653461313962346630643736623163373762223b733a33323a223734313533323266376465616361613533666139323966376234626364303764223b733a33323a226631353862333233363835663161303561663833613730353264343861393731223b733a33323a223936613965626165336633303663316435336239336130383730623166336138223b733a33323a223535386538303338393765366562656461393135316337303837313632616363223b733a33323a223636383734326265326165616165346266376434326430326131333736326132223b733a33323a226231656266393162373864343831363931373834633233623762396264363265223b733a33323a223735313834663032396262326433353538643433336462653264393733393764223b733a33323a223464626165393239373632663635366633356237626264303830666632366231223b733a33323a226137366439323766396166396232663735633164333233633031663232643261223b733a33323a223830313830386336336339336135633739373334646264643731666137643233223b733a33323a226566313364623232393362326134356534366137316362363165323564343830223b733a33323a223935643634633732396238613764336333653938356234616632626330346230223b733a33323a223462656233353833333837393235306466303661313430613063326539643930223b733a33323a223533393330656530666138346532393631383531333766333564633336633434223b733a33323a223061333464623530353565346139366364663264623833333430363435366361223b733a33323a223635643131306432363966376134373439323663643366386464653465373433223b733a33323a226133643430333632343565306430303136323563666462653763346163353561223b733a33323a223638343063616637666565633039663634313539373834663561373765613037223b733a33323a223438356638653333643536353265306138356135643133383938663534313138223b733a33323a223732613333363662393034363762393932333833343864636666376131363066223b733a33323a226237613563373233383637373035373638333135376239343765383061363663223b733a33323a226237336234313438636330386264643561623330356632323535613561663034223b733a33323a223862353639626132373730396265616438613666626661323164616661326239223b733a33323a223738623366613030393761323662363231393438643732613262383266653061223b733a33323a223134643936383438363261373562663163353432343064633739393436373439223b733a33323a226266613263376366616337623664303134333565636465653265626664633865223b733a33323a226466653330643136343565366631396435633634306665666339356166386135223b733a33323a226161376433663431363130383866653064346336653463373066663061313338223b733a33323a226531656337363835396364633438316234366236396465383432383462346266223b733a33323a226365323964666635616139313930633430643262666230373966623863623438223b733a33323a226663623866363732353065623034313364653165353935313630643465356163223b733a33323a223361316265376630613033656536316534643964663939633436383065396536223b733a33323a223035306430343634633338393932326561343933363366616233663838316466223b733a33323a223438663033356561663162353761653431316338623935613135373631373933223b733a33323a223537396262656637343163653239343937306434376233373630303965643862223b733a33323a223739303764336331343138373630376434613938616238343636633363633563223b733a33323a223837616561633938356539306236623361663137333435633230303630616436223b733a33323a226562623931336239353731666634346130663330316330343631356430373636223b733a33323a226263313435666636643664643539656665616334623935626131393036333733223b733a33323a226234663434326161653534333164633562353331306430616662666462326338223b733a33323a223865393166646564663037353765343365636564353461643230393364336130223b733a33323a226236356533363439313831356230643239363663623935383634306231306633223b733a33323a226337616133636235626462396438303564623931613234383835316430666564223b733a33323a226561633936653234323637383939646663323739383936643663386630393332223b733a33323a226264303539333561646632303966666533633434666536636239386439643866223b733a33323a223439613532643138393332316562333234623138636162376438626139353762223b733a33323a223237313938386236303830623763343635303233353832353135346433623537223b733a33323a223063373563306264306462393538613264333232336261323938623866323636223b733a33323a226338623163373739383264303330396237663964386330373466336337333631223b733a33323a226163326665613065636363623066383064393838343632613562636138363438223b733a33323a223435376662653866386132653464356234376162323338613364633665653264223b733a33323a226632616234356439636465326334653532353838646332313237656566613631223b733a33323a223531633166373863366232333139383734633835373961353761356662613464223b733a33323a223931626431333437653431616630313833623564336562643239376266643936223b733a33323a223831633238386366373434636166613833363037366433323439366333313238223b733a33323a226639633761613634393936303839663133623061346263336131656464653431223b733a33323a223265363965323461356337353761316164653861636635653863623839386330223b733a33323a223961336664363533663838366262626133613062356261376437383334333432223b733a33323a223561633161386666306632386663663734363633643261616562626334313031223b733a33323a226562376436323431333062656434306163336262353963393037623164633434223b733a33323a226261376263326330666131653135623732616365303034313230386434306334223b733a33323a223062663936373439633732303563316466326462616231376434613363613335223b733a33323a223961353563383034313334306366663039666436376433663834346633663863223b733a33323a223932643363333531346535336165386466393731636535383665646265663262223b733a33323a223537613266646232343234336539316135316566653361313432303332376136223b733a33323a223265383530653263633733373961383263653138326236316637613366303661223b733a33323a223735303462336133323535303166366265363338623830383537363565643935223b733a33323a223063356637656333386464656664393839376166336663373033333261356266223b733a33323a223366363932623134313365666534386633663466333238643333343139363932223b733a33323a226632386233363339313836636462613531333566376638396463646463323435223b733a33323a223636633763376466353537313035386537333231653833633338303239616633223b733a33323a223038616665343938663934666561303232323537363738383665646364643738223b733a33323a223731333361633632313963313035303065336662663836303566326236653138223b733a33323a223165346536633563353161316263396338343531653565353162623766633632223b733a33323a226162646465633632613563386632376535353061646266646365623261653364223b733a33323a226164326333386432646631363931653737386534386536626438333137313762223b733a33323a223635666139616531326232396365343234333435343532356530326633663065223b733a33323a223963656238386233663162303965363964626662663230303861616461366234223b7d733a343a2268617368223b733a36353a2239636562383862336631623039653639646266626632303038616164613662342d3635666139616531326232396365343234333435343532356530326633663065223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223461333064336530336461366637636535336637653230663935373363636336223b733a33323a223735353835333531313337313863363965623661623164636434336536383566223b733a33323a223464373762623937396237613732373739666133326633353863383730303033223b733a33323a223464666364356565626634666537393133393862323931666338343462353063223b733a33323a226631333238383337616562303265656464653738313965333065613532663935223b733a33323a223836343536303466633833393235383634356538393866326133363431636663223b733a33323a226432336631653833363939633832346234613634623733376162636630306433223b733a33323a226136653837336639636236633033643736663034666266633435333464656530223b733a33323a226465313738613934326531343033643236363238346436646636343235623664223b733a33323a223335313163646562363233303537613666313663383033636661366434316134223b7d733a343a2268617368223b733a36353a2233353131636465623632333035376136663136633830336366613664343161342d6465313738613934326531343033643236363238346436646636343235623664223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343331323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35303a7b733a33323a223131363437663433373739323364613163663230653932396663653831336331223b733a33323a223263666565623031343564383965373932303034616565303438653939616230223b733a33323a223936313134633535633138386232393332383738343664316134373566653934223b733a33323a223065353238306365373033393365623763306462623037613333373833313035223b733a33323a223937326539633761613461343836386138396564363762613631386434303933223b733a33323a223938623835306532376163393838343461613330353238386638623633316137223b733a33323a223037636535356333613737336438396435656230616236353935623937316539223b733a33323a226236313734613138653239386135376135353630316534313262343237623237223b733a33323a223965373762613636636265656336376236626163316665633130646165313939223b733a33323a226662616432303839636664313532616435616361633835396563613262363139223b733a33323a223538626236353065383239623039323961623732323564373133623836343962223b733a33323a223030636563663064383466343364316137633762313330316162343565613964223b733a33323a223966366164383336393031616232666366323166313030626137303931323663223b733a33323a223364346532306162366330656265303037386138393534633635623030386432223b733a33323a223161363136656561336364633663323738313361393438633231626166626236223b733a33323a223832633262623561393832356638643037316132663137383131616164336339223b733a33323a223832383934313039613238353236316161666338626561353533303438303936223b733a33323a223261646231616239613135636135303833393831646134343164636361633031223b733a33323a223439336363343031663630363662386634326430303737646361646635336264223b733a33323a223735646562323134353561663031643836343234376136356165306362363166223b733a33323a223635643038323066363234313836333230643865393935663966323535343330223b733a33323a223166623062636539623136636233626364626464343564636239303361393938223b733a33323a223938626366343562336339623062663964373165356133393732646638313739223b733a33323a226536633932633530646239656464323431323665623832633963623432323163223b733a33323a223837636231386462366338343735616539633637336434393565306137313830223b733a33323a223261626339333737623866363633363366366366613631663663313762643136223b733a33323a226462313630366630616564386634313037333166323364636535336630633631223b733a33323a226633663761393634333931623336376139616432303536343433663631303836223b733a33323a226666306634313730376661333538373232326134643436343565393063656638223b733a33323a223963653139633566623666343435636638333264353830346565646430323862223b733a33323a223966653139383763323834313538313239623130663264383632343330316632223b733a33323a226234393930653063316132333938343432633065336164326534663139356539223b733a33323a226365366136343139656363343438323836643631306635386131656661353639223b733a33323a223166313566323665383137633438396239626530636332373964363035366365223b733a33323a223161396630336136346663626632623039383432396161623338633838666361223b733a33323a226430613236383739643237313736383632623230303961336534626431356234223b733a33323a226435643663386132366332346466343165326439306436383764623265663934223b733a33323a223937616364383030663131346435613933626631373465303035366165396133223b733a33323a226336303434333630663439303565353737613635346332626564636430323737223b733a33323a223765366264333439303461306136383239633939393138646138643839376134223b733a33323a226464323935313761643435346464386430353232306562626337373034336562223b733a33323a223032623831383832343335383638623566343962353439393961613135333231223b733a33323a223064663366643533313838353238616535373134613434376639313264376266223b733a33323a226462313563336638356433616563383635306439643238373839666137386563223b733a33323a226663333662393432636237323233333236313734306532633236353461623363223b733a33323a223731353061626563623732666563353038393532366334366531313763636661223b733a33323a226531353838353164663465363561393431653737353533313362623331383232223b733a33323a223164663664316138323031633835303465616463373636613639303139333362223b733a33323a223263643763316563626261663765343664306331313937396237396130393363223b733a33323a223530363234666134336335366130336431373465623164383961373862663535223b733a33323a223831323930623034323035306261613063396461343765363136323664306537223b733a33323a223962626330383661666665643133363961653739626137616239396335333334223b733a33323a223235636438366339366463386462333039346635343961633436626635623466223b733a33323a223737623862343534343938393635393064313436663538653038336463336132223b733a33323a223930613639656261653638663936393264616236343836376236363261666139223b733a33323a223237386133666437393461633435616163326330616638346134643466363962223b733a33323a223038376136313965613966633836353663363730626235313636383065396232223b733a33323a223932356161363439366435323866366135653230636163326562643636323236223b733a33323a223263656630616535363932343234353366656463306330666435343238646164223b733a33323a226136336130306162663861313939323331366336313038613262643363666333223b733a33323a223032346637323366363363373939386431623137326139353738373963636233223b733a33323a223431623862346235313333663062363763363365636139666332383265613038223b733a33323a226432326665376431636463373763383638306264316362356538396132363935223b733a33323a223535373961383035356134393735363530396566656236623433373764663434223b733a33323a223939353035616436353062626235346664366230393838633934366166626138223b733a33323a226630323330316538353565386538343336303962336561613736346239646235223b733a33323a223930643336626539653165623736386431643435306539383638363833643235223b733a33323a223430636434383130653136636463656239643734313636656162636536643237223b733a33323a223831343238386366653737323566643132333763663233646637393030326637223b733a33323a223838613034393533626430613636626534643136616636326536643933636337223b733a33323a226566333165663966363061303965633731343634386366386239643139656131223b733a33323a223633346239313338656133653664303533623332623532303931353531623234223b733a33323a223165623938326166396634316661386134386662383430636432333535313731223b733a33323a223631373132613838386461313237616264313163313333393632393837326534223b733a33323a223161383265653566323762346636346531626338343034373036616339663662223b733a33323a223031383264656133613636316561626164356161303537656664636166373463223b733a33323a223366343935396661393761326362393866633735306530306666306566353435223b733a33323a223833666461393434303038643964363565326433613064376334646661386235223b733a33323a226136313964376631313333336131646630613139336165613765336136656232223b733a33323a223662393866333236646561386132613662636431333362343633393934383163223b733a33323a223939636137373265376236613465383135633866633461333333363032323634223b733a33323a226361613063356465666465653664636363313866366434316432633138663862223b733a33323a226439373162643865393966636533646137653462393431303865656562346535223b733a33323a223463303763646330353230643031326331346331373936356332323339366638223b733a33323a226631346130333338383331643438373865663964343930303766626239326132223b733a33323a223361343335613736343865313733623262393131383832396635396163396130223b733a33323a223933663635373634396464373634363166323532323339303834613865666537223b733a33323a223538306230393566656630623235636433336366363166393432663336396336223b733a33323a223464663134656461376239623361326166356634313561363734393161383663223b733a33323a223936663832636163393566373162623064643239333536646266643633323362223b733a33323a226134303034396439386561353564613037306138376663363761663662313662223b733a33323a226563663432623363646466386137386461613961303264313130383439643135223b733a33323a226230646637643633376265353836303335623339633937383932383563656166223b733a33323a223933346633363533316565613936653539356166663134346133393033306262223b733a33323a223166643535383139626536303932333966633237313435336434376136663035223b733a33323a223335663938386534373836313736383561376236343834343037336235633664223b733a33323a226365653665373638386639316236653863313830316634613338393764373765223b733a33323a226338373534666536333264393535633463646533363363623134393234346536223b733a33323a223162356437353963666531343837653766323462636464313765663463393935223b733a33323a223061303839373361613233373966333763333833363332353832356266303734223b7d733a343a2268617368223b733a36353a2230613038393733616132333739663337633338333633323538323562663037342d3162356437353963666531343837653766323462636464313765663463393935223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a32323535333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3237383a7b733a33323a223164393063643737653462333937336238626134356665313163643064633165223b733a33323a223965656330333162376631613333383532346463393033656365666538336630223b733a33323a223165353737633462626130326338643339643636616331303439313335663537223b733a33323a226664623233636666316665626264373731343434323833313466626130366234223b733a33323a226537386338313465616436393334383137346164333866333933653462383164223b733a33323a223731303166626561383738653264613266323637646364303137343834626237223b733a33323a223437616366323761356430393338626436316332336538313639326532353235223b733a33323a226264623361333337626161373034636332346437313633393738396563623564223b733a33323a226131333064383563323037306635326232323163656633613238383965363135223b733a33323a226430313430346339303832373132373563326639363262666331306238336633223b733a33323a223231303732383435616265643531373738626264653131316436666430626463223b733a33323a223939316362393066353931313239643266303633353937643065376234313836223b733a33323a223664386332656431336239613965623062616566323535336332323761323662223b733a33323a223063336564356238653464623533616535343936383133333937393564636134223b733a33323a226665336265633230313832343434363636353432373963636663386334613134223b733a33323a223731663365346431663662663866343037316631666662663237616165313131223b733a33323a223831363466663032393234363362346265393765326431653136323139653964223b733a33323a226330626630343964353563633731386139323464613033363331656633396265223b733a33323a223661613231643334353230303666376338643565656264303262666264313631223b733a33323a223061366536306439613463346534613335366335336130396339653966303333223b733a33323a223339383461613936316534353761336163313565353038346538616465333038223b733a33323a223737626534383037366636326236653761343738346537613537313533303035223b733a33323a226266623237373237656161353262623138653266383463346162303135376533223b733a33323a223839393930343534643766366661633533613061303939633032333431663939223b733a33323a226461323863373466653965396132663330643334313533326137616239633662223b733a33323a223536333330653562613934653237333935643665646239306130656539656532223b733a33323a226663623632646439363463383364666534366533663237616635653365333761223b733a33323a223862373336663737613365616333303034656230613837323364346231313038223b733a33323a223662303839633463396666383836383637393331643862386166626630636462223b733a33323a223666393138633438623261626363663766386162646163316364613334316633223b733a33323a223335393861623134313837396132383166366164613266646536363636323231223b733a33323a223336623463653661653936316465623636343832313162666535343436613239223b733a33323a226166383132306339623738396234383831343934613735356638396636643139223b733a33323a226661383263386135623031613238316461623637393032343364383936363630223b733a33323a223636633930393639623432613438353232346565333533393661646162363538223b733a33323a226336313735666332626534656330363565316138343166326161353736323765223b733a33323a223435633732323736636539373264366261313862376464306636316665326262223b733a33323a226138613962316462653230306136326232616436316231386531663433643933223b733a33323a226166653539316130353939343164383531376438653263376262653237623534223b733a33323a223136373134303634393337326365626231613039323061353061333034396536223b733a33323a226635626334376665666463323761623034353866373032653238393333656662223b733a33323a223430313831376566633336346663373433653932623065386366373238646238223b733a33323a223230333535363961313465626262356435336434616533333762653832386231223b733a33323a223864653537343166313333363332393239363865326233386335313531383830223b733a33323a223566336232386462626430626630393666656530656266663166663438363232223b733a33323a226133623564306665343732353439333032353964306161656566333364323561223b733a33323a226233326564363663343234626634336430666135646231653338636230623636223b733a33323a226337326134323831353137343566653739613665666437313230643765646332223b733a33323a226238613337383161626230336632636636616135383836623861623639353363223b733a33323a226261363131353231626335353035633339316664656632333664346233353465223b733a33323a226464303661653038333938613037643038326638383334333762633137633832223b733a33323a223966306335613763343836313361393439633336633437303163353765653761223b733a33323a226136643265366165643361643039306361386165316164393233626565653830223b733a33323a223137656131623037323766323163353636623638336336626265333130663630223b733a33323a223561363039376436396363656438363661353839353434613935323665303230223b733a33323a226230316235333238383561303462663663663331363237393938366661363837223b733a33323a223162333338313436616437623064613062643532666431373861306263363864223b733a33323a226130373163663265653436633732366262333264633965376464393039366563223b733a33323a226437623437343030376564376634623938373539323361333233306261363237223b733a33323a223637346536303764623163613239643564343563353939666130333462386131223b733a33323a226636326434343230623262363961303537333430353833653031653835386332223b733a33323a223361366237323463373135363736373663633637316662396236343738346239223b733a33323a223336303732323663346264663534333530636531316231323465663364626163223b733a33323a223333343732333463303930623666376231653131646631643438343732333235223b733a33323a223731356633333034623363613831356635343961613937303963633061613335223b733a33323a226130383165643335643262626366636237326133323634333335333366363831223b733a33323a223135616231363466333938393666336232646539643661343032393563613337223b733a33323a223936313731303565633433393834613338386463656461356331666665383635223b733a33323a226131643132633061643030663337663565626565353162373962653966356362223b733a33323a223336356138343439353236346238353034653366643735396235666131346630223b733a33323a226262366134623333353338356232633436306131613133623766626265363334223b733a33323a223536346230326439376531343836336630393636636365366230653265623965223b733a33323a226262376239623733383636316336343736613234313739386338663336666232223b733a33323a223333386262306239633064326266646165663636656661306233323961663836223b733a33323a226236623064393865396631373437396535323264376632303862333133326264223b733a33323a223237646165343962313862613035666431346362613164353639353630323163223b733a33323a223861663233323062633934643336393931333639633437383733353536303431223b733a33323a223931613538633836636462353963653138323130616334393531366565356561223b733a33323a226261633637623437396334636234373134646139386531313465356563653532223b733a33323a226333366339393732393934643639343062343039306537316232313538373362223b733a33323a223230366238353337363762613865646636383035336464393534353463316233223b733a33323a223566666531323062303836626637623437363335333031633432363637393633223b733a33323a226565303732616561623238356631366231316134616538633736333866326335223b733a33323a223964336535303434646438393931336338646539616161363961623831386530223b733a33323a223632316666353165343838646136643162313434636132653932373962666334223b733a33323a226665643762386235323639656538356135383930323731613363623638393035223b733a33323a223761613033636366353537653438316534326630386537633539646132633938223b733a33323a223466653234613630353962343661383933656534643835383835626463653665223b733a33323a226438383262386138393032356234373965363935343565353434626534646132223b733a33323a223031353063623837323764306236386161323033323861336539613761616138223b733a33323a223933643965303264393330303439636233303032326561613839356537633536223b733a33323a223763343861303732396638376361636535326436613437363839373731646535223b733a33323a226530356234303064333636643164633462353238613734616333336664656430223b733a33323a223562646461383132646463666466376333303538653865633063306664303465223b733a33323a223534383261663036373564333361616462346164373037636161313365373135223b733a33323a223638633739396237303664633336323065303861653562333437626436383636223b733a33323a223464376332633962363938383538613766313364333738666530626337643962223b733a33323a223165613539383637646135313661336265666365393761666162353036663366223b733a33323a223032386262383138356335653030333930343836663430336439373663336236223b733a33323a223739323939366165313131623464656266333532306633623937323366643036223b733a33323a223634616438323132623261333434356162653961356334333333393933623734223b733a33323a223262336663343433336664656430663338646663393134393335363639653366223b733a33323a223031396137346261623931373865356233323863306135663531623730616364223b733a33323a223930653537386533386661353932303864306331313362366138346266636136223b733a33323a223239343037313361393765663233633437633064336432663436396136336664223b733a33323a226666353961363430303830633137626431663936336361373234386231663838223b733a33323a223962303939303964393835356337353363663735396636396162323931326238223b733a33323a223037356463636231613562353038323435323262653461333838313030653132223b733a33323a226561313262666330643364386233643562623961643738323734353432313462223b733a33323a226435336330383461363063306632643863336233616461336637666534626636223b733a33323a226436353831623066313765396132633066376436333034616336396131623034223b733a33323a223231663438643030326162333731656530383735363638343035356232326232223b733a33323a226439666535313837306465613637663039643030633230313566643237626132223b733a33323a223738666138623763363037333362663432653736346133626537343164306563223b733a33323a223231666537333032343866613862313762303965356661643366656366323033223b733a33323a226338663464343430303530353332656431366265663933393032376264663432223b733a33323a223461653031386531313762336338316563396133646261623964643932613864223b733a33323a223763346431616436633337353462616232643430666166353666333831366563223b733a33323a223139383766363631326336666234363065666139376164353539343366633135223b733a33323a226161376564383236363330323833663135343537393635666331363862303736223b733a33323a223366376161363866646661346433363530356238383539636237643036616339223b733a33323a223537343439323962366662306637613665613638326662323436383131326638223b733a33323a223365373230333461326431616137303638626665333232303733633966343139223b733a33323a226139383763373539636261366666653836343336356161616630326233326133223b733a33323a226233623836616565343236326435343531623964633433613162363337393461223b733a33323a226532383833383331383538643461316132656639316163613930313163373338223b733a33323a223533653465393937373736356165626364393866323861363830643436663966223b733a33323a226536636335663530313634633537373332316364373261656331336331366661223b733a33323a226662383430623163656235313462316231383530633838393838383936666633223b733a33323a223762616334333962383338666139373561643832373465353534666365343534223b733a33323a226630633833313964623131353861376462623337623330383335313434303465223b733a33323a226336643935343034663366643936636436373361643662383531666266316634223b733a33323a226630333266376262343335303064313531313331613866363863366461633162223b733a33323a223566353034386335623863626138333633366639373738373563613434323661223b733a33323a223831316365343633323663646632333336363862316437323637636532306563223b733a33323a223566326236373638633739306662636130313963636339656361343739636666223b733a33323a226565616636363535643339616133376439633762623633326537353162343962223b733a33323a223037326434326238366235303163353263396130303263343361313765633030223b733a33323a223337346530393161343066643431616339663465656630393362363233356630223b733a33323a226461303132653038376430613934303335386661643838393365386230346663223b733a33323a223536633233636636643166653530343633363732373663326535643234623436223b733a33323a223462356331323130383866383466663330633037396566363131353335353065223b733a33323a226263376566393561616334626437646139393131393530316134373938353761223b733a33323a223262333338616234333339333931666133623139613731316631666637666233223b733a33323a223962666238313565376535613932346331353230666238366361386138653939223b733a33323a223836306639633861303039633538643330393134303932313232646133623438223b733a33323a226364646232363734393265373666333131313164613738323632333239316465223b733a33323a226238363466316363376236323537653139656234626636626665353161333936223b733a33323a226233396665616238373963323364303638633634313035353836653462316131223b733a33323a226132633336643931646337626335383236643639613338383365393134646132223b733a33323a226434626337366436613364323133363832383135363531666633326262663066223b733a33323a223061326631653530346264356363393761376138306237306366363866323661223b733a33323a226466323564373637643831333234326437346333623235343266383264363838223b733a33323a223037373539343234666630613531373765323935303266353262303438333331223b733a33323a223231353338646638326437363539343462643933613564393932636437643135223b733a33323a223363393535393032366663326331333639303032316337343935356163323239223b733a33323a223738396331333734393236623331386630306132633934633663653331313932223b733a33323a223234363030663061326237356261643932346566303737303737323961343133223b733a33323a223035366330646330346139333366313832393835623831666365316462653730223b733a33323a223439613565333037613466636565386634363333613938633461313464336265223b733a33323a226361353435313638343235306665363738396262643536393863396135386563223b733a33323a226638363832356137386639646566613238623863383135386362663736613238223b733a33323a226434353736333563313035623637623432303232346136393361643266666166223b733a33323a223133633261303231663538353964646636323433353263363033356632623166223b733a33323a226231376339626237353834343334323536633566333462383036663333333432223b733a33323a223362396364336530373933333934353830366636313433653965386166616133223b733a33323a223565613365326265393461666438336362633061346166333661393962653138223b733a33323a223639613463613430353235303762353366363436643735383937393933663736223b733a33323a223934633034323764633464623635383562313932363965633039613737353436223b733a33323a223366626565323239393564373137306636346630343135353866353034376230223b733a33323a223564326437623233653138616135613266653434613830353039626230303165223b733a33323a226330666537643163656563653537633631343435303534323539386631356436223b733a33323a226130613664653736373663373734383935626238376566633631646266623031223b733a33323a226633666562616466393764653766323234636166316334326664643037383234223b733a33323a223661653530353633346563353935346661343238633862643735333630313433223b733a33323a226362343435613434346161353865326164306237373563323563323964643765223b733a33323a223334333236373364626638326430356431323736666438363838396435663565223b733a33323a223938633736346139626431393138323662343736303463643933303863323333223b733a33323a223030306435643334373637313337626431613961353034383732666166323663223b733a33323a223932336135353735393639643132613738343732616635303763356164623334223b733a33323a223566323230623938306665373635356238376262333937656436333432336133223b733a33323a223634373362613032666364313461306563356566653432393337383635396364223b733a33323a223135346366386365373763643136313362323230343335393566343134393133223b733a33323a223065656331653565643765613064666165643336303262633930313433356161223b733a33323a223164373464363162366463633662636137303265663661333666336136633031223b733a33323a223632653339336339356138333036386231663730643337633038353133663363223b733a33323a223339313630383938653539343065636365303065616639353239626365626265223b733a33323a226539626231356232376531356233343764626464623561663537343738393630223b733a33323a223064636531653635643465393339666666653938326563393162333532316166223b733a33323a223936623131633131363834646236313064613432623033346630336638353839223b733a33323a223739643136663030333637363263333861616363383139613337366537323934223b733a33323a226366383533643638343432643838356237353730306162303434376434376336223b733a33323a223764393663633837323238373932616462653661393463363435663366396536223b733a33323a223135613161646332303735636137643937373163366164383336333764626637223b733a33323a223764613932383431393938333530313138346362653364353436623934666331223b733a33323a226166333763653666363061616562316136363661366462373631326138316362223b733a33323a226166333133363062663566336136353635373530393362343031646463656362223b733a33323a223336386536613331333061343761313938663437366230613839663536663965223b733a33323a226162366439323735636136306530643862363431666635366564613266396238223b733a33323a226464613238316338616361363732376266316463366664633665373437653935223b733a33323a226434383431393261323131393732333963393166363034646236396631383336223b733a33323a223864306662623539326538663730393836396437306164393162353231313866223b733a33323a226362336438303866656531333230326232653261623231333239353365643036223b733a33323a226631656363643131616135313066613231353532386636383133626463393562223b733a33323a226335396265326266373962663932666630386238306232623534626366643339223b733a33323a223936396665333362663335313833396139393965653830636436643238376438223b733a33323a223061386337353534303232616261386661366539633564376362616239363531223b733a33323a223861316236633565663830386437326537623762373133396632643532353466223b733a33323a226263313864393732656231363432656135663637356462616637666465646331223b733a33323a223662393431666635646432353961353631663238633132373739313535356365223b733a33323a226433636236353461613866373431623163393936656461316266373365666137223b733a33323a226634366131646535336638356631383437326639333465373836373161326232223b733a33323a223333333433346566343664356433366531376437326434303933323565653364223b733a33323a223039303839663032393738376436353236613364663536343462376136393435223b733a33323a223064393964616231636338383639383134393638653436663936643932666362223b733a33323a223435346331663537633466656238353462343634333535306532333538333535223b733a33323a223565356662323166373963393561613264353338336133366336616230373861223b733a33323a226162323933383166626430336434643737316639353930376138323063343630223b733a33323a223032336261643531626133646330646438613333366335626430633139393164223b733a33323a226631396362313435303635363864303730343237383838376535396566666464223b733a33323a223565303736663830303663333634313438323535383735326566656230636436223b733a33323a223264626161373936613566356661343064653362306263616531383237353466223b733a33323a223965393835323336653265626232356233613634666663633535313665383363223b733a33323a226336613833633135636538306263346562353733356564313031376138643339223b733a33323a223663376566643364353563316462396237366531623734376363306664666661223b733a33323a223634616336356435353839663732656334316163373432613165393965616631223b733a33323a223562363433383261376338633331336432666433386638646535356533383866223b733a33323a226362376265333630636165636536616532326531633339616231346163323533223b733a33323a223363653665623435336230646662376538623365663163326265383834636565223b733a33323a226539643462343765363733646563666232363363343963396366326266316238223b733a33323a223831343934353565343433653132313631326639353633313064383632393438223b733a33323a223930666461633762383861376632343735636364336466653364316436386166223b733a33323a223437613335343731656636326438666438633237623764326564616363613834223b733a33323a223033366632383166336263323131333761386439646331633834363832373135223b733a33323a226230646138653733313231333138393339663932663465363635346635353930223b733a33323a223164613163326365303461353034393030623036313366333036346364633330223b733a33323a223937386131376633383733666434636435623738383666383738383934313637223b733a33323a223537633639616264373530303937303431373366346531326131356364383462223b733a33323a223737616439303339613636393661646437393731646438386337643832373766223b733a33323a223239646138373738316564653730356262373761313632663032623338316537223b733a33323a223239366532363064383566613062666137646133663765383934616161633463223b733a33323a226265643365313831383862396165306138646133353530303130316332333462223b733a33323a223163663061646334326265613662393462366531373732346435393934653365223b733a33323a226638316166353361393637303139626138323734316264376335656366303736223b733a33323a223932613065623266316435616335326234303837323533363536383531613130223b733a33323a223264376331646335343736313664653633383335353334363666326165656230223b733a33323a226437396163376532393664633433393532353735336665363265363164623133223b733a33323a223166356162386161346638323736316138353638383464326236393562393035223b733a33323a226436653330353536383935363130393537336433653738313463373761636163223b733a33323a223931656232613433613935333863383036343866663564393334636139393639223b733a33323a223635396139333662363366643530623164356463656237386563623837323837223b733a33323a223139383731393439363966386239323131663863313730646635633736636638223b733a33323a226537613562626631663865346236303531313539653165333466653663626661223b733a33323a226562326532313939653434656631663635316564613662613763666434376331223b733a33323a226563306130646235646430383763393161663935386365353834636632336265223b733a33323a223266643065616637346631326538643661643166366663313831613937333165223b733a33323a226130346263323330626464343536386539383438303332313961343438663966223b733a33323a223633373064346131353065383733646566636531653534363566636334396662223b733a33323a223963613033666561323136306262366536653630613532323032343337636536223b733a33323a226239663931366337323565313930346237613936333939393066373630373632223b733a33323a223830383336313530313562323637623263303466656661393237313231316133223b733a33323a223465396563626666326137313037346161323564343464376462323932646639223b733a33323a226239306330616663653030323761363662316432636239636132373839333739223b733a33323a223834333235363564623934396530623063353938373938616263663565653230223b733a33323a223532363662333133316465356162333662363633626433383636643761303331223b733a33323a226538356361656334613538663038303666316333303434303939613834363831223b733a33323a223566353130663333323165353137653132326432313162333464393737653266223b733a33323a223765666261396232333461616531373436663436653761623833663833326633223b733a33323a223966643135383637616132386462303761663235633037663061396362326362223b733a33323a223461396162366639393561383764633163656566653762626663626436663230223b733a33323a223165663665633362643462623761343434306561653532303963383730343761223b733a33323a223266626438313130613066356431373936353463313263343733633764336364223b733a33323a223636313966633631383234343535376535633834333338373565353065313032223b733a33323a223964363633333963303161326562326537363237613831393564303062623166223b733a33323a223963396565393135353537383735653832353434326665656434353865363231223b733a33323a223966373637353364623466336363653433623235643666663237353836306365223b733a33323a226337653261636164623162316561316139656438653362326135316366633737223b733a33323a223366386666643837356566383433663661623533386164656237633131316130223b733a33323a223965343937306634376538616166663137616365353138346662326264396563223b733a33323a226563616133393639613131323661386361343862376639353537356263616330223b733a33323a223030373334643235633964333366636236323766316337633232396534653763223b733a33323a223162363963366162376563303734373363383232396563373238383534613434223b733a33323a223235323130323733383333383264373861363262333139633565323862656538223b733a33323a223463383934633462346232366664623831323436326634383665376362316534223b733a33323a223363383830666535653532316335303361306437373264613464663031373939223b733a33323a226637613339643133613562643132313366396636333834623132313835666562223b733a33323a223265323230386235336135306634656363633830373533333339366635633133223b733a33323a223663616365646638396439316436623538633639316133313638643736353737223b733a33323a223439313237393938356639306538626238313930383831343361316330653933223b733a33323a223931363933393931373766326134663065333561306338653530653035376639223b733a33323a223533396433356436333631643039373633653161396132613636643030396431223b733a33323a226465303638653137333333333932373831636430636562653865636132646563223b733a33323a226633396463613561326230346637643862353439373365323663376231353535223b733a33323a226563653839333366356330356362633763356438613832333064373166623235223b733a33323a223535613064376137393566656138336632313833386361623063646536653562223b733a33323a223530303232353738366662643862663636646163353062316165646232363730223b733a33323a223761306166613061653561363033366230303762393163616639356331376637223b733a33323a226136633431653037666565373631393534356665303264386239343130363834223b733a33323a226439356331633137373133313936383964323561313063303230626530306433223b733a33323a223061393733353563313035343061663065386237396664356265346665366133223b733a33323a226439623639363030663439633861323139393034346137363765396461383633223b733a33323a223934363539653730316538373361343931353464343263353563626261636432223b733a33323a223664353337663536663138326139663131653336316439373435353839663737223b733a33323a223538666662653130653264343362653439346365623065313164346332613434223b733a33323a223134643834353632666433363032353663346432353138616335316638666339223b733a33323a223165333037646637373530623561383365613161653964616439383133316331223b733a33323a226136313762623162343235383836613135333337393333373966656436656333223b733a33323a223833316662613664343637636161343533353061666365353238633466323931223b733a33323a223063656263376565306665616133316137663135326239326562663730316461223b733a33323a226136343036353432343136623434303335653633636665646163666466616434223b733a33323a223730623738396566326632306666353733636131626233393362613330313962223b733a33323a223330376166663833326235323736336430656264316637376531343936623833223b733a33323a223966313938613737346164626132383239353735393134363835346133633662223b733a33323a223962316263383666653063303538393032633065363631646239313435326465223b733a33323a226133336662636162333437366565346265313736633065333237306233653236223b733a33323a223438623739393961336165623263313734666338303832303363393634663937223b733a33323a223163626230396537343936353364343734626532383763363031656534376237223b733a33323a223134313732343431323236313765356538646363613036636431363338356635223b733a33323a226630363431653635313330343966613730356531303564313362363538333931223b733a33323a223639623639396431336130323364323064616662666536633539643262336563223b733a33323a223164626438313163386330666236363862613064626566623565666530363463223b733a33323a226362613330366462323439323061303965633331326334396330666633656166223b733a33323a223962343637656164666132303961326238616338393732643831616635666332223b733a33323a223663316537646265306633656566356233663138366133623238643564303634223b733a33323a223136383561346632633439666135306539343966303331336261373537633535223b733a33323a223863366166616263376137623531623163386532653162356630353331623430223b733a33323a226331616530636330323964336336366336626662393564356232656235326236223b733a33323a223132336364383663393932363266366161666334343764663565656433623533223b733a33323a223864383139636530393538373931356464363331326565323261306165303538223b733a33323a223065656362346330663635363162356636626236643630363263366566396531223b733a33323a223633353865653665636333393963613035363736653461363130643463383130223b733a33323a226265333763613636636339623032636436333537653630303839643331306632223b733a33323a223735333862636133666238333739353132383736633262366537306639613237223b733a33323a223735343831636238343338656438303165653033363465343237333865333338223b733a33323a226361336666333533663436383338636238356436633238326564663864393961223b733a33323a226138333438656366616136396162306563336134623536653336383532623461223b733a33323a223861383734383435333439373235316533636434386463633739386562643466223b733a33323a223266343237333437313538666633366663663161333965336461333631393838223b733a33323a226166333965306439303363663539333565343265636636333336353661333531223b733a33323a223464626433326238383865616639393331366230363266373132663962383063223b733a33323a223065633033646463333233626431616262316665353031356466376535643831223b733a33323a226131666262616632316439643235346163353766313663323234623561326234223b733a33323a226465366433663162633236303862366563376437306464613834656333636566223b733a33323a226562663035666234376664633234623334343736356463623836373038363734223b733a33323a226538303831613865663131663562653462393066633065666532303837356238223b733a33323a223630396265333261346236313566656265646231393166343636636538633063223b733a33323a226361363166663466356632386438313866656333336635316134356437643132223b733a33323a223837613938343137363335353163366333343330393235623264333631366461223b733a33323a226266396531333464633166373865326332666437346464383863613764613361223b733a33323a223562343235626662663038663238383431316239333966643137376435353864223b733a33323a226561306232613264343439663366346366343931343438623162356665323933223b733a33323a226665656665613037363263626465636632653365386536663964383538333163223b733a33323a226362623432336162623835363533376563363231613933663231626161346636223b733a33323a226235376439393864613763376135383538663263303638613365663165313431223b733a33323a223430633132376639346565373831353334353038336433303534383035363963223b733a33323a223431323162306333393834333030323734636661633564316262393334666266223b733a33323a223439303839343435613538653937653838303339343065353832646134633936223b733a33323a223038333762333437663135656633613037643833656262306464316333633833223b733a33323a223663663539313761343832616134633361373763653062303663353230386366223b733a33323a223734646461616134343563333934643338363038316233326435623461646535223b733a33323a226434323439363934383237313135363364396635643833346164636531373236223b733a33323a223165313663666332326632623533376262643833386636623635613634666366223b733a33323a226131376333376633373936356466613437363365623637306636613339363166223b733a33323a223664653336366166323935303430656632383865666530656338313130396332223b733a33323a226434663139383364663066643161333465386265363063393537663763666466223b733a33323a226133663532396665633937623139613030636532356362323465333265313636223b733a33323a226337303132393563356435663466666266326333366364353563666239316137223b733a33323a226164343132303963666432376637363839373862333536356633393066356164223b733a33323a226465343162323934313966646539323531643932356261313834306666663735223b733a33323a223539343463643965363134383965326631373662643937393765313961376138223b733a33323a223831613334326161613032653063393038323761623532636335666235316166223b733a33323a223738373863326531373465373735376534373466366539333839393465663532223b733a33323a223932653036303261343030636631333136376338393265646239336439386563223b733a33323a223138393363623161336430353637636262333263353434623063376533346366223b733a33323a226633313232373263383562363331323030653031323261646266643432666464223b733a33323a223666653931316233636532316164643036373330313932666466653161343433223b733a33323a223330323637313230303931326535313266393863353761383030616165383535223b733a33323a223531643235313734383737383866326666626338323065303330316237316362223b733a33323a226661623833663564613864316664626137653564633838356433306565343564223b733a33323a226339623138326136313738396661666663643234393834623065636531646463223b733a33323a226132656435643537333430353737323061386561303261623166303963306164223b733a33323a223063343564666164616163616234626564643330336638646266306461623039223b733a33323a226638383937356261383635646338333030346236386536303666636638373361223b733a33323a226264373631616165376630656261373436613635306130636263333862653966223b733a33323a223230626466383334653363646134306564306532656538633964333364346362223b733a33323a226330333937306632666133396231336566336134656632326461633839396139223b733a33323a223735303436306630643331333965356237353264373937323531356634653036223b733a33323a226233383834373834633332336634623031336438353031636330363838383036223b733a33323a226564323739363830333235613362663735353365616634663934663339636335223b733a33323a226537653465303262346665376530323932333939663039343765343165636332223b733a33323a226536306665336132316365336135666535393262633939353433306532393131223b733a33323a223265333035363563653363353232613066656165353662646164656138333266223b733a33323a223766633937656666353066373064643966343465363833363238646339313662223b733a33323a223235613433333766633530396462646261653035373039356335363334343936223b733a33323a226231326363313861613462376261393863643738643164623864393338383435223b733a33323a223333326439336537303234326336653361613435353233356639666464383536223b733a33323a223539666436336436636665663963383637346335646333306663366264356163223b733a33323a223966663031326437333732336637313662636238303766306135356166393530223b733a33323a226330373563656334373035313765363235303536313437386636363635313139223b733a33323a223635636437613130323163333163636538343634616265363738306463306333223b733a33323a226165663661633863643034353532656264393662633165363266363830386666223b733a33323a226562313430363230393365323063353766646439333838613965306237633063223b733a33323a226531326265653661346334363031376338663933643664646139323636316465223b733a33323a223530353061623166313135626465396461323861343637306435386430663139223b733a33323a226332626433326163396131373334626265386535373233386662323466616565223b733a33323a226537336664386331306534613339353866363963313533323661653432316461223b733a33323a223131333935653131663839643230383338353464646237353265303434616264223b733a33323a223630643435656561636466656236366537323837316465336436666466663364223b733a33323a226464656661663064653334663735336237616539383433616334626331643763223b733a33323a223631363334353563643334626261343537646231313263366339303933326530223b733a33323a226438303461363961313865393864613339333537626531366536333634373664223b733a33323a223032313039613735666434303336336137313264306161663362346665316436223b733a33323a223965323539346266333962663530303730313735353264643031666537363731223b733a33323a223161343930653530316237393239323166653037626563393936366361326436223b733a33323a223131363131653337316234373461626637316463396433303564396361326538223b733a33323a223833656261336362653034316462353265643261623231383031353435633532223b733a33323a226139663538636166656464643965653337383231323965653538613230626462223b733a33323a223132366362316536383666656361643931303830326239383164343066333535223b733a33323a226239326435656438623539656635363966346438666239663066306631353763223b733a33323a223664626436376434396332376434346537306561343863363838336238383464223b733a33323a223031376262383031643734306336383131613434373635376565396233343332223b733a33323a223461613934353738316561373861313338656136663232353233613738336136223b733a33323a226136313732323464613461336330316334323662616261613633366562666432223b733a33323a226234633438333338333862626236363166643739306339383538353861383165223b733a33323a226237623264646636316565343637646133623434616365333434313136633462223b733a33323a223337323561353762316232363365643865643936306439386264643833396135223b733a33323a223230613266636632373464393236613436633137306266646231613539653333223b733a33323a223538643932373338613635636336623736666163623735386662656231383037223b733a33323a223261653131303035653335393732623032303539653662633964646364356466223b733a33323a223164636266336263653363386133356562313433363639386330613264326337223b733a33323a226537356637303935353961656562613833343736303130306639326563346634223b733a33323a226330613066643132323763313433343532353763663065643762366239313835223b733a33323a223032326362313634306638623937346535386534383131623033613561313565223b733a33323a223838386632333139343133313665373864323266383465333738346632393062223b733a33323a223434653035353439336262336261306537653261356337353437353532616236223b733a33323a223861333865346635333237623330393934343436646538663762336437333831223b733a33323a223839323838303436303162356137626164633638623130396461326362326335223b733a33323a223063306331313565383465306430313434633665303637623562353135313465223b733a33323a223463626430613662623661353264663531313332346530386432663566353933223b733a33323a226237623563373439623833613466623362366166303432623861656238613935223b733a33323a223666303933616164323661643064393734346537393462323134333763663739223b733a33323a223939616466363136663736303561656232646434643736666535333862363264223b733a33323a223733353334346436666236346665613434363839663434616536653366363734223b733a33323a223837333835336165393036383261396334333539653033616663636661306130223b733a33323a223234386136303535346133653463346631656262393065316366653935386262223b733a33323a223636643239646163303431653236363331353661376631303664613430313833223b733a33323a226639653638323566383162303065303364633139313365323430353062623539223b733a33323a226439303436356530623034326533363433396639303138653239393235383965223b733a33323a223036366230326462353364653938333338346530323833343936626235356332223b733a33323a223038613764396239323937353462386138366337323834613834666432333166223b733a33323a226566633865656132666634363938623931306565303561313532353065616239223b733a33323a226236353864363939313762313039663264636361666666363036656633353764223b733a33323a223065313563333034366666353930393037376466316130316332616465613135223b733a33323a223736613138393561323736653964363930363533333233366562323136383564223b733a33323a223064343634633131373234633338343761653234386331626361626331353931223b733a33323a226363653532386433623866306335393739656532626464343839323663323362223b733a33323a226164643039376135373564306531363361666236376262303364643531616466223b733a33323a223133343934336333323833316233633364646166393663346538386236366664223b733a33323a226235373366343934316166326233366566613939326136643366363937643837223b733a33323a223939656534306264373563663665393938613366366465356364386236663232223b733a33323a223931383138333134376263363732353734376638326335353365316439666435223b733a33323a223436343333656432386334663961346338333939373063376337643832393835223b733a33323a223861356531326261386437393731616263323635633262656533393764366239223b733a33323a223864623335363730373136366334303865663466386536343563353533383038223b733a33323a223065376265373432623961323138383136356466363839353465646436333034223b733a33323a223035653563306534623963316639616530636139663766393138373963616437223b733a33323a223662666665396532323732323737343734386365663836613930653439666231223b733a33323a226137333962616132333732366431643137353762393134393761316631386337223b733a33323a223235326266383636386436656636373463383261666433326431623763366430223b733a33323a226565646530623839376662653962653932346464346435626161333361323961223b733a33323a223736626665616430643935613361616663633930343865343935383332616366223b733a33323a223933383537313862383532306466643639616235373861323266343861333635223b733a33323a226332363162306163663531616437653961313836643630626131643461626362223b733a33323a223965646165383139376338376464353430663963643838646533656165323363223b733a33323a226438356566373237383935653136373466663134623462353166653938326263223b733a33323a226136376439393630326462366666646264663562353161326363666463373935223b733a33323a226237616536663534346463363634373435356631626263366161303761353536223b733a33323a223730353936373463353563633561326232336139613933626639633137646138223b733a33323a226637353537663662643532373964613163373331613466303832636636366138223b733a33323a223165323965396366356237656231343538366638306432663133326237623238223b733a33323a226564386638326332393637353339396139616163306464313363343565663334223b733a33323a223433306131306261626264333135663431616461383238653965613732653833223b733a33323a223432343063373130326634663639356264323338636434303939656433383232223b733a33323a223834613231313065363863663837313436393366326463313365663161336363223b733a33323a226137386432303363653238336365393566393431306332383337366165393537223b733a33323a226236626139626438343933336364656266346538336633343432303732613562223b733a33323a223436396230333032613766646231356232353238323861656266396266373539223b733a33323a223033363735613436613562303363343863643366396432316436303134333664223b733a33323a223466363439313835316332353339323866336265383830623330353332363962223b733a33323a226533383637613735636265623538653639366437363436333136616266343132223b733a33323a223137336363366337366332643139633632376634623631623135363762333134223b733a33323a226538393834656466373932333932393233653732323262336138373563656265223b733a33323a226636363861613233363430313132633934386539663530376538623230343361223b733a33323a226264336438626438393038616662313866303533663963323364373437386432223b733a33323a226134383461393434613639343130653733393964613936386233653565353466223b733a33323a226664623963356463343538383730633539626533623734376230306263326130223b733a33323a223363643765383833393965303435616633323936353335373330366534316163223b733a33323a226265626462366538356666373337383566373964626639626637626432333836223b733a33323a226161346635656632316535626131363339663533646433353938646333633834223b733a33323a223434323938666161636665303266383765336437356664623839616230653365223b733a33323a223539376234356665643837326338636131383737313931616561643130646365223b733a33323a223539393331386366653963306132643033356336663464333332323764663836223b733a33323a226639653730613031383231313235326465346637363262356261393138353030223b733a33323a223333656632306462313664613330373939333935303364323634383264343430223b733a33323a226539643633333832303261643835636364663930633039363766323365636465223b733a33323a226135396637663138333639366235323766396465623833326361313362663262223b733a33323a226261623131376130633631613330303663616131373431393631623338303561223b733a33323a226162333361643037646333373166626662303734663431353863663030383039223b733a33323a223537656437323534343531636238373565353735383236356533336162363862223b733a33323a226536643266323661353266386263386564623535326165383536373130656539223b733a33323a226138616339373738633861623531653865336531316362326238343236323233223b733a33323a223633396539313233616539313532623461613162356665643734363166393234223b733a33323a226331653531646438313538623362356436633563333065363037363663633632223b733a33323a223962343039353535373264616536333065613533323039376139366130653065223b733a33323a223139323761313535633035383631653435373335636662343266623563386163223b733a33323a223238373839343861613363396431373333313134366336313130393330383061223b733a33323a223066393337373836613735653365306439313537646632623730333365663731223b733a33323a223062323638636139386666666636636538306462386366653035396432356630223b733a33323a226330623765373538656431313033313232643638396634663762643438333235223b733a33323a226534303661393664623238646137643866663234373138393833356666616430223b733a33323a226135336361393238623163653064386636373533643837613965356362396239223b733a33323a226337363262663166363765366332333964303938393665336661343332363764223b733a33323a223661663436636534303766613364323834626162306332633564633234653535223b733a33323a223034356663663238383166396633663039313032666438643233333664343466223b733a33323a223962663838613131323861636233346530363138306661636337346265396361223b733a33323a223735303232663536333964643166386138633637643762646665646633396138223b733a33323a223238356238643530346531643631343937353365363666323731626366323735223b733a33323a226238656136653766373734373662333162663932343332383932363938346132223b733a33323a223962373835346636333135626466653938373264376163653439303661333338223b733a33323a226438346432306564353962306339383565656661666536316565653232326337223b733a33323a223535323838386636623831306335306231666535636666313932356561313938223b733a33323a223964636338343661373431633061643533643938656231663165306339323632223b733a33323a226634353039383063313762623265666163666331366430633231303939313464223b733a33323a226565643832623439616633306664626535656261316162353462623534363665223b733a33323a226434393363393165663866336563363034313337313934616436616662623038223b733a33323a223262626531616335363832373566633738393230373863626438323135333130223b733a33323a223261303064343036653737383566316666333434306234633434363963346632223b733a33323a226362643735636135303933663139626137626263626330386461333130316633223b733a33323a226536303532343638633431636461313131373533633838306633633038303232223b733a33323a223434343664633932343936313337373039346461393063623333633962666635223b733a33323a223361356361613461373136623266316363343535303935636531346664353366223b733a33323a223730373166616135336339343162313838333865633132373636626363346231223b733a33323a223035313939396233386631326331623562656638383461386164636334613931223b733a33323a223236346363353830623839386666353363636438356638613538336564303038223b733a33323a223962613964616561326232653538303738366232376234663030326630623537223b733a33323a226631616531323936663133643666613461653333666636343561313833633532223b733a33323a223736366664343431653634396662633539326136326436313939626365623638223b733a33323a226330643236643862393431623233663439666563663731363130373064353665223b733a33323a223533613734326165323432663834653038313432326363613535363863626530223b733a33323a223537663762643531363437316330306132653434643666666462623334303862223b733a33323a226164396661363630326362626339616261353764363239646261666330626438223b733a33323a223064616538633238363932306638383337303739326637626131386239646138223b733a33323a223231626534353534323363643966663039663039313336623337386264373663223b733a33323a226635323938393963346637656238313239366434623037306533623465366538223b733a33323a226363336635363737343365653466646166663839393764336437396533646137223b733a33323a223334363931356261616262326336306565346466363438616461643034396139223b7d733a343a2268617368223b733a36353a2233343639313562616162623263363065653464663634386164616430343961392d6363336635363737343365653466646166663839393764336437396533646137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226536303066383238343934356334336164363532323262373765353264643738223b733a33323a223732323565653135326139613835303665643839373734656533393764336232223b7d733a343a2268617368223b733a36353a2237323235656531353261396138353036656438393737346565333937643362322d6536303066383238343934356334336164363532323262373765353264643738223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223537376136663861323936313634326663333636666433303934623537663533223b733a33323a226136633263663931643564346165363936316634643236356336316466616337223b733a33323a223033336630643432323931306337356131323932656464373164393564363364223b733a33323a223437636237663561346561373734383163326436663361333564396566346464223b7d733a343a2268617368223b733a36353a2234376362376635613465613737343831633264366633613335643965663464642d3033336630643432323931306337356131323932656464373164393564363364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a393033333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3130393a7b733a33323a226236613834333437643563623533303337356536643166623835656165363536223b733a33323a223137323930376137376162656434303834613636393765303331636135376664223b733a33323a223436613139316433633734363562373033623039393164363664366162646635223b733a33323a223336663766376536626161396161363832616638396231646631343766333238223b733a33323a226636343533356466326661343261376466616466663738646137376263303535223b733a33323a223866393835333235643830633265396266316333313830306530323662336532223b733a33323a226131323664663530666663356565363731663664646164646335333461316662223b733a33323a223561643765623764323137633236376432333362353635333261333066613965223b733a33323a223864616365633161633736326634643530376234386436313466313931386535223b733a33323a226564663037613932636663666565393564333463626566643939363265313435223b733a33323a226166313835613563623166306633636636306533326431623833396137613732223b733a33323a223463396466633131333937373137346135383061386161383639623139363364223b733a33323a223436366236336138356566666537613630623736353234336232356133353731223b733a33323a226335363633306365303935336133343562313462313536393334626566383063223b733a33323a226330643834343039373030663831646662626239393264646664373232373765223b733a33323a223534366537313062373563313835366463386435636137373135633231623333223b733a33323a226332313937373663333731373462646635336638303531333533373737653331223b733a33323a226233396564313937636633333136313436313134613236633665333532396439223b733a33323a226231396432653063323766353166643334346233343566343738623835653739223b733a33323a223331343537333363633437626230393764343534656262383662303739303862223b733a33323a223363323136316263353965366134343833653565373565653864663536313363223b733a33323a223365666362343536316636303137633239313639343764363564373730633365223b733a33323a226534636261643933313635393666616562396135306531303862356561333365223b733a33323a226435353363323430333337356330643934646437626563306631616535353165223b733a33323a226635363137636361656464613136343334316130653634663466666235316139223b733a33323a223561366632373365393531373431666638383533666431616534396666373538223b733a33323a223364636332666164656438656662643739653130373866643464343031653764223b733a33323a223039303232656463373733643037653133386235373961396636626230613564223b733a33323a223364343563303365343066373466323638353430313564323863646130313233223b733a33323a223831373262663861353838326632303462333366326361656132663162343265223b733a33323a223265393165393166653362656364623163313231373135343935613733666433223b733a33323a223533633832363566373465636465313139666431333034633833336666653465223b733a33323a226133323232316138336665323864333439623166383632326663383539303264223b733a33323a223866626634333837346631326339393533393761346436336461356631343732223b733a33323a226135343339366466346331343362663264316338613130616133393462383235223b733a33323a226263623562386462353132393062333336323334373138383838383964303232223b733a33323a223337613937646530376637303963643635323137306336316136356132376364223b733a33323a226636373631346138396462643039343031633666303439663661663361323739223b733a33323a223339333365383939316364316235373631653735316532363361306239326334223b733a33323a223739633634623661663865396135643964343336303464663366636238323831223b733a33323a226461303766313966336233363530333238323430656365653566633663656662223b733a33323a223932656636623463633666356362376236623538666461376639383862343964223b733a33323a226264356330343165303334663465653236616136666361323636326133343839223b733a33323a226264363232303866303662383834383064363238346434386464623736396534223b733a33323a223939393131666134623761396531656365613533353631613234376163306332223b733a33323a223936626137303830313135393238656337356165396162656266303561313037223b733a33323a226635326337613432616139663264373062666163333030623963646132396332223b733a33323a226362363735383238663066386362663636636232346364336135333235653636223b733a33323a226332646466663338643366343233343037316664393234373961616230636162223b733a33323a223566353066646231373065306138373764343466656362656336633763306330223b733a33323a226163373364613035353339623037386566643233396432333435323633383562223b733a33323a226232333963643531373664333366356238643731616565336537623963626236223b733a33323a223238306236383138383138366333333364396231633834346238373332666465223b733a33323a226662363638383232373837663232333462303365316132356566303763393234223b733a33323a226531303836333430643563366135303864333439643366643533363265396237223b733a33323a226432376439313165343838326534363463613730336235663130306632316566223b733a33323a226263646462633531333235376139333362613833616132363534303265653339223b733a33323a223332363664383130363232633634356539366662626337303962356461393366223b733a33323a223333623864623364613461343563303666323332353933353461643263333165223b733a33323a223733343433323334363434393866333837383864636437333765333139313537223b733a33323a226261343233393937313365376131383831393236613233373064616665663237223b733a33323a226334613833396135633535636464343038663834623364303732323834323662223b733a33323a223130373264663864616662353066306535313332303539336466653834366163223b733a33323a223536663139336535336364303364373234343035346361353663636365396361223b733a33323a223033363163353661383264383232326139396665346666666662393264326632223b733a33323a223165623163653563633031393762383637346361613463343131316166383163223b733a33323a223237616163626436616166623163323738663239363236653139623430363063223b733a33323a223633643937323265323366303236643234356135643961303736353166666264223b733a33323a223732313938306434373561393531303464383763613339386165316135346564223b733a33323a223361356133376339353532623537383063376533366231353963356265326561223b733a33323a226362633739666635373561363339316439383939383362353066643739386664223b733a33323a226366653832386237343435316261646139316535663434326539316237316563223b733a33323a223162643138626433383564653932643062373538363064656266643436363363223b733a33323a223431626639316330353138333834316164386262396139373937363133383538223b733a33323a223461313832376635666437646435393437316462393631663564386463316131223b733a33323a226365656565306531666637653734346461333036323337316532613539303132223b733a33323a223263653333346537663364306332386664303037343136616665383936346631223b733a33323a223136386164396265303063636462643235666162623130663534613632383732223b733a33323a226131323739356634363666616331616137303033646364336534333231336366223b733a33323a226534636130663062643135386430336635316639303037326663633830306165223b733a33323a223866346430333630646561366631636336323663646436313564333231636339223b733a33323a226230303939306162326137376236643532663464653662326631346435393934223b733a33323a226537613533393161613533323336663333663361343430653965643761636338223b733a33323a223631613735386639363966613730336661306536643332346665653434366339223b733a33323a223763666632323732653864363733386562633935316264653633623864333737223b733a33323a226265616433343731373533353034666665663439323565346535323533353633223b733a33323a223863313063323535393635366138373335353566643764343736326134343839223b733a33323a223761313530383835306231663364656561343538346161626538396537363866223b733a33323a226266613735636363386165633837386564343337363736623565633335663036223b733a33323a226661383966376134323765303165353534363061623762353463373966316231223b733a33323a223063613465353831336566396163313135323533623733613536343736616234223b733a33323a226662663039666532333834633635633764383963303737323162656131323064223b733a33323a226137663436356430323638396662303435343834653030626537653731306363223b733a33323a226361386437376434613331663532376337613061343133643462346530643661223b733a33323a226364313762396432363933626466613162373136363636613333363931323438223b733a33323a226565373438623432646265323663653739653766646163616663383837663037223b733a33323a223535656335366637316532333030346433306631343736643037636232323763223b733a33323a226537303466356530346632383539366539323535376530383036666430356161223b733a33323a223764383339366333336133656237396633663165666561343237353765396161223b733a33323a223634643261323330346366633834303439313636373732616130373533326336223b733a33323a226664333634323735653631633962373366363635343065333239313331333933223b733a33323a223739666264636435666535626230343439343037383462383732623335656263223b733a33323a226137383130663332326435653038623935393433613738613036383033306139223b733a33323a223430666332343635643835363661636331656630636562623233343866353639223b733a33323a223665643462353935323837346137393263313265396433346636373930333363223b733a33323a223136386463356434616334386536633539393665623238323334313335643136223b733a33323a223033643330626535373439323031646366623430326231386138633134333465223b733a33323a223738313061373736376362353636663737376162663535383333643939663965223b733a33323a223966326665383264656434366565623561393339303062653731346537316465223b733a33323a223165336335623238363936393937623338633931666130646230356332323637223b733a33323a226339663232343861376539303637646333643735646463633035623462366561223b733a33323a223232663066346365626238666465623634323133373065393334323137663064223b733a33323a223161373635393434383438363862616663656333393233343261333132346134223b733a33323a223563656163656233313336643965306430613634363664636439316536356139223b733a33323a226531303633613162303161613164303834336237613237306561336338396336223b733a33323a223036313662663933383839383130353633356362373036306538626364303433223b733a33323a223132383039623261646333323334316532366635383936383466323934333936223b733a33323a226439663666323230653037626564633464373138653338396637313239633066223b733a33323a226663356664643133353665313236626230653134653963356463346337663562223b733a33323a223231613733336137653430626162323961656532633165656230306565353433223b733a33323a223032363331303065313538663161636661623263313361653939636634333063223b733a33323a223662663163646465333861366234643032613736363065343364306633366636223b733a33323a223262393365333334646334386630383063323036356435313564613264633136223b733a33323a223930613661326530383266363965356438386337633432313762356131663262223b733a33323a223732363738306330616165633733353665616665613239306563383531666163223b733a33323a223332343733653632336334666335633837666133616537643034623761333636223b733a33323a223833623034366163303834623536313366626666323932346438643334363461223b733a33323a223761323439316233616337323238333230393338376537653930313366363661223b733a33323a223938343162373061363965626339343239346432643064646639363134323562223b733a33323a223137346265303237396166623836333036356234373534636537353331336138223b733a33323a223435383133346363316266653066306335646664353464366639313066653263223b733a33323a223137306437316638323831383733333365303239393561313665626635306666223b733a33323a223266663634646434373631386363323239336134363435656231633338366336223b733a33323a226466383537613564613636353630363639326232623331636136623639393061223b733a33323a226466396462663533346430336261383561613737326134613563613539343438223b733a33323a223261376135663935333330336563643137646464326166386439313533363561223b733a33323a223064323930363865656563643538373962343462383539336434343365656434223b733a33323a226235663830633761306465633161326464616136376361366636396466306530223b733a33323a226634393631303832643136376562376134363031626663356636323435343465223b733a33323a226563613637623637636236613463313434646534613538336239346131666234223b733a33323a226665306232323634333466336630323435313033623136323866323966613837223b733a33323a226337353834333833393730343636623636343066613061356662643935613233223b733a33323a223534623735353334366464383037313630373130336338303965313538323535223b733a33323a223365363632386436346338383830626335326361663631613931653963383134223b733a33323a226437383765353132316433306238346162333530323763356636323839363834223b733a33323a226364613066306432356261303361363733323961386235396335386430656638223b733a33323a226161373735633762306237313435346665633233626639306131336136313664223b733a33323a223865376130396261613166346562346633353332613135386234323864356264223b733a33323a223962663130623832646666663962633534643533326364356134613965396162223b733a33323a223761303864633132306566353330353732636433333563313634333430373336223b733a33323a226133663639386266613536343937383135323032643866353035653537643136223b733a33323a223862653138303930333131663261313137646563643037633632346337636466223b733a33323a223864303734316464353966333538386364616461656365396561363034343230223b733a33323a226165393761386639373162383166363830356662613238646230346133343339223b733a33323a223830666263356565323662353133626662653762396237306430326138636533223b733a33323a223834346263616463623131643238313939623037616637336561393565653963223b733a33323a226138306236623130356331623339636634616537616363383135613964316638223b733a33323a223438376231663766333361343937336537626231343166353236323239353564223b733a33323a226362346534653937383966393138313430336664343837626366363963643232223b733a33323a223933323933393535386530626334363230643630323334346266343332623861223b733a33323a226138326134633933386330363463303231326638363234613335666430363966223b733a33323a226635636630386436366664656135336136333261613730353533643235623139223b733a33323a226232636162623163626162303464613364656331663463326531336361363336223b733a33323a223436333731623165336237666535626330613833623835313163646539396133223b733a33323a226365656335643032643465613939323539346434383333323938616633393030223b733a33323a226239613735363863393961343363313636646238363338613138613830393065223b733a33323a226262373962663766363366363737326165376431313764356163323363316431223b733a33323a223032336333303430366364313633303832636433343336346632306337313638223b733a33323a226261633533366265613131636634613339633032386131616434306363393461223b733a33323a226365636337346537623333323565633932666232376362333138313730356436223b733a33323a226632343031366335343938386661393534353930633634663236653839336431223b733a33323a223438386564663735366639373731383136353534306563623135636436633132223b733a33323a226335363461636337353865313731366234336238646464636461363037316537223b733a33323a223933323636313739623264636230343166323531376138373865363839383632223b733a33323a226231633165626639353534343634353263376439653666653565623234626239223b733a33323a223130323366306237346337376461376634663337363731366531303535643637223b733a33323a223433666234613865366137386335653166656330343864366636336635383666223b733a33323a223730616566393936363837623135623532303036313436613666303439666166223b733a33323a223135636131623438353331376163316331303766373532316337663364386436223b733a33323a226235653363356538373034363761393836626664613234626633643038386664223b733a33323a223734393434373366306461346364653266393232323162613038396464346534223b733a33323a226561633635663139613932376338313265383135643235653437333631356433223b733a33323a223564663965393364353731303464636439383438383237656430613137306366223b733a33323a226437383239323036643636613937656563393761663339623538303364643965223b733a33323a223461346238343738386263383464386235323563346237616239393035656435223b733a33323a226437626230653438323165663534303230303231396437653037633530366134223b733a33323a226462396665356566663435646638633666396662326435343938333230643631223b733a33323a223339666431656430636330333461396261386366343565316536333439636465223b733a33323a226263343930373538613135396535333535383563323130363965373366383463223b733a33323a223139353238666164623366633165616438626432633035343162306434313638223b733a33323a226139346161666665616661336630616564653362626137646666383061643364223b733a33323a223039646637386639653334303066613737646237346533306364396233386530223b733a33323a226535653330616462336530636563383339313330363765303339656433623935223b733a33323a223232663662363436636236646465386432303335313537653263393136373763223b733a33323a223965393931313233333338303165363232343636623435616264353839643061223b733a33323a223233656662313636663361633762636663316536366465646365623533343264223b733a33323a223461336564613266396363616135633932393132613430316366343164313331223b733a33323a223133326565343238306663336435326637323638343830346165636364643530223b733a33323a223664353536633962653232386234363162326365383962326366613035303131223b733a33323a226336306630343036343236663433313866653562353235336439393061316331223b733a33323a223536336536336261633637393164643035663635643439316239643664626130223b733a33323a223565373036633035333161343939383063633864323038343365643438323732223b733a33323a223739626161613033643534633966623530333465333633363139313531626437223b733a33323a226565343733616361383066613765653531373832323634633864336134623230223b733a33323a223531396665373766613030646635626162313433616463323136663061613061223b733a33323a226561656539303436316234396666663838636566303433376266353431383261223b733a33323a226362316338626534343264346236383130373130663065656163383639363265223b733a33323a223838353130336337643437393061356633383537313563323030613562393466223b733a33323a226333316239663637323163666463623237366161353063646232383761306635223b733a33323a223339613132333763396461636266393335313037643636353661393739666135223b733a33323a223335336531656561353133363563333139363738666139666536363063353232223b733a33323a223836643633353639666661353135326238346363353431646131646138623632223b733a33323a223965663565306164613637656435643765326665653265616539376161366434223b733a33323a223263386236616465666533643833323133343164666462353562646439316163223b733a33323a226134613735353533363065633433306231396133336432666532643235613032223b733a33323a223934313833643065353764363065666534303430353130386633663465623435223b733a33323a223931653935626462363331343763326137303065616638343830333761393161223b733a33323a226233326639346236316339393531313238616465356362656535326365386435223b7d733a343a2268617368223b733a36353a2262333266393462363163393935313132386164653563626565353263653864352d3931653935626462363331343763326137303065616638343830333761393161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223630316666343566333437343631326239636163353632636535613463613964223b733a33323a226231323866373933626535343563666465383865636436646130366534393232223b733a33323a223765393536323131336165653733663833396139373630616333656139303335223b733a33323a226634633763393764306466623163383966626566313534343838633163633562223b733a33323a226437333430363964663632313930306363333066363366306438373065636434223b733a33323a223661656336383336323037323735313932643866383266313935666532646532223b7d733a343a2268617368223b733a36353a2236616563363833363230373237353139326438663832663139356665326465322d6437333430363964663632313930306363333066363366306438373065636434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604867774);

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
('administrator_email', '\"hichembenameur2003@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"trombinoscope\"'),
('locale', '\"fr\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Paris\"'),
('version', '\"3.0.0\"'),
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

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, 1, 'trombinoscope', 'default', 'trombinoscope', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Parcourir\",\"query\":\"\"},\"links\":[]}]', '[]', '2020-11-08 17:58:42', '2020-11-08 17:58:58', 1, 1);

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

--
-- Déchargement des données de la table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'welcome', 'Bienvenue', 1, '2020-11-08 17:58:42', '2020-11-08 17:58:42');

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

--
-- Déchargement des données de la table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"Bienvenue sur votre nouveau site. Ceci est une page d\\u2019exemple.\"}', 1);

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

--
-- Déchargement des données de la table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin');

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
(1, 'hichembenameur2003@gmail.com', 'Hichem', '2020-11-08 17:18:15', '2020-11-08 17:18:15', '$2y$10$kc4OfaysKlGa9mhTLMDJVOeKCII/jFexoIcI.HQ2KyAqH5t.hpI1S', 'global_admin', 1);

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
(15, 10, 144, NULL, 'literal', '', 'ubgg', NULL, 1),
(16, 10, 1, NULL, 'literal', '', 'Employe', NULL, 1);

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
(12, 1, 'http://dbpedia.org', 'service', 'Service', ''),
(13, 1, 'http://dbpedia.org/ontology/city', 'site', 'Site', ''),
(14, 1, 'http://dbpedia.org/ontology/postalCode', 'site2', 'Code Postal', ''),
(15, 1, 'http://dbpedia.org/ontology/address', 'adresse', 'Adresse', ''),
(18, 1, 'http://dbpedia.org/ontology/pseudonym', 'compte', 'Compte', ''),
(19, 1, 'https://www.w3.org/ns/earl#Pass', 'password', 'password', ''),
(21, 1, 'http://www.linkedmodel.org/schema/vaem#url', 'chemins', 'chemins', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
