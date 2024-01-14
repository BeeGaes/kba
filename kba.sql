-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jan 2024 pada 09.47
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
-- Database: `kba`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_awal`
--

CREATE TABLE `bahan_awal` (
  `id_bahan_awal` int(11) NOT NULL,
  `nama_bahan_awal` varchar(255) DEFAULT NULL,
  `jenis_bahan_awal` enum('Bahan aktif','Bahan penolong','Bahan kemas','') NOT NULL,
  `no_bahan_awal` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `produsen_bahan_awal` varchar(255) NOT NULL,
  `pemasok_bahan_awal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_kba`
--

CREATE TABLE `form_kba` (
  `id_form_KBA` int(11) NOT NULL,
  `id_bahan_awal` int(11) NOT NULL,
  `id_keluhan` int(11) NOT NULL,
  `distribusi_bidang` enum('Bidang Pengadaan','Bidang SCM','Bidang LBA','Arsip') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `investigasi_hasil_uji`
--

CREATE TABLE `investigasi_hasil_uji` (
  `id_investigasi` int(11) NOT NULL,
  `id_keluhan` int(11) NOT NULL,
  `no_huls` varchar(50) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `no_bets` varchar(50) DEFAULT NULL,
  `no_spesifikasi` varchar(50) DEFAULT NULL,
  `no_metode_analisa` varchar(50) DEFAULT NULL,
  `hasil_pengujian` varchar(255) DEFAULT NULL,
  `persyaratan_hasil_uji` varchar(255) DEFAULT NULL,
  `tanggal_sampling` date NOT NULL,
  `tanggal_pengujian` date NOT NULL,
  `nama_analis` varchar(255) DEFAULT NULL,
  `obyek_investigasi` text NOT NULL,
  `hasil_pemeriksaan` enum('Sesuai','Tidak sesuai','NA','Ya','Tidak','Ada','Tidak ada','Sudah','Belum','< 1th','> 1th') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `kesimpulan` text NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluhan`
--

CREATE TABLE `keluhan` (
  `id_keluhan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_pengirim_keluhan` varchar(255) NOT NULL,
  `tanggal_keluhan` date NOT NULL,
  `alasan_keluhan` text NOT NULL,
  `status_keluhan` enum('selesai','tidak selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_form_KBA` int(11) NOT NULL,
  `tanggapan_bidang_p4` text NOT NULL,
  `tanggapan_bidang_pengadaan` text NOT NULL,
  `rencana_tgl_penyelesaian` date NOT NULL,
  `tinjauan_tanggapan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan_awal`
--
ALTER TABLE `bahan_awal`
  ADD PRIMARY KEY (`id_bahan_awal`);

--
-- Indeks untuk tabel `form_kba`
--
ALTER TABLE `form_kba`
  ADD PRIMARY KEY (`id_form_KBA`),
  ADD KEY `id_bahan_awal` (`id_bahan_awal`,`id_keluhan`),
  ADD KEY `id_keluhan` (`id_keluhan`);

--
-- Indeks untuk tabel `investigasi_hasil_uji`
--
ALTER TABLE `investigasi_hasil_uji`
  ADD PRIMARY KEY (`id_investigasi`),
  ADD KEY `id_keluhan` (`id_keluhan`);

--
-- Indeks untuk tabel `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`id_keluhan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_form_KBA` (`id_form_KBA`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bahan_awal`
--
ALTER TABLE `bahan_awal`
  MODIFY `id_bahan_awal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `form_kba`
--
ALTER TABLE `form_kba`
  MODIFY `id_form_KBA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `investigasi_hasil_uji`
--
ALTER TABLE `investigasi_hasil_uji`
  MODIFY `id_investigasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keluhan`
--
ALTER TABLE `keluhan`
  MODIFY `id_keluhan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `form_kba`
--
ALTER TABLE `form_kba`
  ADD CONSTRAINT `form_kba_ibfk_1` FOREIGN KEY (`id_bahan_awal`) REFERENCES `bahan_awal` (`id_bahan_awal`),
  ADD CONSTRAINT `form_kba_ibfk_2` FOREIGN KEY (`id_keluhan`) REFERENCES `investigasi_hasil_uji` (`id_keluhan`);

--
-- Ketidakleluasaan untuk tabel `investigasi_hasil_uji`
--
ALTER TABLE `investigasi_hasil_uji`
  ADD CONSTRAINT `investigasi_hasil_uji_ibfk_1` FOREIGN KEY (`id_keluhan`) REFERENCES `keluhan` (`id_keluhan`);

--
-- Ketidakleluasaan untuk tabel `keluhan`
--
ALTER TABLE `keluhan`
  ADD CONSTRAINT `keluhan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_form_KBA`) REFERENCES `form_kba` (`id_form_KBA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
