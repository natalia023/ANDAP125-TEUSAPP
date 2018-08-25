-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para teusapp_crm
CREATE DATABASE IF NOT EXISTS `teusapp_crm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `teusapp_crm`;

-- Volcando estructura para tabla teusapp_crm.tbl_rusuarios
CREATE TABLE IF NOT EXISTS `tbl_rusuarios` (
  `usu_nid` int(11) NOT NULL,
  `usu_cdescripcion` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `usu_oestado` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  KEY `usu_nid` (`usu_nid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='maestro de usuarios';

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla teusapp_crm.tbl_tinfraccion
CREATE TABLE IF NOT EXISTS `tbl_tinfraccion` (
  `infr_nid` int(11) DEFAULT NULL,
  `infr_dfecha_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
