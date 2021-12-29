-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 10:52 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cfg`
--

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `id` int(11) NOT NULL,
  `head` varchar(50) NOT NULL,
  `body` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`id`, `head`, `body`) VALUES
(1, 'K', 'K Ket'),
(2, 'K', 'K O'),
(3, 'K', 'S P'),
(14, 'K', 'K Pel'),
(15, 'S', 'FN Pn'),
(16, 'Pn', 'punika'),
(17, 'FN', 'FN FN'),
(18, 'FN', 'Anak'),
(19, 'FN', 'lanang'),
(20, 'FN', 'Sekretaris'),
(21, 'FN', 'Daerah'),
(22, 'FN', 'Provinsi'),
(23, 'FN', 'Bali'),
(24, 'P', 'Ps FN'),
(25, 'Ps', 'pinaka'),
(26, 'FN', 'Kalih'),
(27, 'FN', 'diri'),
(28, 'FN', 'negatif'),
(29, 'FN', 'Covid-19'),
(30, 'P', 'Ps FV'),
(31, 'Ps', 'sampun'),
(32, 'FV', 'Kaucap'),
(33, 'Pel', 'FN FN'),
(34, 'FN', 'ring'),
(35, 'FN', 'FN Pn'),
(36, 'FN', 'PMI'),
(37, 'FN', 'pulah'),
(38, 'FN', 'palih'),
(39, 'FN', 'genah'),
(40, 'FN', 'FN FV'),
(41, 'FN', 'dane'),
(42, 'Ps', 'makasami'),
(43, 'FV', 'ngelaksanayang'),
(44, 'FV', 'mekarya'),
(45, 'O', 'FN FN'),
(46, 'Ket', 'Pn FN'),
(47, 'S', 'Ps FN'),
(48, 'S', 'FN Ps'),
(49, 'FN', 'Pn FN'),
(50, 'FN', 'sesuduk'),
(51, 'FN', 'becik'),
(52, 'FV', 'nyarengin'),
(53, 'Pn', 'sane'),
(54, 'S', 'FN FN'),
(55, 'P', 'FV FN'),
(56, 'FN', 'Wakil'),
(57, 'FN', 'Gubernur'),
(58, 'FN', 'Tjokorda'),
(59, 'FN', 'Oka'),
(60, 'FN', 'Artha'),
(61, 'FN', 'Ardhana'),
(62, 'FN', 'Sukawati'),
(63, 'FN', 'pacentokan'),
(64, 'FN', 'layangan'),
(65, 'FN', 'virtual'),
(66, 'FV', 'mungkah'),
(67, 'FN', 'Ps FN'),
(68, 'FN', 'titi'),
(69, 'FN', 'majeng'),
(70, 'FN', 'rare'),
(71, 'FN', 'angon'),
(72, 'FV', 'dados'),
(73, 'Pn', 'para'),
(74, 'Pn', 'puniki'),
(75, 'Pel', 'FN Pn'),
(76, 'FN', 'Kadek'),
(77, 'FN', 'Suprapta'),
(78, 'FN', 'Meranggi'),
(79, 'FN', 'pengalgal'),
(80, 'FN', 'acara'),
(81, 'S', 'Dane'),
(82, 'FN', 'baga'),
(83, 'S', 'Titiang'),
(84, 'P', 'ngelaksanayang'),
(85, 'O', 'swadharma'),
(86, 'FN', 'krama'),
(87, 'FN', 'sami'),
(93, 'P', 'FV FV'),
(94, 'FN', 'usaha'),
(95, 'FN', 'bengkel'),
(96, 'FV', 'raris'),
(97, 'FN', 'nyontoang'),
(98, 'P', 'nangiang'),
(99, 'FN', 'Guru'),
(100, 'FN', 'Besar'),
(101, 'FN', 'ISI'),
(102, 'FN', 'Denpasar'),
(103, 'FN', 'pemilet'),
(104, 'FN', 'utsaha'),
(106, 'FV', 'memargi'),
(107, 'FN', 'masan'),
(108, 'FN', 'pandemi'),
(109, 'FN', 'masan'),
(110, 'Ps', 'Para'),
(111, 'Ps', 'kantun'),
(112, 'O', 'Pn FN'),
(113, 'FN', 'Kawentenang'),
(114, 'FN', 'PBMB'),
(115, 'FN', 'kramane'),
(116, 'FV', 'kauningin'),
(117, 'Pn', 'olih'),
(118, 'P', 'negesan'),
(120, 'FN', 'Wayan'),
(121, 'FN', 'Koster'),
(122, 'FN', 'kauratiang'),
(123, 'FN', 'Desa'),
(124, 'FN', 'Adat'),
(125, 'Pn', 'indik'),
(126, 'Pn', 'ring'),
(127, 'FN', 'pidartane'),
(128, 'P', 'maweweh'),
(129, 'Ket', 'FV FN'),
(130, 'FN', 'Makasami'),
(131, 'FN', 'pasien'),
(132, 'FN', '15'),
(133, 'FN', 'Respati'),
(134, 'FV', 'kantos'),
(135, 'FN', 'positif'),
(136, 'FV', 'katambanin'),
(137, 'FN', '11'),
(138, 'FN', 'Bd FS'),
(139, 'Bd', 'rumah'),
(140, 'FS', 'sakit'),
(141, 'FN', 'sumeken'),
(142, 'FN', 'urati'),
(143, 'FN', 'kabencana'),
(144, 'P', 'Pr FN'),
(145, 'Pr', 'mangda'),
(146, 'Pn', 'lan'),
(147, 'FV', 'FN'),
(148, 'FV', 'nyanggra'),
(149, 'Ket', 'Kt FN'),
(150, 'Kt', 'Benjang'),
(151, 'FN', 'pungkur'),
(152, 'FN', 'Gunung'),
(153, 'FN', 'Batur'),
(154, 'P', 'Sf FN'),
(155, 'Sf', 'pastika'),
(156, 'FV', 'ngerauhan'),
(157, 'O', 'bencana'),
(158, 'FN', 'parikrama'),
(159, 'FN', 'konferensi'),
(160, 'S', 'Astawa'),
(161, 'P', 'FS FV'),
(162, 'FS', 'durung'),
(163, 'FV', 'ngambil'),
(164, 'O', 'FN Pn'),
(165, 'FN', 'pemargi'),
(166, 'FN', 'Industri'),
(167, 'FN', 'Pariwisata'),
(168, 'P', 'FN FV'),
(169, 'FN', 'taler'),
(170, 'FN', 'patut'),
(171, 'FV', 'mapikayun'),
(172, 'FV', 'FV FS'),
(173, 'FS', 'lantang'),
(174, 'Pel', 'FV FN'),
(175, 'FV', 'nindihin'),
(176, 'FN', 'pungkuran'),
(177, 'FN', 'I'),
(178, 'FN', 'Gede'),
(179, 'FN', 'Putra'),
(180, 'FN', 'Ariawan'),
(181, 'FV', 'nuturang'),
(182, 'FN', 'indik'),
(183, 'FN', 'satia'),
(184, 'FN', 'Dosen'),
(185, 'FN', 'Bahasa'),
(186, 'FN', 'Sastra'),
(187, 'FN', 'Unud'),
(188, 'Ps', 'dahat'),
(189, 'FV', 'nyumbungan'),
(190, 'FV', 'Ngewacen'),
(191, 'O', 'FN FV'),
(192, 'FN', 'Cerpen'),
(193, 'S', 'Pemedek'),
(194, 'FN', 'banget'),
(195, 'FV', 'kaaptiyang'),
(196, 'FV', 'nyarengin'),
(197, 'FV', 'nyaga'),
(198, 'FN', 'karesikan'),
(199, 'FN', 'wiadin'),
(200, 'FN', 'kasucian'),
(201, 'FN', 'palemahan'),
(202, 'FN', 'pura'),
(204, 'FV', 'kaloktah'),
(205, 'FN', 'dura'),
(206, 'FN', 'Negara'),
(207, 'FN', 'yowana'),
(208, 'FN', 'naler'),
(209, 'FN', 'kaaptiang'),
(210, 'FV', 'ngicen'),
(211, 'Pel', 'Pr FV'),
(212, 'Pel', 'Pn FN'),
(213, 'FV', 'seseleh'),
(214, 'FN', 'sangkaning'),
(215, 'FN', 'kawentenan'),
(216, 'FN', 'budayane'),
(217, 'FN', 'Aksi'),
(218, 'FN', 'terorisme'),
(219, 'FN', 'patut'),
(220, 'FN', 'setata'),
(221, 'FV', 'katangarin'),
(222, 'FN', 'taler'),
(223, 'FN', 'ngaturang'),
(224, 'FN', 'suksemaning'),
(225, 'FN', 'manah'),
(226, 'FN', 'fraksi-fraksi'),
(227, 'FN', 'DPRD'),
(228, 'FN', 'Putri'),
(229, 'FV', 'nangian'),
(230, 'O', 'kramane'),
(231, 'FV', 'nincapan'),
(232, 'FN', 'HATINYA'),
(233, 'FN', 'PKK'),
(234, 'FN', 'Luh'),
(235, 'FN', 'Sari'),
(236, 'P', 'medagang'),
(237, 'P', 'ngadep'),
(238, 'O', 'jukut'),
(239, 'O', 'jaja'),
(240, 'P', 'ngadepang'),
(241, 'O', 'memene'),
(242, 'P', 'jukut'),
(243, 'FN', 'peken'),
(244, 'FN', 'Klungkung'),
(245, 'Pn', 'di'),
(246, 'S', 'Ia'),
(247, 'P', 'meliang'),
(248, 'O', 'adine'),
(249, 'Pel', 'buku'),
(250, 'FN', 'Toko'),
(251, 'FN', 'Gramedia'),
(252, 'FN', 'Bapa'),
(253, 'P', 'mamula'),
(254, 'O', 'padi'),
(255, 'FN', 'uma'),
(256, 'Kt', 'ituni'),
(257, 'Kt', 'semengan'),
(258, 'FN', 'Tetujone'),
(259, 'FV', 'nyujur'),
(260, 'FN', 'Indonesia'),
(261, 'FN', 'berdaulat'),
(262, 'FN', 'bangsa'),
(263, 'FN', 'sejarah'),
(264, 'P', 'ngaptiang'),
(265, 'S', 'Titiang'),
(266, 'FN', 'sinalih'),
(267, 'FN', 'tunggil'),
(268, 'FN', 'strategis');

-- --------------------------------------------------------

--
-- Table structure for table `sentence`
--

CREATE TABLE `sentence` (
  `id` int(11) NOT NULL,
  `kalimat` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sentence`
--

INSERT INTO `sentence` (`id`, `kalimat`, `status`) VALUES
(1, 'Anak lanang punika pinaka Sekretaris Daerah Provinsi Bali', 'Valid'),
(2, 'Kalih diri punika sampun kaucap negatif Covid-19', 'Valid'),
(3, 'Makasami PMI punika sampun ngelaksanayang pulah palih ring genah dane mekarya', 'Valid'),
(4, 'Dane makasami sampun nyarengin sesuduk sane becik', 'Valid'),
(5, 'Wakil Gubernur Bali Tjokorda Oka Artha Ardhana Sukawati mungkah pacentokan layangan virtual', 'Valid'),
(6, 'Pacentokan layangan virtual puniki dados titi majeng para rare angon', 'Valid'),
(7, 'Kadek Suprapta Meranggi pinaka pengalgal acara punika', 'Valid'),
(8, 'Dane sampun ngelaksanayang pacentokan baga kalih', 'Valid'),
(9, 'Titiang ngelaksanayang swadharma majeng krama sami', 'Valid'),
(10, 'Dane raris nyontoang baga usaha bengkel', 'Valid'),
(11, 'Guru Besar ISI Denpasar puniki nangiang pemilet utsaha', 'Valid'),
(12, 'Para pemilet utsaha kantun memargi ring masan pandemi', 'Valid'),
(13, 'Kawentenang PBMB sampun kauningin olih kramane', 'Valid'),
(14, 'Gubernur Wayan Koster negesan indik kauratiang Desa Adat ring Bali ring pidartane', 'Tidak Valid'),
(15, 'Makasami pasien Covid-19 maweweh 15 diri kantos Respati puniki', 'Valid'),
(16, 'Pasien positif kantun katambanin ring 11 rumah sakit', 'Valid'),
(17, 'Krama makasami mangda urati lan sumeken ring pulah palih nyanggra kabencana', 'Valid'),
(18, 'Benjang pungkur Gunung Batur pastika ngerauhan bencana', 'Tidak Valid'),
(19, 'Gubernur Koster nyanggra becik  parikrama konferensi indik kabencana ring Bali', 'Valid'),
(20, 'Astawa durung ngambil pemargi punika', 'Valid'),
(21, 'Industri pariwisata taler patut mapikayun lantang nindihin pariwisata Bali pungkuran', 'Valid'),
(22, 'I Gede Putra Ariawan nuturang indik satia', 'Valid'),
(23, 'Dosen Bahasa Lan Sastra Bali Unud dahat nyumbungan acara Ngewacen Cerpen puniki', 'Valid'),
(24, 'Pemedek banget kaaptiyang nyarengin nyaga karesikan wiadin kasucian palemahan pura', 'Valid'),
(25, 'Bali kaloktah ring dura Negara', 'Valid'),
(26, 'Para yowana naler kaaptiang mangda ngicen seseleh sane becik', 'Valid'),
(27, 'Bali kaloktah ring dura Negara sangkaning kawentenan budayane', 'Tidak Valid'),
(28, 'Aksi terorisme puniki patut setata katangarin', 'Valid'),
(29, 'Gubernur Koster taler ngaturang suksmaning manah majeng fraksi-fraksi DPRD Provinsi Bali', 'Valid'),
(30, 'Putri Koster taler nangian kramane nincapan parikrama HATINYA PKK', 'Valid'),
(31, 'Pasar Gotong Royong Pangan Krama Bali kalaksanayang ring hari kerja', 'Valid'),
(32, 'Pembeli ngemastikayang angga kenak', 'Valid'),
(33, 'Istri Gubernur Bali Wayan Koster punika taler', 'Tidak Valid'),
(34, 'Makehan perajin ngaryanin karya sane malakar antuk kayu', 'Valid'),
(35, 'Pandemi COVID-19 taler banget mawesana majeng ekonomi Bali', 'Valid'),
(36, 'Gubernur Bali taler tan surud-surud maosang parindikane puniki sareng Menteri Pariwisata', 'Valid'),
(37, 'Akeh pamikarya ring Bali sane kantos keni PHK', 'Tidak Valid'),
(38, 'Utsaha kuliner puniki kalaksanayang ring jeronnyane', 'Valid'),
(39, 'Ibu Jero prasida makarya 15 porsi abon pindang', 'Valid'),
(40, 'Para yowana pinaka embas ring Galungan', 'Valid'),
(41, 'Akeh sane sumeken pisan nyarengin acara puniki', 'Valid'),
(42, 'Wisatawan sampun majanten nenten uning ring geguat ngranjing ka pura', 'Valid'),
(43, 'Dina mabasa Bali katureksain dahat becik kalaksanayang', 'Valid'),
(44, 'Sane akeh wantah nganggen basa campuran', 'Valid'),
(45, 'Pemerintah Desa Beraban ngamargiang parikrama Bulan Bahasa Bali warsa 2020', 'Valid'),
(46, 'Dane taler mapangapti ring alit-alit miwah para yowana ring desa Beraban', 'Valid'),
(47, 'Dane taler mapinunas ring tenaga Penyuluh Bahasa Bali Desa Beraban', 'Valid'),
(48, 'Dewa Indra ngaptiang krama Bali makasami', 'Valid'),
(49, 'Dewa Indra negesan mangda kramane masang Bendera Merah Putih', 'Valid'),
(50, 'Yayasan punika nedungin 16 satuan pendidikan kerjasama', 'Valid'),
(51, 'Satuan pendidikan kerjasama puniki ngaptiang mangda sistem ajah-ajah presida mewali sekadi dumun', 'Valid'),
(52, 'Putri Koster nangiang UMKM setata mecikang angga', 'Valid'),
(53, 'UMKM tetep nguripan perekonomian iraga ring masan gering', 'Valid'),
(54, 'Industri parificata nyihnayang kauratiang sane mageng majeng kawentenan UMKM ring Bali', 'Valid'),
(55, 'Bali medue kaluwihan inggih punika jiwa seni sane kentel ring kramane', 'Valid'),
(56, 'Titiang ring Bali', 'Valid'),
(57, 'Pinaka sinalih tunggil sane strategis', 'Tidak Valid'),
(58, 'Titiang ngaptiang', 'Valid'),
(59, 'Ring pemargi sejarah bangsa Indonesia', 'Tidak Valid'),
(60, 'Tetujone nyujur Indonesia sane berdaulat', 'Tidak Valid'),
(61, 'Luh Sari medagang', 'Valid'),
(62, 'Luh Sari ngadep jukut', 'Valid'),
(63, 'Luh Sari medagang jaja', 'Valid'),
(64, 'Luh Sari ngadepang memene jukut', 'Valid'),
(65, 'Luh Sari medagang di peken Klungkung', 'Valid'),
(66, 'Luh Sari ngadep jukut di peken Klungkung', 'Valid'),
(67, 'Luh Sari medagang jaja di peken Klungkung', 'Valid'),
(68, 'Luh Sari ngadepang memene jukut di peken Klungkung', 'Valid'),
(69, 'Ia meliang adine buku di Toko Gramedia', 'Valid'),
(70, 'I Bapa mamula padi di uma ituni semengan', 'Tidak Valid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sentence`
--
ALTER TABLE `sentence`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `sentence`
--
ALTER TABLE `sentence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
