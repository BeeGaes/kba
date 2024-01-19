-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jan 2024 pada 10.25
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
-- Struktur dari tabel `formulir_kba`
--

CREATE TABLE `formulir_kba` (
  `id_formulir_KBA` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jenis_bahan` enum('Bahan Aktif','Bahan Penolong','Bahan Kemas') NOT NULL,
  `nama_bahan` varchar(255) NOT NULL,
  `no_bets/lot` varchar(255) NOT NULL,
  `jumlah_bahan` varchar(255) NOT NULL,
  `produsen_bahan` varchar(255) NOT NULL,
  `pemasok_bahan` varchar(255) NOT NULL,
  `tanggal_datang` date NOT NULL,
  `no_sp/oc/kontrak` int(25) NOT NULL,
  `no_ppb` int(25) NOT NULL,
  `no_lab` varchar(255) NOT NULL,
  `alasan_keluhan` text NOT NULL,
  `rekomendasi_bidang_pengawas_mutu` text NOT NULL,
  `catatan` text NOT NULL,
  `distribusi_bidang` enum('Bidang Pengadaan','Bidang SCM','Bidang LBA','Arsip') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `investigasi_hasil_uji`
--

CREATE TABLE `investigasi_hasil_uji` (
  `id_investigasi` int(11) NOT NULL,
  `id_formulir_KBA` int(11) NOT NULL,
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
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_formulir_KBA` int(11) NOT NULL,
  `tanggapan_bidang_p4` text NOT NULL,
  `tanggapan_bidang_pengadaan` text NOT NULL,
  `rencana_tgl_penyelesaian` date NOT NULL,
  `tinjauan_tanggapan` text NOT NULL,
  `status` enum('Selesai','Tidak Selesai','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '1-Admin\r\n2-Petugas Sampling\r\n3-Asman LAB\r\n4-Analis LAB\r\n5-Manager QC\r\n6-GM QC\r\n7-GM QA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `formulir_kba`
--
ALTER TABLE `formulir_kba`
  ADD PRIMARY KEY (`id_formulir_KBA`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `investigasi_hasil_uji`
--
ALTER TABLE `investigasi_hasil_uji`
  ADD PRIMARY KEY (`id_investigasi`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `formulir_kba`
--
ALTER TABLE `formulir_kba`
  MODIFY `id_formulir_KBA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `investigasi_hasil_uji`
--
ALTER TABLE `investigasi_hasil_uji`
  MODIFY `id_investigasi` int(11) NOT NULL AUTO_INCREMENT;

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
-- Ketidakleluasaan untuk tabel `investigasi_hasil_uji`
--
ALTER TABLE `investigasi_hasil_uji`
  ADD CONSTRAINT `investigasi_hasil_uji_ibfk_1` FOREIGN KEY (`id_formulir_KBA`) REFERENCES `keluhan` (`id_keluhan`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_formulir_KBA`) REFERENCES `form_kba` (`id_form_KBA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
