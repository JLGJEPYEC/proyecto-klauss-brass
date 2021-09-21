CREATE DATABASE  IF NOT EXISTS `klaussbrass` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `klaussbrass`;
-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: klaussbrass
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acta_contable`
--

DROP TABLE IF EXISTS `acta_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acta_contable` (
  `idacta_contable` int(11) NOT NULL AUTO_INCREMENT,
  `mes_registro` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `saldo` double NOT NULL,
  PRIMARY KEY (`idacta_contable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_contable`
--

LOCK TABLES `acta_contable` WRITE;
/*!40000 ALTER TABLE `acta_contable` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_contable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'productos ferreteria'),(2,'armado de piezas'),(3,'soluciones metal mecanicas'),(4,'elementos contundentes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotdemandada`
--

DROP TABLE IF EXISTS `cotdemandada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotdemandada` (
  `idcotDemandada` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDemanda` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `productobuscado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `cantidades` double NOT NULL,
  `detalles` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcotDemandada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotdemandada`
--

LOCK TABLES `cotdemandada` WRITE;
/*!40000 ALTER TABLE `cotdemandada` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotdemandada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotofertada`
--

DROP TABLE IF EXISTS `cotofertada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotofertada` (
  `idcotOfertada` int(11) NOT NULL AUTO_INCREMENT,
  `cotDemandada` int(11) NOT NULL,
  `prov_empresa_RUC` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcotOfertada`),
  KEY `fk_cotOfertada_cotDemandada1` (`cotDemandada`),
  KEY `fk_cotOfertada_prov_empresa1` (`prov_empresa_RUC`),
  CONSTRAINT `fk_cotOfertada_cotDemandada1` FOREIGN KEY (`cotDemandada`) REFERENCES `cotdemandada` (`idcotDemandada`),
  CONSTRAINT `fk_cotOfertada_prov_empresa1` FOREIGN KEY (`prov_empresa_RUC`) REFERENCES `prov_empresa` (`RUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotofertada`
--

LOCK TABLES `cotofertada` WRITE;
/*!40000 ALTER TABLE `cotofertada` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotofertada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteriocalidad`
--

DROP TABLE IF EXISTS `criteriocalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteriocalidad` (
  `idcriterioCalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCrit` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `esAceptable` tinyint(4) NOT NULL,
  `idProduccion` int(11) NOT NULL,
  PRIMARY KEY (`idcriterioCalidad`),
  KEY `fk_criterioCalidad_Produccion1` (`idProduccion`),
  CONSTRAINT `fk_criterioCalidad_Produccion1` FOREIGN KEY (`idProduccion`) REFERENCES `produccion` (`idProduccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteriocalidad`
--

LOCK TABLES `criteriocalidad` WRITE;
/*!40000 ALTER TABLE `criteriocalidad` DISABLE KEYS */;
INSERT INTO `criteriocalidad` VALUES (1,'la base debe estar lisa',0,1),(2,'la goma debe ser de alta calidad',0,1);
/*!40000 ALTER TABLE `criteriocalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `costoUnit` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidades` double DEFAULT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `RUC` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `monto_total` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `registro_pagos_idregistro_pagos` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_Factura_registro_pagos1` (`registro_pagos_idregistro_pagos`),
  CONSTRAINT `fk_Factura_registro_pagos1` FOREIGN KEY (`registro_pagos_idregistro_pagos`) REFERENCES `registro_pagos` (`idregistro_pagos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ganancia`
--

DROP TABLE IF EXISTS `ganancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ganancia` (
  `idGanancia` int(11) NOT NULL AUTO_INCREMENT,
  `idProduccion` int(11) NOT NULL,
  `RUC_emp_pagadora` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `monto_final` double NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `detalles` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `registro_pagos_idregistro_pagos` int(11) DEFAULT NULL,
  `codOperacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idGanancia`),
  KEY `fk_Ganancia_Produccion1` (`idProduccion`),
  KEY `fk_Ganancia_registro_pagos1` (`registro_pagos_idregistro_pagos`),
  CONSTRAINT `fk_Ganancia_Produccion1` FOREIGN KEY (`idProduccion`) REFERENCES `produccion` (`idProduccion`),
  CONSTRAINT `fk_Ganancia_registro_pagos1` FOREIGN KEY (`registro_pagos_idregistro_pagos`) REFERENCES `registro_pagos` (`idregistro_pagos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ganancia`
--

LOCK TABLES `ganancia` WRITE;
/*!40000 ALTER TABLE `ganancia` DISABLE KEYS */;
INSERT INTO `ganancia` VALUES (1,1,'',56633,'2021-02-03','pago hecho por atencion al cliente. no hay observaciones',NULL,'Scotiabank');
/*!40000 ALTER TABLE `ganancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastosfijos`
--

DROP TABLE IF EXISTS `gastosfijos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastosfijos` (
  `idgastosFijos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `monto` double NOT NULL,
  `ruc_gf` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_gf` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `raz_social_gf` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `registro_pagos_idregistro_pagos` int(11) NOT NULL,
  PRIMARY KEY (`idgastosFijos`),
  KEY `fk_gastosFijos_registro_pagos1` (`registro_pagos_idregistro_pagos`),
  CONSTRAINT `fk_gastosFijos_registro_pagos1` FOREIGN KEY (`registro_pagos_idregistro_pagos`) REFERENCES `registro_pagos` (`idregistro_pagos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastosfijos`
--

LOCK TABLES `gastosfijos` WRITE;
/*!40000 ALTER TABLE `gastosfijos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastosfijos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guiaremision`
--

DROP TABLE IF EXISTS `guiaremision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guiaremision` (
  `idGuiaRemision` int(11) NOT NULL AUTO_INCREMENT,
  `tipoProducto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `DescripcionProducto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Peso` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `prov_empresa_RUC` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idGuiaRemision`),
  KEY `fk_GuiaRemision_prov_empresa1` (`prov_empresa_RUC`),
  CONSTRAINT `fk_GuiaRemision_prov_empresa1` FOREIGN KEY (`prov_empresa_RUC`) REFERENCES `prov_empresa` (`RUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guiaremision`
--

LOCK TABLES `guiaremision` WRITE;
/*!40000 ALTER TABLE `guiaremision` DISABLE KEYS */;
/*!40000 ALTER TABLE `guiaremision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guiaremision_has_producto`
--

DROP TABLE IF EXISTS `guiaremision_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guiaremision_has_producto` (
  `id_gr_r` int(11) NOT NULL AUTO_INCREMENT,
  `GuiaRemision_idGuiaRemision` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`id_gr_r`),
  KEY `fk_GuiaRemision_has_Producto_GuiaRemision1` (`GuiaRemision_idGuiaRemision`),
  KEY `fk_GuiaRemision_has_Producto_Producto1` (`Producto_idProducto`),
  CONSTRAINT `fk_GuiaRemision_has_Producto_GuiaRemision1` FOREIGN KEY (`GuiaRemision_idGuiaRemision`) REFERENCES `guiaremision` (`idGuiaRemision`),
  CONSTRAINT `fk_GuiaRemision_has_Producto_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guiaremision_has_producto`
--

LOCK TABLES `guiaremision_has_producto` WRITE;
/*!40000 ALTER TABLE `guiaremision_has_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `guiaremision_has_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kardex` (
  `idkardex` int(11) NOT NULL AUTO_INCREMENT,
  `elem_totales` int(11) NOT NULL,
  PRIMARY KEY (`idkardex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operarioproduccion`
--

DROP TABLE IF EXISTS `operarioproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operarioproduccion` (
  `idOP` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idProduccion` int(11) NOT NULL,
  `rol` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idOP`),
  KEY `fk_operarioProduccion_usuario` (`iduser`),
  KEY `fk_operarioProduccion_produccion` (`idProduccion`),
  CONSTRAINT `fk_operarioProduccion_produccion` FOREIGN KEY (`idProduccion`) REFERENCES `produccion` (`idProduccion`),
  CONSTRAINT `fk_operarioProduccion_usuario` FOREIGN KEY (`iduser`) REFERENCES `usuario` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operarioproduccion`
--

LOCK TABLES `operarioproduccion` WRITE;
/*!40000 ALTER TABLE `operarioproduccion` DISABLE KEYS */;
INSERT INTO `operarioproduccion` VALUES (1,1,1,'branding de marca'),(2,4,1,'gestion de aleatoriedad'),(3,5,1,'esculpir');
/*!40000 ALTER TABLE `operarioproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produccion` (
  `idProduccion` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) NOT NULL,
  `idrequerimiento` int(11) NOT NULL,
  `fechaProduccion` date NOT NULL,
  `urgencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estadoProduccion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idProduccion`),
  KEY `fk_Produccion_Categoria1` (`idCategoria`),
  KEY `fk_Produccion_requerimiento1` (`idrequerimiento`),
  CONSTRAINT `fk_Produccion_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `fk_Produccion_requerimiento1` FOREIGN KEY (`idrequerimiento`) REFERENCES `requerimiento` (`idrequerimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
INSERT INTO `produccion` VALUES (1,4,3,'2021-02-20','urgente','Pagado');
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `tipoProducto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `esAceptado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `kardex` int(11) NOT NULL,
  `cotOfertada` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_Producto_kardex1` (`kardex`),
  KEY `fk_Producto_cotOfertada1` (`cotOfertada`),
  CONSTRAINT `fk_Producto_cotOfertada1` FOREIGN KEY (`cotOfertada`) REFERENCES `cotofertada` (`idcotOfertada`),
  CONSTRAINT `fk_Producto_kardex1` FOREIGN KEY (`kardex`) REFERENCES `kardex` (`idkardex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_has_produccion`
--

DROP TABLE IF EXISTS `producto_has_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_has_produccion` (
  `id_pp` int(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` int(11) NOT NULL,
  `Produccion_idProduccion` int(11) NOT NULL,
  PRIMARY KEY (`id_pp`),
  KEY `fk_Producto_has_Produccion_Producto1` (`Producto_idProducto`),
  KEY `fk_Producto_has_Produccion_Produccion1` (`Produccion_idProduccion`),
  CONSTRAINT `fk_Producto_has_Produccion_Produccion1` FOREIGN KEY (`Produccion_idProduccion`) REFERENCES `produccion` (`idProduccion`),
  CONSTRAINT `fk_Producto_has_Produccion_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_has_produccion`
--

LOCK TABLES `producto_has_produccion` WRITE;
/*!40000 ALTER TABLE `producto_has_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_has_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prov_empresa`
--

DROP TABLE IF EXISTS `prov_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prov_empresa` (
  `RUC` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `idUser` int(11) NOT NULL,
  `Rubro` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Razon_Social` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` int(11) NOT NULL,
  PRIMARY KEY (`RUC`),
  KEY `prov_empresa_ibfk_1` (`idUser`),
  CONSTRAINT `prov_empresa_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prov_empresa`
--

LOCK TABLES `prov_empresa` WRITE;
/*!40000 ALTER TABLE `prov_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `prov_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_pagos`
--

DROP TABLE IF EXISTS `registro_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_pagos` (
  `idregistro_pagos` int(11) NOT NULL AUTO_INCREMENT,
  `dia` date NOT NULL,
  `tipo_reg_pago` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idacta_contable` int(11) NOT NULL,
  PRIMARY KEY (`idregistro_pagos`),
  KEY `fk_registro_pagos_acta_contable1` (`idacta_contable`),
  CONSTRAINT `fk_registro_pagos_acta_contable1` FOREIGN KEY (`idacta_contable`) REFERENCES `acta_contable` (`idacta_contable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_pagos`
--

LOCK TABLES `registro_pagos` WRITE;
/*!40000 ALTER TABLE `registro_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requerimiento`
--

DROP TABLE IF EXISTS `requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requerimiento` (
  `idrequerimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreReq` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fechaEntrega` date NOT NULL,
  `pagoEstimado` double NOT NULL,
  `RUCempresa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_emp` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `calidadReq` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `compromisoPago` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `cantidad_productos` double NOT NULL,
  PRIMARY KEY (`idrequerimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerimiento`
--

LOCK TABLES `requerimiento` WRITE;
/*!40000 ALTER TABLE `requerimiento` DISABLE KEYS */;
INSERT INTO `requerimiento` VALUES (1,'cerraduras ultra','de tres cierres electrico','2021-02-19',5000,'390444','emp1','Regular','20% pago adelantado','2021-02-02',100),(2,'tornillos','5 hilos x mil','2021-02-13',4000,'9511ff33','emp2','Buena','5% de defectos se rechaza','2021-02-02',1000),(3,'llaves para moto','llaves con seguro reforzado','2021-04-02',7000,'9974722','motos ronco','Alta','pago contra entrega','2021-02-02',14000),(4,'brazos para freno v-brake','frenos de laton plateado','2021-02-27',8000,'822441','monark del peru','Alta','1% se procede a devolucion','2021-02-02',8000),(5,'carcasa para grupo electrógeno','pintura aislante de calor','2021-04-10',50000,'542233','modasa','Buena','pago por deuda','2021-02-02',1000),(6,'vallas separadoras','debe contener marca de la MML','2021-05-16',70000,'80854','municipalidad de lima','Media','10% adelanto','2021-02-02',1500),(7,'casilleros de metal 6x10','tamaño 40x40','2021-03-17',20000,'902993','maletek','Media','incluyen cerraduras','2021-02-02',20),(8,'lavaderos provisionales','portatiles para poner rotoplas','2021-02-26',500,'876542','cc arenales','Baja','pago por adelantado','2021-02-03',5);
/*!40000 ALTER TABLE `requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre1` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre2` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ApellidoP` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoM` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Contraseña` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Sueldo` float NOT NULL,
  `TipoContrato` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `tipoUsuario` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Lorenzo','Gutierrez','Jorgechagua','1234',5000,'Estable 5 años','juan@aea.com','Jefe Produccion'),(2,'Alex','Rommel','Rojas','Coaquira','1234',4000,'Estable 4 años','rommel@aea.com','Atencion al Cliente'),(3,'Argenis',NULL,'Uceda','Malca','1234',3000,'Temporal 12 meses','argenis@aea.com','Asistente Compras'),(4,'Jesus','Sebastian','Huamanculi','Casavilca','1234',4000,'Estable 3 años','sebas@aea.com','Proveedor'),(5,'Jose','Miguel','Vilca','Huillcaya','1234',4000,'Temporal 6 meses','jose@aea.com','Operario Almacen'),(6,'Angie','Alessandra','Olaya','Silipu','1234',5000,'Estable 4 añoss','angie@aea.com','Jefe Compras'),(7,'Angelo','Jesus','Davalos','Salvador','1234',3000,'Temporal 12 meses','angelo@aea.com','Inspector Calidad'),(8,'Enrique','Miguel','Chalco','Vila','1234',4000,'Temporal 12 meses','chalco@aea.com','Jefe Calidad'),(9,'Natalie',NULL,'Paulett','Ramirez','1234',5000,'Estable 3 años','natalie@aea.com','Jefe Area Contable'),(10,'Martin',NULL,'Barueto','Suarez','1234',2500,'Temporal 12 meses','barueto@aea.com','Operario Produccion'),(11,'Sandra','Briggite','Chavarry','Alvarez','1234',2500,'Temporal 12 meses','sandra@aea.com','Operario Produccion'),(12,'Abigail','Marife','Montes','Yngar','1234',2500,'Temporal 12 meses','abigail@aea.com','Operario Produccion'),(13,'alma',NULL,'molina','reyes','1234',2500,'Temporal 12 meses','alma@aea.com','Operario Produccion'),(14,'Alvaro',NULL,'Espiritu','Inga','1234',2500,'Temporal 12 meses','alvaro@aea.com','Operario Produccion');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 20:13:44
