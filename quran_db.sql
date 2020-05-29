/*
SQLyog Ultimate v11.2 (64 bit)
MySQL - 5.6.45-log : Database - quran_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `ayat` */

DROP TABLE IF EXISTS `ayat`;

CREATE TABLE `ayat` (
  `ayat_id` int(11) NOT NULL,
  `surat_id` int(11) DEFAULT NULL,
  `ayat_number` int(11) DEFAULT NULL,
  `ayat_text` text,
  `juz_id` int(11) DEFAULT NULL,
  `ayat_translation` text,
  PRIMARY KEY (`ayat_id`),
  KEY `surat_id` (`surat_id`),
  CONSTRAINT `ayat_ibfk_1` FOREIGN KEY (`surat_id`) REFERENCES `surat` (`id_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ayat` */


/*Table structure for table `surat` */

DROP TABLE IF EXISTS `surat`;

CREATE TABLE `surat` (
  `id_surat` int(11) NOT NULL,
  `surat_name` varchar(100) DEFAULT NULL,
  `surat_text` text,
  `surat_terjemahan` text,
  `count_ayat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `surat` */

insert  into `surat`(`id_surat`,`surat_name`,`surat_text`,`surat_terjemahan`,`count_ayat`) values (1,'Al-Fatihah',' الفاتحة','Pembukaan',7),(2,'Al-Baqarah',' البقرة','Sapi',286),(3,'Ali \'Imran',' اٰل عمران','Keluarga Imran',200),(4,'An-Nisa\'',' النساۤء','Wanita',176),(5,'Al-Ma\'idah',' الماۤئدة','Hidangan',120),(6,'Al-An\'am',' الانعام','Binatang Ternak',165),(7,'Al-A\'raf',' الاعراف','Tempat Tertinggi',206),(8,'Al-Anfal',' الانفال','Rampasan Perang',75),(9,'At-Taubah',' التوبة','Pengampunan',129),(10,'Yunus',' يونس','Yunus',109),(11,'Hud',' هود','Hud',123),(12,'Yusuf',' يوسف','Yusuf',111),(13,'Ar-Ra\'d',' الرّعد','Guruh',43),(14,'Ibrahim',' ابرٰهيم','Ibrahim',52),(15,'Al-Hijr',' الحجر','Hijr',99),(16,'An-Nahl',' النحل','Lebah',128),(17,'Al-Isra\'',' الاسراۤء','Memperjalankan Malam Hari',111),(18,'Al-Kahf',' الكهف','Goa',110),(19,'Maryam',' مريم','Maryam',98),(20,'Taha',' طٰهٰ','Taha',135),(21,'Al-Anbiya\'',' الانبياۤء','Para Nabi',112),(22,'Al-Hajj',' الحج','Haji',78),(23,'Al-Mu\'minun',' المؤمنون','Orang-Orang Mukmin',118),(24,'An-Nur',' النّور','Cahaya',64),(25,'Al-Furqan',' الفرقان','Pembeda',77),(26,'Asy-Syu\'ara\'',' الشعراۤء','Para Penyair',227),(27,'An-Naml',' النمل','Semut-semut',93),(28,'Al-Qasas',' القصص','Kisah-Kisah',88),(29,'Al-\'Ankabut',' العنكبوت','Laba-Laba',69),(30,'Ar-Rum',' الرّوم','Romawi',60),(31,'Luqman',' لقمٰن','Luqman',34),(32,'As-Sajdah',' السّجدة','Sajdah',30),(33,'Al-Ahzab',' الاحزاب','Golongan Yang Bersekutu',73),(34,'Saba\'',' سبأ','Saba\'',54),(35,'Fatir',' فاطر','Maha Pencipta',45),(36,'Yasin',' يٰسۤ','Yasin',83),(37,'As-Saffat',' الصّٰۤفّٰت','Barisan-Barisan',182),(38,'Sad',' ص','Sad',88),(39,'Az-Zumar',' الزمر','Rombongan',75),(40,'Gafir',' غافر','Maha Pengampun',85),(41,'Fussilat',' فصّلت','Yang Dijelaskan',54),(42,'Asy-Syura',' الشورى','Musyawarah',53),(43,'Az-Zukhruf',' الزخرف','Perhiasan',89),(44,'Ad-Dukhan',' الدخان','Kabut',59),(45,'Al-Jasiyah',' الجاثية','Berlutut',37),(46,'Al-Ahqaf',' الاحقاف','Bukit Pasir',35),(47,'Muhammad',' محمّد','Muhammad',38),(48,'Al-Fath',' الفتح','Kemenangan',29),(49,'Al-Hujurat',' الحجرٰت','Kamar-Kamar',18),(50,'Qaf',' ق','Qaf',45),(51,'Az-Zariyat',' الذّٰريٰت','Angin yang Menerbangkan',60),(52,'At-Tur',' الطور','Bukit Tursina',49),(53,'An-Najm',' النجم','Bintang',62),(54,'Al-Qamar',' القمر','Bulan',55),(55,'Ar-Rahman',' الرحمن','Maha Pengasih',78),(56,'Al-Waqi\'ah',' الواقعة','Hari Kiamat',96),(57,'Al-Hadid',' الحديد','Besi',29),(58,'Al-Mujadalah',' المجادلة','Gugatan',22),(59,'Al-Hasyr',' الحشر','Pengusiran',24),(60,'Al-Mumtahanah',' الممتحنة','Wanita Yang Diuji',13),(61,'As-Saff',' الصّفّ','Barisan',14),(62,'Al-Jumu\'ah',' الجمعة','Jumat',11),(63,'Al-Munafiqun',' المنٰفقون','Orang-Orang Munafik',11),(64,'At-Tagabun',' التغابن','Pengungkapan Kesalahan',18),(65,'At-Talaq',' الطلاق','Talak',12),(66,'At-Tahrim',' التحريم','Pengharaman',12),(67,'Al-Mulk',' الملك','Kerajaan',30),(68,'Al-Qalam',' القلم','Pena',52),(69,'Al-Haqqah',' الحاۤقّة','Hari Kiamat',52),(70,'Al-Ma\'arij',' المعارج','Tempat Naik',44),(71,'Nuh',' نوح','Nuh',28),(72,'Al-Jinn',' الجن','Jin',28),(73,'Al-Muzzammil',' المزّمّل','Orang Yang Berselimut',20),(74,'Al-Muddassir',' المدّثّر','Orang Yang Berkemul',56),(75,'Al-Qiyamah',' القيٰمة','Hari Kiamat',40),(76,'Al-Insan',' الانسان','Manusia',31),(77,'Al-Mursalat',' المرسلٰت','Malaikat Yang Diutus',50),(78,'An-Naba\'',' النبأ','Berita Besar',40),(79,'An-Nazi\'at',' النّٰزعٰت','Malaikat Yang Mencabut',46),(80,'\'Abasa',' عبس','Bermuka Masam',42),(81,'At-Takwir',' التكوير','Penggulungan',29),(82,'Al-Infitar',' الانفطار','Terbelah',19),(83,'Al-Mutaffifin',' المطفّفين','Orang-Orang Curang',36),(84,'Al-Insyiqaq',' الانشقاق','Terbelah',25),(85,'Al-Buruj',' البروج','Gugusan Bintang',22),(86,'At-Tariq',' الطارق','Yang Datang Di Malam Hari',17),(87,'Al-A\'la',' الاعلى','Maha Tinggi',19),(88,'Al-Gasyiyah',' الغاشية','Hari Kiamat',26),(89,'Al-Fajr',' الفجر','Fajar',30),(90,'Al-Balad',' البلد','Negeri',20),(91,'Asy-Syams',' الشمس','Matahari',15),(92,'Al-Lail',' الّيل','Malam',21),(93,'Ad-Duha',' الضحى','Duha',11),(94,'Asy-Syarh',' الشرح','Lapang',8),(95,'At-Tin',' التين','Buah Tin',8),(96,'Al-\'Alaq',' العلق','Segumpal Darah',19),(97,'Al-Qadr',' القدر','Kemuliaan',5),(98,'Al-Bayyinah',' البيّنة','Bukti Nyata',8),(99,'Az-Zalzalah',' الزلزلة','Guncangan',8),(100,'Al-\'Adiyat',' العٰديٰت','Kuda Yang Berlari Kencang',11),(101,'Al-Qari\'ah',' القارعة','Hari Kiamat',11),(102,'At-Takasur',' التكاثر','Bermegah-Megahan',8),(103,'Al-\'Asr',' العصر','Asar',3),(104,'Al-Humazah',' الهمزة','Pengumpat',9),(105,'Al-Fil',' الفيل','Gajah',5),(106,'Quraisy',' قريش','Quraisy',4),(107,'Al-Ma\'un',' الماعون','Barang Yang Berguna',7),(108,'Al-Kausar',' الكوثر','Pemberian Yang Banyak',3),(109,'Al-Kafirun',' الكٰفرون','Orang-Orang kafir',6),(110,'An-Nasr',' النصر','Pertolongan',3),(111,'Al-Lahab',' اللهب','Api Yang Bergejolak',5),(112,'Al-Ikhlas',' الاخلاص','Ikhlas',4),(113,'Al-Falaq',' الفلق','Subuh',5),(114,'An-Nas',' الناس','Manusia',6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;