-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2020 pada 20.15
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `ID_KASIR` int(11) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASWORD` varchar(50) DEFAULT NULL,
  `TELEFON` varchar(15) DEFAULT NULL,
  `ROLE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`ID_KASIR`, `USERNAME`, `PASWORD`, `TELEFON`, `ROLE`) VALUES
(1, 'admin', 'admin', '0000', 1),
(2, 'kasir', 'kasir', '2222', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `ID_DETAIL_PEM` int(11) NOT NULL,
  `ID_BARANG` int(11) DEFAULT NULL,
  `ID_PEMBELIAN` int(11) DEFAULT NULL,
  `HARGA_BELI` int(11) DEFAULT NULL,
  `QTY_PEM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`ID_DETAIL_PEM`, `ID_BARANG`, `ID_PEMBELIAN`, `HARGA_BELI`, `QTY_PEM`) VALUES
(1, 1, 1, 1000, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `ID_DETAIL_PEN` int(11) NOT NULL,
  `ID_BARANG` int(11) DEFAULT NULL,
  `ID_PENJUALAN` int(11) DEFAULT NULL,
  `HARGA_JUAL` int(11) DEFAULT NULL,
  `QTY_PEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`ID_DETAIL_PEN`, `ID_BARANG`, `ID_PENJUALAN`, `HARGA_JUAL`, `QTY_PEN`) VALUES
(1, 1, 1, 1000, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keuntungan`
--

CREATE TABLE `keuntungan` (
  `ID_KEUNTUNGAN` int(11) NOT NULL,
  `ID_PENJUALAN` int(11) DEFAULT NULL,
  `ID_PEMBELIAN` int(11) DEFAULT NULL,
  `NOMINAL_KEUNTUNGAN` int(11) DEFAULT NULL,
  `TANGGAL_KEUNTUNGAN` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keuntungan`
--

INSERT INTO `keuntungan` (`ID_KEUNTUNGAN`, `ID_PENJUALAN`, `ID_PEMBELIAN`, `NOMINAL_KEUNTUNGAN`, `TANGGAL_KEUNTUNGAN`) VALUES
(1, 1, 1, 0, '2020-02-01 00:00:00'),
(2, NULL, NULL, 0, '2020-02-02 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `ID_PEMBELIAN` int(11) NOT NULL,
  `ID_KASIR` int(11) DEFAULT NULL,
  `TANGGAL_PEMBELIAN` datetime DEFAULT NULL,
  `QTY_SUPLAI` int(11) DEFAULT NULL,
  `TOTAL_HARGA_PEM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`ID_PEMBELIAN`, `ID_KASIR`, `TANGGAL_PEMBELIAN`, `QTY_SUPLAI`, `TOTAL_HARGA_PEM`) VALUES
(1, 1, '2020-02-01 00:00:00', 10, 10000),
(2, 2, '2020-02-01 00:00:00', 20, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `ID_KASIR` int(11) DEFAULT NULL,
  `TANGGAL_PENJUALAN` datetime DEFAULT NULL,
  `QTY_PENJUALAN` int(11) DEFAULT NULL,
  `TOTAL_HARGA_PENJUALAN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`ID_PENJUALAN`, `ID_KASIR`, `TANGGAL_PENJUALAN`, `QTY_PENJUALAN`, `TOTAL_HARGA_PENJUALAN`) VALUES
(1, 2, '2020-02-01 00:00:00', 5, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_barang`
--

CREATE TABLE `stock_barang` (
  `ID_BARANG` int(11) NOT NULL,
  `TIPE_BARANG` int(11) DEFAULT NULL,
  `NAMA_BARANG` varchar(50) DEFAULT NULL,
  `QTY_INVENTORY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stock_barang`
--

INSERT INTO `stock_barang` (`ID_BARANG`, `TIPE_BARANG`, `NAMA_BARANG`, `QTY_INVENTORY`) VALUES
(1, 0, 'air mineral', 10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_KASIR`);

--
-- Indeks untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`ID_DETAIL_PEM`),
  ADD KEY `FK_BARANG_MASUK` (`ID_BARANG`),
  ADD KEY `FK_DETAIL_MEMBELI` (`ID_PEMBELIAN`);

--
-- Indeks untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`ID_DETAIL_PEN`),
  ADD KEY `FK_DETAIL_JUAL` (`ID_BARANG`),
  ADD KEY `FK_DETAI_MENJUAL` (`ID_PENJUALAN`);

--
-- Indeks untuk tabel `keuntungan`
--
ALTER TABLE `keuntungan`
  ADD PRIMARY KEY (`ID_KEUNTUNGAN`),
  ADD KEY `FK_KEUNTUNGAN_PEMBELIAN` (`ID_PEMBELIAN`),
  ADD KEY `FK_KEUNTUNGAN_PENJUALAN` (`ID_PENJUALAN`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`ID_PEMBELIAN`),
  ADD KEY `FK_NOTA_BELI` (`ID_KASIR`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_PENJUALAN`),
  ADD KEY `FK_NOTA_JUAL` (`ID_KASIR`);

--
-- Indeks untuk tabel `stock_barang`
--
ALTER TABLE `stock_barang`
  ADD PRIMARY KEY (`ID_BARANG`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `FK_BARANG_MASUK` FOREIGN KEY (`ID_BARANG`) REFERENCES `stock_barang` (`ID_BARANG`),
  ADD CONSTRAINT `FK_DETAIL_MEMBELI` FOREIGN KEY (`ID_PEMBELIAN`) REFERENCES `pembelian` (`ID_PEMBELIAN`);

--
-- Ketidakleluasaan untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `FK_DETAIL_JUAL` FOREIGN KEY (`ID_BARANG`) REFERENCES `stock_barang` (`ID_BARANG`),
  ADD CONSTRAINT `FK_DETAI_MENJUAL` FOREIGN KEY (`ID_PENJUALAN`) REFERENCES `penjualan` (`ID_PENJUALAN`);

--
-- Ketidakleluasaan untuk tabel `keuntungan`
--
ALTER TABLE `keuntungan`
  ADD CONSTRAINT `FK_KEUNTUNGAN_PEMBELIAN` FOREIGN KEY (`ID_PEMBELIAN`) REFERENCES `pembelian` (`ID_PEMBELIAN`),
  ADD CONSTRAINT `FK_KEUNTUNGAN_PENJUALAN` FOREIGN KEY (`ID_PENJUALAN`) REFERENCES `penjualan` (`ID_PENJUALAN`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `FK_NOTA_BELI` FOREIGN KEY (`ID_KASIR`) REFERENCES `admin` (`ID_KASIR`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `FK_NOTA_JUAL` FOREIGN KEY (`ID_KASIR`) REFERENCES `admin` (`ID_KASIR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
