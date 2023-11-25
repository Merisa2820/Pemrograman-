-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 31 Agu 2022 pada 04.36
-- Versi server: 5.7.34
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipgp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pangkat`
--

CREATE TABLE `pangkat` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `status_pegawai` varchar(50) NOT NULL,
  `golongan` varchar(20) NOT NULL,
  `mulai_tugas` date NOT NULL,
  `gaji_pokok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pangkat`
--

INSERT INTO `pangkat` (`id`, `id_pegawai`, `status_pegawai`, `golongan`, `mulai_tugas`, `gaji_pokok`) VALUES
(1, 2, 'PNS', '1', '2022-08-21', 3500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nuptk` varchar(20) NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `pendidikan` enum('SLTA / SEDERAJAT','DIPLOMA I / II','DIPLOMA III / AKADEMI / S.MUDA','DIPLOMA IV / STRATA I','STRATA II','STRATA III') NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `sertifikasi` varchar(255) NOT NULL,
  `kepegawaian` varchar(255) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `tmt_kerja` varchar(100) NOT NULL,
  `tugas_tambahan` varchar(255) NOT NULL,
  `mengajar` varchar(100) NOT NULL,
  `jumlah_jam` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nip`, `nuptk`, `jenis_kelamin`, `pendidikan`, `jurusan`, `sertifikasi`, `kepegawaian`, `jabatan`, `tmt_kerja`, `tugas_tambahan`, `mengajar`, `jumlah_jam`) VALUES
(2, 'Merisa', '12345678', '1234567', 'Wanita', 'DIPLOMA IV / STRATA I', 'Pendidikan Bahasa Inggris', 'TOEFL', 'PNS', 'Guru', 'X', 'Wali Kelas', 'Bahasa Inggris', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `potongan`
--

CREATE TABLE `potongan` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `iwp_1` int(11) NOT NULL,
  `iwp_8` int(11) NOT NULL,
  `pph` int(11) NOT NULL,
  `p_bank` int(11) NOT NULL,
  `p_koperasi` int(11) NOT NULL,
  `p_sosial` int(11) NOT NULL,
  `p_dharma` int(11) NOT NULL,
  `jumlah_potongan` int(11) NOT NULL,
  `jumlah_bersih` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `potongan`
--

INSERT INTO `potongan` (`id`, `id_pegawai`, `iwp_1`, `iwp_8`, `pph`, `p_bank`, `p_koperasi`, `p_sosial`, `p_dharma`, `jumlah_potongan`, `jumlah_bersih`) VALUES
(1, 2, 42000, 336000, 100000, 50000, 25000, 15000, 10000, 578000, 3622000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tunjangan`
--

CREATE TABLE `tunjangan` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `t_isbn` int(11) NOT NULL,
  `t_anak` int(11) NOT NULL,
  `t_penghasilan` int(11) NOT NULL,
  `t_fungsional_umum` int(11) NOT NULL,
  `t_fungsional` int(11) NOT NULL,
  `t_pph` int(11) NOT NULL,
  `gaji_kotor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tunjangan`
--

INSERT INTO `tunjangan` (`id`, `id_pegawai`, `t_isbn`, `t_anak`, `t_penghasilan`, `t_fungsional_umum`, `t_fungsional`, `t_pph`, `gaji_kotor`) VALUES
(2, 2, 100000, 100000, 100000, 100000, 100000, 200000, 4200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `img`) VALUES
(1, 'Administrator', 'admin', '$2y$10$sfbLj5Fye066nyouvgJqeup2JwldBGlOVUNhAOTTSr4us8kInSF0W', 'Admin', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pangkat`
--
ALTER TABLE `pangkat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `potongan`
--
ALTER TABLE `potongan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pangkat`
--
ALTER TABLE `pangkat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `potongan`
--
ALTER TABLE `potongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tunjangan`
--
ALTER TABLE `tunjangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
