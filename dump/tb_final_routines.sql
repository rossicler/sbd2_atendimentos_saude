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
-- Temporary table structure for view `v_quantidadePorCaraterAtendimento`
--

DROP TABLE IF EXISTS `v_quantidadePorCaraterAtendimento`;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorCaraterAtendimento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_quantidadePorCaraterAtendimento` (
  `nomeCaraterAtendimento` tinyint NOT NULL,
  `quantidade_atendimentos` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_quantidadePorEstabelecimentoAnoMes`
--

DROP TABLE IF EXISTS `v_quantidadePorEstabelecimentoAnoMes`;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorEstabelecimentoAnoMes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_quantidadePorEstabelecimentoAnoMes` (
  `anoMes` tinyint NOT NULL,
  `nomeEstabelecimento` tinyint NOT NULL,
  `quantidade_atendimentos` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_quantidadePorProcedimento`
--

DROP TABLE IF EXISTS `v_quantidadePorProcedimento`;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorProcedimento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_quantidadePorProcedimento` (
  `nomeProcedimento` tinyint NOT NULL,
  `quantidade_atendimentos` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_quantidadePorEstabelecimento`
--

DROP TABLE IF EXISTS `v_quantidadePorEstabelecimento`;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorEstabelecimento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_quantidadePorEstabelecimento` (
  `nomeEstabelecimento` tinyint NOT NULL,
  `quantidade_atendimentos` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_quantidadePorCaraterAtendimento`
--

/*!50001 DROP TABLE IF EXISTS `v_quantidadePorCaraterAtendimento`*/;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorCaraterAtendimento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`datapolicy_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_quantidadePorCaraterAtendimento` AS select `ca`.`nomeCaraterAtendimento` AS `nomeCaraterAtendimento`,count(0) AS `quantidade_atendimentos` from (`ATENDIMENTO` `atd` join `CARATER_ATENDIMENTO` `ca` on((`ca`.`codCarater` = `atd`.`codCarater`))) group by `ca`.`codCarater` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_quantidadePorEstabelecimentoAnoMes`
--

/*!50001 DROP TABLE IF EXISTS `v_quantidadePorEstabelecimentoAnoMes`*/;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorEstabelecimentoAnoMes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`datapolicy_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_quantidadePorEstabelecimentoAnoMes` AS select `atd`.`anoMes` AS `anoMes`,`est`.`nomeEstabelecimento` AS `nomeEstabelecimento`,count(0) AS `quantidade_atendimentos` from (`ATENDIMENTO` `atd` join `ESTABELECIMENTO_CNES` `est` on((`atd`.`codEstabelecimento` = `est`.`codEstabelecimento`))) group by `atd`.`anoMes`,`atd`.`codEstabelecimento` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_quantidadePorProcedimento`
--

/*!50001 DROP TABLE IF EXISTS `v_quantidadePorProcedimento`*/;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorProcedimento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`datapolicy_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_quantidadePorProcedimento` AS select `p`.`nomeProcedimento` AS `nomeProcedimento`,count(0) AS `quantidade_atendimentos` from (`ATENDIMENTO` `atd` join `PROCEDIMENTO` `p` on((`p`.`codProcedimento` = `atd`.`codProcedimento`))) group by `p`.`codProcedimento` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_quantidadePorEstabelecimento`
--

/*!50001 DROP TABLE IF EXISTS `v_quantidadePorEstabelecimento`*/;
/*!50001 DROP VIEW IF EXISTS `v_quantidadePorEstabelecimento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`datapolicy_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_quantidadePorEstabelecimento` AS select `est`.`nomeEstabelecimento` AS `nomeEstabelecimento`,count(0) AS `quantidade_atendimentos` from (`ATENDIMENTO` `atd` join `ESTABELECIMENTO_CNES` `est` on((`atd`.`codEstabelecimento` = `est`.`codEstabelecimento`))) group by `atd`.`codEstabelecimento` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 17:31:49
