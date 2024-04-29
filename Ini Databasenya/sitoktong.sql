-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Apr 2024 pada 09.04
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sitoktong`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `netto` varchar(16) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama`, `netto`, `stok`, `harga`, `harga_beli`) VALUES
(1, 'Beras', '1 kg', 100, 15000, 12000),
(2, 'Gula Pasir', '1 kg', 97, 20000, 16000),
(3, 'Minyak Goreng', '100 ml', 96, 16000, 15000),
(4, 'Telur Ayam', '1 kg', 98, 32000, 28000),
(5, 'Mie Instant Rebus', '1 pcs', 97, 3500, 3000),
(6, 'Mie Goreng', '1 pcs', 96, 4000, 3500),
(7, 'Susu Kental Manis', '1 pcs', 100, 2000, 1500),
(8, 'Susu Bubuk', '1 pcs', 100, 4000, 3500),
(9, 'Kopi ', '1 pcs', 50, 1500, 1250),
(10, 'Susu Cair', '200 ml', 96, 3500, 2700),
(11, 'Biskuit', '300gr', 90, 10000, 8000),
(12, 'Wafer', '110gr', 100, 5000, 4000),
(13, 'Pasta Gigi', '75gr', 98, 6000, 5400),
(14, 'Sabun Mandi', '70gr', 100, 3500, 3000),
(15, 'Shampo', '10 ml', 100, 500, 400),
(16, 'Sabun Cuci Pakaian', '200gr', 100, 2000, 1800),
(18, 'Sabun Cuci Piring', '100 ml', 100, 2500, 2000),
(19, 'Pembersih Lantai', '25 ml', 100, 500, 400),
(20, 'Pelicin Pakaian', '11 ml', 100, 1000, 800),
(21, 'Rokok', '1 Bungkus', 98, 30000, 27000),
(22, 'Teh Botol', '450ml', 100, 7500, 6000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `id` int(11) NOT NULL,
  `idBarang` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `netto` varchar(32) NOT NULL,
  `jmlPenyesuaian` int(11) NOT NULL,
  `keterangan` varchar(512) NOT NULL,
  `user` varchar(32) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`id`, `idBarang`, `nama`, `netto`, `jmlPenyesuaian`, `keterangan`, `user`, `tanggal`) VALUES
(48, 1, 'Beras', '1 kg', 40, 'Restock', 'Hilmi (Karyawan)', '2024-04-28 22:34:23'),
(49, 21, 'Rokok', '1 Bungkus', 100, 'Restock', 'Hilmi (admin)', '2024-04-29 08:22:00'),
(50, 22, 'Teh Botol', '450ml', 100, 'Restock', 'Hilmi (admin)', '2024-04-29 14:02:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `idBarang` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `netto` varchar(32) NOT NULL,
  `harga` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `user` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `idBarang`, `nama`, `netto`, `harga`, `harga_beli`, `jumlah`, `tanggal`, `user`) VALUES
(21, 6, 'Mie Goreng', '1 pcs', 4000, 3500, 4, '2024-04-28 22:25:43', 'Hilmi (admin)'),
(22, 5, 'Mie Instant Rebus', '1 pcs', 3500, 3000, 3, '2024-04-28 22:25:43', 'Hilmi (admin)'),
(23, 10, 'Susu Cair', '200 ml', 3500, 2700, 4, '2024-04-28 22:26:35', 'Hilmi (admin)'),
(24, 1, 'Beras', '1 kg', 15000, 12000, 5, '2024-04-28 22:27:38', 'Hilmi (admin)'),
(25, 4, 'Telur Ayam', '1 kg', 32000, 28000, 2, '2024-04-28 22:27:38', 'Hilmi (admin)'),
(26, 1, 'Beras', '1 kg', 15000, 12000, 4, '2024-04-28 22:31:58', 'Hilmi (Karyawan)'),
(27, 1, 'Beras', '1 kg', 15000, 12000, 10, '2024-04-28 22:32:24', 'Hilmi (Karyawan)'),
(28, 1, 'Beras', '1 kg', 15000, 12000, 21, '2024-04-28 22:33:16', 'Hilmi (Karyawan)'),
(29, 9, 'Kopi ', '1 pcs', 1500, 1250, 50, '2024-04-28 22:35:54', 'Hilmi (Karyawan)'),
(30, 2, 'Gula Pasir', '1 kg', 20000, 16000, 3, '2024-04-28 22:36:37', 'Hilmi (Karyawan)'),
(31, 3, 'Minyak Goreng', '100 ml', 16000, 15000, 4, '2024-04-28 22:37:30', 'Hilmi (Karyawan)'),
(32, 11, 'Biskuit', '300gr', 10000, 8000, 10, '2024-04-28 22:38:27', 'Hilmi (Karyawan)'),
(33, 21, 'Rokok', '1 Bungkus', 30000, 27000, 2, '2024-04-29 08:23:03', 'Hilmi (admin)'),
(34, 13, 'Pasta Gigi', '75gr', 6000, 5400, 2, '2024-04-29 13:57:41', 'Hilmi (admin)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  `rule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `password`, `rule`) VALUES
(1, 'Hilmi (admin)', '$2y$10$/lqrqVKWZ5phpou8NBecrOT9uAKDqyDQFJ9R56GnbHazsKBnwp06u', 1),
(2, 'Hilmi (Karyawan)', '$2y$10$Do5c0LzDqnO5z45g2SMAhOG5iwfh8XFNoBdhdPux2A3aVCb.VacG.', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
