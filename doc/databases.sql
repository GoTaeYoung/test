-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: doje
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` varchar(30) DEFAULT NULL,
  `Pw` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `nname` varchar(30) DEFAULT NULL,
  `radio1` varchar(10) DEFAULT NULL,
  `cb` varchar(100) DEFAULT NULL,
  `radio2` varchar(10) DEFAULT NULL,
  `sns` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('abcd','1234','홍길동','hong','남자','[농구]','기타','{\"facebook\":\"face\"}'),(NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL),('아아아','sdf','sdf','ㄴㅇㄹ','여자','[독서]','기타','{\"패아수뷱\":\"페북\"}'),('아아아니','sdf','sdf','ㄴㅇㄹ','여자','[독서]','기타','{}'),('sef','sdf','sdf','sdf','여자','[농구]','기타','{}'),('fasef','sdf','dsf','sdf','여자','[배드민턴]','기타','{\"eeee\":\"eee\",\"sfe\":\"sfe\",\"ddd\":\"dddd\"}'),('safef','ab','fsef','sef','여자','[배드민턴]','기타','{\"a\":\"aa\",\"b\":\"bb\",\"e\":\"e\"}'),('safefs','sef','fsef','sef','여자','[배드민턴]','기타','{\"a\":\"aa\"}'),('safefsss','s','fsef','sef','여자','[배드민턴]','기타','{\"a\":\"aa\",\"sef\":\"eee\"}'),('safefssse','sdf','fsef','sef','여자','[축구, 배드민턴, 독서]','기타','{\"ㄴㄹㄷ\":\"ㄴㄷㄹ\"}'),('sefe','sef','efef','sef','여자','[농구, 배드민턴]','검색','{}'),('sefeef','se','efef','sef','여자','[농구, 배드민턴]','검색','{\"face\":\"faaceec\",\"ef\":\"efssef\"}');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-02 11:07:35
