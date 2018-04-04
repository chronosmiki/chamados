CREATE DATABASE  IF NOT EXISTS `lri` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lri`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: lri
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Temporary view structure for view `buscatudo`
--

DROP TABLE IF EXISTS `buscatudo`;
/*!50001 DROP VIEW IF EXISTS `buscatudo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `buscatudo` AS SELECT 
 1 AS `ID`,
 1 AS `Solicitante WHIRLPOOL`,
 1 AS `Responsável LRI`,
 1 AS `Parte Contrária`,
 1 AS `Tipo`,
 1 AS `Objeto`,
 1 AS `Valor do Contrato`,
 1 AS `Empresa Grupo WHP`,
 1 AS `Complexidade`,
 1 AS `Urgência`,
 1 AS `Data da Solicitação`,
 1 AS `Prazo`,
 1 AS `Data de Entrega`,
 1 AS `Urgência 1º Retorno`,
 1 AS `Data do 1º Retorno`,
 1 AS `Prazo do 1º Retorno`,
 1 AS `Data da Entrega do 1º Retorno`,
 1 AS `Urgência 2º Retorno`,
 1 AS `Data do 2º Retorno`,
 1 AS `Prazo do 2º Retorno`,
 1 AS `Data da Entrega do 2º Retorno`,
 1 AS `Urgência 3º Retorno`,
 1 AS `Data do 3º Retorno`,
 1 AS `Prazo do 3º Retorno`,
 1 AS `Data da Entrega do 3º Retorno`,
 1 AS `Comentários LRI`,
 1 AS `STATUS`,
 1 AS `Solicitante da Área`,
 1 AS `Área Solicitante`,
 1 AS `Solicitação Enviada`,
 1 AS `Resposta da Análise - LRI`,
 1 AS `Solicitação 1º Retorno`,
 1 AS `Resposta do 1º Retorno`,
 1 AS `Solicitação 2º Retorno`,
 1 AS `Resposta do 2º Retorno`,
 1 AS `Solicitação 3º Retorno`,
 1 AS `Resposta do 3º Retorno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `id_whpSolic` int(11) NOT NULL,
  `id_lriResp` int(11) DEFAULT NULL,
  `partCont` text NOT NULL,
  `id_Tipo` int(11) NOT NULL,
  `id_Obj` int(11) NOT NULL,
  `vlrCont` float NOT NULL,
  `id_empWhp` int(11) NOT NULL,
  `complex` text NOT NULL,
  `urg` text NOT NULL,
  `data_solic` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `prazo` date NOT NULL,
  `data_entrega` date NOT NULL,
  `urg_ret1` text NOT NULL,
  `data_ret1` date NOT NULL,
  `prazo_ret1` date NOT NULL,
  `data_ent1` date NOT NULL,
  `urg_ret2` text,
  `data_ret2` date DEFAULT NULL,
  `prazo_ret2` date DEFAULT NULL,
  `data_ent2` date DEFAULT NULL,
  `urg_ret3` text,
  `data_ret3` date DEFAULT NULL,
  `prazo_ret3` date DEFAULT NULL,
  `data_ent3` date DEFAULT NULL,
  `lri_coment` text,
  `status` tinyint(1) NOT NULL,
  `solicArea` text NOT NULL,
  `areaSolic` text NOT NULL,
  `solicEnvi` text NOT NULL,
  `respAnali` text NOT NULL,
  `solicRet1` text NOT NULL,
  `respRet1` text NOT NULL,
  `solicRet2` text,
  `respRet2` text,
  `solicRet3` text,
  `respRet3` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `Usuários LRI_idx` (`id_lriResp`),
  KEY `Solicitantes_idx` (`id_whpSolic`),
  KEY `Tipos_idx` (`id_Tipo`),
  KEY `Objetos_idx` (`id_Obj`),
  KEY `Empresa WHP_idx` (`id_empWhp`),
  CONSTRAINT `Empresa WHP` FOREIGN KEY (`id_empWhp`) REFERENCES `emp_whp` (`ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Objetos` FOREIGN KEY (`id_Obj`) REFERENCES `objetos` (`ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Solicitantes` FOREIGN KEY (`id_whpSolic`) REFERENCES `solicitantes` (`ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Tipos` FOREIGN KEY (`id_Tipo`) REFERENCES `tipos` (`ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Usuários LRI` FOREIGN KEY (`id_lriResp`) REFERENCES `users_lri` (`ID`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (1,1,1,'TESTE',1,1,20,1,'alta','sim','2018-01-02 13:18:40','2018-03-03','2018-04-03','sim','2018-05-05','2018-05-05','2018-06-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'teste','teste','teste','teste','teste','teste',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_whp`
--

DROP TABLE IF EXISTS `emp_whp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_whp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Empresas do grupo WHP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_whp`
--

LOCK TABLES `emp_whp` WRITE;
/*!40000 ALTER TABLE `emp_whp` DISABLE KEYS */;
INSERT INTO `emp_whp` VALUES (1,'BUD'),(2,'Consulado da Mulher'),(3,'Embraco'),(4,'MLOG'),(5,'WHP'),(6,'WHP AM');
/*!40000 ALTER TABLE `emp_whp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetos`
--

DROP TABLE IF EXISTS `objetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetos` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `objeto` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Objetos de um contrato';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetos`
--

LOCK TABLES `objetos` WRITE;
/*!40000 ALTER TABLE `objetos` DISABLE KEYS */;
INSERT INTO `objetos` VALUES (1,'Análise de Autorização de Faturamento'),(2,'Análise de Contrato de prestação de serviços de seguro'),(3,'Análise de Contrato de Desenvolvimento e Fornecimento padrão'),(4,'Análise de Termo de Cooperação Comercial e outras avenças'),(5,'Análise NDA'),(6,'Análise Termo de Parceria');
/*!40000 ALTER TABLE `objetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitantes`
--

DROP TABLE IF EXISTS `solicitantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitantes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `sobrenome` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Solicitantes da WHP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitantes`
--

LOCK TABLES `solicitantes` WRITE;
/*!40000 ALTER TABLE `solicitantes` DISABLE KEYS */;
INSERT INTO `solicitantes` VALUES (1,'Vitor','Pereira',1,'suporte@lrilaw.com.br','123');
/*!40000 ALTER TABLE `solicitantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='tipos de contratos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'Contrato de Prestação de Serviços'),(2,'Contrato de Desenvolvimento e Fornecimento'),(3,'Contrato de Parceria'),(4,'NDA'),(5,'Outros');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_lri`
--

DROP TABLE IF EXISTS `users_lri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_lri` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `sobrenome` text NOT NULL,
  `sigla` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Inativo\n1 - Ativo',
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Comum\n1 - Administrador',
  `login` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='usuarios da LRI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_lri`
--

LOCK TABLES `users_lri` WRITE;
/*!40000 ALTER TABLE `users_lri` DISABLE KEYS */;
INSERT INTO `users_lri` VALUES (1,'Vitor','Pereira','Suporte',1,1,'suporte@lrilaw.com.br','123'),(2,'Leonardo','Bianco','LOB',1,0,'lob@lrilaw.com.br','123');
/*!40000 ALTER TABLE `users_lri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `buscatudo`
--

/*!50001 DROP VIEW IF EXISTS `buscatudo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `buscatudo` AS select `contratos`.`ID` AS `ID`,`contratos`.`id_whpSolic` AS `Solicitante WHIRLPOOL`,`contratos`.`id_lriResp` AS `Responsável LRI`,`contratos`.`partCont` AS `Parte Contrária`,`contratos`.`id_Tipo` AS `Tipo`,`contratos`.`id_Obj` AS `Objeto`,`contratos`.`vlrCont` AS `Valor do Contrato`,`contratos`.`id_empWhp` AS `Empresa Grupo WHP`,`contratos`.`complex` AS `Complexidade`,`contratos`.`urg` AS `Urgência`,`contratos`.`data_solic` AS `Data da Solicitação`,`contratos`.`prazo` AS `Prazo`,`contratos`.`data_entrega` AS `Data de Entrega`,`contratos`.`urg_ret1` AS `Urgência 1º Retorno`,`contratos`.`data_ret1` AS `Data do 1º Retorno`,`contratos`.`prazo_ret1` AS `Prazo do 1º Retorno`,`contratos`.`data_ent1` AS `Data da Entrega do 1º Retorno`,`contratos`.`urg_ret2` AS `Urgência 2º Retorno`,`contratos`.`data_ret2` AS `Data do 2º Retorno`,`contratos`.`prazo_ret2` AS `Prazo do 2º Retorno`,`contratos`.`data_ent2` AS `Data da Entrega do 2º Retorno`,`contratos`.`urg_ret3` AS `Urgência 3º Retorno`,`contratos`.`data_ret3` AS `Data do 3º Retorno`,`contratos`.`prazo_ret3` AS `Prazo do 3º Retorno`,`contratos`.`data_ent3` AS `Data da Entrega do 3º Retorno`,`contratos`.`lri_coment` AS `Comentários LRI`,`contratos`.`status` AS `STATUS`,`contratos`.`solicArea` AS `Solicitante da Área`,`contratos`.`areaSolic` AS `Área Solicitante`,`contratos`.`solicEnvi` AS `Solicitação Enviada`,`contratos`.`respAnali` AS `Resposta da Análise - LRI`,`contratos`.`solicRet1` AS `Solicitação 1º Retorno`,`contratos`.`respRet1` AS `Resposta do 1º Retorno`,`contratos`.`solicRet2` AS `Solicitação 2º Retorno`,`contratos`.`respRet2` AS `Resposta do 2º Retorno`,`contratos`.`solicRet3` AS `Solicitação 3º Retorno`,`contratos`.`respRet3` AS `Resposta do 3º Retorno` from `contratos` */;
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

-- Dump completed on 2018-04-03 20:58:53
CREATE DATABASE  IF NOT EXISTS `chamados` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `chamados`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: chamados
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `chamados`
--

DROP TABLE IF EXISTS `chamados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamados` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datachamado` datetime DEFAULT NULL,
  `solicitante` text NOT NULL,
  `chamado` text NOT NULL,
  `solucao` text,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Tipos_idx` (`idtipo`),
  CONSTRAINT `Tipos` FOREIGN KEY (`idtipo`) REFERENCES `tipos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamados`
--

LOCK TABLES `chamados` WRITE;
/*!40000 ALTER TABLE `chamados` DISABLE KEYS */;
INSERT INTO `chamados` VALUES (1,'2018-04-02 13:18:39','2018-04-02 10:16:00','Vitor','Teste','TESTE',1),(5,'2018-04-02 17:40:46','2018-04-02 00:00:00','teste 2','teste2','teste 2',8),(6,'2018-04-02 17:53:32','2018-04-02 14:53:00','teste3','teste3','teste3',9),(7,'2018-04-03 17:17:30','2017-12-01 08:30:00','Suporte','Checklist Servidores','Efetuada a verificação de disco, backups e uso da memória e cpu.',11),(8,'2018-04-03 17:18:23','2017-12-01 09:00:00','KRH','Instalar impressora colorida','Efetuada a instalação da impressora colorida.',9),(9,'2018-04-03 17:19:18','2017-12-01 09:30:00','KDD','Instalar PJeOffice','Efetuada a instalação do PJeOffice.',17),(10,'2018-04-03 17:20:13','2017-12-01 10:30:00','JRM','Computador sem conexão','Efetuado o reset da placa de rede via Bios.',15),(11,'2018-04-03 17:20:51','2017-12-01 11:00:00','FAM','Excluir documento','Efetuada a exclusão do documento no worksite.',3),(12,'2018-04-03 17:21:34','2017-12-01 01:00:00','Suporte','Acompanhamento tecnico','Efetuado o acompanhamento dos tecnicos da Algar.',11),(14,'2018-04-03 17:22:46','2017-12-01 14:00:00','ESS','Instalar PJeOffice','Efetuada a instalação do PJeOffice.',17),(15,'2018-04-03 17:23:39','2017-12-01 14:30:00','Suporte','Impressoras Offline','Efetuada a verficação do servidor e impressoras voltaram a conectar.',9),(16,'2018-04-03 17:24:25','2017-12-01 15:00:00','MCR','Desligamento de funcionária','Efetuado o reset de senha da usuária LIS.',11),(17,'2018-04-03 17:25:28','2017-12-04 08:30:00','Suporte','Checklist Servidores','Efetuada a verificação de disco, backups e uso da memória e cpu.',11),(18,'2018-04-03 17:26:15','2017-12-04 09:20:00','JVC','Excluir documento','Efetuada a exclusão do documento.',3),(19,'2018-04-03 17:26:44','2017-12-04 10:00:00','JVC','Excluir documentos','Efetuada a exclusão dos documentos.',3),(20,'2018-04-03 17:27:38','2017-12-04 10:30:00','Suporte','Backup ex funcionaria','Realizado o backup dos dados da usuária LIS',11),(21,'2018-04-03 17:28:26','2017-12-04 11:00:00','Suporte','Remanejamento de Máquina','Efetuada a troca da máquina do usuário LPT.',11),(22,'2018-04-03 17:29:48','2017-12-04 13:30:00','RMG','Grupo de email com bloqueio','O grupo de e-mail foi criado novamente.',11),(23,'2018-04-03 17:30:32','2017-12-04 14:00:00','CSA','Adicionar caixa de email','Efetuada a importação da caixa de email da usuária CSF.',7),(24,'2018-04-03 17:31:31','2017-12-04 14:40:00','JVC','Excluir documento','Efetuada a exclusão do documento.',3);
/*!40000 ALTER TABLE `chamados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `populaexcel`
--

DROP TABLE IF EXISTS `populaexcel`;
/*!50001 DROP VIEW IF EXISTS `populaexcel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `populaexcel` AS SELECT 
 1 AS `Numero_do_Chamado`,
 1 AS `Data_de_Insercao_dos_Dados`,
 1 AS `Data`,
 1 AS `Solicitante`,
 1 AS `Solicitacao`,
 1 AS `Solucao`,
 1 AS `Tipo_do_Chamado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'Acesso Remoto'),(2,'Windows'),(3,'Worksite'),(4,'Work10'),(5,'Excel'),(6,'Word'),(7,'Outlook'),(8,'Hardware'),(9,'Impressora'),(10,'Duvida'),(11,'Outro'),(12,'3A Plus'),(13,'Navegador'),(14,'Legal Manager'),(15,'Rede / Internet'),(16,'Java'),(17,'Assinador');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `populaexcel`
--

/*!50001 DROP VIEW IF EXISTS `populaexcel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `populaexcel` AS select `c`.`ID` AS `Numero_do_Chamado`,`c`.`data` AS `Data_de_Insercao_dos_Dados`,`c`.`datachamado` AS `Data`,`c`.`solicitante` AS `Solicitante`,`c`.`chamado` AS `Solicitacao`,`c`.`solucao` AS `Solucao`,`t`.`tipo` AS `Tipo_do_Chamado` from (`chamados` `c` join `tipos` `t` on((`c`.`idtipo` = `t`.`ID`))) */;
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

-- Dump completed on 2018-04-03 20:58:54
