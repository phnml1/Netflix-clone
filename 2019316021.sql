-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: term_db
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `contentsid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `director` varchar(100) NOT NULL,
  `running` int(10) unsigned DEFAULT NULL,
  `summary` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `kind` varchar(50) NOT NULL,
  `reg_dt` datetime DEFAULT NULL,
  `posterimgname` varchar(200) DEFAULT NULL,
  `posterimgsavepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contentsid`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES
(68,'진격의거인','action',2019,'이자영',0,'심장을 바쳐라',41,'series','2023-06-19 10:56:00','진격.jpg','90489694-c206-4765-ac48-70d643c0083e.jpg'),
(69,'더글로리','thriler',2023,'이주',0,'송혜교가 나오는 드라마다',6,'series','2023-06-19 21:37:49','AAAABVQNRJujXD_Z1uo2gLpopvWltYVj1p7lxeB7yjvqT5bcvFwxJVXvolNaYx2ZCfODZetOKtJv2HdDF-Q3Km5kqEnQM37iXRjD8umymfVZre9zS1t8gRtrF0E53J72svBI2q8E.jpg','210ea93f-5b90-4cf0-9d41-ef1d80e1e337.jpg'),
(72,'원피스','action',2005,'일본인2',0,'근본애니이다',21,'series','2023-06-19 21:46:50','AAAABediLWorIGYurt4w-H7ptQcVRtvD7c8JOFu5BKyQe4k9xMgVGCqvQBiYI_ZdezGV48HcQ7IW3j3P5VBNGLbNPatctNj4lrYHn9s.jpg','28747364-a588-47b7-beff-b37a247bbc81.jpg'),
(74,'위쳐','action',2022,'헨리카빌',0,'마녀를 사냥하는 이야기',1,'series','2023-06-19 22:14:00','AAAABcYn2qT2a3MmON-43aEwRjGIoJpvaL8YzvKd6vgzxTKJDRZmmzjBElDfqzspkzoEiXm57V3XVtQVfmAP0lUgFmursZ6BjGuPy_hyJCahiJIQSAj0eariBFnGFZBjq6vV4y2D.jpg','cc2da4e9-e54e-4eb9-96c1-55a1add13e1b.jpg'),
(75,'수리남','action',2022,'윤종빈',0,'식사는 잡쉈어?',0,'series','2023-06-19 22:14:45','AAAABcHKN3Ks4_fp0tEu5bbGT3s18bYJJbQZ-imnYiO_BRurpQktUXQRLfweFqUuw36-1dJqyGwzgNeHq5kCysEfUDRZiKYXzWHK-BHn-idv_4OCZ-CF6pLj0CgE-IQ3SozyP6zU.jpg','c78664f0-3206-4bec-b317-9d16d723d416.jpg'),
(76,'섀도우앤본','action',2021,'마이클',0,'판타지 액션인데 개꿀잼임',1,'series','2023-06-19 22:15:36','AAAABYJCL0TDijIJBMqY5xK31RgUTXiFrrwUVa99SlQqdIPqLDfPuE0zMK1Zt_zfiXLOPRYWTelGB-IOi0zHT0iLqZIliRvZt3bllSpIcMFRFDFPxn6Y7lhboQoIKSHAIaeRO1We.jpg','913c6a39-6d65-411d-9d0c-42ea36fb8e95.jpg'),
(77,'귀멸의칼날','action',2021,'일본인3',0,'최애 애니',1,'series','2023-06-19 22:17:40','귀멸.jpg','864a3f48-2ca2-4553-b336-274ca52461be.jpg'),
(78,'러브데스로봇','action',2019,'데이빗핀처',0,'잔인한데 재밌는 sf애니',1,'series','2023-06-19 22:18:56','AAAABUYq5l3QkYpXnV-y9lOFo_HX-_c-YW2FosG-WHK_HHSQJbjLAX6DcjfofTxp84Ol-ZjxmkIzTBTO5keAAAIIocN3wfiSERberfH09X559WZaQU-wg-AjohpFMMo3k4v4M39b.jpg','62dd4e61-1763-480f-b432-46a9460412d7.jpg'),
(79,'슈퍼걸','action',2018,'이주영',0,'슈퍼걸의 이야기',1,'series','2023-06-19 22:19:39','AAAABcz3O4rNdTjqK32nyIvIffMNLpsLfepVHpkckXY9gi9atKjJ-q_Xqk7-MMDO6-PRaLyoWMzGOPbRrZGMY7TC_f7u29MGQJBJhFw.jpg','11e8c4fa-1b06-4190-bc1a-32a0b92bdfb6.jpg'),
(80,'삼국지','action',1999,'조조',0,'위촉오 세나라의 이야기',6,'series','2023-06-19 22:20:30','AAAABba19CbuMBt8eQPfeUkcQdRusNsZtScYgfi4mtQ5vEhREOFIQk0s0qRDSKMuHzUJQrPiUyqBgyle6SQaukFXby5XEmGCJgjridY.jpg','08382ae5-6b0a-4739-99f1-1b4b5289a0db.jpg'),
(81,'경이로운소문','action',2010,'김세정',0,'소문의 경이로움을 나타내는 시리즈',7,'series','2023-06-19 22:21:39','AAAABbloOLoed5pGpDnlgTJX_3opKmmdvHFJGxJUK2f0PuD1fjg11yTr7tMJXdpTbC1OT56mCiMxe2rbnOxdNIiYxRt0bFCattqsULk.jpg','d5a9f3f3-2c14-4c16-8cf9-f7ed29a2d919.jpg'),
(82,'미스터션샤인','romance',2023,'이병헌',0,'이병헌과 김태리의 시대극',0,'series','2023-06-19 22:24:05','AAAABfxVUwA6S6KH1KNfTCpAInDdOm769598nanDrOjjkCC0oCp4kDo1PFqVnDCi8ayiWfpDO1SRFFxxwlZcgeN1HFupsQk4RFJJwZc.jpg','1b5876c5-c20f-4fea-ae18-bc646b4db89a.jpg'),
(83,'사랑의 불시착','romance',2021,'이주영',0,'북한과 남한의 사랑',1,'series','2023-06-19 22:24:51','AAAABbJMUYjKSp1TT6n020YejMd6iTFOOH6ylonf8eJ83Q1IlUPm4WjXrgBU_2tTv44q20aMQ6moD-90oi3GmjPvEbCEQZM7eb-krSM.jpg','6ea48794-7741-478b-a9f3-3dccd6f8b1e6.jpg'),
(84,'그해우리는','romance',2022,'김다미,최우식',0,'김다미랑 최우식이 다큐찍는이야기',1,'series','2023-06-19 22:25:39','AAAABealCWo-SuK9QnZMeicDXAtyv3FSJYd1JUFKSDRZggs_y2-OcL1qHOjd9nKuyJ7Ppokut76Ifw4UeqjTq_nKy3lpX6P4pRDj6XM.jpg','540911be-19cd-48d9-a6eb-47778111b3a8.jpg'),
(85,'알고있지만','romance',2022,'송강,최우식',0,'한소희와 송강의 대학 사랑이야기',1,'series','2023-06-19 22:26:15','AAAABZ8g3LS018KsOc3pI5C4ZEPpYOFohiC9afZMTsOKkG6ncApX6fjRlSOX-ijbQBAyp9cdKmGFR_d8htwsgHN1E43mk3e-3zRMM6A.jpg','e398f985-2dde-4ae2-ac56-af15398cf414.jpg'),
(86,'악의꽃','romance',2019,'이주영',0,'사실 잘모르는드라마인데 재밌어보여서 넣었음',1,'series','2023-06-19 22:27:03','AAAABR2heQDzxw-PDnPCJwKj8u3ELT7h__Nmw3Vcz7dHgwtbZPyB7LeHKM0O5zJfAIKjIEXaPebCjhyGFQaed132pYn-i9ZMNTG9d3E.jpg','192b590a-88f8-4822-bb3c-47e5ed0e1fdd.jpg'),
(87,'이태원클라쓰','romance',2023,'이주',0,'활력과 욕망이 넘치는 이태원. 한 전과자와 친구들이 꿈을 위해 뭉쳤다. 일단 시작은 술집 창업. 불합리한 세상, 막강한 적이 앞길을 막으면? 기를 쓰고 맞서 싸워야지!\r\n',5,'series','2023-06-19 22:09:50','AAAABfqyx-X-9fBM6InzI71DKc-SZh9abj6vOichZZLjiSCyZiZff8a3ExS6G_PqXQTBtfiK_6uDTu19m6ql1603BmzTDSNifTUatfk.jpg','07fc504f-0b65-4d50-a93d-e35fa642f59b.jpg'),
(88,'부부의세계','romance',2022,'한소희',0,'사실 로맨스를 빙자한 불륜이야기',0,'series','2023-06-19 22:31:50','AAAABSJTe7FCRZjUlElsEnV89TM8y_J5mZ9IppYvea2iH0mm4wcQJHftzPMM3Myy_GYAd61GloBWj5LszWWLfYozxGP4XeF1aSzb4NE.jpg','34edb5d4-8a2d-4be0-8113-361d0ec2d6bf.jpg'),
(89,'별에서온그대','romance',2022,'전지현 등',0,'전지현과 김수현의 사랑이야기',0,'series','2023-06-19 22:33:28','AAAABShuTsw9O5Xe4jbQQ3ohftyc-eFpfutUJJnBbrLDeRXsje3NyCoiR5_cclsR9VehmrDeCPVBYCkuCp41m1LyNp25L0or7AYWgGo.jpg','ed811d9b-7b36-4af3-adfb-5c3b5a7842bd.jpg'),
(90,'아는형님','comedy',2023,'이주영',0,'강호동, 김희철등이 나와서 하는 예능입니다.',0,'series','2023-06-19 22:36:19','아형.jpg','b14a6f04-08d6-44f8-b81e-0cab210cf851.jpg'),
(91,'지옥','horror',2022,'연상호',0,'지옥을 경험하라!',1,'series','2023-06-19 22:37:31','AAAABcqudbjIGDHr602AzmT0i3_nOEsuLX14DUWj8hpxN9gOQNjioKEPJmrjgesnop8ijAeAMxQJ9qHO_LLkDJJCtGYyR0EAqx5bbarz7Tlbl9BtUW1m04ZIPkmC6VarA1BxlsjN.jpg','855c340e-233f-4726-b785-5fb9adb47d85.jpg'),
(93,'올드보이','thriler',2010,'박찬욱',122,'박찬욱의 명작',0,'movie','2023-06-19 22:51:49','올드보이.jpg','dd0c6a7b-a673-4da0-a2b6-7587c2e79099.jpg'),
(94,'헤어질결심','thriler',2023,'박찬욱',122,'내가 그렇게 나쁩니까?',0,'movie','2023-06-19 22:52:23','헤어질.jpg','bf85ca60-b7fd-4fb9-ad0a-85f9cc113375.jpg'),
(95,'내부자들','thriler',2022,'이병헌',130,'이병헌과 조승우가 나오는 개꿀잼영화\r\n',0,'movie','2023-06-19 22:53:31','AAAABYjQEjfTgQCRdMrLtIvXaB41eJ2uHkulE3FbJ-PCXaJ6BSvh4CWHh0q7IDXxynLWCevFWdow7W2f_SiIIoDhN-O_OIobaD1CITs.jpg','67ebbc1f-aa97-490c-a973-0b4dca6ae89b.jpg'),
(96,'타짜','thriler',2005,'최동훈',130,'화투영화 불후의 명작',0,'movie','2023-06-19 22:54:23','AAAABS5WlXmSkYJleUym6q68S5VqHPqYF4EadKZXowDCq_grn6s5Y4dO7z_zyjj3GQ-cpZpMIfusV8ugXgLZIm58ZFb0FH_GATPQS8E.jpg','331896aa-8d80-4765-acd6-0eef271463f2.jpg'),
(97,'버닝','thriler',2018,'이창동',180,'전종서와 유아인 나오는 이창동영화',1,'movie','2023-06-19 22:57:21','버닝.jpg','0ad62455-c25a-46f5-807e-80abbc946507.jpg'),
(98,'오션스일레븐','thriler',2020,'이주영',120,'도둑영화의 명작',1,'movie','2023-06-19 22:58:46','오션스.jpg','e4a1a5e3-af73-4c26-a810-32155b30856c.jpg'),
(99,'킬링디어','thriler',2019,'요르고스 란티모스',120,'스파게티가 먹고싶어지는 영화',1,'movie','2023-06-19 22:59:44','킬링디어.jpg','3b30c05e-3f2e-4c4b-9179-c03642c480fa.jpg'),
(100,'기생충','thriler',2020,'봉준호',123,'봉준호의 우주최고 명작',10,'movie','2023-06-19 23:00:24','기생충.jpg','35c7a538-64e2-4647-be8c-75ee73122566.jpg'),
(101,'그레이의 50가지 그림자','romance',2022,'몰름',120,'dwqeqeqewqeeqweqwe',0,'movie','2023-06-19 23:10:14','rmfpdl.jpg','a4773285-572d-42aa-bca4-6ef5d4322122.jpg'),
(102,'너의 췌장을 먹고싶어','romance',2022,'몰름',120,'췌장을 먹고싶은 이야기',0,'movie','2023-06-19 23:10:45','너췌먹.jpg','3c5bb4b1-1953-4378-88a9-4c87ec374493.jpg'),
(103,'이터널선샤인','romance',2022,'미셸 공드리',120,'짐캐리와 케이트윈슬렛의 로맨스 명작',0,'movie','2023-06-19 23:11:15','이터널.jpg','2ebf9095-f8c9-4c0d-b986-e48ddbfd3df5.jpg'),
(104,'클래식','romance',2015,'이주영',130,'손예진and조승우의 명작',0,'movie','2023-06-19 23:12:24','클래식.jpg','d2ff9183-4ff4-4071-a368-9609f3c7e920.jpg'),
(105,'어바웃타임','romance',2010,'이주영',0,'인생작중하나\r\n',0,'movie','2023-06-19 23:13:00','어바웃타임.jpg','75fc9edf-fec2-470d-b8f8-b1e2955baecf.jpg'),
(106,'나는내일어제와만난다','romance',2020,'이주영',125,'내가 어제의 너와 만나는 가슴아픈이야기',1,'movie','2023-06-19 23:13:35','나내어.jpg','04689053-01c4-4895-82a0-2a154beca7a8.jpg'),
(107,'극한직업','comedy',2020,'이병헌',120,'치킨집이 너무잘되서 벌어지는 이야기',0,'movie','2023-06-19 23:15:44','극한직업.jpg','f6df903a-9a89-41ad-b3f2-08390199282c.jpg'),
(108,'존윅','action',2019,'키아누리브스',120,'강아지 한마리 죽였다고 몇명을 죽이는가',0,'movie','2023-06-19 23:16:32','존윅.jpg','ee26b6a5-7d1a-4833-9cb6-46d709fd62fb.jpg'),
(109,'곤지암','horror',2020,'ㅇㅂㅈㄷㅂㄷ',130,'방금코누가곤지암?',0,'movie','2023-06-19 23:17:09','곤지암.jpg','c1c45b12-0967-4c4b-a2b9-86e3db84eeef.jpg');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `num` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'cus',
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES
(1,'aa','aa','aa',12,'aa','aaa'),
(2,'juyung0903@gmail.com','88bf3f301413987009fc6f9ae8d38f93e125d6af771cc91b90e2d58234daf8a1','eed',12,'cus','이주영'),
(4,'admin','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','인천',25,'admin','이주영'),
(5,'aa','961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506','aa',12,'cus','aa'),
(6,'leejuyoung','7a5df5ffa0dec2228d90b8d0a0f1b0767b748b0a41314c123075b8289e4e053f','임학동',12,'cus','이주영');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch` (
  `num` int(10) unsigned NOT NULL,
  `contents_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch`
--

LOCK TABLES `watch` WRITE;
/*!40000 ALTER TABLE `watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19 23:42:48
