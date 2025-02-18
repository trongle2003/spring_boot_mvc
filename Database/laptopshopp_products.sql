-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: laptopshopp
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'ASUS TUF Gaming F15 FX506HF HN017W là chiếc laptop gaming giá rẻ nhưng vô cùng mạnh mẽ. Không chỉ bộ vi xử lý Intel thế hệ thứ 11, card đồ họa RTX 20 series mà điểm mạnh còn đến từ việc trang bị sẵn 16GB RAM, cho bạn hiệu năng xuất sắc mà không cần nâng cấp máy.','ASUS','1711078092373-asus-01.png','Asus TUF Gaming',17490000,100,' Intel Core i5 11400H 16GB 512GB RTX 2060Ti',0,'GAMING'),(2,'Khám phá sức mạnh tối ưu từ Dell Inspiron 15 N3520, chiếc laptop có cấu hình cực mạnh với bộ vi xử lý Intel Core i5 1235U thế hệ mới và dung lượng RAM lên tới 16GB. Bạn có thể thoải mái xử lý nhiều tác vụ, nâng cao năng suất trong công việc mà không gặp bất kỳ trở ngại nào.','DELL','1711078452562-dell-01.png','Dell Inspiron 15 ',15490000,200,'i5 1235U 16GB 512GB Iris XE 15.6\"FHD',0,'SINHVIEN-VANPHONG'),(3,' Mới đây, Lenovo đã tung ra thị trường một sản phẩm gaming thế hệ mới với hiệu năng mạnh mẽ, thiết kế tối giản, lịch lãm phù hợp cho những game thủ thích sự đơn giản. Tản nhiệt mát mẻ với hệ thống quạt kép kiểm soát được nhiệt độ máy luôn mát mẻ khi chơi game.','LENOVO','1711079073759-lenovo-01.png','Lenovo IdeaPad Gaming 3',19500000,150,' i5-10300H 8GB 512GB GTX 1650Ti 15.6\'',0,'GAMING'),(5,'Chiếc MacBook Air có hiệu năng đột phá nhất từ trước đến nay đã xuất hiện. Bộ vi xử lý Apple M1 hoàn toàn mới đưa sức mạnh của MacBook Air M1 13 inch 2020 vượt xa khỏi mong đợi người dùng, có thể chạy được những tác vụ nặng và thời lượng pin đáng kinh ngạc.','APPLE','1711079954090-apple-01.png','MacBook Air 13',17690000,99,'Apple M1 CPU M1 8 nhân GPU 16 nhân ',0,'DOANH-NHAN'),(6,'14.0 Chính: inch, 2880 x 1800 Pixels, OLED, 90 Hz, OLED','LG','1711080386941-lg-01.png','LG Gram Style 2024',31490000,99,'Core Ultra U7-155H 16GB 1TB PCIE 17.0',0,'MONG-NHE'),(7,'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm  ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.','APPLE','1711080787179-apple-02.png','MacBook Air 13 ',24990000,99,' Apple M2 CPU M2 12 nhân GPU 20 nhân',0,'DOANH-NHAN'),(8,'Là chiếc laptop gaming thế hệ mới nhất thuộc dòng Nitro 5 luôn chiếm được rất nhiều cảm tình của game thủ trước đây, Acer Nitro Gaming AN515-58-769J nay còn ấn tượng hơn nữa với bộ vi xử lý Intel Core i7 12700H cực khủng và card đồ họa RTX 3050, sẵn sàng cùng bạn chinh phục những đỉnh cao.\r\n','ACER','1711080948771-acer-01.png','Acer Nitro 5 Tiger',23490000,99,'i5-12500H 8GB 512GB PCIE VGA 4GB RTX3050 15.6 FHD 144Hz',0,'GAMING'),(9,'15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, 250 nits, Acer ComfyView LED-backlit','Apple','1711081080930-asus-03.png','Acer Nitro V',26999000,99,'Intel i7-13620H VGA RTX2050 4GB IPS 144 Hz 250 nits',0,'GAMING'),(10,'Dell Inspiron N3520 là chiếc laptop lý tưởng cho công việc hàng ngày. Bộ vi xử lý Intel Core i5 thế hệ thứ 12 hiệu suất cao, màn hình lớn 15,6 inch Full HD 120Hz mượt mà, thiết kế bền bỉ sẽ giúp bạn giải quyết công việc nhanh chóng mọi lúc mọi nơi.','DELL','1711081278418-dell-02.png','Laptop Dell Latitude 3420',21399000,99,' Intel Iris Xe Graphics',0,'SINHVIEN-VANPHONG'),(11,'Trải nghiệm mẫu UltraBook mỏng nhất và nhẹ nhất trong dòng Dell XPS 13 được thiết kế dành riêng cho phong cách sống luôn di chuyển với công việc. Đi kèm thời lượng Pin kéo dài ấn tượng với chip Intel. Tất cả đều gói gọn trong thiết bị có trọng lượng chỉ 1.17Kg.','DELL','xps.png','Dell XPS 14 9440',74800000,99,'Core Ultra 7 155H 64GB 1TB SSD RTX 4050 6GB 14 inch OLED 4K 120hz',0,'DOANH-NHAN'),(12,'Lenovo ThinkPad P1 Gen 7 là lựa chọn lý tưởng cho các chuyên gia cần một máy trạm di động mạnh mẽ, thiết kế tinh tế và tính năng bảo mật cao, đáp ứng tốt các tác vụ đồ họa, kỹ thuật và trí tuệ nhân tạo.','LENOVO','p1gen7.jpg','ThinkPad P1 Gen 7 - 2024',68900000,99,'Core Ultra 7 155H 64GB 1TB RTX A3000 ada Generation 8GB 16 inch OLED 4K',0,'THIET-KE-DO-HOA'),(13,'Laptop Asus ROG Strix G18 G814JU-N6143W là một trong những lựa chọn hàng đầu cho game thủ và người dùng đòi hỏi hiệu suất vượt trội. Sở hữu sức mạnh vượt bậc từ bộ vi xử lý tiên tiến và card đồ họa mạnh mẽ, chiếc laptop này mang đến trải nghiệm mượt mà từ các tựa game nặng đến các tác vụ đồ họa phức tạp.','Asus','rogtrix.png','Asus ROG Strix SCAR 16',89800000,99,'Intel Core i9-14900HX VGA RTX 4080 RAM 64 GB SSD 2TB  16 inch 144hz',0,'GAMING'),(14,'Acer Predator Helios Neo  mang đến hiệu năng đỉnh cao. Sở hữu Acer Predator Helios Neo, game thủ như nắm trong tay chìa khóa để chinh phục mọi tựa game khó nhằn cùng đồng đội. Sử dụng sức mạnh từ con chip Intel Core i9 thế hệ thứ 14 để xử lý nhanh gọn mọi thao tác. Và tận dụng sức mạnh từ chiếc card đồ họa rời Geforce RTX 4060 để mang đến trải nghiệm trọn vẹn về đồ họa đẹp mắt. ','Acer','neo18.png','Acer Predator Helios Neo 16',30490000,99,'Core i9-14900HX VGA RTX 4060 8GB RAM 16GB 1TB SSD 16\" 2.5K 180HZ',0,'GAMING'),(15,'MacBook Pro 14 inch M3 Max 96GB 512GB sạc 96W sử dụng bộ vi xử lý khủng chip M3 Max với CPU 14 lõi và GPU 30 lõi được tạo nên từ công nghệ 3 nanometer. Bộ nhớ khủng 1TB cùng RAM 96GB mang đến không gian lưu trữ cực thoải mái hỗ trợ tốt cho người dùng trong quá trình sử dụng.','Apple','macm3max.png','MacBook Pro 14  M3 Max',88990000,99,'Apple M3 Max CPU 14 nhân 16 luồng GPU Neural Engine 30  nhân 96GB 512GB 14\'',0,'GAMING'),(17,'Laptop Gaming Lenovo Legion 9 16IRX9 83G0001AVN không chỉ là một chiếc laptop gaming thông thường, đây là một tuyệt tác công nghệ hội tụ những tinh hoa đỉnh cao, mang đến trải nghiệm chơi game tuyệt đỉnh và làm việc hiệu quả. Với thiết kế tinh tế, hiệu năng vượt trội cùng những công nghệ tiên tiến, Lenovo Legion 9 16IRX9 83G0001AVN xứng đáng là biểu tượng của sức mạnh và đẳng cấp.','LENOVO','legion9.png','Lenovo Legion 9',134490000,99,'i9-14900HX RTX 4090 16GB RAM 64GB DDR5 SSD 2TB 16 Inch MiniLED 3.2K 165Hz',0,'GAMING'),(19,'Laptop Dell Precision là dòng máy trạm được thiết kế tối ưu về đồ họa của thương hiệu Dell. Sản phẩm này hướng đến nhóm người dùng là lập trình viên, doanh nghiệp, những người làm việc trong lĩnh vực xây dựng, biên tập video và nhiều sản phẩm đồ họa.','DELL','precesion.png','Dell Precision Workstation 5680',81000000,99,'i9-13900H 32GB 1TB  RTX2000 Ada 8GB  16 inch FHD',0,'THIET-KE-DO-HOA'),(20,'Lenovo Thinkpad T14 Gen 2 Ryzen 5 được biết đến là một chiếc laptop doanh nghiệp với thiết kế bền bỉ, nhiều công nghệ bảo mật cao. Không những vậy, sản phẩm là một trong những dòng máy Thinkpad được trang bị con chip xử lý AMD Pro cực kỳ mạnh mẽ','LENOVO','t14gen2.png','Lenovo Thinkpad T14 Gen 2',13000000,99,'AMD Ryzen 5 PRO 5650u  AMD Radeon™ Graphics 16GB 256GB 14 inch FHD',0,'DOANH-NHAN'),(21,'Laptop Lenovo LOQ 15IAX9 83GS001RVN được trang bị bộ xử lý Intel Core i5-12450HX với 8 lõi, 12 luồng cùng RAM DDR5-4800 cho khả năng đa nhiệm ấn tượng. Ổ cứng SSD 512GB chuẩn kết nối PCIe rút ngắn thời gian truy xuất dữ liệu và có thể nâng cấp với lên đến 1TB. Màn hình 15.6 inch cho vùng hiển thị rộng và tốc độ phản hồi nhanh nhờ tần số quét 144Hz.','Lenovo','loq_1.png','Lenovo LOQ 2024',20490000,99,'i5-12450HX RAM 12GB SSD 512GB PCIE VGA 6GB RTX3050 15.6 inches FHD',0,'GAMING'),(24,'Laptop Asus Rog Zephyrus G16 GA605WI-QR156WS Ryzen nổi bật nhờ sử dụng phần cứng thế hệ mới với GPU GeForce RTX 4070 8GB kết hợp với RYZEN AI 9 HX 370. Máy sẽ có dung lượng ổ cứng 1TB, 32GB ram DDR5 tốc độ cao. Chất lượng hình ảnh trên dòng laptop Asus ROG Zephyrus này cũng rất ấn tượng với độ phân giải lên đến 2.5K, sử dụng tấm nền Oled.','Asus','zephyrus.png','ASUS ROG Zephyrus G16',67990000,99,'Ryzen AI 9 HX 370 RAM 32GB SSD 1TB VGA 8GB RTX 4070 16\' 2K Oled 240Hz',0,'GAMING'),(25,'HP Victus 15 đã từ lâu được biết đến là một dòng laptop/ máy tính xách tay với thiết kế tinh tế, hiệu năng mạnh mẽ và mức giá phù hợp với người dùng phổ thông. Đối tượng mà dòng sản phẩm này hướng đến bao gồm cả những game thủ thường xuyên chơi các tựa game yêu cầu cấu hình cao và những người làm đồ họa chuyên nghiệp cần một chiếc laptop gaming hiệu năng tốt nhưng không muốn chi quá nhiều tiền.','HP','victus16.png','HP Victus 15',23900000,99,'AMD Ryzen 5-7535HS RAM 8GB SSD 512GB VGA  Radeon RX 6550M  15.6 inch Full HD 144Hz',0,'GAMING');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-16 16:31:44
