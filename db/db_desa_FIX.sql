-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 27 Jan 2023 pada 16.48
-- Versi server: 10.5.17-MariaDB-cll-lve
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u1576245_db_desa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_agenda`
--

CREATE TABLE `tb_agenda` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
-- Dumping data untuk tabel `tb_agenda`
--

INSERT INTO `tb_agenda` (`id`, `nama`, `tanggal`, `deskripsi`, `startdate`, `enddate`, `tempat`, `color`, `ket`, `userid`, `slug`) VALUES
(15, 'GERMAS', '2022-06-27 17:26:36', 'Test1', '2022-07-01 07:00:00', '2022-07-01 08:00:00', 'HALAMAN BALAI DESA ', '#7a2323', 'SETIAP HARI UMAT PAGI DIADAKAN GERMAS ', 7, 'germas'),
(16, 'VAKSIN KE 2-3 DAN BOOSTER DESA KARANG SARI', '2022-06-28 04:05:16', 'VAKSIN UNTUK WARGA', '2022-06-29 11:04:33', '2022-06-30 11:04:37', 'HALAMAN BALAI DESA ', '#00afaa', 'SIAPP 86', 7, 'vaksin-ke-2-3-dan-booster-desa-karang-sari');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_album`
--

CREATE TABLE `tb_album` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userid` int(11) NOT NULL,
  `count` int(11) DEFAULT 0,
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_album`
--

INSERT INTO `tb_album` (`id`, `nama`, `tanggal`, `userid`, `count`, `cover`) VALUES
(0, 'PEMBANGUNAN', '2023-01-27 09:24:51', 0, 1, '240a99495f48ad02c4be28a4c3e7565a.jpg');


ALTER TABLE `tb_album`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------


CREATE TABLE `tb_pegawai` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
--
-- Struktur dari tabel `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `tanggal` datetime NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tayang` int(11) DEFAULT 0,
  `slug` varchar(200) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `kategoriid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_berita`
--

INSERT INTO `tb_berita` (`id`, `judul`, `tanggal`, `isi`, `gambar`, `tayang`, `slug`, `userid`, `kategoriid`) VALUES
(12, 'Perbaikan Jalan di salah satu kebun warga daerah karang sari', '2022-06-27 20:13:46', '<p>dengan memperbaiki jalan yang telah rusak akan mempermudah akses perjalanan&nbsp;</p>\r\n', '9623a25c17c806af5f519412f3dd72fd.jpg', 3, 'perbaikan-jalan-di-salah-satu-kebun-warga-daerah-karang-sari', 7, 2),
(13, 'pameran pupuk gudang jonder yang di perodukai/dikelola BUMDES desa karang sari', '2022-06-29 05:25:11', '<p>pameran yang diadakan di sebuak kecamatan dengan ini karang sari mengeluarkan hasil umkm peroduk desa karang sari yang ber label kudang jonder dimana peroduk ini berupa pupuk campuran yang berkualitas&nbsp;</p>\r\n', 'b58e978b925e16360c160e6a317fad05.jpg', 8, 'pameran-pupuk-gudang-jonder-yang-di-perodukai-dikelola-bumdes-desa-karang-sari', 7, 3),
(17, 'Pembagian BLT DD tahun 2022 Tahap 1, 2, dan 3', '2022-07-06 19:44:48', '<p><strong>Pembagian BLT DD tahun 2022 Tahap 1, 2, dan 3&nbsp;</strong>&nbsp;yang dimaan di bagikan kepada masyarakat yang terpilih memenuhi keriteria yang disediakan oleh menerimaan blt dd&nbsp;</p>\r\n', '3fa829d5ba7fe8aebb2ccb3c09974779.jpeg', 2, 'pembagian-blt-dd-tahun-2022-tahap-1-2-dan-3', 7, 2),
(18, 'KEGIATAN SOSIALISASI PIHAK DESA DAN PUSKERMAS MENGENAI MAKANAN SEHAT DI SEKOTAH TK TUNAS HARAPAN', '2022-11-21 14:36:23', '<p>Dengan ini Desa bersama puskesmas parenggean&nbsp;II memberikan sosialisasi dan pengecekan makanan sehat yang dijual di lingkungan sekolah.</p>\r\n', '68e6665114de6983f0fff2bfad5a465b.jpeg', 15, 'kegiatan-sosialisasi-pihak-desa-dan-puskermas-mengenai-makanan-sehat-di-sekotah-tk-tunas-harapan', 7, 2),
(19, 'PENANDATANGANAN MUSDES (Musawarah Desa)  TAHUN 2022/2023', '2022-11-21 14:43:54', '<p>Dalam penandatanganan persetujuan (MUSDES) dalam pembangunan desa ditahun 2022/2023.</p>\r\n\r\n<p>Sebagian masyarakat ikut serta dalam perancangan anggaran desa untuk perkembangan desa tahun 2022/2023. Disini juga masyarakat ikut dalam menerapkan kebituhan-kebutuhan yang diperlukan dalam desa atau lingkup masyarakat serta memajukan dan mendukung fasilitas yang belum ada dalam dunia pendidikan,masyarakat,kesehatan dan agama.</p>\r\n', 'a4136136a470725fc5681df660b40c38.jpeg', 2, 'penandatanganan-musdes-musawarah-desa-tahun-2022-2023', 7, 3),
(1, 'PEMBANGUNAN GARASI', '2023-01-27 09:21:37', '<p><em>Sedang Maintenance</em></p>\r\n', 'cfef06d374438f2ccc6266ba7b008345.jpg', 7, 'pembangunan-garasi', 0, 2),
(0, 'PEMBANGUNAN POS KAMLING', '2023-01-27 09:22:26', '<p><em>Sedang Maintenance</em></p>\r\n', '5deeeefcacc8b7623a13e45c40959025.jpg', 7, 'pembangunan-pos-kamling', 0, 2);


ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `tb_berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buka`
--

CREATE TABLE `tb_buka` (
  `id` int(11) NOT NULL,
  `hari` varchar(40) DEFAULT NULL,
  `jam` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_buka`
--

INSERT INTO `tb_buka` (`id`, `hari`, `jam`) VALUES
(4, 'Senin - Jumat', '08.00 - 12.00 WIB');

ALTER TABLE `tb_buka`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_buka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_files`
--

CREATE TABLE `tb_files` (
  `id` int(11) NOT NULL,
  `judul` varchar(120) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `oleh` varchar(40) DEFAULT NULL,
  `download` int(11) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_files`
--

INSERT INTO `tb_files` (`id`, `judul`, `deskripsi`, `tanggal`, `oleh`, `download`, `data`) VALUES
(0, 'PETUNJUK PELAKSANAAN PENERIMAAN BLT DD  TAHUN 2023', 'PEDMAN PENERIMAAN PERENCANAAN ANGGARAN BLT-DD TAHUN 2023 ', '2023-01-25 03:39:46', 'DESA KARANG SARI', NULL, 'b2b724b1771150470c83862d11eef4d0.docx');

ALTER TABLE `tb_files`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gallery`
--

CREATE TABLE `tb_gallery` (
  `id` int(11) NOT NULL,
  `judul` varchar(80) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gambar` varchar(255) DEFAULT NULL,
  `albumid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_gallery`
--

INSERT INTO `tb_gallery` (`id`, `judul`, `tanggal`, `gambar`, `albumid`, `userid`) VALUES
(1, 'A', '2019-05-09 02:29:39', '7192cef3c289d9fde5726c28354d3243.jpeg', 3, 6),
(6, 'Sambutan Camat1', '2019-05-09 02:30:01', '42be71a6af502a8cc4ffcbeb953b98c7.jpg', 1, 6),
(7, 'kkjj1', '2019-01-25 02:09:15', '035bd55b0961ee7722306e25bfdfaf1b.jpg', 3, 6),
(8, 'ewewe', '2019-01-25 02:09:30', '5b0b92075fa65e917e24074b381a0b11.jpeg', 3, 6),
(0, 'PEMBANGUNAN GARASI', '2023-01-27 09:24:51', '192abe149466f93cd6429b32574b4cbc.jpg', 0, 0);

ALTER TABLE `tb_gallery`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_identitas`
--

CREATE TABLE `tb_identitas` (
  `id` int(11) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `maps` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_identitas`
--

INSERT INTO `tb_identitas` (`id`, `favicon`, `brand`, `email`, `alamat`, `telepon`, `maps`) VALUES
(1, 'e0a4b03e9d03b562e2bb5c4157d1913e.png', 'e6a5a2e69f82d4c9cfe2d5cc17b0c754.png', 'karangsari2prg.kotim@gmail.com', 'Jalan Poros Desa Karang Sari Kecamatan Parenggean Kabupaten Kotawaringin Timur Kalimantan Tengah 74355, Indonesia', '085932168906', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d592.7369765088492!2d112.86051382952682!3d-1.977089603064968!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dfd43a3eb8f2923%3A0x46ca869d0fe062d!2sKantor%20Desa%20Karang%20Sari!5e0!3m2!1sid!2sid!4v1656343186329!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');

ALTER TABLE `tb_identitas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_identitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_igfeed`
--

CREATE TABLE `tb_igfeed` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `client` varchar(80) NOT NULL,
  `accestoken` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_igfeed`
--

INSERT INTO `tb_igfeed` (`id`, `userid`, `client`, `accestoken`) VALUES
(1, '12609509999', 'b3abdc2ff1fe4a928e09cdf7974abb68', '12609509999.b3abdc2.65615b2e72e148ceaeff9be08f2d1d02');


ALTER TABLE `tb_igfeed`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_igfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_inbox`
--

CREATE TABLE `tb_inbox` (
  `id` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `kontak` varchar(13) NOT NULL,
  `pesan` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('1','0') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `tb_inbox`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenispelayanan`
--

CREATE TABLE `tb_jenispelayanan` (
  `id` int(11) NOT NULL,
  `judul` varchar(80) NOT NULL,
  `isi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `tb_jenispelayanan`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_jenispelayanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `nama`) VALUES
(2, 'UMUM'),
(3, 'KHUSUS');


ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_komentar`
--

CREATE TABLE `tb_komentar` (
  `id` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `isi` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('1','0') DEFAULT NULL,
  `beritaid` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_komentar`
--

INSERT INTO `tb_komentar` (`id`, `nama`, `email`, `isi`, `tanggal`, `status`, `beritaid`, `parent`) VALUES
(1, 'Seree', 'ammar.fiky@gmail.com', 'Niice', '2019-05-10 02:42:30', '1', 5, 0),
(2, 'Ammar', '', 'ty', '2019-05-10 02:42:35', '1', 5, 1);

ALTER TABLE `tb_komentar`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `urutan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengumuman`
--

CREATE TABLE `tb_pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userid` int(11) NOT NULL,
  `isi` text NOT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengumuman`
--

INSERT INTO `tb_pengumuman` (`id`, `judul`, `tanggal`, `userid`, `isi`, `slug`) VALUES
(0, 'GERMAS KARANG SARI', '2023-01-27 02:39:18', 0, '<p>jadwal mengikuti disetiap hari jumat</p>\r\n', 'germas-karang-sari');


ALTER TABLE `tb_pengumuman`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengunjung`
--

CREATE TABLE `tb_pengunjung` (
  `id` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(40) DEFAULT NULL,
  `perangkat` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengunjung`
--

INSERT INTO `tb_pengunjung` (`id`, `tanggal`, `ip`, `perangkat`) VALUES
(1, '2019-01-03 15:15:08', '::1', 'Chrome'),
(2, '2019-01-04 00:16:10', '::1', 'Chrome'),
(3, '2019-01-05 10:14:54', '::1', 'Chrome'),
(4, '2019-01-05 11:20:12', '192.168.0.2', 'Chrome'),
(5, '2019-01-06 02:58:50', '::1', 'Chrome'),
(6, '2019-01-07 01:31:54', '::1', 'Chrome'),
(7, '2019-01-07 23:49:54', '::1', 'Chrome'),
(8, '2019-01-08 02:45:44', '192.168.100.119', 'Firefox'),
(9, '2019-01-08 03:08:37', '192.168.100.134', 'Chrome'),
(10, '2019-01-08 22:53:31', '::1', 'Chrome'),
(11, '2019-01-10 02:39:08', '::1', 'Chrome'),
(12, '2019-01-12 02:10:53', '::1', 'Chrome'),
(13, '2019-01-13 09:52:43', '::1', 'Chrome'),
(14, '2019-01-13 22:37:28', '::1', 'Chrome'),
(15, '2019-01-15 12:33:49', '::1', 'Chrome'),
(16, '2019-01-15 22:15:30', '::1', 'Chrome'),
(17, '2019-01-16 22:57:31', '::1', 'Chrome'),
(18, '2019-01-17 20:32:33', '::1', 'Chrome'),
(19, '2019-01-19 22:35:11', '::1', 'Chrome'),
(20, '2019-01-20 21:38:48', '::1', 'Chrome'),
(21, '2019-01-21 20:57:50', '::1', 'Chrome'),
(22, '2019-01-22 21:56:59', '::1', 'Chrome'),
(23, '2019-01-23 23:14:28', '::1', 'Chrome'),
(24, '2019-01-24 17:43:12', '::1', 'Chrome'),
(25, '2019-01-25 02:12:06', '192.168.100.211', 'Chrome'),
(26, '2019-01-25 02:13:08', '192.168.100.79', 'Chrome'),
(27, '2019-01-25 21:47:08', '::1', 'Chrome'),
(28, '2019-01-27 06:49:04', '::1', 'Chrome'),
(29, '2019-01-27 21:32:23', '::1', 'Chrome'),
(30, '2019-01-28 21:37:21', '::1', 'Chrome'),
(31, '2019-01-28 21:37:21', '::1', 'Chrome'),
(32, '2019-01-29 17:36:01', '::1', 'Chrome'),
(33, '2019-02-02 02:15:08', '::1', 'Chrome'),
(34, '2019-02-02 22:27:40', '::1', 'Chrome'),
(35, '2019-02-08 07:26:48', '::1', 'Chrome'),
(36, '2019-02-09 06:47:15', '::1', 'Chrome'),
(37, '2019-02-11 16:36:57', '::1', 'Chrome'),
(38, '2019-02-14 10:15:27', '::1', 'Chrome'),
(39, '2019-02-15 03:37:12', '192.168.100.107', 'Chrome'),
(40, '2019-02-15 03:53:36', '::1', 'Chrome'),
(41, '2019-02-15 03:53:37', '192.168.100.96', 'Chrome'),
(42, '2019-02-16 14:03:57', '::1', 'Chrome'),
(43, '2019-02-17 01:34:01', '::1', 'Chrome'),
(44, '2019-02-21 00:50:30', '::1', 'Chrome'),
(45, '2019-02-21 00:50:31', '127.0.0.1', 'Chrome'),
(46, '2019-02-21 03:53:49', '192.168.100.34', 'Chrome'),
(47, '2019-02-21 03:54:53', '192.168.100.26', 'Chrome'),
(48, '2019-02-25 22:18:19', '::1', 'Chrome'),
(49, '2019-02-26 04:11:16', '192.168.100.139', 'Chrome'),
(50, '2019-02-28 07:07:59', '::1', 'Chrome'),
(51, '2019-02-28 22:48:54', '::1', 'Chrome'),
(52, '2019-03-02 01:38:48', '::1', 'Chrome'),
(53, '2019-03-03 02:55:52', '::1', 'Chrome'),
(54, '2019-03-06 23:03:14', '::1', 'Chrome'),
(55, '2019-03-07 17:20:24', '::1', 'Chrome'),
(56, '2019-03-11 07:43:59', '::1', 'Chrome'),
(57, '2019-05-08 03:25:57', '::1', 'Chrome'),
(58, '2019-05-08 17:01:38', '::1', 'Chrome'),
(59, '2019-05-09 05:12:24', '125.166.234.176', 'Firefox'),
(60, '2019-05-09 05:23:40', '184.72.115.35', 'Safari'),
(61, '2019-05-09 05:23:40', '54.175.74.27', 'Safari'),
(62, '2019-05-09 05:23:41', '54.86.66.252', 'Safari'),
(63, '2019-05-09 05:40:19', '52.71.155.178', 'Safari'),
(64, '2019-05-09 17:17:18', '185.220.101.50', 'Safari'),
(65, '2019-05-09 17:23:18', '199.249.230.107', 'Safari'),
(66, '2019-05-09 18:08:56', '120.188.81.150', 'Firefox'),
(67, '2019-05-09 19:07:41', '185.245.85.228', 'Chrome'),
(68, '2019-05-09 21:28:15', '120.188.78.237', 'Firefox'),
(69, '2019-05-09 23:04:59', '54.86.66.252', 'Safari'),
(70, '2019-05-10 00:23:38', '52.71.155.178', 'Safari'),
(71, '2019-05-10 02:53:07', '54.86.126.150', 'Chrome'),
(72, '2019-05-10 03:40:42', '54.209.60.63', 'Safari'),
(73, '2019-05-10 11:00:21', '185.100.87.207', 'Safari'),
(74, '2019-05-10 11:15:15', '37.9.87.164', 'YandexBot'),
(75, '2019-05-10 15:35:12', '209.17.97.58', 'Mozilla'),
(76, '2019-05-10 16:54:09', '198.98.57.155', 'Safari'),
(77, '2019-05-10 17:42:39', '199.249.230.118', 'Safari'),
(78, '2019-05-10 21:53:56', '5.135.183.25', 'Chrome'),
(79, '2019-05-10 23:35:43', '18.85.192.253', 'Safari'),
(80, '2019-05-10 23:36:27', '62.210.201.91', 'Internet Explorer'),
(81, '2019-05-10 23:41:54', '185.220.101.28', 'Safari'),
(82, '2019-05-11 02:42:42', '178.175.148.34', 'Safari'),
(83, '2019-05-11 11:10:36', '120.188.73.46', 'Chrome'),
(84, '2019-05-11 12:45:29', '114.4.218.171', 'Chrome'),
(85, '2019-05-11 12:54:44', '54.86.66.252', 'Safari'),
(86, '2019-05-11 12:54:49', '184.72.115.35', 'Safari'),
(87, '2019-05-11 17:32:10', '5.255.250.41', 'YandexBot'),
(88, '2019-05-11 23:05:42', '185.112.254.195', 'Safari'),
(89, '2019-05-12 03:08:01', '144.217.165.223', 'Safari'),
(90, '2019-05-12 03:09:05', '199.249.230.87', 'Safari'),
(91, '2019-05-12 09:40:38', '18.85.192.253', 'Safari'),
(92, '2019-05-12 13:57:10', '114.4.216.122', 'Chrome'),
(93, '2019-05-12 14:56:51', '216.244.66.194', 'Mozilla'),
(94, '2019-05-12 15:51:15', '141.8.143.183', 'YandexBot'),
(95, '2019-05-12 15:51:18', '93.158.161.171', 'YandexBot'),
(96, '2019-05-12 17:52:14', '5.255.250.41', 'YandexBot'),
(97, '2019-05-12 21:56:50', '141.8.143.183', 'YandexBot'),
(98, '2019-05-12 23:16:12', '5.45.207.1', 'YandexBot'),
(99, '2019-05-12 23:18:15', '141.8.142.13', 'YandexBot'),
(100, '2019-05-13 00:58:36', '195.176.3.23', 'Safari'),
(101, '2019-05-13 11:18:16', '185.112.254.195', 'Safari'),
(102, '2019-05-13 12:16:18', '23.129.64.152', 'Safari'),
(103, '2019-05-13 12:47:37', '54.36.148.52', 'Mozilla'),
(104, '2019-05-13 14:08:27', '141.8.143.129', 'YandexBot'),
(105, '2019-05-13 16:00:59', '54.36.148.200', 'Mozilla'),
(106, '2019-05-13 17:55:45', '54.36.149.33', 'Mozilla'),
(107, '2019-05-13 20:17:13', '54.36.148.37', 'Mozilla'),
(108, '2019-05-13 20:46:38', '54.36.148.221', 'Mozilla'),
(109, '2019-05-13 20:58:15', '54.36.148.12', 'Mozilla'),
(110, '2019-05-13 21:38:28', '216.244.66.194', 'Mozilla'),
(111, '2019-05-13 23:41:14', '54.36.148.180', 'Mozilla'),
(112, '2019-05-13 23:59:21', '54.36.149.13', 'Mozilla'),
(113, '2019-05-14 04:12:04', '35.181.4.90', 'Other'),
(114, '2019-05-14 06:00:31', '54.36.148.13', 'Mozilla'),
(115, '2019-05-14 10:12:13', '54.36.149.18', 'Mozilla'),
(116, '2019-05-14 11:57:44', '54.36.148.134', 'Mozilla'),
(117, '2019-05-14 17:52:58', '54.36.148.242', 'Mozilla'),
(118, '2019-05-14 20:39:57', '54.36.148.217', 'Mozilla'),
(119, '2019-05-14 22:28:15', '141.8.143.183', 'YandexBot'),
(120, '2019-05-14 22:31:48', '54.36.148.63', 'Mozilla'),
(121, '2019-05-14 23:58:06', '216.244.66.194', 'Mozilla'),
(122, '2019-05-15 00:00:17', '108.62.3.45', 'Opera'),
(123, '2019-05-15 00:25:32', '54.36.149.57', 'Mozilla'),
(124, '2019-05-15 01:02:12', '185.132.177.199', 'Chrome'),
(125, '2019-05-15 01:49:23', '54.36.148.92', 'Mozilla'),
(126, '2019-05-15 02:07:51', '5.255.250.41', 'YandexBot'),
(127, '2019-05-15 05:27:19', '54.36.148.94', 'Mozilla'),
(128, '2019-05-15 14:26:39', '54.36.148.61', 'Mozilla'),
(129, '2019-05-15 18:27:24', '18.85.192.253', 'Safari'),
(130, '2019-05-15 19:36:42', '54.36.148.19', 'Mozilla'),
(131, '2019-05-15 22:27:54', '93.158.161.91', 'YandexBot'),
(132, '2019-05-16 01:03:46', '54.36.148.158', 'Mozilla'),
(133, '2019-05-16 01:06:11', '54.36.149.82', 'Mozilla'),
(134, '2019-05-16 01:57:39', '54.36.148.170', 'Mozilla'),
(135, '2019-05-16 02:12:00', '54.36.149.23', 'Mozilla'),
(136, '2019-05-16 04:38:29', '216.244.66.194', 'Mozilla'),
(137, '2019-05-16 05:30:38', '54.36.148.239', 'Mozilla'),
(138, '2019-05-16 06:14:04', '5.255.250.41', 'YandexBot'),
(139, '2019-05-16 07:34:35', '54.36.148.58', 'Mozilla'),
(140, '2019-05-16 20:48:19', '54.36.148.243', 'Mozilla'),
(141, '2019-05-16 22:28:20', '54.36.149.24', 'Mozilla'),
(142, '2019-05-16 23:13:14', '51.15.117.50', 'Safari'),
(143, '2019-05-17 02:12:58', '54.36.149.97', 'Mozilla'),
(144, '2019-05-17 04:51:18', '209.17.97.10', 'Mozilla'),
(145, '2019-05-17 05:21:55', '54.36.148.69', 'Mozilla'),
(146, '2019-05-17 06:01:25', '185.220.101.5', 'Safari'),
(147, '2019-05-17 06:22:24', '54.36.148.51', 'Mozilla'),
(148, '2019-05-17 08:04:16', '54.36.148.249', 'Mozilla'),
(149, '2019-05-17 11:37:00', '54.36.149.6', 'Mozilla'),
(150, '2019-05-17 12:33:30', '54.36.148.123', 'Mozilla'),
(151, '2019-05-17 13:10:39', '54.36.149.49', 'Mozilla'),
(152, '2019-05-17 14:09:54', '95.154.200.145', 'Opera'),
(153, '2019-05-17 14:12:40', '54.36.149.16', 'Mozilla'),
(154, '2019-05-17 14:52:16', '54.36.148.168', 'Mozilla'),
(155, '2019-05-17 17:33:28', '199.249.230.115', 'Safari'),
(156, '2019-05-17 18:27:25', '216.244.66.194', 'Mozilla'),
(157, '2019-05-17 19:30:09', '54.36.149.88', 'Mozilla'),
(158, '2019-05-17 20:32:43', '31.220.40.54', 'Safari'),
(159, '2019-05-17 20:56:33', '54.36.149.75', 'Mozilla'),
(160, '2019-05-18 02:56:53', '54.36.148.109', 'Mozilla'),
(161, '2019-05-18 07:07:12', '54.36.149.89', 'Mozilla'),
(162, '2019-05-18 08:57:44', '171.13.14.27', 'Safari'),
(163, '2019-05-18 08:57:53', '171.13.14.16', 'Safari'),
(164, '2019-05-18 08:58:09', '171.13.14.21', 'Safari'),
(165, '2019-05-18 10:56:46', '94.230.208.147', 'Safari'),
(166, '2019-05-18 11:43:54', '185.220.101.56', 'Safari'),
(167, '2019-05-18 15:28:24', '5.255.250.41', 'YandexBot'),
(168, '2019-05-19 06:37:04', '216.244.66.194', 'Mozilla'),
(169, '2019-05-19 07:16:11', '5.255.250.41', 'YandexBot'),
(170, '2019-05-19 11:15:09', '104.244.73.199', 'Safari'),
(171, '2019-05-20 14:33:27', '5.255.250.41', 'YandexBot'),
(172, '2019-05-20 16:23:28', '91.148.141.162', 'Chrome'),
(173, '2019-05-20 19:11:44', '199.115.97.202', 'Firefox'),
(174, '2019-05-20 21:15:02', '209.17.96.58', 'Mozilla'),
(175, '2019-05-20 21:38:45', '141.8.143.183', 'YandexBot'),
(176, '2019-05-20 21:38:46', '5.255.250.41', 'YandexBot'),
(177, '2019-05-21 06:28:19', '209.17.96.250', 'Mozilla'),
(178, '2019-05-21 10:03:04', '54.36.149.54', 'Mozilla'),
(179, '2019-05-21 10:56:28', '54.36.148.24', 'Mozilla'),
(180, '2019-05-21 10:58:49', '54.36.149.77', 'Mozilla'),
(181, '2019-05-21 11:33:56', '54.36.148.76', 'Mozilla'),
(182, '2019-05-21 11:34:34', '54.36.148.39', 'Mozilla'),
(183, '2019-05-21 11:36:26', '54.36.148.235', 'Mozilla'),
(184, '2019-05-21 12:02:01', '54.36.148.121', 'Mozilla'),
(185, '2019-05-21 15:14:50', '64.246.178.34', 'Firefox'),
(186, '2019-05-21 17:36:15', '185.230.127.103', 'Opera'),
(187, '2019-05-21 18:20:22', '54.36.148.34', 'Mozilla'),
(188, '2019-05-21 18:45:37', '54.36.149.3', 'Mozilla'),
(189, '2019-05-21 18:52:10', '209.17.97.26', 'Mozilla'),
(190, '2019-05-21 19:07:10', '54.36.149.89', 'Mozilla'),
(191, '2019-05-21 19:19:36', '54.36.149.42', 'Mozilla'),
(192, '2019-05-21 19:45:16', '54.36.148.171', 'Mozilla'),
(193, '2019-05-21 19:45:32', '5.255.250.41', 'YandexBot'),
(194, '2019-05-21 20:01:17', '54.36.148.37', 'Mozilla'),
(195, '2019-05-21 20:20:27', '141.8.143.183', 'YandexBot'),
(196, '2019-05-21 20:48:04', '54.36.149.80', 'Mozilla'),
(197, '2019-05-21 21:51:21', '54.36.148.78', 'Mozilla'),
(198, '2019-05-21 22:03:05', '54.36.148.164', 'Mozilla'),
(199, '2019-05-21 22:20:46', '54.36.148.247', 'Mozilla'),
(200, '2019-05-21 23:00:15', '54.36.148.167', 'Mozilla'),
(201, '2019-05-21 23:09:51', '54.36.148.3', 'Mozilla'),
(202, '2019-05-22 00:03:13', '54.36.148.117', 'Mozilla'),
(203, '2019-05-22 02:18:20', '54.36.148.206', 'Mozilla'),
(204, '2019-05-22 03:01:28', '54.36.149.57', 'Mozilla'),
(205, '2019-05-22 03:14:08', '54.36.148.50', 'Mozilla'),
(206, '2019-05-22 03:53:38', '54.36.149.71', 'Mozilla'),
(207, '2019-05-22 03:55:01', '54.36.149.0', 'Mozilla'),
(208, '2019-05-22 04:39:59', '54.36.149.77', 'Mozilla'),
(209, '2019-05-22 05:15:16', '54.36.149.50', 'Mozilla'),
(210, '2019-05-22 05:19:54', '209.17.96.202', 'Mozilla'),
(211, '2019-05-22 05:25:00', '54.36.148.165', 'Mozilla'),
(212, '2019-05-22 05:28:38', '54.36.148.43', 'Mozilla'),
(213, '2019-05-22 06:04:00', '54.36.148.121', 'Mozilla'),
(214, '2019-05-22 08:48:39', '54.36.148.153', 'Mozilla'),
(215, '2019-05-22 09:23:06', '54.36.148.150', 'Mozilla'),
(216, '2019-05-22 09:46:09', '54.36.149.27', 'Mozilla'),
(217, '2019-05-22 10:22:08', '54.36.148.38', 'Mozilla'),
(218, '2019-05-22 10:45:05', '54.36.148.231', 'Mozilla'),
(219, '2019-05-22 11:19:46', '54.36.149.19', 'Mozilla'),
(220, '2019-05-22 11:38:07', '199.30.231.1', 'Chrome'),
(221, '2019-05-22 11:38:12', '64.233.172.129', 'Chrome'),
(222, '2019-05-22 13:22:41', '54.36.148.179', 'Mozilla'),
(223, '2019-05-22 13:29:50', '54.36.148.113', 'Mozilla'),
(224, '2019-05-22 14:17:45', '54.36.149.64', 'Mozilla'),
(225, '2019-05-22 17:54:31', '5.255.250.41', 'YandexBot'),
(226, '2019-05-22 18:05:36', '54.36.149.79', 'Mozilla'),
(227, '2019-05-22 19:41:56', '54.36.148.178', 'Mozilla'),
(228, '2019-05-22 20:06:51', '54.36.148.117', 'Mozilla'),
(229, '2019-05-22 20:18:31', '54.36.148.141', 'Mozilla'),
(230, '2019-05-22 20:53:28', '54.36.149.78', 'Mozilla'),
(231, '2019-05-22 21:07:31', '178.154.244.39', 'YandexBot'),
(232, '2019-05-22 21:09:17', '5.255.253.22', 'YandexBot'),
(233, '2019-05-22 21:17:44', '54.36.148.49', 'Mozilla'),
(234, '2019-05-22 22:19:01', '54.36.148.239', 'Mozilla'),
(235, '2019-05-22 23:23:17', '54.36.148.50', 'Mozilla'),
(236, '2019-05-22 23:32:09', '54.36.148.63', 'Mozilla'),
(237, '2019-05-23 00:09:23', '54.36.148.185', 'Mozilla'),
(238, '2019-05-23 00:25:47', '54.36.148.53', 'Mozilla'),
(239, '2019-05-23 00:45:38', '54.36.148.110', 'Mozilla'),
(240, '2019-05-23 01:21:14', '54.36.148.202', 'Mozilla'),
(241, '2019-05-23 01:37:01', '91.148.141.162', 'Chrome'),
(242, '2019-05-23 02:02:41', '54.36.148.58', 'Mozilla'),
(243, '2019-05-23 02:17:15', '54.36.149.38', 'Mozilla'),
(244, '2019-05-23 02:23:03', '120.188.77.24', 'Firefox'),
(245, '2019-05-23 02:23:03', '120.188.77.24', 'Firefox'),
(246, '2019-05-23 02:48:15', '54.36.148.217', 'Mozilla'),
(247, '2019-05-23 03:42:26', '54.36.149.65', 'Mozilla'),
(248, '2019-05-23 04:49:17', '54.36.148.210', 'Mozilla'),
(249, '2019-05-23 05:16:09', '54.36.148.221', 'Mozilla'),
(250, '2019-05-23 06:26:50', '54.36.148.148', 'Mozilla'),
(251, '2019-05-23 08:22:58', '54.36.149.26', 'Mozilla'),
(252, '2019-05-23 09:55:50', '54.36.148.116', 'Mozilla'),
(253, '2019-05-23 11:21:01', '54.36.148.212', 'Mozilla'),
(254, '2019-05-23 12:05:29', '54.36.148.213', 'Mozilla'),
(255, '2019-05-23 12:54:41', '54.36.148.164', 'Mozilla'),
(256, '2019-05-23 13:19:53', '54.36.148.134', 'Mozilla'),
(257, '2019-05-23 13:33:09', '54.36.148.62', 'Mozilla'),
(258, '2019-05-23 13:33:45', '54.36.148.124', 'Mozilla'),
(259, '2019-05-23 14:17:05', '54.36.148.82', 'Mozilla'),
(260, '2019-05-23 14:28:42', '54.36.148.38', 'Mozilla'),
(261, '2019-05-23 15:03:26', '54.36.149.88', 'Mozilla'),
(262, '2019-05-23 15:03:32', '54.36.148.190', 'Mozilla'),
(263, '2019-05-23 15:06:37', '54.36.148.107', 'Mozilla'),
(264, '2019-05-23 15:32:01', '54.36.148.35', 'Mozilla'),
(265, '2019-05-23 16:21:09', '54.36.149.103', 'Mozilla'),
(266, '2019-05-23 16:43:13', '54.36.148.113', 'Mozilla'),
(267, '2019-05-23 18:00:45', '54.36.149.71', 'Mozilla'),
(268, '2019-05-23 18:34:33', '5.255.250.41', 'YandexBot'),
(269, '2019-05-23 19:22:05', '62.210.201.91', 'Internet Explorer'),
(270, '2019-05-23 20:41:48', '54.36.148.92', 'Mozilla'),
(271, '2019-05-23 21:00:02', '54.36.149.12', 'Mozilla'),
(272, '2019-05-23 21:00:37', '141.8.143.183', 'YandexBot'),
(273, '2019-05-23 21:28:48', '54.36.149.33', 'Mozilla'),
(274, '2019-05-23 21:59:57', '54.36.149.44', 'Mozilla'),
(275, '2019-05-23 22:26:07', '54.36.149.18', 'Mozilla'),
(276, '2019-05-23 23:28:41', '54.36.148.58', 'Mozilla'),
(277, '2019-05-23 23:32:39', '54.36.148.17', 'Mozilla'),
(278, '2019-05-24 01:24:07', '54.36.148.27', 'Mozilla'),
(279, '2019-05-24 01:24:56', '54.36.149.39', 'Mozilla'),
(280, '2019-05-24 03:32:25', '54.36.149.104', 'Mozilla'),
(281, '2019-05-24 03:40:19', '54.36.149.97', 'Mozilla'),
(282, '2019-05-24 04:04:01', '54.36.148.53', 'Mozilla'),
(283, '2019-05-24 06:47:41', '54.36.148.111', 'Mozilla'),
(284, '2019-05-24 06:48:46', '54.36.148.8', 'Mozilla'),
(285, '2019-05-24 06:50:23', '54.36.148.35', 'Mozilla'),
(286, '2019-05-24 08:05:59', '54.36.148.224', 'Mozilla'),
(287, '2019-05-24 08:17:54', '54.36.149.61', 'Mozilla'),
(288, '2019-05-24 08:27:34', '54.36.149.21', 'Mozilla'),
(289, '2019-05-24 08:34:04', '54.36.148.173', 'Mozilla'),
(290, '2019-05-24 08:55:09', '54.36.148.46', 'Mozilla'),
(291, '2019-05-24 10:58:15', '54.36.149.51', 'Mozilla'),
(292, '2019-05-24 11:57:41', '185.127.17.85', 'Other'),
(293, '2019-05-24 12:05:27', '193.70.34.209', 'Chrome'),
(294, '2019-05-24 12:49:02', '54.36.148.15', 'Mozilla'),
(295, '2019-05-24 13:00:15', '54.36.148.102', 'Mozilla'),
(296, '2019-05-24 13:44:01', '54.36.149.13', 'Mozilla'),
(297, '2019-05-24 14:10:55', '54.36.148.244', 'Mozilla'),
(298, '2019-05-24 15:00:21', '54.36.148.137', 'Mozilla'),
(299, '2019-05-24 15:07:02', '54.36.148.88', 'Mozilla'),
(300, '2019-05-24 17:16:26', '54.36.149.41', 'Mozilla'),
(301, '2019-05-24 18:28:25', '54.36.148.179', 'Mozilla'),
(302, '2019-05-24 19:02:40', '54.36.148.135', 'Mozilla'),
(303, '2019-05-24 19:12:01', '54.36.148.129', 'Mozilla'),
(304, '2019-05-24 20:11:42', '54.36.148.213', 'Mozilla'),
(305, '2019-05-24 20:48:13', '54.36.148.130', 'Mozilla'),
(306, '2019-05-24 20:48:33', '54.36.148.184', 'Mozilla'),
(307, '2019-05-24 21:28:06', '54.36.149.89', 'Mozilla'),
(308, '2019-05-24 21:46:42', '54.36.148.214', 'Mozilla'),
(309, '2019-05-24 22:49:07', '54.36.148.225', 'Mozilla'),
(310, '2019-05-24 23:16:46', '54.36.148.124', 'Mozilla'),
(311, '2019-05-24 23:51:38', '54.36.148.188', 'Mozilla'),
(312, '2019-05-25 00:50:26', '54.36.148.93', 'Mozilla'),
(313, '2019-05-25 01:12:08', '54.36.148.143', 'Mozilla'),
(314, '2019-05-25 03:44:09', '54.36.148.229', 'Mozilla'),
(315, '2019-05-25 04:31:33', '54.36.149.12', 'Mozilla'),
(316, '2019-05-25 04:45:03', '54.36.149.25', 'Mozilla'),
(317, '2019-05-25 06:11:02', '54.36.148.97', 'Mozilla'),
(318, '2019-05-25 06:13:51', '54.36.148.234', 'Mozilla'),
(319, '2019-05-25 06:26:33', '185.127.18.74', 'Other'),
(320, '2019-05-25 07:38:28', '54.36.148.73', 'Mozilla'),
(321, '2019-05-25 08:37:01', '54.36.148.227', 'Mozilla'),
(322, '2019-05-25 08:53:46', '54.36.148.27', 'Mozilla'),
(323, '2019-05-25 12:30:15', '54.36.148.65', 'Mozilla'),
(324, '2019-05-25 14:55:50', '209.17.97.10', 'Mozilla'),
(325, '2019-05-25 15:30:16', '54.36.148.116', 'Mozilla'),
(326, '2019-05-25 18:02:07', '54.36.148.167', 'Mozilla'),
(327, '2019-05-25 18:51:31', '54.36.149.15', 'Mozilla'),
(328, '2019-05-25 19:01:02', '54.36.148.130', 'Mozilla'),
(329, '2019-05-25 19:11:08', '54.36.148.7', 'Mozilla'),
(330, '2019-05-25 20:55:00', '54.36.148.51', 'Mozilla'),
(331, '2019-05-26 01:45:36', '54.36.149.92', 'Mozilla'),
(332, '2019-05-26 03:02:27', '54.36.148.52', 'Mozilla'),
(333, '2019-05-26 03:09:46', '5.255.250.41', 'YandexBot'),
(334, '2019-05-26 03:10:44', '54.36.149.21', 'Mozilla'),
(335, '2019-05-26 04:57:34', '54.36.148.72', 'Mozilla'),
(336, '2019-05-26 06:48:42', '54.36.149.79', 'Mozilla'),
(337, '2019-05-26 07:28:27', '54.36.148.27', 'Mozilla'),
(338, '2019-05-26 08:07:54', '54.36.148.192', 'Mozilla'),
(339, '2019-05-26 12:23:10', '141.8.143.183', 'YandexBot'),
(340, '2019-05-26 16:05:04', '54.36.148.112', 'Mozilla'),
(341, '2019-05-26 16:25:34', '54.36.149.64', 'Mozilla'),
(342, '2019-05-26 17:34:02', '54.36.148.0', 'Mozilla'),
(343, '2019-05-26 17:46:19', '185.217.71.155', 'Chrome'),
(344, '2019-05-26 17:53:27', '54.36.148.157', 'Mozilla'),
(345, '2019-05-26 17:57:55', '54.36.148.226', 'Mozilla'),
(346, '2019-05-26 18:54:53', '54.36.148.50', 'Mozilla'),
(347, '2019-05-26 20:15:16', '54.36.148.19', 'Mozilla'),
(348, '2019-05-26 20:32:39', '54.36.148.87', 'Mozilla'),
(349, '2019-05-26 20:37:38', '54.36.148.156', 'Mozilla'),
(350, '2019-05-26 20:45:23', '54.36.148.205', 'Mozilla'),
(351, '2019-05-26 20:47:05', '54.36.149.96', 'Mozilla'),
(352, '2019-05-26 21:41:49', '54.36.148.242', 'Mozilla'),
(353, '2019-05-26 22:24:59', '54.36.149.50', 'Mozilla'),
(354, '2019-05-26 22:42:50', '54.36.148.217', 'Mozilla'),
(355, '2019-05-26 23:27:15', '54.36.149.78', 'Mozilla'),
(356, '2019-05-27 00:09:35', '54.36.148.225', 'Mozilla'),
(357, '2019-05-27 00:21:43', '54.36.148.61', 'Mozilla'),
(358, '2019-05-27 00:22:31', '54.36.148.110', 'Mozilla'),
(359, '2019-05-27 00:53:53', '54.36.149.100', 'Mozilla'),
(360, '2019-05-27 03:12:05', '54.36.148.184', 'Mozilla'),
(361, '2019-05-27 03:32:01', '54.36.148.146', 'Mozilla'),
(362, '2019-05-27 04:19:27', '54.36.148.81', 'Mozilla'),
(363, '2019-05-27 04:36:22', '54.36.148.114', 'Mozilla'),
(364, '2019-05-27 04:58:13', '54.36.148.241', 'Mozilla'),
(365, '2019-05-27 06:04:00', '54.36.148.60', 'Mozilla'),
(366, '2019-05-27 06:24:24', '54.36.149.38', 'Mozilla'),
(367, '2019-05-27 07:29:36', '54.36.149.39', 'Mozilla'),
(368, '2019-05-27 07:42:19', '54.36.148.51', 'Mozilla'),
(369, '2019-05-27 07:48:03', '54.36.148.204', 'Mozilla'),
(370, '2019-05-27 09:24:14', '54.36.149.22', 'Mozilla'),
(371, '2019-05-27 09:32:32', '54.36.148.55', 'Mozilla'),
(372, '2019-05-27 09:58:05', '54.36.148.124', 'Mozilla'),
(373, '2019-05-27 10:01:21', '54.36.148.134', 'Mozilla'),
(374, '2019-05-27 10:33:23', '54.36.149.43', 'Mozilla'),
(375, '2019-05-27 10:36:59', '54.36.149.101', 'Mozilla'),
(376, '2019-05-27 11:02:29', '54.36.148.154', 'Mozilla'),
(377, '2019-05-27 11:02:29', '54.36.149.89', 'Mozilla'),
(378, '2019-05-27 12:40:07', '54.36.148.89', 'Mozilla'),
(379, '2019-05-27 13:44:52', '54.36.148.119', 'Mozilla'),
(380, '2019-05-27 14:02:04', '54.36.148.181', 'Mozilla'),
(381, '2019-05-27 14:49:43', '54.36.148.122', 'Mozilla'),
(382, '2019-05-27 16:26:18', '54.36.148.25', 'Mozilla'),
(383, '2019-05-27 17:09:39', '54.36.148.98', 'Mozilla'),
(384, '2019-05-27 18:10:26', '54.36.150.49', 'Mozilla'),
(385, '2019-05-27 18:33:36', '54.36.148.233', 'Mozilla'),
(386, '2019-05-27 19:08:35', '54.36.150.37', 'Mozilla'),
(387, '2019-05-27 19:42:40', '54.36.148.181', 'Mozilla'),
(388, '2019-05-27 20:19:09', '54.36.149.86', 'Mozilla'),
(389, '2019-05-27 20:34:23', '54.36.150.22', 'Mozilla'),
(390, '2019-05-27 21:54:15', '54.36.150.173', 'Mozilla'),
(391, '2019-05-27 23:51:24', '54.36.148.173', 'Mozilla'),
(392, '2019-05-28 00:22:39', '54.36.150.74', 'Mozilla'),
(393, '2019-05-28 00:29:57', '54.36.150.176', 'Mozilla'),
(394, '2019-05-28 01:43:53', '54.36.148.29', 'Mozilla'),
(395, '2019-05-28 02:50:55', '151.80.39.16', 'Mozilla'),
(396, '2019-05-28 03:26:15', '54.36.148.218', 'Mozilla'),
(397, '2019-05-28 04:11:29', '54.36.149.28', 'Mozilla'),
(398, '2019-05-28 04:25:11', '54.36.150.5', 'Mozilla'),
(399, '2019-05-28 05:04:24', '54.36.148.253', 'Mozilla'),
(400, '2019-05-28 05:12:27', '54.36.150.184', 'Mozilla'),
(401, '2019-05-28 06:17:55', '54.36.148.157', 'Mozilla'),
(402, '2019-05-28 06:32:41', '54.36.150.70', 'Mozilla'),
(403, '2019-05-28 06:55:24', '54.36.150.81', 'Mozilla'),
(404, '2019-05-28 07:23:09', '54.36.150.73', 'Mozilla'),
(405, '2019-05-28 07:24:53', '54.36.150.75', 'Mozilla'),
(406, '2019-05-28 08:31:53', '54.36.150.71', 'Mozilla'),
(407, '2019-05-28 09:37:31', '54.36.148.114', 'Mozilla'),
(408, '2019-05-28 09:50:45', '54.36.150.102', 'Mozilla'),
(409, '2019-05-28 10:26:02', '54.36.148.160', 'Mozilla'),
(410, '2019-05-28 11:01:50', '54.36.150.82', 'Mozilla'),
(411, '2019-05-28 11:18:55', '54.36.150.170', 'Mozilla'),
(412, '2019-05-28 11:45:50', '54.36.150.186', 'Mozilla'),
(413, '2019-05-28 11:52:18', '54.36.148.230', 'Mozilla'),
(414, '2019-05-28 12:18:15', '54.36.150.138', 'Mozilla'),
(415, '2019-05-28 12:20:21', '54.36.150.17', 'Mozilla'),
(416, '2019-05-28 13:56:35', '5.255.250.41', 'YandexBot'),
(417, '2019-05-28 14:40:15', '54.36.148.178', 'Mozilla'),
(418, '2019-05-28 14:52:12', '54.36.148.239', 'Mozilla'),
(419, '2019-05-28 15:04:23', '54.36.148.236', 'Mozilla'),
(420, '2019-05-28 15:38:55', '141.8.143.183', 'YandexBot'),
(421, '2019-05-28 16:05:18', '54.36.148.134', 'Mozilla'),
(422, '2019-05-28 16:07:45', '54.36.148.147', 'Mozilla'),
(423, '2019-05-28 17:11:06', '54.36.149.42', 'Mozilla'),
(424, '2019-05-28 17:24:36', '54.36.150.172', 'Mozilla'),
(425, '2019-05-28 17:36:19', '54.36.150.174', 'Mozilla'),
(426, '2019-05-28 17:50:23', '54.36.150.152', 'Mozilla'),
(427, '2019-05-28 18:41:27', '54.36.148.98', 'Mozilla'),
(428, '2019-05-28 18:53:59', '54.36.150.24', 'Mozilla'),
(429, '2019-05-28 19:21:42', '54.36.148.23', 'Mozilla'),
(430, '2019-05-28 22:17:12', '54.36.150.59', 'Mozilla'),
(431, '2019-05-28 23:38:52', '54.36.149.1', 'Mozilla'),
(432, '2019-05-29 00:10:23', '54.36.150.178', 'Mozilla'),
(433, '2019-05-29 00:42:49', '54.36.148.243', 'Mozilla'),
(434, '2019-05-29 00:47:58', '54.36.150.94', 'Mozilla'),
(435, '2019-05-29 01:19:38', '54.36.150.82', 'Mozilla'),
(436, '2019-05-29 01:24:36', '54.36.148.219', 'Mozilla'),
(437, '2019-05-29 02:21:49', '54.36.148.27', 'Mozilla'),
(438, '2019-05-29 02:42:33', '209.17.96.202', 'Mozilla'),
(439, '2019-05-29 05:15:51', '54.36.150.136', 'Mozilla'),
(440, '2019-05-29 05:22:06', '209.17.97.50', 'Mozilla'),
(441, '2019-05-29 06:37:37', '54.36.149.51', 'Mozilla'),
(442, '2019-05-29 07:23:40', '54.36.150.106', 'Mozilla'),
(443, '2019-05-29 07:28:01', '54.36.149.45', 'Mozilla'),
(444, '2019-05-29 07:30:14', '54.36.150.85', 'Mozilla'),
(445, '2019-05-29 07:31:12', '54.36.149.97', 'Mozilla'),
(446, '2019-05-29 07:49:07', '54.36.150.31', 'Mozilla'),
(447, '2019-05-29 08:16:17', '54.36.150.100', 'Mozilla'),
(448, '2019-05-29 08:38:10', '54.36.148.101', 'Mozilla'),
(449, '2019-05-29 09:18:29', '54.36.148.11', 'Mozilla'),
(450, '2019-05-29 09:18:41', '54.36.148.228', 'Mozilla'),
(451, '2019-05-29 09:22:05', '54.36.148.125', 'Mozilla'),
(452, '2019-05-29 10:48:44', '54.36.150.37', 'Mozilla'),
(453, '2019-05-29 10:54:00', '54.36.150.183', 'Mozilla'),
(454, '2019-05-29 11:14:42', '54.36.148.176', 'Mozilla'),
(455, '2019-05-29 12:33:02', '54.36.148.191', 'Mozilla'),
(456, '2019-05-29 13:59:28', '54.36.150.115', 'Mozilla'),
(457, '2019-05-29 14:28:19', '54.36.149.92', 'Mozilla'),
(458, '2019-05-29 14:52:06', '54.36.150.87', 'Mozilla'),
(459, '2019-05-29 16:26:16', '54.36.150.138', 'Mozilla'),
(460, '2019-05-29 17:01:51', '54.36.149.64', 'Mozilla'),
(461, '2019-05-29 17:08:49', '31.13.190.27', 'Chrome'),
(462, '2019-05-29 17:30:37', '54.36.149.57', 'Mozilla'),
(463, '2019-05-29 18:01:53', '54.36.149.103', 'Mozilla'),
(464, '2019-05-29 19:05:52', '103.253.214.20', 'Other'),
(465, '2019-05-29 20:11:51', '54.36.148.76', 'Mozilla'),
(466, '2019-05-29 20:36:40', '54.36.148.11', 'Mozilla'),
(467, '2019-05-29 21:06:25', '54.36.150.81', 'Mozilla'),
(468, '2019-05-29 21:55:17', '54.36.150.82', 'Mozilla'),
(469, '2019-05-30 01:00:12', '54.36.150.158', 'Mozilla'),
(470, '2019-05-30 01:52:18', '54.36.150.121', 'Mozilla'),
(471, '2019-05-30 01:53:32', '54.36.150.95', 'Mozilla'),
(472, '2019-05-30 02:08:51', '54.36.148.159', 'Mozilla'),
(473, '2019-05-30 02:51:16', '54.36.148.186', 'Mozilla'),
(474, '2019-05-30 03:28:16', '54.36.150.38', 'Mozilla'),
(475, '2019-05-30 03:58:08', '54.36.149.13', 'Mozilla'),
(476, '2019-05-30 04:23:06', '54.36.150.123', 'Mozilla'),
(477, '2019-05-30 05:37:48', '54.36.150.71', 'Mozilla'),
(478, '2019-05-30 07:15:44', '54.36.150.47', 'Mozilla'),
(479, '2019-05-30 08:18:17', '54.36.148.91', 'Mozilla'),
(480, '2019-05-30 08:31:52', '54.36.149.68', 'Mozilla'),
(481, '2019-05-30 08:53:21', '31.13.115.23', 'Chrome'),
(482, '2019-05-30 08:59:05', '54.36.150.0', 'Mozilla'),
(483, '2019-05-30 09:00:37', '54.36.149.99', 'Mozilla'),
(484, '2019-05-30 10:11:22', '54.36.150.28', 'Mozilla'),
(485, '2019-05-30 10:28:33', '54.36.150.173', 'Mozilla'),
(486, '2019-05-30 11:34:58', '54.36.150.120', 'Mozilla'),
(487, '2019-05-30 11:49:46', '54.36.148.212', 'Mozilla'),
(488, '2019-05-30 12:01:35', '54.36.148.160', 'Mozilla'),
(489, '2019-05-30 12:36:59', '54.36.149.56', 'Mozilla'),
(490, '2019-05-30 14:00:26', '5.255.250.41', 'YandexBot'),
(491, '2019-05-30 14:00:27', '141.8.143.183', 'YandexBot'),
(492, '2019-05-30 14:56:32', '54.36.150.174', 'Mozilla'),
(493, '2019-05-30 15:31:03', '93.158.161.171', 'YandexBot'),
(494, '2019-05-30 15:49:11', '54.36.148.192', 'Mozilla'),
(495, '2019-05-30 16:00:47', '54.36.150.105', 'Mozilla'),
(496, '2019-05-30 17:57:08', '54.36.149.52', 'Mozilla'),
(497, '2019-05-30 19:04:27', '103.253.214.20', 'Other'),
(498, '2019-05-30 21:55:21', '54.36.150.101', 'Mozilla'),
(499, '2019-05-30 22:44:15', '5.255.250.41', 'YandexBot'),
(500, '2019-05-30 22:59:58', '54.36.150.72', 'Mozilla'),
(501, '2019-05-30 23:26:01', '54.36.150.175', 'Mozilla'),
(502, '2019-05-30 23:31:50', '54.36.149.9', 'Mozilla'),
(503, '2019-05-30 23:46:36', '54.36.150.8', 'Mozilla'),
(504, '2019-05-31 01:01:59', '54.36.148.241', 'Mozilla'),
(505, '2019-05-31 01:21:46', '54.36.150.51', 'Mozilla'),
(506, '2019-05-31 03:29:50', '54.36.148.151', 'Mozilla'),
(507, '2019-05-31 03:50:37', '54.36.149.25', 'Mozilla'),
(508, '2019-05-31 09:21:31', '18.182.43.120', 'Chrome'),
(509, '2019-05-31 10:16:18', '54.36.150.77', 'Mozilla'),
(510, '2019-05-31 11:25:46', '54.36.148.155', 'Mozilla'),
(511, '2019-05-31 12:20:08', '54.36.149.71', 'Mozilla'),
(512, '2019-05-31 12:39:20', '54.36.150.164', 'Mozilla'),
(513, '2019-05-31 12:46:10', '54.36.148.165', 'Mozilla'),
(514, '2019-05-31 13:37:55', '54.36.148.67', 'Mozilla'),
(515, '2019-05-31 13:54:30', '209.17.96.250', 'Mozilla'),
(516, '2019-05-31 14:09:07', '54.36.150.21', 'Mozilla'),
(517, '2019-05-31 14:38:37', '209.17.96.242', 'Mozilla'),
(518, '2019-05-31 14:54:49', '54.36.148.172', 'Mozilla'),
(519, '2019-05-31 15:11:54', '54.36.148.254', 'Mozilla'),
(520, '2019-05-31 15:39:07', '54.36.150.171', 'Mozilla'),
(521, '2019-05-31 18:17:19', '54.36.148.188', 'Mozilla'),
(522, '2019-05-31 18:41:59', '54.36.150.121', 'Mozilla'),
(523, '2019-05-31 19:04:50', '103.253.214.20', 'Other'),
(524, '2019-05-31 19:37:22', '54.36.149.61', 'Mozilla'),
(525, '2019-05-31 21:05:59', '54.36.148.179', 'Mozilla'),
(526, '2019-05-31 22:32:28', '54.36.148.109', 'Mozilla'),
(527, '2019-05-31 23:10:53', '3.14.143.245', 'Other'),
(528, '2019-06-01 00:21:42', '141.8.142.46', 'YandexBot'),
(529, '2019-06-01 01:11:28', '54.36.150.32', 'Mozilla'),
(530, '2019-06-01 01:40:53', '54.36.148.202', 'Mozilla'),
(531, '2019-06-01 03:43:05', '54.36.149.14', 'Mozilla'),
(532, '2019-06-01 06:26:25', '54.36.150.42', 'Mozilla'),
(533, '2019-06-01 06:42:53', '54.36.148.110', 'Mozilla'),
(534, '2019-06-01 08:53:35', '173.252.127.36', 'Chrome'),
(535, '2019-06-01 08:53:41', '173.252.127.2', 'Chrome'),
(536, '2019-06-01 11:24:20', '54.36.150.142', 'Mozilla'),
(537, '2019-06-01 13:54:11', '209.17.96.66', 'Mozilla'),
(538, '2019-06-01 14:51:49', '54.36.149.54', 'Mozilla'),
(539, '2019-06-01 17:03:34', '54.36.150.113', 'Mozilla'),
(540, '2019-06-01 17:34:54', '54.36.150.119', 'Mozilla'),
(541, '2019-06-01 17:46:38', '5.255.250.41', 'YandexBot'),
(542, '2019-06-01 17:46:38', '141.8.143.183', 'YandexBot'),
(543, '2019-06-01 18:12:33', '54.36.148.229', 'Mozilla'),
(544, '2019-06-01 18:31:18', '54.36.149.29', 'Mozilla'),
(545, '2019-06-01 19:01:18', '103.253.214.20', 'Other'),
(546, '2019-06-01 19:33:34', '54.36.150.76', 'Mozilla'),
(547, '2019-06-01 19:54:10', '54.36.150.16', 'Mozilla'),
(548, '2019-06-01 20:33:22', '54.36.149.71', 'Mozilla'),
(549, '2019-06-01 22:07:38', '54.36.150.100', 'Mozilla'),
(550, '2019-06-01 23:18:51', '54.36.150.35', 'Mozilla'),
(551, '2019-06-01 23:52:58', '54.36.150.124', 'Mozilla'),
(552, '2019-06-02 00:09:20', '54.36.148.248', 'Mozilla'),
(553, '2019-06-02 01:33:35', '54.36.150.187', 'Mozilla'),
(554, '2019-06-02 01:47:32', '54.36.150.34', 'Mozilla'),
(555, '2019-06-02 03:04:52', '54.36.150.131', 'Mozilla'),
(556, '2019-06-02 04:45:01', '54.36.148.142', 'Mozilla'),
(557, '2019-06-02 05:06:10', '54.36.148.21', 'Mozilla'),
(558, '2019-06-02 05:30:36', '54.36.149.9', 'Mozilla'),
(559, '2019-06-02 05:42:33', '54.36.148.52', 'Mozilla'),
(560, '2019-06-02 06:33:52', '54.36.150.182', 'Mozilla'),
(561, '2019-06-02 07:40:05', '54.36.148.212', 'Mozilla'),
(562, '2019-06-02 08:36:03', '54.36.150.159', 'Mozilla'),
(563, '2019-06-02 09:09:54', '54.36.150.81', 'Mozilla'),
(564, '2019-06-02 09:21:06', '54.36.148.98', 'Mozilla'),
(565, '2019-06-02 09:41:59', '54.36.150.27', 'Mozilla'),
(566, '2019-06-02 10:12:19', '54.36.150.68', 'Mozilla'),
(567, '2019-06-02 10:59:29', '54.36.149.11', 'Mozilla'),
(568, '2019-06-02 11:54:37', '54.36.149.106', 'Mozilla'),
(569, '2019-06-02 13:07:29', '54.36.149.0', 'Mozilla'),
(570, '2019-06-02 13:53:09', '54.36.150.185', 'Mozilla'),
(571, '2019-06-02 14:02:44', '54.36.150.166', 'Mozilla'),
(572, '2019-06-02 14:33:08', '54.36.149.10', 'Mozilla'),
(573, '2019-06-02 15:29:38', '54.36.150.148', 'Mozilla'),
(574, '2019-06-02 17:31:22', '54.36.148.0', 'Mozilla'),
(575, '2019-06-02 19:00:04', '103.253.214.20', 'Other'),
(576, '2019-06-02 19:21:59', '54.36.150.9', 'Mozilla'),
(577, '2019-06-02 20:15:37', '54.36.148.37', 'Mozilla'),
(578, '2019-06-02 21:03:11', '13.114.20.38', 'Chrome'),
(579, '2019-06-02 21:57:36', '5.255.250.41', 'YandexBot'),
(580, '2019-06-02 22:48:04', '54.36.149.52', 'Mozilla'),
(581, '2019-06-02 23:10:28', '54.36.148.233', 'Mozilla'),
(582, '2019-06-03 00:30:13', '54.36.150.17', 'Mozilla'),
(583, '2019-06-03 01:52:07', '54.36.150.50', 'Mozilla'),
(584, '2019-06-03 02:11:52', '54.36.150.144', 'Mozilla'),
(585, '2019-06-03 04:13:42', '54.36.150.79', 'Mozilla'),
(586, '2019-06-03 05:01:40', '54.36.148.251', 'Mozilla'),
(587, '2019-06-03 05:09:01', '54.36.148.239', 'Mozilla'),
(588, '2019-06-03 05:34:25', '54.36.148.49', 'Mozilla'),
(589, '2019-06-03 05:49:59', '54.36.148.121', 'Mozilla'),
(590, '2019-06-03 07:59:27', '54.36.149.84', 'Mozilla'),
(591, '2019-06-03 08:32:02', '54.36.150.113', 'Mozilla'),
(592, '2019-06-03 09:20:03', '54.36.148.104', 'Mozilla'),
(593, '2019-06-03 11:03:26', '54.36.148.99', 'Mozilla'),
(594, '2019-06-03 12:23:38', '54.36.148.22', 'Mozilla'),
(595, '2019-06-03 12:30:15', '54.36.148.241', 'Mozilla'),
(596, '2019-06-03 12:30:48', '54.36.148.128', 'Mozilla'),
(597, '2019-06-03 12:44:25', '54.36.148.4', 'Mozilla'),
(598, '2019-06-03 13:04:31', '54.36.148.171', 'Mozilla'),
(599, '2019-06-03 13:54:31', '54.36.148.252', 'Mozilla'),
(600, '2019-06-03 14:18:48', '54.36.150.91', 'Mozilla'),
(601, '2019-06-03 14:51:41', '207.102.138.158', 'Chrome'),
(602, '2019-06-03 15:08:16', '54.36.150.174', 'Mozilla'),
(603, '2019-06-03 15:29:18', '54.36.149.29', 'Mozilla'),
(604, '2019-06-03 16:11:27', '54.36.150.186', 'Mozilla'),
(605, '2019-06-03 16:28:41', '54.36.150.13', 'Mozilla'),
(606, '2019-06-03 17:45:40', '54.36.148.21', 'Mozilla'),
(607, '2019-06-03 18:17:31', '54.36.148.145', 'Mozilla'),
(608, '2019-06-03 18:19:51', '54.36.148.167', 'Mozilla'),
(609, '2019-06-03 19:04:01', '103.253.214.20', 'Other'),
(610, '2019-06-03 19:09:26', '54.36.148.59', 'Mozilla'),
(611, '2019-06-03 20:26:45', '54.36.150.44', 'Mozilla'),
(612, '2019-06-03 20:59:14', '54.36.148.233', 'Mozilla'),
(613, '2019-06-03 21:48:59', '54.36.148.149', 'Mozilla'),
(614, '2019-06-03 22:53:36', '54.36.150.17', 'Mozilla'),
(615, '2019-06-03 23:07:14', '54.36.148.251', 'Mozilla'),
(616, '2019-06-03 23:52:30', '54.36.150.8', 'Mozilla'),
(617, '2019-06-04 00:53:40', '176.113.74.59', 'Chrome'),
(618, '2019-06-04 01:01:13', '54.36.150.101', 'Mozilla'),
(619, '2019-06-04 01:40:16', '54.36.150.141', 'Mozilla'),
(620, '2019-06-04 02:01:57', '54.36.149.45', 'Mozilla'),
(621, '2019-06-04 02:06:40', '54.36.150.161', 'Mozilla'),
(622, '2019-06-04 04:08:50', '5.255.250.41', 'YandexBot'),
(623, '2019-06-04 06:57:39', '54.36.150.166', 'Mozilla'),
(624, '2019-06-04 07:06:37', '54.36.148.193', 'Mozilla'),
(625, '2019-06-04 07:35:49', '54.36.150.16', 'Mozilla'),
(626, '2019-06-04 08:06:54', '54.36.150.184', 'Mozilla'),
(627, '2019-06-04 08:36:51', '54.36.148.38', 'Mozilla'),
(628, '2019-06-04 09:24:20', '54.36.148.95', 'Mozilla'),
(629, '2019-06-04 10:20:46', '54.36.148.109', 'Mozilla'),
(630, '2019-06-04 10:32:33', '54.36.148.236', 'Mozilla'),
(631, '2019-06-04 10:55:08', '54.36.149.16', 'Mozilla'),
(632, '2019-06-04 11:15:55', '54.36.150.88', 'Mozilla'),
(633, '2019-06-04 12:03:27', '209.17.96.242', 'Mozilla'),
(634, '2019-06-04 12:28:11', '54.36.149.34', 'Mozilla'),
(635, '2019-06-04 13:05:51', '54.36.150.170', 'Mozilla'),
(636, '2019-06-04 13:18:50', '54.36.150.140', 'Mozilla'),
(637, '2019-06-04 14:04:34', '54.36.148.129', 'Mozilla'),
(638, '2019-06-04 14:30:52', '141.8.143.183', 'YandexBot'),
(639, '2019-06-04 14:37:19', '54.36.148.102', 'Mozilla'),
(640, '2019-06-04 18:49:09', '5.255.250.41', 'YandexBot'),
(641, '2019-06-04 18:59:19', '209.17.96.42', 'Mozilla'),
(642, '2019-06-04 19:02:31', '103.253.214.20', 'Other'),
(643, '2019-06-04 19:14:14', '93.158.161.171', 'YandexBot'),
(644, '2019-06-04 19:41:14', '141.8.143.183', 'YandexBot'),
(645, '2019-06-05 05:49:58', '54.36.150.40', 'Mozilla'),
(646, '2019-06-05 07:01:06', '185.180.222.15', 'Opera'),
(647, '2019-06-05 10:23:00', '54.36.150.134', 'Mozilla'),
(648, '2019-06-05 10:59:54', '54.36.148.58', 'Mozilla'),
(649, '2019-06-05 12:05:13', '54.36.150.129', 'Mozilla'),
(650, '2019-06-05 19:03:42', '103.253.214.20', 'Other'),
(651, '2019-06-05 21:51:22', '54.36.150.64', 'Mozilla'),
(652, '2019-06-05 21:54:02', '54.36.148.65', 'Mozilla'),
(653, '2019-06-06 02:52:40', '31.13.190.254', 'Chrome'),
(654, '2019-06-06 08:25:03', '54.36.148.71', 'Mozilla'),
(655, '2019-06-06 11:37:22', '165.227.77.71', 'Mozilla'),
(656, '2019-06-06 13:09:06', '54.36.149.72', 'Mozilla'),
(657, '2019-06-06 13:23:49', '5.255.250.41', 'YandexBot'),
(658, '2019-06-06 17:03:47', '54.36.150.102', 'Mozilla'),
(659, '2019-06-06 18:50:08', '5.255.250.41', 'YandexBot'),
(660, '2019-06-06 19:02:29', '103.253.214.20', 'Other'),
(661, '2019-06-06 20:22:08', '54.36.148.37', 'Mozilla'),
(662, '2019-06-06 23:46:07', '54.36.150.174', 'Mozilla'),
(663, '2019-06-07 00:35:28', '54.36.149.70', 'Mozilla'),
(664, '2019-06-07 01:10:20', '54.36.150.57', 'Mozilla'),
(665, '2019-06-07 01:47:26', '54.36.150.99', 'Mozilla'),
(666, '2019-06-07 04:39:54', '54.36.148.224', 'Mozilla'),
(667, '2019-06-07 07:33:32', '54.36.150.138', 'Mozilla'),
(668, '2019-06-07 07:43:06', '54.36.150.175', 'Mozilla'),
(669, '2019-06-07 09:54:44', '209.17.97.42', 'Mozilla'),
(670, '2019-06-07 10:11:57', '54.36.148.11', 'Mozilla'),
(671, '2019-06-07 15:20:44', '141.8.143.183', 'YandexBot'),
(672, '2019-06-07 17:06:22', '54.36.148.156', 'Mozilla'),
(673, '2019-06-07 23:36:19', '54.36.150.72', 'Mozilla'),
(674, '2019-06-08 02:16:32', '51.15.192.148', 'Other'),
(675, '2019-06-08 04:16:00', '209.17.96.250', 'Mozilla'),
(676, '2019-06-08 06:02:01', '54.36.148.211', 'Mozilla'),
(677, '2019-06-08 07:46:50', '54.36.150.85', 'Mozilla'),
(678, '2019-06-08 08:35:37', '54.36.150.104', 'Mozilla'),
(679, '2019-06-08 13:15:00', '54.36.150.147', 'Mozilla'),
(680, '2019-06-08 16:12:13', '54.36.150.57', 'Mozilla'),
(681, '2019-06-08 18:59:51', '103.253.214.20', 'Other'),
(682, '2019-06-08 19:51:20', '5.255.250.41', 'YandexBot'),
(683, '2019-06-09 09:45:09', '54.36.150.137', 'Mozilla'),
(684, '2019-06-09 17:11:29', '54.36.150.160', 'Mozilla'),
(685, '2019-06-09 19:01:01', '103.253.214.20', 'Other'),
(686, '2019-06-09 19:05:15', '54.36.150.77', 'Mozilla'),
(687, '2019-06-09 22:00:52', '54.36.150.155', 'Mozilla'),
(688, '2019-06-10 00:09:09', '54.36.148.143', 'Mozilla'),
(689, '2019-06-10 03:16:50', '54.36.148.17', 'Mozilla'),
(690, '2019-06-10 04:22:30', '54.36.150.16', 'Mozilla'),
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
(908, '2019-07-01 18:08:29', '54.36.150.160', 'Mozilla');
INSERT INTO `tb_pengunjung` (`id`, `tanggal`, `ip`, `perangkat`) VALUES
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
(1273, '2022-12-26 09:38:18', '::1', 'Chrome');


ALTER TABLE `tb_pengunjung`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_pengunjung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_potensi`
--

CREATE TABLE `tb_potensi` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `tb_potensi`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_potensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_slider`
--

CREATE TABLE `tb_slider` (
  `id` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_slider`
--

INSERT INTO `tb_slider` (`id`, `gambar`) VALUES
(1, '950e14f46e438360bd85a38731a3e5b7.jpg'),
(2, '479dfde69b3070bccf7020805dfa700f.jpg'),
(3, '40040babb63c412bcf466df1137f314f.jpg');

ALTER TABLE `tb_slider`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_socmed`
--

CREATE TABLE `tb_socmed` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `tb_socmed`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_socmed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_statis`
--

CREATE TABLE `tb_statis` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_statis`
--

INSERT INTO `tb_statis` (`id`, `judul`, `isi`, `gambar`) VALUES
(1, 'Sambutan Kepala Desa Karang Sari', '<p><strong>Assalammualaikum Wr. Wb</strong></p>\r\n\r\n<p style=\"text-align:justify\">Alhamdulillahhirobbilalamin</p>\r\n\r\n<p style=\"text-align:justify\">Dengan&nbsp;mengucapkan puji dan syukur kehadirat Allah SWT, Serta&nbsp;kami sampaikan salam bagi warga Desa Karang Sari. Selanjutnya dengan senang hati kami sampaikan informasi kepada Anda untuk mengenal lebih dekat Website Desa Karang Sari, Kecamatan Parenggean, Kabupaten Kotawaringin Timur&nbsp;ini. Situs ini diharapkan akan memberikan informasi mengenai perkembangan desa karang sari&nbsp;&nbsp;secara umum tentang pemerintahan, pembangunan dan kemasyarakatan, termasuk didalamnya, khasanah budaya, potensi ekonomi dan pariwisata, yang selalanjutnya dapat digunakan dinas instansi terkait dan stakeholder lainnya dalam rangka pelaksanaan program-progam pembangunan di desa karang sari&nbsp; ini untuk meningkatkan kesejahteraan masyarakat.</p>\r\n\r\n<p style=\"text-align:justify\">Jenderal Besar Sudirman pernah berkata &quot;untuk menang, kita harus kuat, untuk kuat kita harus bersatu, agar kita dapat bersatu kita harus memelihara tali silaturrahhim&quot;, untuk itu kami mengingatkan kepada selurah elemen masyarakat, mari kita menjaga persatuan dan kesatuan dengan tetap memelihara tali silaturrahhim demi keberhasilan program-program pembangunan di Desa Karang Sari.</p>\r\n\r\n<p style=\"text-align:justify\">Semboyan Purbalingga Perwira kita jadikan motivasi dalam bekerja demi terwujudnya Desa yang Baldatun Toyyibatun Warobun Ghofur.</p>\r\n\r\n<p style=\"text-align:justify\">Wabillahi Taufik Walhidayah, Wassalammualaikum Wr. Wb.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Desa Karang Sari, juni 2022</p>\r\n\r\n<p style=\"text-align:justify\">Hormat kami:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">HUSNI TAMBERIN</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n', '1c22f7fc3979810f27fe54c05ec83daf.jpg'),
(2, 'Visi dan Misi', '<p><strong>VISI</strong></p>\r\n\r\n<p>&quot;<strong>TERBENTUKNYA TATA KELOLA PEMERINTAHAN DESA YANG BAIK BERSIH GUNA MEWUJUDKAN KEHIDUPAN MASYARAKAT DESA YANG ADIL, MAKMUR, DAN SEJAHTERA&quot;</strong></p>\r\n\r\n<p><strong>MISI</strong></p>\r\n\r\n<ol>\r\n	<li>MELAKUKAN REFORMASI SISTEM KINERJA&nbsp; APARATUR PEMERINTAH DESA GUNA MENINGKATKAN KUALITAS PELAYANAN KEPADA MASYARAKAT.</li>\r\n	<li>MENYELENGGARAKAN PEMERINTAH YANG BERSIH, TERBEBAS DARI KORUPSI SERTA BENTUK-BENTUK PENYELEWENGAN LAINYA.</li>\r\n	<li>MENYELENGGARAKAN PEMERINTAH DESA SECARA TERBUKA, DAN BERTANGGUNG JAWAB SESUAI DENGAN PERATURAN PERUNDANG-UNDANGAN.</li>\r\n	<li>MENINGKATKAN PEREKONOMIAN MASYARAKAT MELALUI PENDAMPINGAN BERUPA PENYULUHAN KEPADA UKM, WIRASWASTA, DAN PETANI.</li>\r\n	<li>MENINGKATKAN MUTU KESEJAHTERAAN MASYARAKAT UNTUK MENCAPAI TARAF KEHIDUPAN YANG LEBIH BAIK DAN LAYAK SEHINGGA MENJADI LEBIH MAJU DAN MANDIRI.</li>\r\n</ol>\r\n', 'wkwkwk.com'),
(3, 'Struktur Organisasi', '<p style=\"text-align:center\"><span style=\"font-size:20px\"><strong>STRUKTUR ORGANISASI DAN TATA KELOLA KERJA PEMERINTAHAN DESA KARANG SARI&nbsp;KECAMATAN PARENGGEAN&nbsp;KABUPATEN KOTA WARINGIN TIMUR&nbsp;</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:20px\"><strong>(Berdasarkan Peraturan Desa Nomor 04 Tahun 2018)</strong></span></p>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">BPD</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">ABU SAROJI DAN ANGGOTA</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KEPALA DESA</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">HUSNI TAMBERIN</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">SEKERTARIS DESA</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">DANI SETIAWAN</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KAUR UMUM &amp; PERENCANAAN</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">NUR LAILA SURFIN</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KAUR KEUANGAN</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">SETYA BAKTI</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KASI PEMDES</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">NUR WIDYANINGSIH</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KASI KESEJAHTERAAN &amp; PELAYANAN</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">SRI WAHYUNINGSIH</span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">STAFF KASI PEMDES</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"color:#000000\"><span style=\"font-size:16px\">MULYO UTOMO</span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:black\">KETUA RT &amp; RW</span></span></strong></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table style=\"border:undefined; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<div>\r\n			<div>\r\n			<p style=\"text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"color:black\">RT.01 s.d RT.15 &amp; RW. 01 s.d RW.04 </span></span></p>\r\n			</div>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"left\" style=\"border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 'wkwkwk.com'),
(4, 'Profil Pegawai', '<table border=\"1\" cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:solid windowtext 1.0pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#aeaaaa; width:467.5pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">PEGAWAI MENURUT JENIS KELAMIN </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Laki-laki&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; 4&nbsp;orang.</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Perempuan&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp; &nbsp;3 orang.</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#aeaaaa; width:467.5pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">PEGAWAI MENURUT PENDIDIKAN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">S1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 1 orang</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma I&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 1&nbsp;orang.</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">SLTA&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 5 orang.</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">SLTP&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; &nbsp; 0&nbsp;orang.</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#aeaaaa; width:467.5pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">PEGAWAI MENURUT GOLONGAN/RUANG </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Pegawai Negeri Sipil&nbsp;&nbsp; &nbsp;:&nbsp; &nbsp; &nbsp; 1&nbsp;orang.</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:467.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Pegawai Tidak Tetap&nbsp;&nbsp; &nbsp;:&nbsp; &nbsp; &nbsp; 6&nbsp;orang</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'wkwkwk.com'),
(5, ' KETUA RT/RW', '<table border=\"1\" class=\"Table\" style=\"border:solid windowtext 1.0pt\">\r\n	<thead>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">NO</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">NAMA</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">RT/RW</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">NO.HP</span></strong></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><strong><span style=\"font-size:12.0pt\">KETERANGAN</span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">1</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">WAWAN</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">001/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">&nbsp;KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">2</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SUWASNO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">002/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">3</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">FIRMANSAH</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">003/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">4</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PARYANTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">004/002</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">5</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">INDARTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">005/002</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">6</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PAIJO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">006/002</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">7</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">AJI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">007/003</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">8</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SUPRAPTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">008/003</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">9</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PAINO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">009/003</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">10</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">ROBANI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">010/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-&nbsp;</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">11</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">MARSUDI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">011/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">12</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">TEGUH SUSANTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">012/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">13</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">TRIYANTO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">013/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">14</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SAMSIAR</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">014/004</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">15</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">OJO SUTARJO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">015/001</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">-</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RT</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">16</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SUMIKO</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">001,002,003,015</span></span></span></p>\r\n			</td>\r\n			<td style=\"text-align:center\">-</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\">17</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SANDI</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">004,005,006</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\">-</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\">18</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">SAMSURIZAL</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">007,008,013</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\">-</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">19</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">PAIMAN</span></span></span></p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">009,010,011,012,014</span></span></span></p>\r\n			</td>\r\n			<td style=\"text-align:center\">-</td>\r\n			<td>\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:12.0pt\">KETUA RW</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'wkwkwk.com'),
(6, 'ALUR KEGIATAN PELAYANAN', '<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\">ALUR KEGIATAN PELAYANAN</span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:16px\"><strong>DESA KAARANG SARI</strong></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>PEMOHON</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MENYEDIAKAN BERKAS ATAU PERSYARATAN</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>KAUR UMUM</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MEMPEROSES PELAYANAN BERKORDINASI DENGAN PETUGAS TERKAIT</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>SEKERTARIS DESA</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MEMPEROSES PELAYANAN BERKORDINASI DENGAN PETUGAS TERKAIT</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>KEPALA DESA</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MENGOREKSI BERKAS SERTA MEMBERIKAN TANDA TANGAN</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>KAUR UMUM</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MEMERIKSA DATA TELAH SELESAI SERTA MENYERAHKAN DATA</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\"><strong>PEMOHON</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">MENERIMA DATA YANG TELAH SELESAI</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 'wkwkwk.com'),
(7, 'SYARAT PEMBUATAN SURAT ', '<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>SARAT DAN KETENTUAN PEMBUATAN SURAT&nbsp;</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>DESA KARANG SARI</strong></span></p>\r\n\r\n<table align=\"left\" cellspacing=\"0\" class=\"Table\" style=\"background:white; border-collapse:collapse; border:undefined; margin-left:9px; margin-right:9px; width:10.75in\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Tidak Mampu</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KK ATAU KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Domisili</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">&nbsp;KTP Atau&nbsp;KK Yang Bersangkutan</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Kelahiran</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Keterangan Kelahiran Dari Pihak Rumahsakit</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP Kedua Orang Tua</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Kematian</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP Dan KK Yang Bersangkutan</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Usaha</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Ahli Waris</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">SHM</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP Kedua Belah Pihak</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Penghasilan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP&nbsp;</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">SLIP GAJI</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#f9f9f9; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:#f9f9f9; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Kehilangan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:#f9f9f9; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Jalan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Belum Nikah</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">KTP</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Usaha</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Jual Beli</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp Kedua Belah Pihak</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Tanah</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Kuitansi</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Telah Nikah</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Buku Nikah</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Pernyataan Dan Kesepakatan</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp Dua Belah Pihak</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:white; width:32.5pt\">&nbsp;</td>\r\n			<td style=\"background-color:white; width:125.0pt\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Surat Keterangan Bebas Sngketa</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"background-color:white; width:256.5pt\">\r\n			<ul>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Ktp Dua Belah Pihak</span></span></span></span></li>\r\n				<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,\"><span style=\"font-size:9.0pt\"><span style=\"color:#333333\">Shm (Surat Hak Milik)</span></span></span></span></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div><a href=\"https://api.whatsapp.com/send?phone=+6281255285819&amp;text=Halo\"><img src=\"https://i.postimg.cc/TPFtHKP7/dimassawe.png\" /> Whatsapp Kami</a></div>\r\n', 'wkwkwk.com');


ALTER TABLE `tb_statis`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_statis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_submenu`
--

CREATE TABLE `tb_submenu` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `urutan` int(3) NOT NULL,
  `idmenu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `tb_submenu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
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
  `register` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `email`, `jenkel`, `username`, `password`, `nohp`, `status`, `level`, `register`, `photo`) VALUES
(10, 'Dimas tantan suryana', 'abahdimas06@gmail.com', 'L', 'desa', 'e54cc06625bbadf12163b41a3cb92bf8', '081522822538', '1', '1', '2022-12-21 03:07:49', 'ce01b633ff87a80c555472bca36da9dd.png'),
(0, 'admindesa', 'desakarangsari002@gmail', 'L', 'DESA2H', '03c3143092cfc8a1396641a57a8f0cdc', '081255864430', '1', '1', '2022-12-28 01:39:18', '00bd53f7b2382c58b2c020d3d21ada76.png');


ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_agenda`
--
ALTER TABLE `tb_agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userid` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
