-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Feb 2024 pada 09.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kba`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_huls`
--

CREATE TABLE `tbl_huls` (
  `id_huls` int(11) NOT NULL,
  `no_huls` int(50) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `no_bets` varchar(50) NOT NULL,
  `no_spesifikasi` varchar(50) NOT NULL,
  `no_metode_analisa` varchar(50) NOT NULL,
  `hasil_pengujian` varchar(50) NOT NULL,
  `persyaratan_hasil_uji` varchar(50) NOT NULL,
  `tanggal_sampling` date NOT NULL,
  `tanggal_pengujian` date NOT NULL,
  `nama_analis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_huls`
--

INSERT INTO `tbl_huls` (`id_huls`, `no_huls`, `nama_bahan`, `no_bets`, `no_spesifikasi`, `no_metode_analisa`, `hasil_pengujian`, `persyaratan_hasil_uji`, `tanggal_sampling`, `tanggal_pengujian`, `nama_analis`) VALUES
(1, 0, 'PTP Irbersartan 150mg kaptab.SS. Ed-03', 'I01723H047 ', 'DLS 323JO', '-', '14,448862 gram', '12,0 - 13-8', '2024-08-28', '2024-08-29', 'Septiyeni');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kba`
--

CREATE TABLE `tbl_kba` (
  `id_kba` int(11) NOT NULL,
  `jenis_bahan` int(1) NOT NULL COMMENT '1-Bahan Aktif 2-Bahan Penolong 3-Bahan Kemas',
  `nama_bahan` varchar(100) NOT NULL,
  `no_bets_lot` varchar(50) NOT NULL,
  `jumlah_bahan` varchar(50) NOT NULL,
  `produsen_bahan` varchar(100) NOT NULL,
  `pemasok_bahan` varchar(100) NOT NULL,
  `tanggal_datang` date NOT NULL,
  `no_sp_oc_kontrak` varchar(50) NOT NULL,
  `no_ppb` varchar(50) NOT NULL,
  `no_lab` varchar(50) NOT NULL,
  `alasan_keluhan` text NOT NULL,
  `rekomendasi_bidang` text NOT NULL,
  `catatan` text NOT NULL,
  `distribusi_bidang` int(1) NOT NULL COMMENT '1-Bidang Pengadaan 2-Bidang SCM 3-Bidang LBA 4-Arsip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_kba`
--

INSERT INTO `tbl_kba` (`id_kba`, `jenis_bahan`, `nama_bahan`, `no_bets_lot`, `jumlah_bahan`, `produsen_bahan`, `pemasok_bahan`, `tanggal_datang`, `no_sp_oc_kontrak`, `no_ppb`, `no_lab`, `alasan_keluhan`, `rekomendasi_bidang`, `catatan`, `distribusi_bidang`) VALUES
(1, 3, 'PTP Irbersartan 150mg kaptab.SS. Ed-03', 'I01723H047', '10 Rol', 'PT. Induksarana Kemasindo', 'PT. Induksarana Kemasindo', '2024-08-28', '6100011537', '5000265980', 'K23 1333', 'Hasil uji bobot per meter PTP foil 14,32797 - 14,54218 gram, x= 14,448862 gram (syarat ; 12,0 - 13,8 gram)', 'PT. Induksarana Kemasindo agar memberikan penjelasan secara tertulis kepada QC PT. Indofarma mengenai :\r\n1. Penyebab masalah tersebut\r\n2. Perbaikan proses produksi yang dilakukan sehinga untuk kedatangan PTP Irbersartan 150mg kaptab.SS. Ed-03 berikutnya bobot per meter sudah sesuai spesifikasi yaitu 12,0 - 13,8 gram.\r\nPT. Induksarana Kemasindo agar memberikan perhatian yang serius mengenai masalah tersebut dengan lebih memperhatikan pada saat proses produksi sehingga pengiriman berikutnya kasus yang sama tidak terulang lagi. ', 'Ini merupakan KBA peringatan, kami menunggu jawaban mengenai klaim ini paling lambat tujuh (7) hari setelah klaim diterima', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tanggapan`
--

CREATE TABLE `tbl_tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_kba` int(11) NOT NULL,
  `tanggapan_bidang_p4` text NOT NULL,
  `tanggapan_bidang_pengadaan` text NOT NULL,
  `tanggal_penyelesaian` date NOT NULL,
  `tinjauan` text NOT NULL,
  `status` int(1) NOT NULL COMMENT '1-Selesai 2-Tidak Selesai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `level` int(1) NOT NULL COMMENT '1-Administrator 2-Petugas Sampling 3-Asman Lab 4-Analis Lab 5-Manager QC 6-Manager QA 7-GM QC 8-GM QA',
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `username`, `fullname`, `password`, `level`, `foto`) VALUES
(2, 'admin', 'administrator', '$2y$10$dD6VpX6jPSdAj65gi4ISUONdnnFjNCmyneaGv8TybVNlv4GNsOr7S', 1, 'default.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_huls`
--
ALTER TABLE `tbl_huls`
  ADD PRIMARY KEY (`id_huls`);

--
-- Indeks untuk tabel `tbl_kba`
--
ALTER TABLE `tbl_kba`
  ADD PRIMARY KEY (`id_kba`);

--
-- Indeks untuk tabel `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_kba` (`id_kba`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_huls`
--
ALTER TABLE `tbl_huls`
  MODIFY `id_huls` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_kba`
--
ALTER TABLE `tbl_kba`
  MODIFY `id_kba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  ADD CONSTRAINT `tbl_tanggapan_ibfk_1` FOREIGN KEY (`id_kba`) REFERENCES `tbl_kba` (`id_kba`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
