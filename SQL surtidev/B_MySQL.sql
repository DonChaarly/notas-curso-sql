-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: surtidoradb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id_articulos` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf16_bin NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `inventario_min` int DEFAULT NULL,
  `inventario_max` int DEFAULT NULL,
  `precio1` decimal(30,2) NOT NULL,
  `precio2` decimal(30,2) DEFAULT NULL,
  `existencias` decimal(30,2) DEFAULT '0.00',
  `ultimo_precio_compra` decimal(30,2) DEFAULT NULL,
  `veces_comprado` int DEFAULT '0',
  `modificacion_precio` tinyint(1) DEFAULT '1',
  `id_categorias` int DEFAULT '1',
  PRIMARY KEY (`id_articulos`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `articulo_categoria_idx` (`id_categorias`),
  FULLTEXT KEY `articulo_nombre` (`nombre`),
  CONSTRAINT `articulo_categoria_fk` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=16564 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `id_cajas` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_cajas`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,'CAJA1'),(2,'CAJA2'),(3,'CAJA3'),(4,'CAJA4');
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categorias` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_departamentos` int NOT NULL,
  PRIMARY KEY (`id_categorias`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `departamento_categoira_fk_idx` (`id_departamentos`),
  FULLTEXT KEY `categoria_nombre_ft` (`nombre`),
  CONSTRAINT `categoria_departamento_fk` FOREIGN KEY (`id_departamentos`) REFERENCES `departamentos` (`id_departamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'SIN DEFINIR',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `delete_categoria` BEFORE DELETE ON `categorias` FOR EACH ROW BEGIN
		UPDATE Articulos SET Articulos.id_categorias = 1 WHERE OLD.id_categorias = Articulos.id_categorias;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `telefono` bigint DEFAULT NULL,
  `direccion` varchar(80) COLLATE utf16_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_clientes`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  FULLTEXT KEY `cliente_nombre_ft` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'PG','PUBLICO GENERAL',NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `delete_cliente` BEFORE DELETE ON `clientes` FOR EACH ROW BEGIN
		UPDATE Ventas SET Ventas.id_clientes = 1 WHERE OLD.id_clientes = ventas.id_clientes;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compras` int NOT NULL AUTO_INCREMENT,
  `folio` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_provedores` int NOT NULL,
  `id_usuarios` int NOT NULL,
  `id_cajas` int NOT NULL,
  `fecha` date NOT NULL,
  `en_espera` tinyint(1) NOT NULL DEFAULT '0',
  `total` decimal(30,2) DEFAULT NULL,
  PRIMARY KEY (`id_compras`),
  UNIQUE KEY `folio_UNIQUE` (`folio`),
  KEY `compra_provedor_fk_idx` (`id_provedores`),
  KEY `compra_usuraio_fk_idx` (`id_usuarios`),
  KEY `compra_caja_fk_idx` (`id_cajas`),
  CONSTRAINT `compra_caja_fk` FOREIGN KEY (`id_cajas`) REFERENCES `cajas` (`id_cajas`),
  CONSTRAINT `compra_provedor_fk` FOREIGN KEY (`id_provedores`) REFERENCES `provedores` (`id_provedores`),
  CONSTRAINT `compra_usuraio_fk` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'1',1,1,1,'2022-08-30',0,0.00);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamentos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_departamentos`),
  UNIQUE KEY `Nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'SIN DEFINIR');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `delete_departamento` BEFORE DELETE ON `departamentos` FOR EACH ROW BEGIN
		DELETE FROM Categorias WHERE Categorias.id_departamentos = OLD.id_departamentos;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detallescomprasarticulos`
--

DROP TABLE IF EXISTS `detallescomprasarticulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallescomprasarticulos` (
  `id_detalles_compras_articulos` int NOT NULL AUTO_INCREMENT,
  `id_articulos` int NOT NULL,
  `id_compras` int NOT NULL,
  `cantidad` decimal(30,2) NOT NULL,
  `precio_compra` decimal(30,2) NOT NULL,
  `precio1_venta` decimal(30,2) NOT NULL,
  `precio2_venta` decimal(30,2) DEFAULT NULL,
  `importe` decimal(30,2) NOT NULL,
  PRIMARY KEY (`id_detalles_compras_articulos`),
  KEY `detalleCompraArticulo_articulo_idx` (`id_articulos`),
  KEY `detalleCompraArticulo_compra_idx` (`id_compras`),
  CONSTRAINT `detalleCompraArticulo_articulo_fk` FOREIGN KEY (`id_articulos`) REFERENCES `articulos` (`id_articulos`),
  CONSTRAINT `detalleCompraArticulo_compra_fk` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallescomprasarticulos`
--

LOCK TABLES `detallescomprasarticulos` WRITE;
/*!40000 ALTER TABLE `detallescomprasarticulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallescomprasarticulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesprovedoresarticulos`
--

DROP TABLE IF EXISTS `detallesprovedoresarticulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesprovedoresarticulos` (
  `id_detalles_provedores_articulos` int NOT NULL AUTO_INCREMENT,
  `id_articulos` int NOT NULL,
  `id_provedores` int NOT NULL,
  `ult_precio` int NOT NULL,
  PRIMARY KEY (`id_detalles_provedores_articulos`),
  KEY `detalleArticulo_provedor_idx` (`id_provedores`),
  KEY `detalleArticulo_articulo_idx` (`id_articulos`),
  CONSTRAINT `detalleArticulo_articulo` FOREIGN KEY (`id_articulos`) REFERENCES `articulos` (`id_articulos`),
  CONSTRAINT `detalleArticulo_provedor` FOREIGN KEY (`id_provedores`) REFERENCES `provedores` (`id_provedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesprovedoresarticulos`
--

LOCK TABLES `detallesprovedoresarticulos` WRITE;
/*!40000 ALTER TABLE `detallesprovedoresarticulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesprovedoresarticulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesventasarticulos`
--

DROP TABLE IF EXISTS `detallesventasarticulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesventasarticulos` (
  `id_detalles_ventas_articulos` int NOT NULL AUTO_INCREMENT,
  `id_articulos` int NOT NULL,
  `id_ventas` int DEFAULT NULL,
  `cantidad` decimal(30,2) NOT NULL,
  `precio_unitario` decimal(30,2) NOT NULL,
  `importe` decimal(30,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalles_ventas_articulos`),
  KEY `detalleVentaArticulo_articulo_fk_idx` (`id_articulos`),
  KEY `detalleVentaArticulo_venta_fk_idx` (`id_ventas`),
  CONSTRAINT `detalleVentaArticulo_articulo_fk` FOREIGN KEY (`id_articulos`) REFERENCES `articulos` (`id_articulos`),
  CONSTRAINT `detalleVentaArticulo_venta_fk` FOREIGN KEY (`id_ventas`) REFERENCES `ventas` (`id_ventas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesventasarticulos`
--

LOCK TABLES `detallesventasarticulos` WRITE;
/*!40000 ALTER TABLE `detallesventasarticulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesventasarticulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleados` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion` varchar(80) COLLATE utf16_spanish_ci DEFAULT NULL,
  `telefono` bigint DEFAULT NULL,
  `puesto` varchar(30) COLLATE utf16_spanish_ci DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_empleados`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'ADMIN','ADMIN',NULL,NULL,'ADMIN',NULL);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `delete_empleado` BEFORE DELETE ON `empleados` FOR EACH ROW BEGIN
		DELETE FROM Usuarios WHERE Usuarios.id_empleados = OLD.id_empleados;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id_empresas` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `telefono` bigint DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_empresas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Tienda',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promociones` int NOT NULL AUTO_INCREMENT,
  `id_articulos` int NOT NULL,
  `codigo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf16_spanish_ci NOT NULL,
  `cantidad` decimal(30,2) NOT NULL,
  `precio` decimal(30,2) NOT NULL,
  PRIMARY KEY (`id_promociones`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `promocion_articulo_fk_idx` (`id_articulos`),
  CONSTRAINT `FKibjr8ma0agubiey9cpx2ffqjq` FOREIGN KEY (`id_promociones`) REFERENCES `articulos` (`id_articulos`),
  CONSTRAINT `promocion_articulo_fk` FOREIGN KEY (`id_articulos`) REFERENCES `articulos` (`id_articulos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedores`
--

DROP TABLE IF EXISTS `provedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedores` (
  `id_provedores` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rfc` varchar(30) DEFAULT NULL,
  `telefono` bigint DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_provedores`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedores`
--

LOCK TABLES `provedores` WRITE;
/*!40000 ALTER TABLE `provedores` DISABLE KEYS */;
INSERT INTO `provedores` VALUES (1,'SP','SIN PROVEDOR',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `provedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `delete_provedor` BEFORE DELETE ON `provedores` FOR EACH ROW BEGIN
		UPDATE Compras SET Compras.id_provedores = 1 WHERE OLD.id_provedores = compras.id_provedores;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_roles` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `seccion_catalogo` tinyint(1) NOT NULL DEFAULT '1',
  `agregar_articulo` tinyint(1) NOT NULL DEFAULT '0',
  `eliminar_articulo` tinyint(1) NOT NULL DEFAULT '0',
  `editar_articulo` tinyint(1) NOT NULL DEFAULT '0',
  `exportar_articulos` tinyint(1) NOT NULL DEFAULT '0',
  `importar_articulos` tinyint(1) NOT NULL DEFAULT '0',
  `seccion_consultas` tinyint(1) NOT NULL DEFAULT '0',
  `cambiar_fecha_consulta` tinyint(1) NOT NULL DEFAULT '0',
  `cancelar_venta` tinyint(1) NOT NULL DEFAULT '0',
  `cancelar_compra` tinyint(1) NOT NULL DEFAULT '0',
  `seccion_ventas` tinyint(1) NOT NULL DEFAULT '0',
  `realizar_venta` tinyint(1) NOT NULL DEFAULT '0',
  `cambiar_precio` tinyint(1) NOT NULL DEFAULT '0',
  `seccion_reportes` tinyint(1) NOT NULL DEFAULT '0',
  `cambiar_fecha_reporte` tinyint(1) NOT NULL DEFAULT '0',
  `seccion_compras` tinyint(1) NOT NULL DEFAULT '0',
  `seccion_configuraciones` tinyint(1) NOT NULL DEFAULT '0',
  `seccion_otros` tinyint(1) NOT NULL DEFAULT '0',
  `preguntar_imprimir` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_roles`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,'ROLE_CAJERO',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0),(3,'ROLE_CONSULTOR',1,0,0,0,1,0,1,1,0,0,1,0,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `delete_rol` BEFORE DELETE ON `roles` FOR EACH ROW BEGIN
		UPDATE Usuarios SET Usuarios.id_roles = 3 WHERE OLD.id_roles = Usuarios.id_roles;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuarios` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf16_spanish_ci NOT NULL,
  `id_empleados` int NOT NULL,
  `id_roles` int NOT NULL,
  `password` varchar(130) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_usuarios`),
  KEY `usuario_empleado_fk_idx` (`id_empleados`),
  KEY `usuario_rol_fk_idx` (`id_roles`),
  CONSTRAINT `usuario_empleado_fk` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`),
  CONSTRAINT `usuario_rol_fk` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'ADMIN',1,1,'$2a$10$mi4SZPGe3q7eH.xaHGaJ2uTUTEdiCdx7jPAaBuFTB962hRR17QMQ2',1),(2,'CAJA1',1,2,'$2a$10$mi4SZPGe3q7eH.xaHGaJ2uTUTEdiCdx7jPAaBuFTB962hRR17QMQ2',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `delete_usuario` BEFORE DELETE ON `usuarios` FOR EACH ROW BEGIN
		UPDATE Ventas SET Ventas.id_usuarios = 1 WHERE OLD.id_usuarios = Ventas.id_usuarios;
        UPDATE Compras SET Compras.id_usuarios = 1 WHERE OLD.id_usuarios = Compras.id_usuarios;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_ventas` int NOT NULL AUTO_INCREMENT,
  `folio` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_usuarios` int NOT NULL,
  `id_clientes` int NOT NULL,
  `id_cajas` int NOT NULL,
  `fecha` date NOT NULL,
  `en_espera` tinyint(1) NOT NULL DEFAULT '0',
  `total` decimal(30,2) DEFAULT NULL,
  PRIMARY KEY (`id_ventas`),
  UNIQUE KEY `folio_UNIQUE` (`folio`),
  KEY `venta_usuario_fk_idx` (`id_usuarios`),
  KEY `venta_cliente_idx` (`id_clientes`),
  KEY `venta_caja_idx` (`id_cajas`),
  CONSTRAINT `venta_caja` FOREIGN KEY (`id_cajas`) REFERENCES `cajas` (`id_cajas`),
  CONSTRAINT `venta_cliente` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`),
  CONSTRAINT `venta_usuario_fk` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'1',1,1,1,'2022-08-30',0,0.00);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-06 22:42:42
