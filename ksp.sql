-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2019 at 11:32 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ksp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cicilan`
--

CREATE TABLE IF NOT EXISTS `cicilan` (
`id` int(11) NOT NULL,
  `kode_nasabah` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `cicilan`
--

INSERT INTO `cicilan` (`id`, `kode_nasabah`, `cicilan_ke`, `jumlah`, `tanggal`) VALUES
(19, 222, 1, 50000, '2019-06-14'),
(20, 222, 4, 50000, '2019-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `keanggotaan`
--

CREATE TABLE IF NOT EXISTS `keanggotaan` (
`id` int(11) unsigned NOT NULL,
  `jenis` varchar(100) DEFAULT NULL,
  `simpanan_pokok` int(11) DEFAULT NULL,
  `simpanan_wajib` int(11) DEFAULT NULL,
  `bunga_simpanan` float DEFAULT NULL,
  `denda_pinjaman` float DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keanggotaan`
--

INSERT INTO `keanggotaan` (`id`, `jenis`, `simpanan_pokok`, `simpanan_wajib`, `bunga_simpanan`, `denda_pinjaman`, `keterangan`) VALUES
(1, 'Masyarakat', 500, 0, 0.5, 0.2, 'Setelah simpanan di atas Rp. 1 juta'),
(2, 'Anggota', 500, 5000, 0.7, 0.2, 'Setelah ada saldo simpanan pokok'),
(3, 'Siswa', 0, 0, 0, 0.2, 'Tanpa jasa');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE IF NOT EXISTS `nasabah` (
`id` int(11) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `departemen` varchar(40) DEFAULT '',
  `alamat` varchar(200) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `keanggotaan_id` int(11) DEFAULT NULL,
  `tgl_masuk` varchar(20) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id`, `kode`, `nama`, `departemen`, `alamat`, `hp`, `keanggotaan_id`, `tgl_masuk`) VALUES
(3, '222', 'danta', '0', 'rawa - rawa', '02922834', 1, '2019-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE IF NOT EXISTS `pinjaman` (
`id` int(11) NOT NULL,
  `kode_nasabah` int(11) NOT NULL,
  `jenis` enum('Uang','Barang') NOT NULL,
  `jumlah` int(20) NOT NULL,
  `lama` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `bunga` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`id`, `kode_nasabah`, `jenis`, `jumlah`, `lama`, `tanggal`, `status`, `bunga`, `total_bayar`) VALUES
(10, 222, 'Uang', 200000, 4, '2019-06-14', '4', 1, 202500);

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE IF NOT EXISTS `preference` (
  `attr` varchar(200) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preference`
--

INSERT INTO `preference` (`attr`, `value`) VALUES
('last_check_bunga', '2019-06-13');

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE IF NOT EXISTS `simpanan` (
`id` int(11) NOT NULL,
  `kode_nasabah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('Pokok','Wajib','Sukarela','Bunga','Ambil') NOT NULL,
  `jumlah` float NOT NULL,
  `sld` float DEFAULT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `simpanan`
--

INSERT INTO `simpanan` (`id`, `kode_nasabah`, `tanggal`, `jenis`, `jumlah`, `sld`, `created`) VALUES
(4, '222', '2019-06-14', 'Sukarela', 200000, 200000, 1560470553);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `level` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `level`, `username`, `password`) VALUES
(5, 'Administrator', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(6, 'teller', 'teller', 'teller', '8482dfb1bca15b503101eb438f52deed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cicilan`
--
ALTER TABLE `cicilan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cicilan`
--
ALTER TABLE `cicilan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `simpanan`
--
ALTER TABLE `simpanan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
