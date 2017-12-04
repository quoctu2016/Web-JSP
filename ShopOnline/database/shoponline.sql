-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: shoponline
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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'banner1','images/banner1.jpg'),(2,'banner2','images/banner2.jpg'),(3,'banner3','images/banner3.jpg'),(4,'banner4','images/banner4.jpg');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` bigint(25) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Table'),(2,'Mobile Phone'),(3,'Laptop'),(1511357032727,'Smart phone'),(1511360288320,'Head Phone'),(1512200680509,'Other'),(1512204891980,'&#272;i&#7879;n tho&#7841;i');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `or_id` bigint(15) NOT NULL,
  `total` double DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `date` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`or_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1512205283668,4000,'Live','33, Quan 9, TP.HCM','Tri Phan','triphan@gmail.com','2017-12-02 09:01:23.668000'),(1512361381100,2184,'Bank Transfer','33, Quan 9, TP.HCM','Tri Phan','triphan@gmail.com','2017-12-04 04:23:01.103000'),(1512381588807,4054,'Bank Transfer','33, Quan 9, TP.HCM','Tri Phan','triphan@gmail.com','2017-12-04 09:59:48.809000');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `orderDetailId` bigint(15) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(15) DEFAULT NULL,
  `proId` bigint(15) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (17,1512205283668,1511428117240,2000,1),(18,1512205283668,1511771715272,1000,2),(19,1512361381100,1512200771856,60,1),(20,1512361381100,1512200840848,70,1),(21,1512361381100,1511519299455,54,1),(22,1512361381100,1511428117240,2000,1),(23,1512381588807,1511519299455,54,1),(24,1512381588807,1511428117240,2000,2);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pro_id` bigint(30) NOT NULL,
  `pro_name` varchar(50) DEFAULT NULL,
  `pro_image` varchar(500) DEFAULT NULL,
  `cat_id` bigint(30) DEFAULT NULL,
  `description` longtext,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (15115169381,'GM9','SomicG9.jpg',1511360288320,'Th&#7853;t không th&#7875; tin &#273;&#432;&#7907;c',11),(1511425542800,'iphone 8','iphonex.jpg',1511357032727,'										Apple Company\r\n									',999),(1511426144638,'Samsung S8','samsungs8.jpg',1511357032727,'Samsung Company',700),(1511428117240,'Laptop acer predator 21x','Acer_Predator21X_zing25.jpg',3,'Laptop acer predator 21x',2000),(1511516629711,'Sades SA714','SadesSA714.jpeg',1511360288320,'Th&#7853;t không th&#7875; tin n&#7893;i x100',10),(1511518596467,'Macbook Pro 2017 128GB ','macbookpro2017.jpg',3,'										Máy có thi&#7871;t k&#7871; m&#7887;ng và nh&#7865;, s&#7903; h&#7919;u màn hình Retina 2560x1600 làm cho hình &#7843;nh hi&#7875;n th&#7883; c&#7921;c k&#7923; s&#7855;c nét và th&#7921;c t&#7871;. Trên phiên b&#7843;n macbook pro 2017 13 inch 128gb này, thanh Touch Bar l&#7847;n &#273;&#7847;u tiên &#273;ã &#273;&#432;&#7907;c ch&#7841;y th&#7917; trên bàn phím. So sánh v&#7873; thi&#7871;t k&#7871; thì v&#7899;i phiên b&#7843;n m&#7899;i và phiên b&#7843;n c&#361; không có quá nhi&#7873;u thay &#273;&#7893;i. Màn hình hi&#7875;n th&#7883; trên phiên b&#7843;n m&#7899;i này &#273;em l&#7841;i s&#7921; k&#7871;t h&#7907;p vô cùng hoàn h&#7843;o gi&#7919;a l&#7899;p n&#7873;n và t&#432;&#417;ng ph&#7843;n, giúp ch&#7845;t l&#432;&#7907;ng hình &#7843;nh vô cùng chân th&#7921;c và s&#7889;ng &#273;&#7897;ng\r\n									',1500),(1511519299455,'CAT B25, Caterpillar','catb25.png',2,'										IF YOU DROP IT, IT\'LL SURVIVE \r\nWith the B25, it doesn\'t matter if it falls from your hand. Drop-proof to 1.8 meters (5\'11\"), this is one rugged phone that\'s tough enough to take it. \r\n\r\nA PHONE MADE FOR TALKING \r\nThis is one rugged phone thats high on features and high on battery power. You get a full 9.5 hours of talk-time. \r\n\r\nGREAT FOR WORK AND PLAY \r\nFeaturing dual SIM cards, you can switch between your work and your private contacts  its perfect for ensuring that the two dont mix. \r\n\r\nDUST AND WATER DON\'T PRESENT A DANGER \r\nThe B25 is a tough phone that stands up for itself. Being a dust and waterproof* phone, you can put it through its paces without having to worry.\r\n									',54),(1511706610644,'iPhone 7 Plus 32GB','iphone7plus2.png',1511357032727,'										V&#7899;i thi&#7871;t k&#7871; không quá nhi&#7873;u thay &#273;&#7893;i, v&#7851;n b&#7843;o t&#7891;n v&#7867; &#273;&#7865;p truy&#7873;n th&#7889;ng t&#7915; th&#7901;i iPhone 6 Plus,  iPhone 7 Plus 32GB &#273;&#432;&#7907;c trang b&#7883; nhi&#7873;u nâng c&#7845;p &#273;áng giá nh&#432; camera kép, &#273;&#7841;t chu&#7849;n ch&#7889;ng n&#432;&#7899;c ch&#7889;ng b&#7909;i cùng c&#7845;u hình c&#7921;c m&#7841;nh.\r\n									',1000),(1511771301340,'Xiaomi redmi note 4','xiaomiredminote 4.jpg',1511357032727,'Xiaomi redmi note 4',300),(1511771451248,'Nokia 6','nokia6.png',1511357032727,'Nokia 6 s&#7903; h&#7919;u m&#7897;t b&#7897; khung t&#7915; nhôm nguyên kh&#7889;i vô cùng ch&#7855;c ch&#7855;n, thi&#7871;t k&#7871; &#273;&#7865;p v&#7899;i ch&#7845;t l&#432;&#7907;ng hoàn thi&#7879;n vô cùng t&#7889;t, các góc c&#7841;nh &#273;&#432;&#7907;c bo cong cho c&#7843;m giác c&#7847;m n&#7855;m tho&#7843;i mái.\r\n\r\n',300),(1511771715272,'Samsung Galaxy Book','SamsungGalaxyBook.png',1,'Nhìn t&#7915; bên ngoài thì chi&#7871;c Samsung Galaxy Book không có quá nhi&#7873;u s&#7921; khác bi&#7879;t so v&#7899;i các tablet 2 trong 1 &#273;ang có m&#7863;t trên th&#7883; tr&#432;&#7901;ng. Máy &#273;&#432;&#7907;c gia công khá t&#7889;t, các chi ti&#7871;t &#273;&#432;&#7907;c hoàn thi&#7879;n v&#7899;i &#273;&#7897; chính xác cao.\r\n\r\n',1000),(1512200771856,'Logitech Anywhere Mouse MX','LogitechMX.jpg',1512200680509,'Logitech\'s Anywhere nh&#7855;m t&#7899;i &#273;&#7889;i t&#432;&#7907;ng ng&#432;&#7901;i dùng netbook và laptop nh&#7857;m mang t&#7899;i c&#7843;m giác tho&#7843;i mái và s&#7921; t&#7921; tin trong thao tác &#273;i&#7873;u khi&#7875;n. Thi&#7871;t k&#7871; nh&#7887; g&#7885;n, kh&#7843; n&#259;ng x&#7917; lý cao cùng v&#7899;i công ngh&#7879; Darkfield &#273;em l&#7841;i kh&#7843; n&#259;ng ho&#7841;t &#273;&#7897;ng t&#7889;i &#432;u cho chu&#7897;t laze trên m&#7885;i b&#7873; m&#7863;t, k&#7875; c&#7843; m&#7863;t kính trong su&#7889;t.',60),(1512200840848,'CM Storm Sentinel Z3RO-G','cat1.jpg',1512200680509,'V&#7899;i b&#7897; nh&#7899; ch&#7881; vào kho&#7843;ng 128kb nh&#432;ng chu&#7897;t CoolMaster v&#7851;n &#273;óng vai trò nh&#432; m&#7897;t máy ch&#7911; l&#432;u gi&#7919; h&#7891; s&#417; c&#7911;a b&#7841;n c&#361;ng nh&#432; các t&#7853;p tin bitmap v&#7899;i &#273;&#7897; phân gi&#7843;i th&#7845;p trên màn hình OLED. Các ph&#7847;n m&#7873;m tinh ch&#7881;nh &#273;&#432;&#7907;c cung c&#7845;p s&#7869; làm hài lòng khách hàng.',70),(1512383496425,'Samsung Tablet','niki7.jpg',1511357032727,'asdzxczxc',10000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','1');
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

-- Dump completed on 2017-12-04 19:53:18
