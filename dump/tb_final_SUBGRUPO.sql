-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: tb_final
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB-6+b1

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
-- Table structure for table `SUBGRUPO`
--

DROP TABLE IF EXISTS `SUBGRUPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUBGRUPO` (
  `codSubgrupo` int(11) NOT NULL,
  `nomeSubgrupo` varchar(200) NOT NULL,
  `codGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codSubgrupo`),
  KEY `SUBGRUPO_GRUPO_FK` (`codGrupo`),
  CONSTRAINT `SUBGRUPO_GRUPO_FK` FOREIGN KEY (`codGrupo`) REFERENCES `GRUPO` (`codGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUBGRUPO`
--

LOCK TABLES `SUBGRUPO` WRITE;
/*!40000 ALTER TABLE `SUBGRUPO` DISABLE KEYS */;
INSERT INTO `SUBGRUPO` VALUES (101,'Sub Grupo: 01 - Ações coletivas/individuais em saúde',1),(102,'Sub Grupo: 02 - Vigilância em saúde',1),(201,'Sub Grupo: 01 - Coleta de material',2),(202,'Sub Grupo: 02 - Diagnóstico em laboratório clínico',2),(203,'Sub Grupo: 03 - Diagnóstico por anatomia patológica e citopatologia',2),(204,'Sub Grupo: 04 - Diagnóstico por radiologia',2),(205,'Sub Grupo: 05 - Diagnóstico por ultra-sonografia',2),(206,'Sub Grupo: 06 - Diagnóstico por tomografia',2),(207,'Sub Grupo: 07 - Diagnóstico por ressonância magnética',2),(208,'Sub Grupo: 08 - Diagnóstico por medicina nuclear in vivo',2),(209,'Sub Grupo: 09 - Diagnóstico por endoscopia',2),(210,'Sub Grupo: 10 - Diagnóstico por radiologia intervencionista',2),(211,'Sub Grupo: 11 - Métodos diagnósticos em especialidades',2),(212,'Sub Grupo: 12 - Diagnóstico e procedimentos especiais em hemoterapia',2),(213,'Sub Grupo: 13 - Diagnóstico em vigilância epidemiológica e ambiental',2),(214,'Sub Grupo: 14 - Diagnóstico por teste rápido',2),(301,'Sub Grupo: 01 - Consultas / Atendimentos / Acompanhamentos',3),(302,'Sub Grupo: 02 - Fisioterapia',3),(303,'Sub Grupo: 03 - Tratamentos clínicos (outras especialidades)',3),(304,'Sub Grupo: 04 - Tratamento em oncologia',3),(305,'Sub Grupo: 05 - Tratamento em nefrologia',3),(306,'Sub Grupo: 06 - Hemoterapia',3),(307,'Sub Grupo: 07 - Tratamentos odontológicos',3),(309,'Sub Grupo: 09 - Terapias especializadas',3),(310,'Sub Grupo: 10 - Parto e nascimento',3),(401,'Sub Grupo: 01 - Pequenas cirurgias e cirurgias de pele, tecido subcutâneo e mucosa',4),(404,'Sub Grupo: 04 - Cirurgia das vias aéreas superiores, da cabeça e do pescoço',4),(405,'Sub Grupo: 05 - Cirurgia do aparelho da visão',4),(406,'Sub Grupo: 06 - Cirurgia do aparelho circulatório',4),(407,'Sub Grupo: 07 - Cirurgia do aparelho digestivo, orgãos anexos e parede abdominal',4),(408,'Sub Grupo: 08 - Cirurgia do sistema osteomuscular',4),(409,'Sub Grupo: 09 - Cirurgia do aparelho geniturinário',4),(410,'Sub Grupo: 10 - Cirurgia de mama',4),(411,'Sub Grupo: 11 - Cirurgia obstétrica',4),(412,'Sub Grupo: 12 - Cirurgia torácica',4),(413,'Sub Grupo: 13 - Cirurgia reparadora',4),(414,'Sub Grupo: 14 - Cirurgia oro-facial',4),(415,'Sub Grupo: 15 - Outras cirurgias',4),(417,'Sub Grupo: 17 - Anestesiologia',4),(418,'Sub Grupo: 18 - Cirurgia em nefrologia',4),(501,'Sub Grupo: 01 - Coleta e exames para fins de doação de orgãos, tecidos e células e de transplante',5),(503,'Sub Grupo: 03 - Ações relacionadas à doação de orgãos, tecidos e células',5),(504,'Sub Grupo: 04 - Processamento de tecidos para transplante',5),(505,'Sub Grupo: 05 - Transplante de orgãos, tecidos e células',5),(506,'Sub Grupo: 06 - Acompanhamento e intercorrências pós-transplante',5),(604,'Sub Grupo: 04 - Componente Especializado da Assitencia Farmaceutica',6),(701,'Sub Grupo: 01 - Órteses, próteses e materiais especiais não relacionados ao ato cirúrgico',7),(702,'Sub Grupo: 02 - Órteses, próteses e materiais especiais relacionados ao ato cirúrgico',7),(803,'Sub Grupo: 03 - Autorização / Regulação',8);
/*!40000 ALTER TABLE `SUBGRUPO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 17:31:49
