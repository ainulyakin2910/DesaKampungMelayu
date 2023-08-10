-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 21, 2023 at 04:50 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_desa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_agenda`
--

CREATE TABLE `tb_agenda` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deskripsi` text NOT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `tempat` varchar(90) NOT NULL,
  `color` varchar(7) NOT NULL,
  `ket` varchar(200) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_agenda`
--

INSERT INTO `tb_agenda` (`id`, `nama`, `tanggal`, `deskripsi`, `startdate`, `enddate`, `tempat`, `color`, `ket`, `userid`, `slug`) VALUES
(1, 'GOTONG  ROYONG', '2023-07-07 10:40:12', 'Kegiatan gotong royong masyarakat desa kampung melayu', '2023-05-19 12:15:06', '2023-08-04 17:38:05', 'kantor desa kampung melayu', '#f1f1f1', 'Harap Untuk menghadiri kegiatan tersebut', 0, 'gotong-royong'),
(2, 'kerja bakti', '2023-07-10 01:10:47', 'mhgjhg', '2023-10-12 12:15:06', '2023-12-21 08:06:06', 'rt 02', '', 'jfhfhg', 0, 'kerja-bakti');

-- --------------------------------------------------------

--
-- Table structure for table `tb_album`
--

CREATE TABLE `tb_album` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `count` int(11) DEFAULT '0',
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_album`
--

INSERT INTO `tb_album` (`id`, `nama`, `tanggal`, `userid`, `count`, `cover`) VALUES
(8, 'Kegiatan Masyarakat', '2023-07-07 09:11:17', 0, 5, 'c90029fad7a7a08ed2976c9a2661afe1.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_apbdes`
--

CREATE TABLE `tb_apbdes` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `file` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bantuan`
--

CREATE TABLE `tb_bantuan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_bantuan`
--

INSERT INTO `tb_bantuan` (`id`, `name`, `image`) VALUES
(5, 'Petunjuk dan Penggunaan aplikasi', '8f8020e15022a50ab9a07ccb191740c4.jpg'),
(6, 'Cara Untuk Pendaftaran Akun Untuk Pengajuan Surat', 'ba5716cc5a76d1ea485cd3115a6bd5ca.jpg'),
(7, 'Petunjuk dan Penggunaan aplikasi', 'd5afe7cedef1a94a0031537d44101f9f.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `tanggal` datetime NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tayang` int(11) DEFAULT '0',
  `slug` varchar(200) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `kategoriid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_berita`
--

INSERT INTO `tb_berita` (`id`, `judul`, `tanggal`, `isi`, `gambar`, `tayang`, `slug`, `userid`, `kategoriid`) VALUES
(23, 'Penerimaan bantuan BLT ', '2023-07-11 18:19:16', '', 'a5f0dc61ba46a8247719d216656d20a2.jpeg', 0, 'penerimaan-bantuan-blt', 0, 2),
(24, 'Rapat MUSRENBANGDES', '2023-07-11 18:22:00', '<p><strong>Musyawarah Perencanaan Pembangunan Desa</strong>&nbsp;(Musrenbangdesa) Dalam Rangka Penyusunan RKP Desa Tahun 2022.</p>\r\n', '146acd0f49e51ce72532b93eeed84cd1.jpeg', 1, 'rapat-musrenbangdes', 0, 2),
(25, 'Sambutan Kepala Desa Kampung Melayu', '2023-07-15 04:07:31', '<p>scfyfcysdfchgsvchgsvchxzvchc</p>\r\n\r\n<p>&nbsp;</p>\r\n', '0f557683817e7af2aa857f85fc952758.jpeg', 6, 'sambutan-kepala-desa-kampung-melayu', 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_buka`
--

CREATE TABLE `tb_buka` (
  `id` int(11) NOT NULL,
  `hari` varchar(40) DEFAULT NULL,
  `jam` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_buka`
--

INSERT INTO `tb_buka` (`id`, `hari`, `jam`) VALUES
(4, 'Senin - Jumat', '08.00 - 12.00 WIB');

-- --------------------------------------------------------

--
-- Table structure for table `tb_files`
--

CREATE TABLE `tb_files` (
  `id` int(11) NOT NULL,
  `judul` varchar(120) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `oleh` varchar(40) DEFAULT NULL,
  `download` int(11) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_files`
--

INSERT INTO `tb_files` (`id`, `judul`, `deskripsi`, `tanggal`, `oleh`, `download`, `data`) VALUES
(0, 'PETUNJUK PELAKSANAAN PENERIMAAN BLT DD  TAHUN 2023', 'PEDMAN PENERIMAAN PERENCANAAN ANGGARAN BLT-DD TAHUN 2023 ', '2023-07-11 04:07:13', 'DESA KAMPUNG MELAYU', NULL, 'b2b724b1771150470c83862d11eef4d0.docx');

-- --------------------------------------------------------

--
-- Table structure for table `tb_form`
--

CREATE TABLE `tb_form` (
  `id` int(11) NOT NULL,
  `tb_user_penduduk_id` int(11) NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `religion` enum('Islam','Kristen','Katolik','Hindu','Budha','Konghucu') DEFAULT NULL,
  `marital_status` enum('BELUM MENIKAH','SUDAH MENIKAH') DEFAULT NULL,
  `letter_category` varchar(255) DEFAULT 'NULL',
  `no_hp` varchar(255) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `pob` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `message` text,
  `address` text,
  `photo` varchar(255) DEFAULT NULL,
  `isChange` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `warga_negara` varchar(255) DEFAULT NULL,
  `melengkapi_persyaratan` text,
  `nama_ibu` varchar(255) DEFAULT NULL,
  `nama_ayah` varchar(255) DEFAULT NULL,
  `hari_meninggal` varchar(255) DEFAULT NULL,
  `tanggal_meninggal` varchar(255) DEFAULT NULL,
  `jam_meninggal` varchar(255) DEFAULT NULL,
  `bertempat_di` varchar(255) DEFAULT NULL,
  `keperluan` text,
  `penandatangan` varchar(255) NOT NULL,
  `opsi_ttd` enum('scan','asli') NOT NULL,
  `ttd` varchar(250) DEFAULT NULL,
  `status` enum('Menunggu Persetujuan','Di Tolak','Di Setujui','') NOT NULL,
  `pesan_admin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_form`
--

INSERT INTO `tb_form` (`id`, `tb_user_penduduk_id`, `nik`, `name`, `religion`, `marital_status`, `letter_category`, `no_hp`, `gender`, `pob`, `dob`, `job`, `message`, `address`, `photo`, `isChange`, `created_at`, `warga_negara`, `melengkapi_persyaratan`, `nama_ibu`, `nama_ayah`, `hari_meninggal`, `tanggal_meninggal`, `jam_meninggal`, `bertempat_di`, `keperluan`, `penandatangan`, `opsi_ttd`, `ttd`, `status`, `pesan_admin`) VALUES
(199, 11, '6206092910010001', 'MUHAMMAD AINUL YAKIN', 'Islam', NULL, 'surat_keterangan_tidak_mampu', '081352009802', 'L', 'Kampung Melayu', '2001-10-29', 'Mahasiswa', NULL, 'desa kampung melayu, RT 002, RW 001', '8c8b6eed4d119dfb83645434be3a00ab.jpg', 0, '2023-07-12 06:28:53', 'INDONESIA', 'Beasiswa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'asli', NULL, 'Menunggu Persetujuan', ''),
(201, 11, '131143145324', 'vaajjavavavd', 'Islam', NULL, 'surat_keterangan_tidak_mampu', '08152009802', 'L', 'qeq21121212', '2000-10-20', 'adadada', NULL, 'dadasdwd', '4984d5e6939d3025e0954695534fb3c6.jpg', 0, '2023-07-12 06:32:55', 'INDONESIA', 'dadqwdqwqw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'scan', NULL, 'Menunggu Persetujuan', ''),
(206, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_domisili', '2341354', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', '863adfb71c9c08619ae70fb19cd028e3.png', 0, '2023-07-20 06:07:32', 'Indonesia', 'sadasda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'scan', '9bf7b9212e57e0569728bd278320fd96.png', 'Di Setujui', ''),
(207, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_tidak_mampu', '21231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', 'd60178ffc4602748790082bd8d48304e.png', 0, '2023-07-21 07:38:34', 'Indonesia', 'tes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'scan', 'cfeffc91d5c7afbd12e34fe2e717dbb5.png', 'Di Setujui', ''),
(208, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_kematian', '021231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', '3df85c66994bdf82d3f4fbc6622d10b0.png', 0, '2023-07-21 07:55:15', 'Indonesia', NULL, 'ter', 'ret', 'Rabu', '2001-09-08', '09', 'jl', NULL, 'MARKASI', 'scan', '84aeaa95ce6d74876db56536926527a1.png', 'Di Setujui', ''),
(209, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_kelahiran', '021231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', '8962e0952116c1cdfae1708d8eed3cc5.png', 0, '2023-07-21 08:05:48', 'Indonesia', NULL, 'ter', 'ret', NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'scan', 'e717f7ed58d3b61f21f56e197c5c6af7.png', 'Di Setujui', ''),
(210, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_penghasilan_orang_tua', '021231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', '61c0ff119930bf5b25fb41af2c1d1d53.png', 0, '2023-07-21 08:11:35', 'Indonesia', 'ret', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'scan', '15708c722a4781a1d42d88206ec904fc.png', 'Di Setujui', ''),
(211, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_pengantar_berkelakuan_baik', '021231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', '200a74a8f69f27f61bfd7ef6332d28c7.png', 0, '2023-07-21 08:18:20', 'Indonesia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pop', 'MARKASI', 'scan', '205c6ad64ead6c24c13123a46d7ea346.png', 'Di Setujui', ''),
(212, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_pernyataan_belum_menikah', '021231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', 'a99b08a57499f67659396deeaf9aba10.png', 0, '2023-07-21 08:27:07', 'Indonesia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kulukulu', 'MARKASI', 'scan', 'fd45366ddede271c11281bfbfa58baf3.png', 'Di Setujui', ''),
(213, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_tidak_mampu', '021231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', '7a803d7500bb742b4b7e4c793ba77432.png', 0, '2023-07-21 08:33:34', 'Indonesia', 'pop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'scan', '5215531635bcf7857d1a719d5d694275.png', 'Di Setujui', 'cek'),
(214, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_tidak_mampu', '021231313212', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', 'b0d8739dbbd89c3f2f7b47f6c7f5a057.png', 0, '2023-07-21 09:06:19', 'Indonesia', 'sasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'asli', NULL, 'Di Setujui', ''),
(216, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_tidak_mampu', '2323123', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', 'e032ee348463a947b4d1923d46ea6eec.png', 0, '2023-07-21 09:45:18', 'Indonesia', 'dsaasdas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'asli', NULL, 'Di Setujui', ''),
(217, 22, '12345678', 'Testing', 'Islam', 'SUDAH MENIKAH', 'surat_keterangan_tidak_mampu', '21312312', 'L', 'Tes', '2023-07-10', 'Programmer', NULL, 'tes', '6346e458522e75ffbf6dadeeb901f8ce.png', 0, '2023-07-21 09:45:56', 'Indonesia', ' sdadsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARKASI', 'scan', NULL, 'Di Tolak', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_gallery`
--

CREATE TABLE `tb_gallery` (
  `id` int(11) NOT NULL,
  `judul` varchar(80) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gambar` varchar(255) DEFAULT NULL,
  `albumid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_gallery`
--

INSERT INTO `tb_gallery` (`id`, `judul`, `tanggal`, `gambar`, `albumid`, `userid`) VALUES
(0, 'PEMBANGUNAN GARASI', '2023-01-27 09:24:51', '192abe149466f93cd6429b32574b4cbc.jpg', 0, 0),
(1, 'A', '2019-05-09 02:29:39', '7192cef3c289d9fde5726c28354d3243.jpeg', 3, 6),
(6, 'Sambutan Camat1', '2019-05-09 02:30:01', '42be71a6af502a8cc4ffcbeb953b98c7.jpg', 1, 6),
(7, 'kkjj1', '2019-01-25 02:09:15', '035bd55b0961ee7722306e25bfdfaf1b.jpg', 3, 6),
(8, 'ewewe', '2019-01-25 02:09:30', '5b0b92075fa65e917e24074b381a0b11.jpeg', 3, 6),
(9, 'posyandu', '2023-07-07 00:39:15', '65d3adc93d5b01740410c997bf8c628f.jpeg', 8, 0),
(10, 'Pasar Rakyat Desa Kampung Melayu', '2023-07-07 02:36:11', '290dabe742e8e4699949f2f706985fdf.jpeg', 8, 0),
(11, 'desa', '2023-07-07 08:43:49', 'a5b0e3225039cc1c1ea5dd967493dcc2.jpeg', 8, 0),
(12, 'Sambutan Kepala Desa Kampung Melayu', '2023-07-07 09:06:50', '444fc20ba910b81fedce6421ca8c6b94.jpeg', 8, 0),
(13, 'foto', '2023-07-07 09:11:17', '253ff25185b27573d87cc67741bb8335.jpeg', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_identitas`
--

CREATE TABLE `tb_identitas` (
  `id` int(11) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `maps` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_identitas`
--

INSERT INTO `tb_identitas` (`id`, `favicon`, `brand`, `email`, `alamat`, `telepon`, `maps`) VALUES
(1, '4351547fd86dae1f6e97fc52e1cd150f.png', 'e6a5a2e69f82d4c9cfe2d5cc17b0c754.png', 'desakpmelayu@gmail.com', 'Desa Kampung Melayu, Kecamatan Mendawai. Kabupaten Katingan,  Kalimantan Tengah, 7443, Indonesia', '085932168906', 'https://goo.gl/maps/eNAWbzdx5MTpZ9hA9');

-- --------------------------------------------------------

--
-- Table structure for table `tb_igfeed`
--

CREATE TABLE `tb_igfeed` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `client` varchar(80) NOT NULL,
  `accestoken` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_igfeed`
--

INSERT INTO `tb_igfeed` (`id`, `userid`, `client`, `accestoken`) VALUES
(1, '12609509999', 'b3abdc2ff1fe4a928e09cdf7974abb68', '12609509999.b3abdc2.65615b2e72e148ceaeff9be08f2d1d02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenispelayanan`
--

CREATE TABLE `tb_jenispelayanan` (
  `id` int(11) NOT NULL,
  `judul` varchar(80) NOT NULL,
  `isi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `nama`) VALUES
(2, 'UMUM'),
(3, 'KHUSUS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_komentar`
--

CREATE TABLE `tb_komentar` (
  `id` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `isi` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','0') DEFAULT NULL,
  `beritaid` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_komentar`
--

INSERT INTO `tb_komentar` (`id`, `nama`, `email`, `isi`, `tanggal`, `status`, `beritaid`, `parent`) VALUES
(1, 'Seree', 'ammar.fiky@gmail.com', 'Niice', '2019-05-10 02:42:30', '1', 5, 0),
(2, 'Ammar', '', 'ty', '2019-05-10 02:42:35', '1', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `urutan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pegawai`
--

INSERT INTO `tb_pegawai` (`id`, `name`, `position`, `photo`) VALUES
(1, 'Markasi', 'Kepala Desa', '45e536a9c292d2c336495a935100839e.png'),
(2, 'Guntur Setiawan', 'Sekertaris Desa', 'c7856006aadb20ae156fc65a6e82539e.png'),
(3, 'Karyadie', 'Kaur Perencanaan', '7a0266cd1bb38992db94c048b74822eb.png'),
(4, 'Rusdiani Agustin', 'Kaur Keuangan', 'bc5e5dd3fbeba2e37df630dc8e249d3a.png'),
(5, 'Tuah Catur Wibowo', 'Kasi Kesejahteraan dan Pelayanan', 'a86c72e8e6ad576d5b8dea76c3408ea2.png'),
(6, 'Fathur Rahman', 'Kasi Pemerintahan', '8f5b4073feffaadab00b8dd4548843b1.png'),
(7, 'LUKMAN BAHTIAR', 'Kepala Desa', 'dcf8a223facaab35b131f01eca49bede.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penduduk`
--

CREATE TABLE `tb_penduduk` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `status` enum('BELUM MENIKAH','SUDAH MENIKAH') NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `kewarganegaraan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penduduk`
--

INSERT INTO `tb_penduduk` (`id`, `nik`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `agama`, `status`, `pekerjaan`, `kewarganegaraan`) VALUES
(4, '12345678', 'Testing', 'Tes', '2023-07-10', 'L', 'tes', 'Islam', 'SUDAH MENIKAH', 'Programmer', 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaduan_masyarakat`
--

CREATE TABLE `tb_pengaduan_masyarakat` (
  `id` int(11) NOT NULL,
  `user_penduduk` int(11) NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_kejadian` date NOT NULL,
  `lokasi_kejadian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_laporan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_pengaduan_masyarakat`
--

INSERT INTO `tb_pengaduan_masyarakat` (`id`, `user_penduduk`, `judul`, `isi`, `tgl_kejadian`, `lokasi_kejadian`, `kategori_laporan`, `created_at`) VALUES
(1, 0, 'fsd', 'fsdfsdf', '2023-06-09', 'fsdfasf', 'Agama', '2023-06-21 08:10:03'),
(2, 0, 'KERUSAKAN JALAN', 'mdhsdnskfsbff', '2023-07-15', 'dmdsnsfksfksbf', 'Kesehatan', '2023-07-08 03:20:47'),
(3, 0, 'KERUSAKAN JALAN', '211212121', '2023-10-20', 'Rt 03, RW, 01, Di Rumah radi', 'Topik Lainnya', '2023-07-08 03:26:51'),
(4, 0, 'pengadaan lomba 17 agustus', 'agar pihak desa dapat melaksanakan kegiatan tersebut', '2023-07-12', 'Rt 03, RW, 01, ', 'Topik Lainnya', '2023-07-12 09:16:42'),
(5, 0, 'fuqfwtfqyfw', 'sgyaguyaguys', '2023-07-29', 'ksayjjahsas', 'Topik Lainnya', '2023-07-14 01:01:48'),
(6, 22, 'tes', 'weqweqw', '2011-09-09', 'sda', 'Kesehatan', '2023-07-21 09:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaturan_layanan_surat`
--

CREATE TABLE `tb_pengaturan_layanan_surat` (
  `id` int(11) NOT NULL,
  `nama_penandatangan_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan_penandatangan_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_nip_penandatangan_surat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_pengaturan_layanan_surat`
--

INSERT INTO `tb_pengaturan_layanan_surat` (`id`, `nama_penandatangan_surat`, `jabatan_penandatangan_surat`, `nomor_nip_penandatangan_surat`) VALUES
(1, 'MARKASI', 'KEPALA DESA', '3554325');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengumuman`
--

CREATE TABLE `tb_pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `isi` text NOT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengumuman`
--

INSERT INTO `tb_pengumuman` (`id`, `judul`, `tanggal`, `userid`, `isi`, `slug`) VALUES
(0, 'GOTONG ROYONG MASYARAKAT DESA KAMPUNG MELAYU', '2023-07-06 23:02:01', 0, '<p>jadwal mengikuti disetiap hari jumat</p>\r\n', 'gotong-royong-masyarakat-desa-kampung-melayu'),
(1, '1231231231', '2023-07-13 06:11:03', 11, '<p>1ewddas</p>\r\n', '1231231231');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengunjung`
--

CREATE TABLE `tb_pengunjung` (
  `id` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(40) DEFAULT NULL,
  `perangkat` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengunjung`
--

INSERT INTO `tb_pengunjung` (`id`, `tanggal`, `ip`, `perangkat`) VALUES
(691, '2019-06-10 07:25:04', '54.36.148.176', 'Mozilla'),
(692, '2019-06-10 10:36:19', '54.36.150.171', 'Mozilla'),
(693, '2019-06-10 13:27:29', '54.36.150.2', 'Mozilla'),
(694, '2019-06-11 00:10:50', '54.36.150.143', 'Mozilla'),
(695, '2019-06-11 01:02:49', '54.36.150.101', 'Mozilla'),
(696, '2019-06-11 05:07:15', '54.36.150.161', 'Mozilla'),
(697, '2019-06-11 07:49:54', '54.36.150.189', 'Mozilla'),
(698, '2019-06-11 13:13:58', '54.36.150.150', 'Mozilla'),
(699, '2019-06-11 14:31:28', '5.255.250.41', 'YandexBot'),
(700, '2019-06-11 14:31:28', '141.8.143.183', 'YandexBot'),
(701, '2019-06-11 19:01:14', '103.253.214.20', 'Other'),
(702, '2019-06-11 21:45:25', '54.36.150.32', 'Mozilla'),
(703, '2019-06-11 22:11:27', '209.17.97.98', 'Mozilla'),
(704, '2019-06-12 06:36:54', '5.255.250.41', 'YandexBot'),
(705, '2019-06-12 07:16:28', '54.36.149.1', 'Mozilla'),
(706, '2019-06-12 18:50:40', '54.36.148.42', 'Mozilla'),
(707, '2019-06-12 19:03:22', '103.253.214.20', 'Other'),
(708, '2019-06-12 21:48:12', '54.36.150.123', 'Mozilla'),
(709, '2019-06-12 23:00:03', '54.36.150.182', 'Mozilla'),
(710, '2019-06-12 23:18:08', '178.154.244.184', 'YandexBot'),
(711, '2019-06-12 23:59:38', '141.8.143.183', 'YandexBot'),
(712, '2019-06-13 00:48:05', '54.36.150.120', 'Mozilla'),
(713, '2019-06-13 03:27:32', '54.36.150.65', 'Mozilla'),
(714, '2019-06-13 08:20:11', '51.158.98.255', 'Other'),
(715, '2019-06-13 09:48:21', '54.36.148.180', 'Mozilla'),
(716, '2019-06-13 14:52:15', '5.255.250.41', 'YandexBot'),
(717, '2019-06-13 14:59:47', '54.36.149.104', 'Mozilla'),
(718, '2019-06-13 16:17:22', '54.36.149.62', 'Mozilla'),
(719, '2019-06-13 19:08:59', '103.253.214.20', 'Other'),
(720, '2019-06-13 23:13:27', '54.36.148.232', 'Mozilla'),
(721, '2019-06-14 00:00:51', '37.9.87.203', 'YandexBot'),
(722, '2019-06-14 01:52:41', '54.36.149.97', 'Mozilla'),
(723, '2019-06-14 03:37:23', '209.17.97.26', 'Mozilla'),
(724, '2019-06-14 04:14:44', '54.36.148.211', 'Mozilla'),
(725, '2019-06-14 06:53:46', '54.36.148.22', 'Mozilla'),
(726, '2019-06-14 07:50:32', '54.36.149.88', 'Mozilla'),
(727, '2019-06-14 08:48:26', '54.36.150.30', 'Mozilla'),
(728, '2019-06-14 09:48:44', '54.36.148.33', 'Mozilla'),
(729, '2019-06-14 11:29:44', '54.36.150.101', 'Mozilla'),
(730, '2019-06-14 13:52:22', '54.36.150.116', 'Mozilla'),
(731, '2019-06-14 17:26:52', '64.246.178.34', 'Firefox'),
(732, '2019-06-14 17:39:26', '83.97.23.104', 'Edge'),
(733, '2019-06-14 18:49:24', '103.253.214.20', 'Other'),
(734, '2019-06-14 19:07:27', '209.17.97.58', 'Mozilla'),
(735, '2019-06-14 21:03:15', '54.36.150.157', 'Mozilla'),
(736, '2019-06-15 00:12:07', '54.36.150.102', 'Mozilla'),
(737, '2019-06-15 02:41:47', '54.36.150.177', 'Mozilla'),
(738, '2019-06-15 05:14:08', '54.36.150.166', 'Mozilla'),
(739, '2019-06-15 05:37:49', '54.36.150.111', 'Mozilla'),
(740, '2019-06-15 09:35:25', '54.36.150.164', 'Mozilla'),
(741, '2019-06-15 09:56:44', '54.36.150.91', 'Mozilla'),
(742, '2019-06-15 10:55:52', '54.36.149.55', 'Mozilla'),
(743, '2019-06-15 11:17:20', '5.255.250.41', 'YandexBot'),
(744, '2019-06-15 13:10:55', '54.36.150.112', 'Mozilla'),
(745, '2019-06-15 13:48:43', '141.8.143.183', 'YandexBot'),
(746, '2019-06-15 14:20:33', '54.36.149.89', 'Mozilla'),
(747, '2019-06-15 15:52:10', '31.13.190.254', 'Opera'),
(748, '2019-06-15 19:04:40', '5.255.250.41', 'YandexBot'),
(749, '2019-06-15 19:04:41', '141.8.143.183', 'YandexBot'),
(750, '2019-06-15 19:05:55', '103.253.214.20', 'Other'),
(751, '2019-06-15 19:28:23', '37.9.87.161', 'YandexBot'),
(752, '2019-06-15 20:26:46', '54.36.148.212', 'Mozilla'),
(753, '2019-06-15 23:34:02', '54.36.150.31', 'Mozilla'),
(754, '2019-06-16 05:55:04', '51.158.98.255', 'Other'),
(755, '2019-06-16 15:13:53', '54.36.148.209', 'Mozilla'),
(756, '2019-06-16 16:47:34', '91.121.171.104', 'Other'),
(757, '2019-06-16 19:05:32', '103.253.214.20', 'Other'),
(758, '2019-06-16 20:26:24', '54.36.149.99', 'Mozilla'),
(759, '2019-06-16 21:28:50', '54.36.148.154', 'Mozilla'),
(760, '2019-06-17 00:35:05', '54.36.149.26', 'Mozilla'),
(761, '2019-06-17 05:11:40', '54.36.150.76', 'Mozilla'),
(762, '2019-06-17 06:47:07', '54.36.150.38', 'Mozilla'),
(763, '2019-06-17 08:54:05', '54.36.148.37', 'Mozilla'),
(764, '2019-06-17 18:33:58', '5.255.250.41', 'YandexBot'),
(765, '2019-06-17 18:34:00', '141.8.143.183', 'YandexBot'),
(766, '2019-06-17 19:08:48', '103.253.214.20', 'Other'),
(767, '2019-06-17 19:36:59', '54.36.150.177', 'Mozilla'),
(768, '2019-06-18 03:23:02', '54.36.148.177', 'Mozilla'),
(769, '2019-06-18 19:05:51', '103.253.214.20', 'Other'),
(770, '2019-06-18 22:44:52', '54.36.149.84', 'Mozilla'),
(771, '2019-06-19 00:32:25', '5.255.250.41', 'YandexBot'),
(772, '2019-06-19 05:07:49', '54.169.131.185', 'Other'),
(773, '2019-06-19 05:48:18', '209.17.96.226', 'Mozilla'),
(774, '2019-06-19 07:44:28', '209.17.97.74', 'Mozilla'),
(775, '2019-06-19 09:50:03', '54.36.148.160', 'Mozilla'),
(776, '2019-06-19 13:21:57', '209.17.96.10', 'Mozilla'),
(777, '2019-06-19 19:10:16', '103.253.214.20', 'Other'),
(778, '2019-06-19 23:50:56', '54.36.150.59', 'Mozilla'),
(779, '2019-06-20 01:59:42', '54.36.150.58', 'Mozilla'),
(780, '2019-06-20 02:49:01', '54.36.150.81', 'Mozilla'),
(781, '2019-06-20 15:11:16', '163.172.154.242', 'Other'),
(782, '2019-06-20 15:13:48', '54.36.150.84', 'Mozilla'),
(783, '2019-06-20 16:50:22', '54.36.148.167', 'Mozilla'),
(784, '2019-06-20 19:05:37', '103.253.214.20', 'Other'),
(785, '2019-06-20 22:22:19', '54.36.150.11', 'Mozilla'),
(786, '2019-06-21 00:46:03', '5.255.250.41', 'YandexBot'),
(787, '2019-06-21 00:46:04', '141.8.143.183', 'YandexBot'),
(788, '2019-06-21 07:45:34', '54.36.150.63', 'Mozilla'),
(789, '2019-06-21 11:49:52', '54.36.150.88', 'Mozilla'),
(790, '2019-06-21 12:58:12', '209.17.96.210', 'Mozilla'),
(791, '2019-06-21 13:59:51', '209.17.97.122', 'Mozilla'),
(792, '2019-06-21 18:18:56', '54.36.150.155', 'Mozilla'),
(793, '2019-06-21 19:07:35', '103.253.214.20', 'Other'),
(794, '2019-06-22 06:42:30', '54.36.150.120', 'Mozilla'),
(795, '2019-06-22 09:03:59', '54.36.148.43', 'Mozilla'),
(796, '2019-06-22 15:16:36', '54.36.150.168', 'Mozilla'),
(797, '2019-06-22 15:41:33', '54.36.148.115', 'Mozilla'),
(798, '2019-06-22 16:36:36', '54.36.149.103', 'Mozilla'),
(799, '2019-06-22 17:39:28', '209.17.97.50', 'Mozilla'),
(800, '2019-06-22 18:03:12', '54.36.148.110', 'Mozilla'),
(801, '2019-06-22 19:08:51', '103.253.214.20', 'Other'),
(802, '2019-06-22 20:44:01', '54.36.148.163', 'Mozilla'),
(803, '2019-06-22 22:21:04', '5.255.250.41', 'YandexBot'),
(804, '2019-06-22 22:21:04', '141.8.143.183', 'YandexBot'),
(805, '2019-06-23 04:52:50', '54.36.150.108', 'Mozilla'),
(806, '2019-06-23 05:46:49', '54.36.150.20', 'Mozilla'),
(807, '2019-06-23 06:02:18', '46.105.99.163', 'Firefox'),
(808, '2019-06-23 06:55:02', '54.36.148.185', 'Mozilla'),
(809, '2019-06-23 08:09:24', '54.36.150.91', 'Mozilla'),
(810, '2019-06-23 12:26:10', '54.36.150.90', 'Mozilla'),
(811, '2019-06-23 16:46:28', '54.36.149.64', 'Mozilla'),
(812, '2019-06-23 19:09:28', '103.253.214.20', 'Other'),
(813, '2019-06-23 19:13:53', '185.253.96.140', 'Opera'),
(814, '2019-06-23 23:09:22', '54.36.148.155', 'Mozilla'),
(815, '2019-06-23 23:27:29', '54.36.150.84', 'Mozilla'),
(816, '2019-06-23 23:31:16', '54.36.148.141', 'Mozilla'),
(817, '2019-06-24 02:57:49', '54.36.150.34', 'Mozilla'),
(818, '2019-06-24 08:35:22', '5.255.250.145', 'YandexBot'),
(819, '2019-06-24 13:47:22', '5.255.250.41', 'YandexBot'),
(820, '2019-06-24 14:11:27', '87.101.94.126', 'Chrome'),
(821, '2019-06-24 17:42:06', '54.36.150.161', 'Mozilla'),
(822, '2019-06-24 19:06:21', '103.253.214.20', 'Other'),
(823, '2019-06-24 20:16:41', '209.17.96.26', 'Mozilla'),
(824, '2019-06-24 21:56:21', '5.255.250.41', 'YandexBot'),
(825, '2019-06-24 23:55:33', '141.8.143.183', 'YandexBot'),
(826, '2019-06-25 01:21:50', '54.36.150.95', 'Mozilla'),
(827, '2019-06-25 02:03:53', '54.36.148.216', 'Mozilla'),
(828, '2019-06-25 06:01:21', '54.36.150.115', 'Mozilla'),
(829, '2019-06-25 06:30:53', '54.36.150.91', 'Mozilla'),
(830, '2019-06-25 06:38:56', '209.17.97.42', 'Mozilla'),
(831, '2019-06-25 13:15:56', '85.206.165.3', 'Chrome'),
(832, '2019-06-25 14:46:57', '54.36.148.234', 'Mozilla'),
(833, '2019-06-25 16:47:13', '54.36.148.42', 'Mozilla'),
(834, '2019-06-25 19:55:30', '103.253.214.20', 'Other'),
(835, '2019-06-25 21:31:00', '54.36.150.116', 'Mozilla'),
(836, '2019-06-26 00:21:00', '209.17.97.66', 'Mozilla'),
(837, '2019-06-26 01:35:27', '54.36.150.163', 'Mozilla'),
(838, '2019-06-26 03:33:27', '54.36.150.58', 'Mozilla'),
(839, '2019-06-26 06:29:54', '54.36.150.61', 'Mozilla'),
(840, '2019-06-26 07:09:39', '54.36.149.23', 'Mozilla'),
(841, '2019-06-26 12:23:29', '54.36.149.46', 'Mozilla'),
(842, '2019-06-26 15:17:31', '54.36.148.53', 'Mozilla'),
(843, '2019-06-26 15:27:01', '54.36.148.242', 'Mozilla'),
(844, '2019-06-26 16:03:21', '54.36.149.13', 'Mozilla'),
(845, '2019-06-26 16:05:41', '54.36.148.25', 'Mozilla'),
(846, '2019-06-26 16:06:13', '54.157.173.91', 'Chrome'),
(847, '2019-06-26 17:27:30', '209.17.97.106', 'Mozilla'),
(848, '2019-06-26 19:36:54', '5.255.250.41', 'YandexBot'),
(849, '2019-06-26 20:19:06', '185.217.71.134', 'Opera'),
(850, '2019-06-26 21:05:36', '54.36.150.12', 'Mozilla'),
(851, '2019-06-27 02:19:46', '120.188.86.242', 'Chrome'),
(852, '2019-06-27 08:12:01', '54.36.148.157', 'Mozilla'),
(853, '2019-06-27 11:58:32', '34.222.212.37', 'Other'),
(854, '2019-06-27 13:20:17', '18.237.98.142', 'Chrome'),
(855, '2019-06-27 14:49:43', '52.26.182.49', 'Other'),
(856, '2019-06-27 15:05:53', '54.36.148.221', 'Mozilla'),
(857, '2019-06-27 16:00:40', '52.39.89.61', 'Firefox'),
(858, '2019-06-27 19:25:52', '209.17.96.202', 'Mozilla'),
(859, '2019-06-27 19:26:04', '54.36.148.149', 'Mozilla'),
(860, '2019-06-27 20:10:41', '54.36.148.244', 'Mozilla'),
(861, '2019-06-27 23:41:09', '5.255.250.41', 'YandexBot'),
(862, '2019-06-27 23:41:10', '141.8.143.183', 'YandexBot'),
(863, '2019-06-28 00:58:53', '54.36.150.7', 'Mozilla'),
(864, '2019-06-28 02:36:03', '54.36.148.183', 'Mozilla'),
(865, '2019-06-28 03:04:31', '54.36.148.80', 'Mozilla'),
(866, '2019-06-28 06:50:48', '64.233.173.162', 'Chrome'),
(867, '2019-06-28 06:50:53', '36.72.219.15', 'Chrome'),
(868, '2019-06-28 06:51:27', '64.233.173.190', 'Chrome'),
(869, '2019-06-28 06:52:23', '64.233.173.165', 'Chrome'),
(870, '2019-06-28 12:13:57', '54.36.150.120', 'Mozilla'),
(871, '2019-06-28 16:41:02', '54.36.148.63', 'Mozilla'),
(872, '2019-06-28 17:29:55', '34.221.102.191', 'Chrome'),
(873, '2019-06-28 17:58:41', '54.36.148.238', 'Mozilla'),
(874, '2019-06-28 18:34:31', '54.36.150.44', 'Mozilla'),
(875, '2019-06-28 18:48:52', '163.172.151.47', 'Other'),
(876, '2019-06-28 19:08:43', '103.253.214.20', 'Other'),
(877, '2019-06-29 04:15:19', '54.36.148.198', 'Mozilla'),
(878, '2019-06-29 06:16:29', '54.36.149.42', 'Mozilla'),
(879, '2019-06-29 06:32:46', '54.36.150.28', 'Mozilla'),
(880, '2019-06-29 09:08:26', '54.36.149.84', 'Mozilla'),
(881, '2019-06-29 11:02:01', '209.17.97.66', 'Mozilla'),
(882, '2019-06-29 17:03:17', '18.237.95.46', 'Chrome'),
(883, '2019-06-29 19:05:14', '103.253.214.20', 'Other'),
(884, '2019-06-29 23:41:03', '212.83.146.233', 'Firefox'),
(885, '2019-06-29 23:41:06', '62.4.14.206', 'Firefox'),
(886, '2019-06-30 01:25:46', '195.154.61.206', 'Firefox'),
(887, '2019-06-30 01:25:49', '62.4.14.198', 'Firefox'),
(888, '2019-06-30 04:40:53', '54.36.148.25', 'Mozilla'),
(889, '2019-06-30 06:38:47', '54.36.150.130', 'Mozilla'),
(890, '2019-06-30 08:10:04', '173.252.95.3', 'Chrome'),
(891, '2019-06-30 08:10:11', '173.252.95.20', 'Chrome'),
(892, '2019-06-30 12:55:00', '185.93.3.114', 'Chrome'),
(893, '2019-06-30 18:09:46', '52.40.199.84', 'Chrome'),
(894, '2019-06-30 18:32:33', '34.222.96.170', 'Safari'),
(895, '2019-06-30 19:05:35', '103.253.214.20', 'Other'),
(896, '2019-06-30 22:09:40', '51.255.109.160', 'Firefox'),
(897, '2019-06-30 22:09:47', '51.255.109.170', 'Firefox'),
(898, '2019-07-01 01:55:54', '54.36.150.174', 'Mozilla'),
(899, '2019-07-01 02:08:29', '54.36.150.179', 'Mozilla'),
(900, '2019-07-01 02:57:57', '54.36.150.183', 'Mozilla'),
(901, '2019-07-01 03:37:46', '54.36.150.20', 'Mozilla'),
(902, '2019-07-01 07:25:39', '173.252.95.19', 'Chrome'),
(903, '2019-07-01 07:25:47', '173.252.95.14', 'Chrome'),
(904, '2019-07-01 07:59:19', '54.36.148.52', 'Mozilla'),
(905, '2019-07-01 11:13:47', '54.36.148.117', 'Mozilla'),
(906, '2019-07-01 17:57:03', '54.213.75.233', 'Chrome'),
(907, '2019-07-01 18:01:51', '5.255.250.41', 'YandexBot'),
(908, '2019-07-01 18:08:29', '54.36.150.160', 'Mozilla'),
(909, '2019-07-01 19:09:43', '103.253.214.20', 'Other'),
(910, '2019-07-02 02:16:03', '51.255.109.161', 'Firefox'),
(911, '2019-07-02 02:16:19', '51.255.109.171', 'Firefox'),
(912, '2019-07-02 02:53:22', '54.36.148.132', 'Mozilla'),
(913, '2019-07-02 04:12:43', '54.36.150.0', 'Mozilla'),
(914, '2019-07-02 04:45:00', '54.36.149.94', 'Mozilla'),
(915, '2019-07-02 05:27:31', '54.36.150.10', 'Mozilla'),
(916, '2019-07-02 08:38:01', '54.36.150.110', 'Mozilla'),
(917, '2019-07-02 08:49:55', '54.36.150.34', 'Mozilla'),
(918, '2019-07-02 09:46:17', '54.36.148.198', 'Mozilla'),
(919, '2019-07-02 10:09:33', '54.36.148.156', 'Mozilla'),
(920, '2019-07-02 10:23:47', '54.36.149.66', 'Mozilla'),
(921, '2019-07-02 10:24:50', '54.36.148.200', 'Mozilla'),
(922, '2019-07-02 10:31:56', '54.36.148.47', 'Mozilla'),
(923, '2019-07-02 10:42:36', '54.36.149.67', 'Mozilla'),
(924, '2019-07-02 10:45:01', '54.36.150.4', 'Mozilla'),
(925, '2019-07-02 12:09:07', '54.36.150.166', 'Mozilla'),
(926, '2019-07-02 12:12:08', '54.36.148.120', 'Mozilla'),
(927, '2019-07-02 13:09:24', '54.36.150.184', 'Mozilla'),
(928, '2019-07-02 14:47:15', '54.36.150.77', 'Mozilla'),
(929, '2019-07-02 14:50:07', '54.36.148.54', 'Mozilla'),
(930, '2019-07-02 15:09:39', '54.202.133.21', 'Other'),
(931, '2019-07-02 15:22:54', '34.216.65.15', 'Chrome'),
(932, '2019-07-02 15:47:49', '54.36.150.72', 'Mozilla'),
(933, '2019-07-02 15:56:45', '54.36.148.74', 'Mozilla'),
(934, '2019-07-02 17:04:30', '54.36.148.150', 'Mozilla'),
(935, '2019-07-02 18:01:43', '54.36.150.10', 'Mozilla'),
(936, '2019-07-02 18:21:18', '163.172.76.63', 'Other'),
(937, '2019-07-02 19:07:40', '103.253.214.20', 'Other'),
(938, '2019-07-02 19:09:03', '54.36.148.205', 'Mozilla'),
(939, '2019-07-02 19:20:57', '54.36.148.25', 'Mozilla'),
(940, '2019-07-02 19:32:16', '54.36.148.234', 'Mozilla'),
(941, '2019-07-02 20:08:35', '54.36.148.242', 'Mozilla'),
(942, '2019-07-02 21:10:07', '54.36.148.63', 'Mozilla'),
(943, '2019-07-02 21:45:43', '54.36.148.18', 'Mozilla'),
(944, '2019-07-02 23:46:09', '34.215.173.183', 'Chrome'),
(945, '2019-07-03 00:06:23', '54.36.148.24', 'Mozilla'),
(946, '2019-07-03 02:33:27', '54.36.150.31', 'Mozilla'),
(947, '2019-07-03 02:53:30', '54.36.150.123', 'Mozilla'),
(948, '2019-07-03 05:48:49', '209.17.97.42', 'Mozilla'),
(949, '2019-07-03 06:28:29', '54.36.148.110', 'Mozilla'),
(950, '2019-07-03 07:11:00', '54.36.149.84', 'Mozilla'),
(951, '2019-07-03 08:01:21', '54.36.149.34', 'Mozilla'),
(952, '2019-07-03 09:07:56', '54.36.150.84', 'Mozilla'),
(953, '2019-07-03 10:37:48', '54.36.148.111', 'Mozilla'),
(954, '2019-07-03 11:44:23', '54.36.149.50', 'Mozilla'),
(955, '2019-07-03 12:09:19', '54.36.150.80', 'Mozilla'),
(956, '2019-07-03 12:26:56', '54.36.150.152', 'Mozilla'),
(957, '2019-07-03 13:12:16', '54.149.229.209', 'Chrome'),
(958, '2019-07-03 17:07:47', '167.71.186.45', 'Mozilla'),
(959, '2019-07-03 17:50:08', '54.36.148.11', 'Mozilla'),
(960, '2019-07-03 18:06:27', '54.36.150.39', 'Mozilla'),
(961, '2019-07-03 18:41:24', '54.36.150.138', 'Mozilla'),
(962, '2019-07-03 19:08:16', '103.253.214.20', 'Other'),
(963, '2019-07-03 21:50:38', '54.36.149.30', 'Mozilla'),
(964, '2019-07-03 22:31:37', '54.36.148.135', 'Mozilla'),
(965, '2019-07-03 23:45:50', '141.8.143.183', 'YandexBot'),
(966, '2019-07-03 23:45:51', '5.255.250.41', 'YandexBot'),
(967, '2019-07-04 02:40:15', '54.36.149.34', 'Mozilla'),
(968, '2019-07-04 03:32:49', '54.36.150.42', 'Mozilla'),
(969, '2019-07-04 04:56:28', '54.36.150.113', 'Mozilla'),
(970, '2019-07-04 07:09:03', '54.36.150.67', 'Mozilla'),
(971, '2019-07-04 08:41:29', '54.36.148.186', 'Mozilla'),
(972, '2019-07-04 10:47:04', '54.36.150.152', 'Mozilla'),
(973, '2019-07-04 11:35:22', '54.36.150.166', 'Mozilla'),
(974, '2019-07-04 12:16:58', '185.93.3.114', 'Opera'),
(975, '2019-07-04 12:26:36', '54.36.150.56', 'Mozilla'),
(976, '2019-07-04 14:16:49', '167.71.182.16', 'Mozilla'),
(977, '2019-07-04 14:53:30', '34.217.21.8', 'Chrome'),
(978, '2019-07-04 17:48:43', '54.36.150.79', 'Mozilla'),
(979, '2019-07-04 18:03:16', '54.36.150.86', 'Mozilla'),
(980, '2019-07-04 18:25:33', '54.36.150.21', 'Mozilla'),
(981, '2019-07-04 19:07:50', '54.36.148.177', 'Mozilla'),
(982, '2019-07-04 19:07:57', '103.253.214.20', 'Other'),
(983, '2019-07-04 19:46:42', '54.36.150.62', 'Mozilla'),
(984, '2019-07-04 20:23:55', '54.36.150.160', 'Mozilla'),
(985, '2019-07-04 21:30:40', '209.17.97.50', 'Mozilla'),
(986, '2019-07-04 21:36:13', '54.36.148.89', 'Mozilla'),
(987, '2019-07-04 21:47:16', '54.36.150.50', 'Mozilla'),
(988, '2019-07-04 23:17:09', '54.36.150.41', 'Mozilla'),
(989, '2019-07-04 23:38:39', '54.36.148.223', 'Mozilla'),
(990, '2019-07-05 00:03:36', '54.36.148.94', 'Mozilla'),
(991, '2019-07-05 01:30:35', '54.36.150.1', 'Mozilla'),
(992, '2019-07-05 01:30:49', '134.209.170.193', 'Mozilla'),
(993, '2019-07-05 01:53:36', '54.36.148.19', 'Mozilla'),
(994, '2019-07-05 03:13:57', '54.36.150.40', 'Mozilla'),
(995, '2019-07-05 03:41:34', '54.36.149.10', 'Mozilla'),
(996, '2019-07-05 04:51:23', '54.36.148.211', 'Mozilla'),
(997, '2019-07-05 06:05:25', '209.17.97.42', 'Mozilla'),
(998, '2019-07-05 06:38:16', '54.36.148.165', 'Mozilla'),
(999, '2019-07-05 06:49:03', '54.36.149.3', 'Mozilla'),
(1000, '2019-07-05 11:31:21', '54.36.150.7', 'Mozilla'),
(1001, '2019-07-05 13:08:59', '54.36.148.32', 'Mozilla'),
(1002, '2019-07-05 17:02:08', '54.36.148.106', 'Mozilla'),
(1003, '2019-07-05 17:07:05', '54.36.150.165', 'Mozilla'),
(1004, '2019-07-05 18:18:35', '35.160.188.134', 'Chrome'),
(1005, '2019-07-05 19:11:36', '103.253.214.20', 'Other'),
(1006, '2019-07-05 19:18:57', '54.36.150.45', 'Mozilla'),
(1007, '2019-07-05 20:51:37', '54.36.150.38', 'Mozilla'),
(1008, '2019-07-05 22:43:12', '54.36.150.153', 'Mozilla'),
(1009, '2019-07-06 00:30:28', '54.36.148.135', 'Mozilla'),
(1010, '2019-07-06 01:16:20', '18.195.49.161', 'Other'),
(1011, '2019-07-06 01:43:31', '54.36.148.70', 'Mozilla'),
(1012, '2019-07-06 02:36:34', '54.36.150.134', 'Mozilla'),
(1013, '2019-07-06 03:36:59', '54.36.148.95', 'Mozilla'),
(1014, '2019-07-06 04:27:04', '54.36.150.49', 'Mozilla'),
(1015, '2019-07-06 05:06:23', '54.36.150.79', 'Mozilla'),
(1016, '2019-07-06 05:08:04', '209.17.97.10', 'Mozilla'),
(1017, '2019-07-06 09:35:19', '66.220.149.29', 'Edge'),
(1018, '2019-07-06 09:35:27', '66.220.149.17', 'Edge'),
(1019, '2019-07-06 10:47:35', '54.36.150.70', 'Mozilla'),
(1020, '2019-07-06 11:59:06', '54.36.150.161', 'Mozilla'),
(1021, '2019-07-06 12:40:24', '54.36.148.77', 'Mozilla'),
(1022, '2019-07-06 12:55:39', '54.36.150.16', 'Mozilla'),
(1023, '2019-07-06 13:27:30', '54.36.150.56', 'Mozilla'),
(1024, '2019-07-06 13:53:53', '54.36.148.151', 'Mozilla'),
(1025, '2019-07-06 14:40:10', '54.36.150.14', 'Mozilla'),
(1026, '2019-07-06 15:01:50', '54.36.150.90', 'Mozilla'),
(1027, '2019-07-06 16:04:40', '54.36.150.77', 'Mozilla'),
(1028, '2019-07-06 18:00:15', '54.36.149.107', 'Mozilla'),
(1029, '2019-07-06 18:17:22', '54.36.150.0', 'Mozilla'),
(1030, '2019-07-06 18:39:29', '54.36.148.27', 'Mozilla'),
(1031, '2019-07-06 19:04:32', '54.36.150.191', 'Mozilla'),
(1032, '2019-07-06 19:08:45', '103.253.214.20', 'Other'),
(1033, '2019-07-06 19:10:41', '5.255.250.41', 'YandexBot'),
(1034, '2019-07-06 19:41:43', '185.93.180.238', 'Chrome'),
(1035, '2019-07-06 21:10:59', '64.246.187.42', 'Firefox'),
(1036, '2019-07-06 21:47:50', '34.213.187.239', 'Chrome'),
(1037, '2019-07-07 01:00:29', '182.0.175.62', 'Chrome'),
(1038, '2019-07-07 01:01:34', '101.89.239.230', 'Safari'),
(1039, '2019-07-07 01:04:31', '61.129.6.251', 'Chrome'),
(1040, '2019-07-07 01:04:31', '58.247.206.153', 'Chrome'),
(1041, '2019-07-07 06:49:06', '54.36.150.92', 'Mozilla'),
(1042, '2019-07-07 07:02:16', '54.36.148.223', 'Mozilla'),
(1043, '2019-07-07 07:02:30', '54.36.149.55', 'Mozilla'),
(1044, '2019-07-07 09:09:31', '54.36.150.132', 'Mozilla'),
(1045, '2019-07-07 09:23:43', '54.36.150.60', 'Mozilla'),
(1046, '2019-07-07 10:38:05', '54.36.148.250', 'Mozilla'),
(1047, '2019-07-07 11:26:52', '54.36.149.48', 'Mozilla'),
(1048, '2019-07-07 11:44:30', '54.36.148.90', 'Mozilla'),
(1049, '2019-07-07 12:38:32', '54.36.150.29', 'Mozilla'),
(1050, '2019-07-07 15:15:06', '54.36.150.34', 'Mozilla'),
(1051, '2019-07-07 15:53:40', '54.36.148.62', 'Mozilla'),
(1052, '2019-07-07 16:47:58', '34.221.186.43', 'Other'),
(1053, '2019-07-07 17:01:17', '54.36.150.183', 'Mozilla'),
(1054, '2019-07-07 18:40:08', '18.236.64.229', 'Chrome'),
(1055, '2019-07-07 19:05:46', '103.253.214.20', 'Other'),
(1056, '2019-07-07 19:09:57', '54.36.148.202', 'Mozilla'),
(1057, '2019-07-07 20:45:47', '54.36.148.96', 'Mozilla'),
(1058, '2019-07-07 22:04:06', '54.36.149.60', 'Mozilla'),
(1059, '2019-07-07 22:14:29', '54.36.148.184', 'Mozilla'),
(1060, '2019-07-07 23:56:31', '103.87.78.122', 'Other'),
(1061, '2019-07-08 00:36:25', '54.36.148.247', 'Mozilla'),
(1062, '2019-07-08 03:56:34', '54.36.150.83', 'Mozilla'),
(1063, '2019-07-08 05:27:29', '54.36.148.25', 'Mozilla'),
(1064, '2019-07-08 05:53:56', '54.36.149.35', 'Mozilla'),
(1065, '2019-07-08 07:04:24', '185.216.33.164', 'Opera'),
(1066, '2019-07-08 07:07:48', '54.36.149.45', 'Mozilla'),
(1067, '2019-07-08 07:32:27', '54.36.150.26', 'Mozilla'),
(1068, '2019-07-08 09:02:43', '54.36.150.100', 'Mozilla'),
(1069, '2019-07-08 09:19:13', '54.36.150.142', 'Mozilla'),
(1070, '2019-07-08 09:20:22', '54.36.150.149', 'Mozilla'),
(1071, '2019-07-08 10:25:07', '54.36.150.75', 'Mozilla'),
(1072, '2019-07-08 10:35:24', '54.36.148.120', 'Mozilla'),
(1073, '2019-07-08 11:20:49', '54.36.149.52', 'Mozilla'),
(1074, '2019-07-08 11:35:27', '54.36.150.154', 'Mozilla'),
(1075, '2019-07-08 12:23:16', '54.36.148.124', 'Mozilla'),
(1076, '2019-07-08 12:57:00', '54.36.150.124', 'Mozilla'),
(1077, '2019-07-08 13:19:24', '54.36.149.85', 'Mozilla'),
(1078, '2019-07-08 13:42:24', '54.36.149.100', 'Mozilla'),
(1079, '2019-07-08 14:32:18', '54.36.150.51', 'Mozilla'),
(1080, '2019-07-08 14:57:22', '54.36.150.116', 'Mozilla'),
(1081, '2019-07-08 15:54:39', '34.211.229.149', 'Chrome'),
(1082, '2019-07-08 16:08:25', '54.36.148.52', 'Mozilla'),
(1083, '2019-07-08 16:22:46', '54.36.149.91', 'Mozilla'),
(1084, '2019-07-08 16:28:32', '54.36.150.167', 'Mozilla'),
(1085, '2019-07-08 16:49:24', '54.36.148.141', 'Mozilla'),
(1086, '2019-07-08 17:02:20', '54.36.149.36', 'Mozilla'),
(1087, '2019-07-08 17:06:09', '54.36.148.204', 'Mozilla'),
(1088, '2019-07-08 19:07:00', '103.253.214.20', 'Other'),
(1089, '2019-07-08 19:37:39', '141.8.143.183', 'YandexBot'),
(1090, '2019-07-08 19:37:39', '5.255.250.41', 'YandexBot'),
(1091, '2019-07-08 21:43:45', '54.36.148.53', 'Mozilla'),
(1092, '2019-07-08 21:49:20', '54.36.150.127', 'Mozilla'),
(1093, '2019-07-08 22:03:12', '54.36.150.13', 'Mozilla'),
(1094, '2019-07-08 22:59:44', '54.36.150.87', 'Mozilla'),
(1095, '2019-07-08 23:12:36', '54.36.148.15', 'Mozilla'),
(1096, '2019-07-08 23:14:32', '54.36.150.188', 'Mozilla'),
(1097, '2019-07-08 23:49:14', '54.36.148.246', 'Mozilla'),
(1098, '2019-07-09 00:02:02', '54.36.149.24', 'Mozilla'),
(1099, '2019-07-09 00:18:40', '54.36.150.186', 'Mozilla'),
(1100, '2019-07-09 01:03:49', '54.36.148.196', 'Mozilla'),
(1101, '2019-07-09 01:10:32', '54.36.150.94', 'Mozilla'),
(1102, '2019-07-09 01:30:53', '54.36.148.200', 'Mozilla'),
(1103, '2019-07-09 01:31:50', '54.36.150.95', 'Mozilla'),
(1104, '2019-07-09 02:33:48', '209.17.97.66', 'Mozilla'),
(1105, '2019-07-09 03:06:14', '54.36.150.152', 'Mozilla'),
(1106, '2019-07-09 03:49:13', '54.36.150.162', 'Mozilla'),
(1107, '2019-07-09 03:51:40', '54.36.149.89', 'Mozilla'),
(1108, '2019-07-09 06:20:56', '54.36.150.114', 'Mozilla'),
(1109, '2019-07-09 07:01:40', '54.36.150.54', 'Mozilla'),
(1110, '2019-07-09 09:33:31', '54.36.150.56', 'Mozilla'),
(1111, '2019-07-09 14:00:45', '54.36.148.255', 'Mozilla'),
(1112, '2019-07-09 14:33:19', '34.223.252.106', 'Chrome'),
(1113, '2019-07-09 15:04:27', '91.121.222.157', 'Chrome'),
(1114, '2019-07-09 15:09:43', '54.36.150.104', 'Mozilla'),
(1115, '2019-07-09 16:19:48', '54.36.150.136', 'Mozilla'),
(1116, '2019-07-09 18:00:35', '54.36.150.185', 'Mozilla'),
(1117, '2019-07-09 18:17:00', '54.36.148.100', 'Mozilla'),
(1118, '2019-07-09 19:08:20', '103.253.214.20', 'Other'),
(1119, '2019-07-09 20:08:06', '54.36.150.120', 'Mozilla'),
(1120, '2019-07-09 21:50:31', '54.36.150.141', 'Mozilla'),
(1121, '2019-07-09 22:09:03', '114.4.218.86', 'Chrome'),
(1122, '2019-07-09 23:52:40', '54.36.148.224', 'Mozilla'),
(1123, '2019-07-10 00:58:13', '54.36.148.109', 'Mozilla'),
(1124, '2019-07-10 04:36:17', '54.36.148.194', 'Mozilla'),
(1125, '2019-07-10 05:04:10', '54.36.148.178', 'Mozilla'),
(1126, '2019-07-10 06:17:35', '54.36.148.217', 'Mozilla'),
(1127, '2019-07-10 06:30:13', '54.36.149.11', 'Mozilla'),
(1128, '2019-07-10 06:45:54', '54.36.148.104', 'Mozilla'),
(1129, '2019-07-10 07:59:11', '54.36.150.26', 'Mozilla'),
(1130, '2019-07-10 08:02:54', '54.36.148.182', 'Mozilla'),
(1131, '2019-07-10 09:13:55', '54.36.150.48', 'Mozilla'),
(1132, '2019-07-10 10:38:28', '54.36.150.83', 'Mozilla'),
(1133, '2019-07-10 10:41:07', '54.36.150.43', 'Mozilla'),
(1134, '2019-07-10 15:13:27', '54.36.150.190', 'Mozilla'),
(1135, '2019-07-10 15:14:30', '54.36.149.2', 'Mozilla'),
(1136, '2019-07-10 17:12:55', '54.36.149.22', 'Mozilla'),
(1137, '2019-07-10 17:46:20', '54.36.150.147', 'Mozilla'),
(1138, '2019-07-10 18:04:35', '54.36.150.41', 'Mozilla'),
(1139, '2019-07-10 18:23:22', '35.166.118.140', 'Chrome'),
(1140, '2019-07-10 18:58:18', '54.36.148.196', 'Mozilla'),
(1141, '2019-07-10 19:11:08', '103.253.214.20', 'Other'),
(1142, '2019-07-10 19:31:51', '37.9.87.161', 'YandexBot'),
(1143, '2019-07-10 19:31:52', '37.9.87.203', 'YandexBot'),
(1144, '2019-07-10 19:31:52', '93.158.161.27', 'YandexBot'),
(1145, '2019-07-10 19:36:05', '54.36.150.187', 'Mozilla'),
(1146, '2019-07-10 22:12:09', '54.36.148.108', 'Mozilla'),
(1147, '2019-07-10 23:25:01', '54.36.148.66', 'Mozilla'),
(1148, '2019-07-10 23:50:04', '54.36.150.30', 'Mozilla'),
(1149, '2019-07-11 00:48:17', '54.36.150.61', 'Mozilla'),
(1150, '2019-07-11 01:00:55', '120.188.85.205', 'Chrome'),
(1151, '2019-07-11 02:11:59', '54.36.150.51', 'Mozilla'),
(1152, '2019-07-11 04:06:07', '54.36.150.72', 'Mozilla'),
(1153, '2019-07-11 06:38:53', '54.36.150.142', 'Mozilla'),
(1154, '2019-07-11 07:10:36', '54.36.150.86', 'Mozilla'),
(1155, '2019-07-11 09:40:17', '54.36.149.29', 'Mozilla'),
(1156, '2019-07-11 10:49:44', '54.36.149.75', 'Mozilla'),
(1157, '2019-07-11 12:46:20', '54.36.149.30', 'Mozilla'),
(1158, '2019-07-11 15:11:44', '54.36.150.8', 'Mozilla'),
(1159, '2019-07-11 15:38:18', '54.36.148.42', 'Mozilla'),
(1160, '2019-07-11 16:53:19', '54.36.150.94', 'Mozilla'),
(1161, '2019-07-11 19:00:50', '54.36.148.36', 'Mozilla'),
(1162, '2019-07-11 19:07:00', '54.36.150.20', 'Mozilla'),
(1163, '2019-07-11 19:43:23', '54.36.148.73', 'Mozilla'),
(1164, '2019-07-11 20:10:07', '54.184.72.10', 'Chrome'),
(1165, '2019-07-11 20:46:23', '54.36.150.144', 'Mozilla'),
(1166, '2019-07-11 22:45:02', '54.36.149.69', 'Mozilla'),
(1167, '2019-07-11 22:52:25', '54.36.148.62', 'Mozilla'),
(1168, '2019-07-12 00:54:59', '54.36.148.175', 'Mozilla'),
(1169, '2019-07-12 00:56:30', '54.36.149.64', 'Mozilla'),
(1170, '2019-07-12 00:59:16', '54.36.148.144', 'Mozilla'),
(1171, '2019-07-12 02:06:00', '54.36.150.5', 'Mozilla'),
(1172, '2019-07-12 02:35:07', '54.36.150.107', 'Mozilla'),
(1173, '2019-07-12 02:42:43', '54.36.148.246', 'Mozilla'),
(1174, '2019-07-12 03:13:27', '54.36.150.160', 'Mozilla'),
(1175, '2019-07-12 03:31:49', '54.36.150.176', 'Mozilla'),
(1176, '2019-07-12 04:33:33', '54.36.150.101', 'Mozilla'),
(1177, '2019-07-12 09:06:12', '209.17.97.42', 'Mozilla'),
(1178, '2019-07-12 11:55:32', '54.36.148.229', 'Mozilla'),
(1179, '2019-07-12 13:28:16', '54.36.149.55', 'Mozilla'),
(1180, '2019-07-12 13:58:01', '54.36.148.160', 'Mozilla'),
(1181, '2019-07-12 15:34:59', '54.36.149.12', 'Mozilla'),
(1182, '2019-07-12 20:43:39', '54.36.150.169', 'Mozilla'),
(1183, '2019-07-12 21:23:35', '54.36.150.145', 'Mozilla'),
(1184, '2019-07-13 01:37:42', '54.36.150.160', 'Mozilla'),
(1185, '2019-07-13 02:27:57', '209.17.96.242', 'Mozilla'),
(1186, '2019-07-13 04:40:00', '120.188.75.197', 'Chrome'),
(1187, '2019-07-13 05:45:52', '54.36.150.165', 'Mozilla'),
(1188, '2019-07-13 10:31:11', '120.188.80.40', 'Firefox'),
(1189, '2019-07-13 11:38:34', '54.36.148.156', 'Mozilla'),
(1190, '2019-07-13 13:03:30', '54.36.149.100', 'Mozilla'),
(1191, '2019-07-13 13:39:32', '54.36.150.76', 'Mozilla'),
(1192, '2019-07-13 16:48:29', '52.39.187.133', 'Other'),
(1193, '2019-07-13 17:39:59', '54.185.75.142', 'Chrome'),
(1194, '2019-07-13 18:35:58', '54.36.149.25', 'Mozilla'),
(1195, '2019-07-14 00:24:05', '54.36.150.129', 'Mozilla'),
(1196, '2019-07-14 02:58:27', '54.36.150.52', 'Mozilla'),
(1197, '2019-07-14 03:04:31', '54.36.149.94', 'Mozilla'),
(1198, '2019-07-14 03:07:49', '54.36.150.119', 'Mozilla'),
(1199, '2019-07-14 04:03:51', '128.72.34.108', 'Internet Explorer'),
(1200, '2019-07-14 11:55:43', '54.36.150.45', 'Mozilla'),
(1201, '2019-07-14 13:27:44', '34.211.89.103', 'Other'),
(1202, '2019-07-14 14:36:42', '37.9.87.203', 'YandexBot'),
(1203, '2019-07-14 14:36:42', '141.8.188.191', 'YandexBot'),
(1204, '2019-07-14 14:36:42', '93.158.161.27', 'YandexBot'),
(1205, '2019-07-14 14:37:14', '54.36.148.169', 'Mozilla'),
(1206, '2019-07-14 16:27:36', '141.8.188.184', 'YandexBot'),
(1207, '2019-07-14 16:27:40', '93.158.161.13', 'YandexBot'),
(1208, '2019-07-14 17:08:31', '34.221.236.237', 'Chrome'),
(1209, '2019-07-14 17:23:22', '54.191.238.58', 'Other'),
(1210, '2019-07-14 20:47:43', '95.220.0.167', 'Internet Explorer'),
(1211, '2019-07-14 21:45:24', '54.36.150.118', 'Mozilla'),
(1212, '2019-07-14 22:30:25', '185.93.3.114', 'Opera'),
(1213, '2019-07-14 23:08:28', '184.94.240.92', 'Firefox'),
(1214, '2019-07-14 23:10:41', '54.36.148.43', 'Mozilla'),
(1215, '2019-07-15 02:09:21', '40.77.167.188', 'Bing'),
(1216, '2019-07-15 02:09:44', '40.77.189.178', 'Mozilla'),
(1217, '2019-07-15 02:21:21', '52.44.223.88', 'Firefox'),
(1218, '2019-07-15 03:14:11', '150.249.214.252', 'Internet Explorer'),
(1219, '2019-07-15 03:14:47', '150.249.214.249', 'Internet Explorer'),
(1220, '2019-07-15 04:01:49', '178.128.0.34', 'Chrome'),
(1221, '2019-07-15 04:32:04', '38.99.62.94', 'Other'),
(1222, '2019-07-15 04:32:57', '188.68.48.243', 'Chrome'),
(1223, '2019-07-15 04:47:49', '24.107.66.144', 'Other'),
(1224, '2019-07-15 05:10:33', '54.82.16.127', 'Chrome'),
(1225, '2019-07-15 05:16:39', '37.9.87.189', 'YandexBot'),
(1226, '2019-07-15 06:26:50', '54.36.149.42', 'Mozilla'),
(1227, '2019-07-15 06:48:26', '95.216.15.49', 'Safari'),
(1228, '2019-07-15 08:51:39', '54.36.149.102', 'Mozilla'),
(1229, '2019-07-15 09:19:17', '185.198.57.210', 'Chrome'),
(1230, '2019-07-15 11:05:24', '37.9.87.161', 'YandexBot'),
(1231, '2019-07-15 11:05:28', '141.8.188.191', 'YandexBot'),
(1232, '2019-07-15 11:56:11', '198.108.66.176', 'Mozilla'),
(1233, '2019-07-15 11:58:16', '54.162.154.47', 'Chrome'),
(1234, '2019-07-15 13:19:44', '54.39.100.61', 'Chrome'),
(1235, '2019-07-15 13:30:15', '94.130.167.248', 'Mozilla'),
(1236, '2019-07-15 13:34:57', '77.88.5.3', 'YandexBot'),
(1237, '2019-07-15 14:37:26', '198.108.66.208', 'Mozilla'),
(1238, '2019-07-15 14:38:43', '161.69.99.11', 'Firefox'),
(1239, '2019-07-15 14:57:54', '18.237.126.93', 'Other'),
(1240, '2019-07-15 15:22:40', '95.216.20.96', 'Chrome'),
(1241, '2019-07-15 17:26:39', '69.164.111.198', 'Internet Explorer'),
(1242, '2019-07-15 18:07:00', '54.200.243.0', 'Other'),
(1243, '2019-07-15 19:05:44', '103.253.214.20', 'Other'),
(1244, '2019-07-15 19:08:45', '34.222.127.127', 'Chrome'),
(1245, '2019-07-15 19:30:15', '38.99.62.94', 'Mozilla'),
(1246, '2019-07-15 20:06:28', '185.198.57.210', 'Chrome'),
(1247, '2020-02-23 04:09:10', '::1', 'Firefox'),
(1248, '2022-06-27 14:57:17', '::1', 'Chrome'),
(1249, '2022-06-27 17:14:56', '::1', 'Chrome'),
(1250, '2022-06-29 01:32:49', '::1', 'Chrome'),
(1251, '2022-06-30 05:02:07', '::1', 'Chrome'),
(1252, '2022-07-01 15:22:27', '::1', 'Chrome'),
(1253, '2022-07-01 17:09:37', '::1', 'Chrome'),
(1254, '2022-07-06 05:25:58', '::1', 'Chrome'),
(1255, '2022-07-06 17:28:41', '::1', 'Chrome'),
(1256, '2022-10-03 04:17:30', '::1', 'Chrome'),
(1257, '2022-11-14 02:03:51', '::1', 'Chrome'),
(1258, '2022-11-16 12:22:06', '::1', 'Chrome'),
(1259, '2022-11-19 05:36:56', '::1', 'Chrome'),
(1260, '2022-11-21 11:36:56', '::1', 'Chrome'),
(1261, '2022-11-29 02:13:31', '::1', 'Chrome'),
(1262, '2022-12-01 03:56:01', '::1', 'Chrome'),
(1263, '2022-12-05 01:56:52', '::1', 'Chrome'),
(1264, '2022-12-06 01:48:11', '::1', 'Chrome'),
(1265, '2022-12-07 02:28:32', '::1', 'Chrome'),
(1266, '2022-12-08 01:47:26', '::1', 'Chrome'),
(1267, '2022-12-09 03:57:43', '::1', 'Chrome'),
(1268, '2022-12-16 12:03:05', '::1', 'Chrome'),
(1269, '2022-12-17 01:20:05', '::1', 'Chrome'),
(1270, '2022-12-19 02:38:06', '::1', 'Chrome'),
(1271, '2022-12-20 02:01:03', '::1', 'Chrome'),
(1272, '2022-12-21 01:28:11', '::1', 'Chrome'),
(1273, '2022-12-26 09:38:18', '::1', 'Chrome'),
(1274, '2023-02-28 12:03:48', '::1', 'Chrome'),
(1275, '2023-05-12 02:19:00', '::1', 'Chrome'),
(1276, '2023-05-13 03:07:25', '::1', 'Chrome'),
(1277, '2023-05-13 22:30:30', '::1', 'Chrome'),
(1278, '2023-05-15 02:37:06', '::1', 'Chrome'),
(1279, '2023-05-16 05:49:03', '::1', 'Chrome'),
(1280, '2023-05-17 01:08:16', '::1', 'Chrome'),
(1281, '2023-05-22 14:08:58', '::1', 'Chrome'),
(1282, '2023-05-25 00:52:43', '::1', 'Chrome'),
(1283, '2023-06-21 08:09:48', '::1', 'Chrome'),
(1284, '2023-06-22 02:25:42', '::1', 'Chrome'),
(1285, '2023-06-24 09:02:25', '::1', 'Chrome'),
(1286, '2023-06-26 02:05:09', '::1', 'Chrome'),
(1287, '2023-07-04 03:19:45', '::1', 'Chrome'),
(1288, '2023-07-06 22:41:08', '::1', 'Chrome'),
(1289, '2023-07-07 17:01:11', '::1', 'Chrome'),
(1290, '2023-07-09 15:15:24', '::1', 'Chrome'),
(1291, '2023-07-09 18:02:42', '::1', 'Chrome'),
(1292, '2023-07-11 00:02:39', '::1', 'Chrome'),
(1293, '2023-07-11 17:39:00', '::1', 'Chrome'),
(1294, '2023-07-13 00:10:34', '::1', 'Chrome'),
(1295, '2023-07-13 23:34:23', '::1', 'Chrome'),
(1296, '2023-07-15 02:06:36', '::1', 'Chrome'),
(1297, '2023-07-16 03:03:36', '127.0.0.1', 'Chrome'),
(1298, '2023-07-19 07:58:00', '127.0.0.1', 'Chrome'),
(1299, '2023-07-20 12:03:47', '127.0.0.1', 'Chrome'),
(1300, '2023-07-21 05:54:51', '127.0.0.1', 'Chrome');

-- --------------------------------------------------------

--
-- Table structure for table `tb_potensi`
--

CREATE TABLE `tb_potensi` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_potensi`
--

INSERT INTO `tb_potensi` (`id`, `judul`, `tanggal`, `isi`, `gambar`, `slug`, `userid`) VALUES
(1, 'Pasar Rakyat Desa Kampung Melayu', '2023-07-07 02:46:32', '', '8105a5579c62b6ed49f89d030721a0ca.jpeg', 'pasar-rakyat-desa-kampung-melayu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_slider`
--

CREATE TABLE `tb_slider` (
  `id` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_slider`
--

INSERT INTO `tb_slider` (`id`, `gambar`) VALUES
(1, '6ee7262eb932aa85618ce845f32ec425.jpeg'),
(2, 'cf4007d702fe3effdc67b45b595af647.jpeg'),
(3, '701441a27f2fd770f122204f2d4e79da.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_socmed`
--

CREATE TABLE `tb_socmed` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_socmed`
--

INSERT INTO `tb_socmed` (`id`, `nama`, `url`, `icon`) VALUES
(1, 'desaku', 'www.desaku.com', 'fa fa facebook');

-- --------------------------------------------------------

--
-- Table structure for table `tb_statis`
--

CREATE TABLE `tb_statis` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_statis`
--

INSERT INTO `tb_statis` (`id`, `judul`, `isi`, `gambar`) VALUES
(1, 'Sambutan Kepala Desa Kampung Melayu', '<p><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Assalamu&rsquo;alaikum Wr. Wb.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Puji syukur alhamdulillah kami panjatkan ke hadirat Allah SWT atas limpahan rahmat, bimbingan serta karunia-Nya sehingga Website Desa Lalang Sembawa dapat hadir dihadapan masyarakat luas, khususnya warga Desa kampung melayu, Kecamatan Mendawai, Kabupaten Katingan, Provinsi Kalimantan Tengah.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Website ini dibuat dan dikembangkan dalam rangka memenuhi tuntutan era globalisasi sehingga keberadaan Markasi dengan segala informasinya dapat diketahui oleh masyarakat luas, dan sebagai sarana komunikasi antara seluruh komponen dan stakeholder yang ada di Desa kampung melayu, untuk kemajuan Desa.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Ucapan terima kasih tak lupa kami sampaikan kepada semua pihak yang telah berusaha membangun dan mengembangkan Website Desa Lalang Sembawa ini, semoga jerih payahnya tidak sia-sia demi membangun dan memajukan Desa kampung melayu.<br />\r\nAkhir kata, kritik dan saran yang membangun untuk kesempurnaan Website Desa Kampung Melayu ini, sangat kami harapkan dari segenap pembaca. Semoga keberadaannya memenuhi harapan dan tujuan serta banyak membawa manfaat. Amiin.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Wassalamu&rsquo;alaikum Wr. Wb</span></span></span></span></p>\r\n', 'a32697b2d48251e7a0db343812da4904.jpg'),
(2, 'Visi dan Misi', '<p><strong>VISI</strong></p>\r\n\r\n<p>&quot;<strong>TERBENTUKNYA TATA KELOLA PEMERINTAHAN DESA YANG BAIK BERSIH GUNA MEWUJUDKAN KEHIDUPAN MASYARAKAT DESA YANG ADIL, MAKMUR, DAN SEJAHTERA&quot;</strong></p>\r\n\r\n<p><strong>MISI</strong></p>\r\n\r\n<ol>\r\n	<li>MELAKUKAN REFORMASI SISTEM KINERJA&nbsp; APARATUR PEMERINTAH DESA GUNA MENINGKATKAN KUALITAS PELAYANAN KEPADA MASYARAKAT.</li>\r\n	<li>MENYELENGGARAKAN PEMERINTAH YANG BERSIH, TERBEBAS DARI KORUPSI SERTA BENTUK-BENTUK PENYELEWENGAN LAINYA.</li>\r\n	<li>MENYELENGGARAKAN PEMERINTAH DESA SECARA TERBUKA, DAN BERTANGGUNG JAWAB SESUAI DENGAN PERATURAN PERUNDANG-UNDANGAN.</li>\r\n	<li>MENINGKATKAN PEREKONOMIAN MASYARAKAT MELALUI PENDAMPINGAN BERUPA PENYULUHAN KEPADA UKM, WIRASWASTA, DAN PETANI.</li>\r\n	<li>MENINGKATKAN MUTU KESEJAHTERAAN MASYARAKAT UNTUK MENCAPAI TARAF KEHIDUPAN YANG LEBIH BAIK DAN LAYAK SEHINGGA MENJADI LEBIH MAJU DAN MANDIRI.</li>\r\n</ol>\r\n', 'wkwkwk.com'),
(3, 'Struktur Organisasi', '<p style=\"text-align:center\"><span style=\"font-size:20px\"><strong>STRUKTUR ORGANISASI DAN TATA KELOLA KERJA PEMERINTAHAN DESA KAMPUNG MELAYU,&nbsp;KECAMATAN MENDAWAI,&nbsp;KABUPATEN KATINGAN&nbsp;&nbsp;</strong></span></p>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">BPD</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"color:#000000\"><span style=\"font-size:16px\">HALIKUR RAHMAN</span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KEPALA DESA</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">MARKASI</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">SEKERTARIS DESA</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">GUNTUR SETIAWAN</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KAUR UMUM &amp; PERENCANAAN</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">KARYADIE</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KAUR KEUANGAN</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"color:#000000\"><span style=\"font-size:16px\">RUSDIANI AGUSTIN</span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KASI PEMDES</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">TUAH CATUR WIBOWO</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KASI KESEJAHTERAAN &amp; PELAYANAN</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">FATHUR RAHMAN</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 'wkwkwk.com'),
(4, 'Data Pegawai', '<table border=\"1\" cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:solid windowtext 1.0pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#aeaaaa; width:467.5pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PEGAWAI MENURUT JENIS KELAMIN </span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">Laki-laki&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; 4&nbsp;orang.</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">Perempuan&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp; &nbsp;3 orang.</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#aeaaaa; width:467.5pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PEGAWAI MENURUT PENDIDIKAN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">S1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 1 orang</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">Diploma I&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 1&nbsp;orang.</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SLTA&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 5 orang.</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SLTP&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 0&nbsp;orang.</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#aeaaaa; width:467.5pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PEGAWAI MENURUT GOLONGAN/RUANG </span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">Pegawai Negeri Sipil&nbsp;&nbsp; &nbsp;:&nbsp; &nbsp; &nbsp; 1&nbsp;orang.</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">Pegawai Tidak Tetap&nbsp;&nbsp; &nbsp;:&nbsp; &nbsp; &nbsp; 6&nbsp;orang</span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'wkwkwk.com'),
(5, ' KETUA RT/RW', '<table border=\"1\" class=\"Table\" style=\"border:solid windowtext 1.0pt\">\r\n	<thead>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">NO</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">NAMA</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">RT/RW</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">NO.HP</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">KETERANGAN</span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">1</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">WAWAN</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">001/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">&nbsp;KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">2</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SUWASNO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">002/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">3</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">FIRMANSAH</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">003/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">4</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PARYANTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">004/002</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">5</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">INDARTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">005/002</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">6</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PAIJO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">006/002</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">7</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">AJI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">007/003</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">8</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SUPRAPTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">008/003</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">9</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PAINO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">009/003</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">10</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">ROBANI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">010/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-&nbsp;</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">11</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">MARSUDI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">011/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">12</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">TEGUH SUSANTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">012/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">13</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">TRIYANTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">013/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">14</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SAMSIAR</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">014/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">15</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">OJO SUTARJO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">015/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">16</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SUMIKO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">001,002,003,015</span></span></span></p>\r\n			</td>\r\n			<td style=\"text-align:center\">-</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\">17</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SANDI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">004,005,006</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\">-</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\">18</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SAMSURIZAL</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">007,008,013</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\">-</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">19</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PAIMAN</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">009,010,011,012,014</span></span></span></p>\r\n			</td>\r\n			<td style=\"text-align:center\">-</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'wkwkwk.com'),
(6, 'ALUR KEGIATAN PELAYANAN', '<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\">ALUR KEGIATAN PELAYANAN</span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:16px\"><strong>DESA KAARANG SARI</strong></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>PEMOHON</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MENYEDIAKAN BERKAS ATAU PERSYARATAN</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>KAUR UMUM</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MEMPEROSES PELAYANAN BERKORDINASI DENGAN PETUGAS TERKAIT</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>SEKERTARIS DESA</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MEMPEROSES PELAYANAN BERKORDINASI DENGAN PETUGAS TERKAIT</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>KEPALA DESA</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MENGOREKSI BERKAS SERTA MEMBERIKAN TANDA TANGAN</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>KAUR UMUM</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MEMERIKSA DATA TELAH SELESAI SERTA MENYERAHKAN DATA</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>PEMOHON</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MENERIMA DATA YANG TELAH SELESAI</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 'wkwkwk.com'),
(7, 'SYARAT PEMBUATAN SURAT ', '<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>SARAT DAN KETENTUAN PEMBUATAN SURAT&nbsp;</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>DESA KARANG SARI</strong></span></p>\r\n\r\n<table align=\"left\" cellspacing=\"0\" class=\"Table\" style=\"background:white; border-collapse:collapse; border:undefined; margin-left:9px; margin-right:9px; width:10.75in\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Tidak Mampu</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KK ATAU KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Domisili</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">&nbsp;KTP Atau&nbsp;KK Yang Bersangkutan</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Kelahiran</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Keterangan Kelahiran Dari Pihak Rumahsakit</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP Kedua Orang Tua</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Kematian</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP Dan KK Yang Bersangkutan</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Usaha</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Ahli Waris</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">SHM</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP Kedua Belah Pihak</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Penghasilan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP&nbsp;</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">SLIP GAJI</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Kehilangan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Jalan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Belum Nikah</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Usaha</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Jual Beli</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp Kedua Belah Pihak</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Tanah</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Kuitansi</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Telah Nikah</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Buku Nikah</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Pernyataan Dan Kesepakatan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp Dua Belah Pihak</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Bebas Sngketa</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp Dua Belah Pihak</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Shm (Surat Hak Milik)</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div><a href=\"https://api.whatsapp.com/send?phone=+6281255285819&amp;text=Halo\"><img src=\"https://i.postimg.cc/TPFtHKP7/dimassawe.png\" /> Whatsapp Kami</a></div>\r\n', 'wkwkwk.com');
INSERT INTO `tb_statis` (`id`, `judul`, `isi`, `gambar`) VALUES
(8, 'APBDesa', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">PENJABARAN ANGGARAN PENDAPATANDAN DAN BELANJA DANA DESA, PEMERINTAH DESA KAMPUNG MELAYU TAHUN ANGGARAN 2023</span></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">PENDAPATAN</span></span></p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:solid windowtext 1.0pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">PENDAPATAN TRANSFER</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 1.192.733.198</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">DANA DESA</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 727.437. 000</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">BAGI HASIL PAJAK &amp; RETRIBUSI</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 13.324.198</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">ALOKASI DANA DESA (ADD)</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 451.927.000</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">PKK CSR-RMU</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 136.500.000</span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">BELANJA</span></span></p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:solid windowtext 1.0pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">BIDANG PENYELENGGARAAN DANA DESA</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 458.719.670</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">BIDANG PELAKSANAAN PEMBANGUNAN DANA DESA</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 378.069.747</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">BIDANG PEMBINAAN MASYARAKAT</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 55.600.000</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">BIDANG PEMBERDAYAAN MASYARAKAT</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 159.487.400</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">BIDANG PENANGGULANGAN BENCANA, DARURAT DAN MENDESAK DESA</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">RP 255.737.492</span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">PEMBIAYAAN TAHUN SEBELUMNYA</span></span></p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:solid windowtext 1.0pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:328.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">SILPA TAHUN SEBELUMNYA</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:139.25pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Rp 5.381. 109</span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 'fa7716aadfd6efdb28290db3849a40a1.JPG'),
(9, 'Statistik Penduduk ', '<table border=\"1\" cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse; border:solid windowtext 1.0pt; margin-left:26px; width:460.7pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#a6a6a6; height:20.1pt; width:78.0pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">RT</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#a6a6a6; height:20.1pt; width:85.05pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Jumlah KK</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#a6a6a6; height:20.1pt; width:92.1pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Laki-laki</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#a6a6a6; height:20.1pt; width:106.3pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Perempuan</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#a6a6a6; height:20.1pt; width:99.25pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Jumlah</span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:16.7pt; width:78.0pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">01</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:85.05pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">55</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:92.1pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">7</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">8</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:106.3pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">65</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:99.25pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">1</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">43</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:15.1pt; width:78.0pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">02</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:15.1pt; width:85.05pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">60</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:15.1pt; width:92.1pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">80</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:15.1pt; width:106.3pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">100</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:15.1pt; width:99.25pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">1</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">80</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:16.7pt; width:78.0pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">03</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:85.05pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">45</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:92.1pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">100</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:106.3pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">67</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:99.25pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">1</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">67</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:16.7pt; width:78.0pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">04</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:85.05pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">11</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:92.1pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">5</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">7</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:106.3pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">30</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"height:16.7pt; width:99.25pt\">\r\n			<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">87</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Sumber : Pemdes Tahun 202</span></span></em><em><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">2</span></span></em></span></span></p>\r\n', '58cff130f96894a408518f758aa4fbae.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_submenu`
--

CREATE TABLE `tb_submenu` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `urutan` int(3) NOT NULL,
  `idmenu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jenkel` enum('L','P') NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nohp` varchar(13) NOT NULL,
  `status` enum('1','0') DEFAULT '1',
  `level` enum('1','2') DEFAULT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `email`, `jenkel`, `username`, `password`, `nohp`, `status`, `level`, `register`, `photo`) VALUES
(11, 'ADMIN', 'desakampungmelayu@gmail.com', 'L', 'ADMIN', '73acd9a5972130b75066c82595a1fae3', '081352009802', '1', '1', '2023-07-12 11:20:29', 'e602aee06719d74ec2803ebb2fe38f90.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_penduduk`
--

CREATE TABLE `tb_user_penduduk` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ktp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siapa_nama_sahabat_anda` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dimana_anda_lahir` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_user_penduduk`
--

INSERT INTO `tb_user_penduduk` (`id`, `nama_lengkap`, `no_ktp`, `token`, `siapa_nama_sahabat_anda`, `dimana_anda_lahir`, `password`) VALUES
(11, 'Muhammad Ainul Yakin', '6206092910010001', '8G6ZUHCS1D4VMBJOT3Q507WIN', 'riski', 'kampung melayu', '$2y$10$jnoVUxiG1T2kr1fHP4ypbuYJNZ.fAhKqgdzL8zcVICjUM/GFFlVNC'),
(12, 'yakin', '6206092910010002', '', 'sampit', 'kamel', '$2y$10$gTP5GZ1RteDY/TmqTV7q/eIq4Q20Kr/VLoeQ6f6jROeP7IYgst9ly'),
(13, 'kay', '6206092910010001', '', 'rahmat', 'sampit', '$2y$10$QFvO62V6UHUrXE5aSPk0C.KdAneadUz5jcXj6Xbal9THAbaLNBfr.'),
(16, 'kin', '1234567890111212', 'G59ZWBE42JSFVO1MD0C3KNXUY', 'risky', 'sampit', ''),
(22, 'Testing', '12345678', '', 'tes', 'kampung melayu', '$2y$10$DnjwRb.G/FRZKGbFmtIo/u8R.8wL/JWxTQvVSLlX9ZRX8yOKKIte.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_agenda`
--
ALTER TABLE `tb_agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `tb_album`
--
ALTER TABLE `tb_album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_apbdes`
--
ALTER TABLE `tb_apbdes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bantuan`
--
ALTER TABLE `tb_bantuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_buka`
--
ALTER TABLE `tb_buka`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_files`
--
ALTER TABLE `tb_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_form`
--
ALTER TABLE `tb_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_gallery`
--
ALTER TABLE `tb_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_identitas`
--
ALTER TABLE `tb_identitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_igfeed`
--
ALTER TABLE `tb_igfeed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jenispelayanan`
--
ALTER TABLE `tb_jenispelayanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penduduk`
--
ALTER TABLE `tb_penduduk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengaduan_masyarakat`
--
ALTER TABLE `tb_pengaduan_masyarakat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengaturan_layanan_surat`
--
ALTER TABLE `tb_pengaturan_layanan_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengumuman`
--
ALTER TABLE `tb_pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_potensi`
--
ALTER TABLE `tb_potensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_slider`
--
ALTER TABLE `tb_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_socmed`
--
ALTER TABLE `tb_socmed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_statis`
--
ALTER TABLE `tb_statis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_submenu`
--
ALTER TABLE `tb_submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user_penduduk`
--
ALTER TABLE `tb_user_penduduk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_agenda`
--
ALTER TABLE `tb_agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_album`
--
ALTER TABLE `tb_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_apbdes`
--
ALTER TABLE `tb_apbdes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_bantuan`
--
ALTER TABLE `tb_bantuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_buka`
--
ALTER TABLE `tb_buka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_files`
--
ALTER TABLE `tb_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_form`
--
ALTER TABLE `tb_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `tb_gallery`
--
ALTER TABLE `tb_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_identitas`
--
ALTER TABLE `tb_identitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_igfeed`
--
ALTER TABLE `tb_igfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_jenispelayanan`
--
ALTER TABLE `tb_jenispelayanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_penduduk`
--
ALTER TABLE `tb_penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pengaduan_masyarakat`
--
ALTER TABLE `tb_pengaduan_masyarakat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_pengaturan_layanan_surat`
--
ALTER TABLE `tb_pengaturan_layanan_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pengumuman`
--
ALTER TABLE `tb_pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1301;

--
-- AUTO_INCREMENT for table `tb_potensi`
--
ALTER TABLE `tb_potensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_slider`
--
ALTER TABLE `tb_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_socmed`
--
ALTER TABLE `tb_socmed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_statis`
--
ALTER TABLE `tb_statis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_submenu`
--
ALTER TABLE `tb_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_user_penduduk`
--
ALTER TABLE `tb_user_penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
