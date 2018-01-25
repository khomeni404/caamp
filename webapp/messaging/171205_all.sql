/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.8 : Database - online
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `online`;

/*Table structure for table `ad_branch` */

DROP TABLE IF EXISTS `ad_branch`;

CREATE TABLE `ad_branch` (
  `br_code` varchar(255) NOT NULL,
  `br_name` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `dist` bigint(20) DEFAULT NULL,
  `ad_br_code` varchar(255) DEFAULT NULL,
  `bb_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`br_code`),
  KEY `FK_sk264fn492yqc6b5v41xf9ut6` (`dist`),
  CONSTRAINT `FK_sk264fn492yqc6b5v41xf9ut6` FOREIGN KEY (`dist`) REFERENCES `com_district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ad_branch` */

insert  into `ad_branch`(`br_code`,`br_name`,`zone`,`dist`,`ad_br_code`,`bb_code`) values ('001','Alanga Br, Tangail','11',NULL,NULL,'00374'),('002','Bandura Br, Nawabgonj','02',NULL,NULL,'00542'),('003','Dakbangla Br, Jhenaihdah','16',NULL,NULL,'00455'),('004','Chaprashirhat Br, Noakhali','14',NULL,NULL,'00168'),('005','Court Bazar SME/Krishi Br.','12',NULL,NULL,'00086'),('006','Chormuguria Br, Madaripur','10',NULL,NULL,'00248'),('007','Mohastangor Br, Bogra','05',45,NULL,'00362'),('008','Keshorehat Br, Rajshahi','09',NULL,NULL,'00837'),('009','Shayestaganj SME/Krishi BranchEnum, Habiganj','08',NULL,NULL,'00243'),('010','Ziranibazar Br, Dhaka','03',NULL,NULL,'00543'),('011','Fultola SME Br, Khulna','06',NULL,NULL,'00384'),('012','Muktagacha SME Br, Mymensingh','11',NULL,NULL,'00314'),('013','Shantahar SME/Krishi BranchEnum, Bogra','05',45,NULL,'00363'),('014','Daudkandi SME Br, Comilla','07',NULL,NULL,'00068'),('015','Kahaloo   SME Center, Bogra','05',45,NULL,'00364'),('016','Kalampur  SME Center, Savar','03',NULL,NULL,'00544'),('017','BoroDarogarhat  SME Center, Sitakundo','13',NULL,NULL,'00524'),('018','Akhaura  SME Center, B.Baria','07',NULL,NULL,'00069'),('019','Borhanuddin SME Center, Bhola','10',NULL,NULL,'00413'),('020','Sonargoan SME Center, Narayangonj','15',NULL,NULL,'00512'),('021','Parshuram SME Center, Feni','14',NULL,NULL,'00021'),('022','Sujanagar SME Center, Pabna','09',NULL,NULL,'00022'),('023','Burichong SME Center, Comilla','07',NULL,NULL,'00023'),('102','Local Office','00',NULL,'0862','00011'),('103','Agrabad Br., Ctg.','00',NULL,'0866','00001'),('104','Sylhet','08',NULL,'0867','00004'),('105','Chawk Mugoltolly Br. (C.M.B), Dhaka.','01',NULL,'0863','00010'),('106','Khatungonj Br., Ctg.','00',NULL,'0869','00002'),('107','Khulna','06',NULL,'0868','00021'),('108','Narayangonj Br., N.Gonj.','15',NULL,'0865','00015'),('109','Foreign Exchange  Br.','00',NULL,'0864','00013'),('110','Islampur Br., Dhaka.','02',NULL,'0872','00012'),('111','Barisal','10',NULL,'0910','00050'),('112','Bogra','05',45,'0873','00075'),('113','Rajshahi','09',NULL,'0879','00085'),('114','Moulvi Bazar Br., Moulvi Bazar.','08',NULL,NULL,'00008'),('115','Pabna','09',NULL,'0884','00080'),('116','Cox-s Bazar Br.,Cox-s Bazar.','12',NULL,NULL,'00006'),('117','Rangpur','04',NULL,'0917','00090'),('118','Nawabpur Road Br.','00',NULL,'0871','00014'),('119','Narsingdi Br., Narsingdi.','15',NULL,'0896','00016'),('120','Kishorgonj Br., Kishorgonj.','11',NULL,NULL,'00009'),('121','Comilla','07',NULL,'0912','00005'),('122','Feni, Feni.','14',NULL,NULL,'00007'),('124','Anderkilla Br., Ctg.','12',NULL,'0874','00003'),('125','Jessore Br., Jessore.','16',NULL,'0886','00442'),('126','Chowmuhani Br., Noakhali.','14',NULL,'0895','00162'),('127','Zinzira Br., Dhaka.','02',NULL,NULL,'00215'),('128','Beani Bazar Br., Sylhet.','08',NULL,NULL,'00203'),('129','New Market Br., Dhaka.','01',NULL,'0889','00214'),('130','Savar Br., Dhaka.','03',NULL,'0920','00218'),('131','Mirpur Br., Dhaka.','01',NULL,'0878','00217'),('132','C-N-Gonj Br.,C-N-Gonj.','09',NULL,'0900','00622'),('133','Kustia','16',NULL,'0883','00482'),('134','Chandpur Br., Chandpur.','07',NULL,NULL,'00025'),('135','Noapara Br., Jessore.','16',NULL,'0905','00443'),('136','Farmgate Br., Dhaka.','01',NULL,'0880','00216'),('137','Jublee Road Br., Ctg.','13',NULL,'0875','00035'),('138','Dinajpur','04',NULL,'0897','00562'),('139','Laksam Br.,Comilla.','07',NULL,NULL,'00062'),('140','Mymensing','11',NULL,'0911','00312'),('141','Chiringa Br., Cox-s Bazar.','12',NULL,NULL,'00082'),('142','Biswanath Br., Sylhet.','08',NULL,NULL,'00206'),('143','Satkhira Br., Satkhira.','06',44,'0918','00532'),('144','Naogaon Br., Naogaon.','05',NULL,NULL,'00611'),('145','Mouchak Br., Dhaka.','01',NULL,'0890','00219'),('146','Chaktai Br.,Ctg.','12',NULL,NULL,'00045'),('147','Teknaf Br.,Cox-s Bazar.','12',NULL,NULL,'00072'),('148','Faridpur','06',NULL,NULL,'00230'),('149','Sirajgonj Br., Sirajgonj.','05',NULL,NULL,'00682'),('150','Mongla Br., Bagerhat.','06',NULL,NULL,'00382'),('151','Amin Bazar Br., Dhaka.','03',NULL,NULL,'00220'),('152','Saidpur Br., Nilphamari.','04',NULL,'0881','00631'),('153','Joypurhat','05',NULL,NULL,'00571'),('154','Shahjadpur Br., Sirajgonj.','05',NULL,NULL,'00683'),('155','Nazipur Br., Naogaon.','09',NULL,NULL,'00612'),('156','Lohagara Br.,Ctg.','12',NULL,NULL,'00019'),('157','Ramna Br., Dhaka.','00',NULL,'0876','00221'),('158','GazipurChawrasta Br.,Gazipur.','15',NULL,'0915','00212'),('159','Tangail Br.,Tangail.','11',NULL,NULL,'00371'),('160','Jhikorgacha Br.,Jessore.','16',NULL,NULL,'00421'),('161','Jamalpur','11',NULL,NULL,'00251'),('162','Chawk BazarBr., Ctg.','12',NULL,NULL,'00018'),('163','Patiya Br.,Ctg.','12',NULL,NULL,'00020'),('164','Benaple Br.,Jessore.','16',NULL,'0914','00444'),('165','Kashinathpur Br., Pabna.','09',NULL,NULL,'00081'),('166','Amberkhana Br.,Sylhet.','08',NULL,NULL,'00207'),('167','Station Road Br.,Ctg.','13',NULL,'0877','00046'),('168','Bashurhat Br., Noakhali.','14',NULL,NULL,'00163'),('169','Kolaroa Br., Satkhira.','06',44,NULL,'00533'),('170','Hathazari Br., Ctg.','13',NULL,NULL,'00047'),('171','Madhabdi Br., Narsingdi.','15',NULL,'0904','00700'),('172','Palash Br., Narsingdi.','15',NULL,NULL,'00017'),('173','Highway Br Sherpur,Bogra','05',45,NULL,'00361'),('174','Bhola Br., Bhola.','10',NULL,NULL,'00411'),('175','Jhenaidah Br., Jhenaidah.','16',NULL,NULL,'00453'),('176','Ashugonj,B.Baria.','07',NULL,NULL,'00063'),('177','Gulshan Br., Dhaka.','00',NULL,'0888','00222'),('178','Tarakandi Br., Jamalpur.','11',NULL,NULL,'00252'),('179','Bangshal Br., Dhaka.','01',NULL,'0882','00223'),('180','Bagerhat Br.,Bagerhat.','06',NULL,NULL,'00381'),('181','Manikgonj','03',NULL,NULL,'00301'),('182','Daulatpur Br., Khulna.','06',NULL,NULL,'00022'),('183','Jhalokati Br., Jhalokati.','10',NULL,NULL,'00415'),('184','Natore','09',NULL,NULL,'00640'),('185','Gaibanda Br., Gaibanda.','05',NULL,NULL,'00580'),('186','Kaligonj Br.,Satkhira.','06',NULL,NULL,'00534'),('187','Munshigonj Br., Munshigonj.','02',NULL,NULL,'00307'),('188','Sherpur Br.-Sherpur','11',NULL,NULL,'00321'),('189','Hajigonj Br.,Chandpur.','07',NULL,NULL,'00026'),('190','Laxmipur Br., Laxmipur.','14',NULL,NULL,'00150'),('191','Mohakhali Br., Dhaka.','03',NULL,'0909','00224'),('192','Patuakhali Br., Patuakhali.','10',NULL,NULL,'00401'),('193','CDA-Avenue Br.,Ctg.','13',NULL,NULL,'00036'),('194','Thakurgaon','04',NULL,NULL,'00670'),('195','Kurigram Br., Kurigram.','04',NULL,NULL,'00720'),('196','B.Baria Br., B.Baria.','07',NULL,NULL,'00064'),('197','Sadarghat Br., Dhaka.','02',NULL,'0903','00225'),('198','Hobigonj Br., Hobigonj.','08',NULL,NULL,'00208'),('199','Laldighirpar Br., Sylhet.','08',NULL,NULL,'00204'),('200','Pirojpur Br., Pirojpur.','06',NULL,NULL,'00056'),('201','Rangamati Br., Rangamati.','13',NULL,NULL,'00067'),('202','Pahartali Br.,Ctg.','13',NULL,'0908','00037'),('203','Cantonment Br., Dhaka.','03',NULL,NULL,'00226'),('204','Jatrabari Br., Dhaka.','15',NULL,NULL,'00227'),('205','Dhanmondi Br., Dhaka.','01',NULL,'0907','00228'),('206','Paltan Br., Dhaka.','01',NULL,'0885','00229'),('207','Uttara Br., Dhaka.','01',NULL,'0898','00231'),('208','Gopalgonj Br., Gopalgonj.','06',NULL,NULL,'00242'),('209','Shyamoli Br., Dhaka.','01',NULL,'0899','00232'),('210','Mirpur-1 Br.Dhaka','03',NULL,'0902','00233'),('211','Shibgonj Br., C-N-Gonj.','09',NULL,NULL,'00623'),('212','Nilphamari Br., Nilphamari.','04',NULL,NULL,'00632'),('213','Head Office Complex Br.','00',NULL,'0887','00234'),('214','Sreemongal Br., Moulvibazar','08',NULL,NULL,'00195'),('215','Elephant Road Br., Dhaka','01',NULL,'0891','00235'),('216','Tongi Br., Gazipur','03',NULL,NULL,'00213'),('217','Madaripur Br., Madaripur','10',NULL,NULL,'00246'),('218','Haji Camp Br., Dhaka','03',NULL,NULL,'00236'),('219','Gobindagonj Br., Gaibanda','05',NULL,NULL,'00581'),('220','Goalabazar Br., Sylhet','08',NULL,NULL,'00202'),('221','Sitakundo BranchEnum','13',NULL,NULL,'00038'),('222','Kawran Bazar BranchEnum, Dhaka','01',NULL,'0893','00238'),('223','VIP Road BranchEnum','01',NULL,'0892','00237'),('224','IDB Bhaban BranchEnum','02',NULL,NULL,'00239'),('225','Maijdee Court BranchEnum','14',NULL,NULL,'00164'),('226','Rampura BranchEnum','03',NULL,'0894','00240'),('227','Eidgaon Br.Cox-s bazar','12',NULL,NULL,'00083'),('228','Bhairab BranchEnum, Kishorgong','11',NULL,NULL,'00316'),('229','Ishwardi','09',NULL,NULL,'00079'),('230','Chuadanga Br, Chuadanga','16',NULL,NULL,'00485'),('231','Chhatak BranchEnum, Sunamgonj','08',NULL,NULL,'00201'),('232','Paikgacha BranchEnum, Khulna','06',NULL,NULL,'00023'),('233','Nawabgonj BranchEnum,Dhaka','02',NULL,NULL,'00209'),('234','Barguna BranchEnum, Barguna','10',NULL,NULL,'00412'),('235','Raipur Br,Laxmipur','14',NULL,NULL,'00151'),('236','Kumarkhali Br,Kustia','16',NULL,NULL,'00483'),('237','Chouddagram Br,Comilla','07',NULL,NULL,'00061'),('238','Birampur Br,Dinajpur','04',NULL,NULL,'00563'),('239','Bandertilla Br,Ctg.','13',NULL,NULL,'00034'),('240','Khilgaon Br, Dhaka','15',NULL,NULL,'00241'),('241','Moralgonj Br,Bagerhat','06',NULL,NULL,'00383'),('242','Rajbari Br,Rajbari.','16',NULL,NULL,'00256'),('243','Panchogar Br, Panchogar','04',NULL,NULL,'00560'),('244','Shanthia Br, Pabna','09',NULL,NULL,'00078'),('245','Dupchanchia Br, Bogra','05',45,NULL,'00076'),('246','Magura Br, Magura','16',NULL,NULL,'00501'),('247','Companygonj Br, Comilla','07',NULL,NULL,'00727'),('248','Kanaighat Br, Sylhet','08',NULL,NULL,'00721'),('249','Sonagazi Br, Feni','14',NULL,NULL,'00722'),('250','Modhupur Br, Tangail','11',NULL,NULL,'00723'),('251','Shariatpur Br, Shariatpur','10',NULL,NULL,'00724'),('252','Barayarhat Br, Chittagong','13',NULL,NULL,'00725'),('253','Lalmonirhat Br, Lalmonirhat','04',NULL,NULL,'00726'),('254','Ramgonj Br, Laxmipur','14',NULL,NULL,'00152'),('255','Faridgonj Br, Chandpur','07',NULL,NULL,'00027'),('256','Kulaura Br, Moulvibazar','08',NULL,NULL,'00196'),('257','Jaldhaka, Nilphamari','04',NULL,NULL,'00633'),('258','Gouripur, Comilla','07',NULL,NULL,'00065'),('259','Shampur, Dhaka','02',NULL,NULL,'00350'),('260','Netrokona Br, Netrokona','11',NULL,NULL,'00330'),('261','Bank Road Br, Noakhali','14',NULL,NULL,'00391'),('262','Meherpur Br, Meherpur','16',NULL,NULL,'00471'),('263','Norail Br, Norail','16',NULL,NULL,'00461'),('264','Rohanpur Br, Chapai Nawabgonj','09',NULL,NULL,'00624'),('265','Poradoho Br, Kushtia','16',NULL,NULL,'00484'),('266','Shawndip Br, Chittagong','13',NULL,NULL,'00521'),('267','Mohammadpur Krishi Market Br, Dhaka','02',NULL,NULL,'00541'),('268','Fatikchori Br, Chittagong','13',NULL,NULL,'00522'),('269','Tekerhat Br, Madaripur','10',NULL,NULL,'00247'),('270','Bancharampur Br, B. Baria','07',NULL,NULL,'00591'),('271','Torki Bondor, Barishal','10',NULL,NULL,'00350'),('272','Jagannatpur Br, Sunamganj','08',NULL,NULL,'00272'),('273','Chatkhil Br, Noakhali','14',NULL,NULL,'00273'),('274','Pallabi Br, Mirpur','03',NULL,NULL,'00373'),('275','Chowgacha Br, Jessore','16',NULL,NULL,'00275'),('276','Gulshan Circle-1 Br, Dhaka ','01',NULL,'0901','00230'),('277','Nabinagar Br, Brahmanbaria ','07',NULL,NULL,'00277'),('278','Belkuchi Br, Sirajganj ','05',NULL,NULL,'00278'),('279','New Market Br,Rajshahi','09',NULL,NULL,'00279'),('280','Bhulta Br,(Rupgonj)Narayangonj','15',NULL,NULL,'00280'),('281','Miarhat Br,Pirojpur','10',NULL,NULL,'00281'),('282','Damodya Br,Shariatpur','10',NULL,NULL,'00282'),('283','Ganakbari Br,Savar','03',NULL,NULL,'00283'),('284','Barolekha Br, Moulvi Bazar','08',NULL,NULL,'00284'),('285','Chhagalnaiya Br,Feni','14',NULL,NULL,'00285'),('286','Chachkoir Br,Natore','09',NULL,NULL,'00286'),('287','Kaliganj Br,Jhenaidah','16',NULL,NULL,'00287'),('288','Dewanhat Br,Chittagong','13',NULL,NULL,'00288'),('289','Dohar Br,Dhaka','02',NULL,NULL,'00289'),('290','Panthapath Br, Dhaka','02',NULL,NULL,'00290'),('291','Senbagh Br,Noakhali','14',NULL,NULL,'00291'),('292','Kanchpur Br,N-Gonj','15',NULL,NULL,'00292'),('293','Sunamgonj Br, Sylhet','08',NULL,'0913','00293'),('294','Keranihat Br, Chittagong','12',NULL,NULL,'00294'),('295','Dagonbhuyian Br, Feni','14',NULL,NULL,'00295'),('296','Mawna Br, Gazipur','15',NULL,NULL,'00296'),('297','Bandarban Br, Bandarban','12',NULL,NULL,'00297'),('298','Nazumiarhat Br, Chittagong','13',NULL,NULL,'00298'),('300','Kotchandpur Br, Kotchandpur, Jhenaidah.','16',NULL,NULL,'00300'),('301','Khagrachari Br, Khagrachari','13',NULL,NULL,'00301'),('302','Sundargonj Br, Gaibandha','04',NULL,NULL,'00302'),('303','Fulbaria Br, Mymensingh ','11',NULL,NULL,'00303'),('304','O.R. Nizam Road, Chittagong','13',NULL,NULL,'00304'),('305','Matlab, Chandpur','07',NULL,NULL,'00305'),('306','Bhandaria, Pirojpur','10',NULL,NULL,'00306'),('307','Sreenagar, Munshigonj','02',NULL,NULL,'00307'),('308','Mohadevpur, Naogaon','09',NULL,NULL,'00308'),('309','zindabazar, Sylhet','08',NULL,NULL,'00197'),('310','Badda, Dhaka','03',NULL,NULL,'00375'),('311','Motijheel, Dhaka','01',NULL,'0906','00376'),('312','Baragola, Bogra','05',45,NULL,'00312'),('313','Raozan, Chittagong ','13',NULL,NULL,'00313'),('314','Chandina, Comilla ','07',NULL,NULL,'00314'),('316','KDA Avenue Br.','06',NULL,NULL,'00316'),('317','Ullapara, Sirajgonj','05',NULL,NULL,'00317'),('318','Hatkhola, Barisal','10',NULL,NULL,'00318'),('319','Baneswar, Rajshahi','09',NULL,NULL,'00319'),('320','Bhanga, Faridpur','06',NULL,NULL,'00320'),('321','Dakshin Surma, Sylhet','08',NULL,NULL,'00321'),('322','Patgram, Lalmonirhat','04',NULL,NULL,'00322'),('323','Jibon Nagar, Chuadanga','16',NULL,NULL,'00323'),('324','Board Bazar, Gazipur','03',NULL,NULL,'00324'),('325','Nandigram, Bogra','05',45,NULL,'00325'),('326','Mirerswarai, Chittagong','13',NULL,NULL,'00326'),('327','Nabiganj SME/Krishi BranchEnum, Hobiganj','08',NULL,NULL,'00327'),('328','Lalbag BranchEnum, Dhaka','02',NULL,NULL,'00328'),('329','Banshkhali BranchEnum, Chittagong','12',NULL,NULL,'00329'),('330','Moheshkhali SME/Krishi BranchEnum, Chittagong','12',NULL,NULL,'00330'),('331','Bakshiganj BranchEnum, Jamalpur','11',NULL,NULL,'00251'),('332','Mogbazar BranchEnum, Dhaka','03',NULL,'0919','00378'),('333','Dhap BranchEnum, Rangpur','04',NULL,NULL,'00090'),('334','Halishahar, Chittagong','13',NULL,NULL,'00090'),('335','Chandraganj, Laxmipur','14',NULL,NULL,'00090'),('336','Shyamnagar, Shatkhira','06',44,NULL,'00336'),('337','Gandaria Br., Dhaka','02',NULL,NULL,'00380'),('338','Konabari Br.,Gazipur.','15',NULL,NULL,'00338'),('339','College Road Br., Feni','14',NULL,NULL,'00339'),('340','Nitaiganj Br., N.Gonj.','15',NULL,NULL,'00340'),('341','Terry Patty Br, Comilla','07',NULL,NULL,'00341'),('342','Baridhara Br.,Dhaka','03',NULL,'0916','00342'),('343','Katiadi,Kishoreganj','11',NULL,NULL,'00317'),('344','Kosba, B. Baria','07',NULL,NULL,'00592'),('345','Trisal, Mymensingh','11',NULL,NULL,'00315'),('346','Bangodda,Comilla','07',NULL,NULL,'00097'),('347','Shetabgonj,Dinajpur','04',NULL,NULL,'00564'),('348','Bahaddarhat, Chittagong','12',NULL,NULL,'00520'),('349','Shapahar, Naogaon','09',NULL,NULL,'00614'),('350','Ramu, Coxs Bazar','12',NULL,NULL,'00087'),('351','Wiseghat, Dhaka','02',NULL,NULL,'00107'),('352','Araihazar','15',NULL,NULL,'00171'),('353','Charfashion, Bhola','10',NULL,NULL,'00410'),('354','Subarnachar, Noakhali','14',NULL,NULL,'00169'),('355','Bhurungamari, Kurigram','04',NULL,NULL,'00721'),('356','Gazipur Sadar, Gazipur','15',NULL,NULL,'00262'),('357','Naria, Shariatpur','10',NULL,NULL,'00801'),('359','Sachar Bazar, Kachua, Chandpur','07',NULL,NULL,'00042'),('360','Sonaimuri,Noakhali','14',NULL,NULL,'00043'),('361','Kadamtoli,Chittagong','13',NULL,NULL,'00044'),('362','Roumari BranchEnum, Kurigram','11',NULL,NULL,'00601'),('363','Fatulla BranchEnum,Narayangonj','15',NULL,NULL,'00109'),('364','Kamrangir Char, Dhaka','02',NULL,NULL,'00111'),('365','GolapgonjBr.Sylhet','08',NULL,NULL,'00502'),('366','Pekua, Coxs Bazar','12',NULL,NULL,'00052'),('367','Anwara,Chittagonj','12',NULL,NULL,'00053'),('368','LALMOHAN, BHOLA','10',NULL,NULL,'00402'),('369','Panchbibi Br., Joypurhat','05',NULL,NULL,'38067'),('370','Hazirhat Br., Laxmipur.','14',NULL,NULL,'51009'),('371','Boalkhali Br., Ctg','12',NULL,NULL,'15130'),('372','Oxyzen Moor Br., Ctg','13',NULL,NULL,'15587'),('373','Mirzapur','11',NULL,NULL,'0112'),('374','Sarankhola','06',NULL,NULL,'0245'),('375','Dholaikhal','02',NULL,NULL,'0113'),('376','Kapasia','15',NULL,NULL,'0114'),('377','Monohardi','15',NULL,NULL,'00377'),('378','Kalkini','10',NULL,NULL,'00378'),('379','Ati Bazar','02',NULL,NULL,'00379'),('380','Kalurghat Br.','12',NULL,NULL,'00380'),('381','Bhawanigonj Br.','09',NULL,NULL,'00381'),('382','Chandanaish Br.','12',NULL,NULL,'00382'),('383','Sonargaon Janapath Road Br.','03',NULL,NULL,'00383'),('384','Pirganj BranchEnum,Rangpur','04',NULL,NULL,'00384'),('385','Singair BranchEnum','03',NULL,NULL,'00385'),('386','Kalapara Br., Patuakhali.','10',NULL,NULL,'00386'),('387','Debiganj Br.','04',NULL,NULL,'00387'),('388','Keshabpur BranchEnum, Jessore','16',NULL,NULL,'54112'),('389','Manda Br., Naogaon.','09',NULL,NULL,'56410'),('390','Pangsha Br,Rajbari.','16',NULL,NULL,'00256'),('391','Banani Br., Dhaka.','03',NULL,NULL,'52604'),('392','Bakerganj Br.Barishal','10',NULL,NULL,'06022'),('393','Rajapur Br.Jhalokati','10',NULL,NULL,'42055'),('394','Lohagara Br, Narail','16',NULL,NULL,'65046'),('395','Raipura Br.Narsingdi','15',NULL,NULL,'00395'),('396','Donia Br.,Dhaka.','15',NULL,NULL,'00396'),('397','Shibaloy Br.Manikgonj','03',NULL,NULL,'00397'),('398','Bhaluka Br. Mymensingh','11',NULL,NULL,'00398'),('399','Nimotla Br.,Munshigonj.','02',NULL,NULL,'59166'),('400','Tungipara Br.,Gopalgonj','06',NULL,NULL,'06022'),('401','Fakirhat Br.,Bagerhat.','06',NULL,NULL,'01046'),('402','Alamdanga Br,Chuadanga','16',NULL,NULL,'18004'),('403','Chatmohar BranchEnum, Pabna','09',NULL,NULL,'76064'),('404','Hemayetpur Br., Savar','03',NULL,NULL,'26050'),('405','Satkania Br., CTG','12',NULL,NULL,'15706'),('406','Agrabad Com. Area Br','00',NULL,NULL,'15060'),('407','Sonatola Br., Bogra','05',45,NULL,'10298'),('408','Mathbaria Br., Pirojpur.','06',NULL,NULL,'79052'),('409','Comilla Cantonment BranchEnum','07',NULL,NULL,'00005'),('410','Nikunja BranchEnum, Dhaka','03',NULL,NULL,'26018');

/*Table structure for table `ad_project` */

DROP TABLE IF EXISTS `ad_project`;

CREATE TABLE `ad_project` (
  `code` varchar(255) NOT NULL,
  `rural_amt_m` double DEFAULT NULL,
  `urban_amt_m` double DEFAULT NULL,
  `rural_amt_ot` double DEFAULT NULL,
  `urban_amt_ot` double DEFAULT NULL,
  `sub_code` varchar(255) DEFAULT NULL,
  `s_date` datetime DEFAULT NULL,
  `s_no` varchar(255) DEFAULT NULL,
  `sess_duration` int(11) DEFAULT NULL,
  `sess_end` datetime DEFAULT NULL,
  `sess_start` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total_bene` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ad_project` */

insert  into `ad_project`(`code`,`rural_amt_m`,`urban_amt_m`,`rural_amt_ot`,`urban_amt_ot`,`sub_code`,`s_date`,`s_no`,`sess_duration`,`sess_end`,`sess_start`,`title`,`total_bene`) values ('201602',2000,2000,3000,3000,'00','2017-09-11 12:01:23','Board Memo.250',24,'2018-06-30 12:01:02','2016-01-07 12:00:30','Islami Bank Scholarship HSC-2016',1500),('201603',6000,5500,15000,10000,'00','2017-09-11 12:01:23','Board Memo.',2,'2020-12-31 12:00:48','2017-01-07 12:00:05','Islami Bank Scholarship (Graduation Level)-2016',2000);

/*Table structure for table `app_application` */

DROP TABLE IF EXISTS `app_application`;

CREATE TABLE `app_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aiOK` bit(1) DEFAULT NULL,
  `applicantId` varchar(255) DEFAULT NULL,
  `applyDate` datetime DEFAULT NULL,
  `eiOK` bit(1) DEFAULT NULL,
  `fiOK` bit(1) DEFAULT NULL,
  `oiOK` bit(1) DEFAULT NULL,
  `piOK` bit(1) DEFAULT NULL,
  `branch_br_code` varchar(255) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `familyInfo_id` bigint(20) DEFAULT NULL,
  `personalInfo_id` bigint(20) DEFAULT NULL,
  `project_code` varchar(255) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_o10ng3rvay8627tpixjqlb4aj` (`branch_br_code`),
  KEY `FK_lvhe7xxyvdbo9s1asv0xr730f` (`district_id`),
  KEY `FK_p9r5a0n5m9xsuui9i4mwm9heg` (`familyInfo_id`),
  KEY `FK_7o9xy71jx5won3y4w48i1utr2` (`personalInfo_id`),
  KEY `FK_fuf6gnalxxf6xd60hsdojjw09` (`project_code`),
  KEY `FK_3s3kekh8iieq0x8nc98o7iemp` (`student_id`),
  CONSTRAINT `FK_3s3kekh8iieq0x8nc98o7iemp` FOREIGN KEY (`student_id`) REFERENCES `sec_user_master` (`id`),
  CONSTRAINT `FK_7o9xy71jx5won3y4w48i1utr2` FOREIGN KEY (`personalInfo_id`) REFERENCES `app_personal_info` (`id`),
  CONSTRAINT `FK_fuf6gnalxxf6xd60hsdojjw09` FOREIGN KEY (`project_code`) REFERENCES `ad_project` (`code`),
  CONSTRAINT `FK_lvhe7xxyvdbo9s1asv0xr730f` FOREIGN KEY (`district_id`) REFERENCES `com_district` (`id`),
  CONSTRAINT `FK_o10ng3rvay8627tpixjqlb4aj` FOREIGN KEY (`branch_br_code`) REFERENCES `ad_branch` (`br_code`),
  CONSTRAINT `FK_p9r5a0n5m9xsuui9i4mwm9heg` FOREIGN KEY (`familyInfo_id`) REFERENCES `app_family_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `app_application` */

insert  into `app_application`(`id`,`aiOK`,`applicantId`,`applyDate`,`eiOK`,`fiOK`,`oiOK`,`piOK`,`branch_br_code`,`district_id`,`familyInfo_id`,`personalInfo_id`,`project_code`,`student_id`) values (4,'\0','17020024','2017-12-04 18:21:46','\0','','\0','','169',44,1,26,NULL,12);

/*Table structure for table `app_edu_info` */

DROP TABLE IF EXISTS `app_edu_info`;

CREATE TABLE `app_edu_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entryDate` datetime DEFAULT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dpqu5alsquccr4xtghgy4a0q0` (`application_id`),
  CONSTRAINT `FK_dpqu5alsquccr4xtghgy4a0q0` FOREIGN KEY (`application_id`) REFERENCES `app_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_edu_info` */

/*Table structure for table `app_family_info` */

DROP TABLE IF EXISTS `app_family_info`;

CREATE TABLE `app_family_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantId` varchar(255) DEFAULT NULL,
  `completed` bit(1) DEFAULT NULL,
  `earningMember` int(11) DEFAULT NULL,
  `entryDate` datetime DEFAULT NULL,
  `familyMember` int(11) DEFAULT NULL,
  `fatherCell` varchar(255) DEFAULT NULL,
  `fatherCultivableLand` double DEFAULT NULL,
  `fatherEducation` varchar(255) DEFAULT NULL,
  `fatherHouseLand` double DEFAULT NULL,
  `fatherLeasedLand` double DEFAULT NULL,
  `fatherOccupation` varchar(255) DEFAULT NULL,
  `fatherState` varchar(255) DEFAULT NULL,
  `guardianCellNo` varchar(255) DEFAULT NULL,
  `guardianMonthIncome` varchar(255) DEFAULT NULL,
  `guardianName` varchar(255) DEFAULT NULL,
  `guardianOccupation` varchar(255) DEFAULT NULL,
  `guardianRelation` varchar(255) DEFAULT NULL,
  `houseType` varchar(255) DEFAULT NULL,
  `managerRecommendType` varchar(255) DEFAULT NULL,
  `maritalStatus` varchar(255) DEFAULT NULL,
  `motherCell` varchar(255) DEFAULT NULL,
  `motherEducation` varchar(255) DEFAULT NULL,
  `motherOccupation` varchar(255) DEFAULT NULL,
  `motherState` varchar(255) DEFAULT NULL,
  `physicallyChalanged` int(11) DEFAULT NULL,
  `physicallyChalangedType` varchar(255) DEFAULT NULL,
  `residenceType` varchar(255) DEFAULT NULL,
  `scholarshipFromIbbl` int(11) DEFAULT NULL,
  `scholarshipFromOrg` varchar(255) DEFAULT NULL,
  `scholarshipFromOther` int(11) DEFAULT NULL,
  `scholarshipMonthlyAmt` double DEFAULT NULL,
  `siblingsInStudy` int(11) DEFAULT NULL,
  `studentInfogenuine` varchar(255) DEFAULT NULL,
  `totalSiblings` int(11) DEFAULT NULL,
  `wardsOfFreedomFighter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `app_family_info` */

insert  into `app_family_info`(`id`,`applicantId`,`completed`,`earningMember`,`entryDate`,`familyMember`,`fatherCell`,`fatherCultivableLand`,`fatherEducation`,`fatherHouseLand`,`fatherLeasedLand`,`fatherOccupation`,`fatherState`,`guardianCellNo`,`guardianMonthIncome`,`guardianName`,`guardianOccupation`,`guardianRelation`,`houseType`,`managerRecommendType`,`maritalStatus`,`motherCell`,`motherEducation`,`motherOccupation`,`motherState`,`physicallyChalanged`,`physicallyChalangedType`,`residenceType`,`scholarshipFromIbbl`,`scholarshipFromOrg`,`scholarshipFromOther`,`scholarshipMonthlyAmt`,`siblingsInStudy`,`studentInfogenuine`,`totalSiblings`,`wardsOfFreedomFighter`) values (1,NULL,'',NULL,'2017-12-05 18:50:15',NULL,'017845545545',NULL,'2501',NULL,NULL,'20','2602','021545454',NULL,'Habib Uddinn','18','Brother',NULL,NULL,NULL,'0121545','2506','24','2602',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `app_personal_info` */

DROP TABLE IF EXISTS `app_personal_info`;

CREATE TABLE `app_personal_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beneficiaryStatus` varchar(255) DEFAULT NULL,
  `beneficiaryType` varchar(255) DEFAULT NULL,
  `cellNo` varchar(255) DEFAULT NULL,
  `completed` bit(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `educationLevelCode` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `entryDate` date DEFAULT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `studentType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `app_personal_info` */

insert  into `app_personal_info`(`id`,`beneficiaryStatus`,`beneficiaryType`,`cellNo`,`completed`,`dob`,`educationLevelCode`,`emailAddress`,`entryDate`,`fatherName`,`motherName`,`nid`,`religion`,`sex`,`studentName`,`studentType`) values (26,NULL,NULL,'01717659287','','2017-12-01','','','2017-12-05','Jobbar','Jamela','','2103','1502','Habib Uddin Khan','1701');

/*Table structure for table `com_address` */

DROP TABLE IF EXISTS `com_address`;

CREATE TABLE `com_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `divisionCode` varchar(255) DEFAULT NULL,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `pc` varchar(255) DEFAULT NULL,
  `po` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `ps_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fvbgfe7eplbkup25nr05478sp` (`application_id`),
  KEY `FK_c89ladgm7ai4hhlan5mc85ibf` (`district_id`),
  KEY `FK_mhlp65bsfof3e6hh3ixtmy3wo` (`ps_id`),
  CONSTRAINT `FK_c89ladgm7ai4hhlan5mc85ibf` FOREIGN KEY (`district_id`) REFERENCES `com_district` (`id`),
  CONSTRAINT `FK_fvbgfe7eplbkup25nr05478sp` FOREIGN KEY (`application_id`) REFERENCES `app_application` (`id`),
  CONSTRAINT `FK_mhlp65bsfof3e6hh3ixtmy3wo` FOREIGN KEY (`ps_id`) REFERENCES `com_thana` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_address` */

/*Table structure for table `com_district` */

DROP TABLE IF EXISTS `com_district`;

CREATE TABLE `com_district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` double DEFAULT NULL,
  `bbID` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `DIVISION_ID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `PPK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `com_district` */

insert  into `com_district`(`id`,`area`,`bbID`,`description`,`DIVISION_ID`,`name`,`population`,`PPK`) values (1,1831,NULL,'---','1','Barguna',882000,481),(2,2785,NULL,'---','1','Barisal',2291000,823),(3,3403,NULL,'---','1','Bhola',1758000,517),(4,749,NULL,'---','1','Jhalokati',596000,795),(5,3221,NULL,'---','1','Patuakhali',1517000,471),(6,1308,NULL,'---','1','Pirojpur',1103000,844),(7,4479,NULL,'---','2','Bandarban',383000,86),(8,1927,NULL,'---','2','Brahmanbaria',2808000,1457),(9,1704,NULL,'---','2','Chandpur',2393000,1404),(10,5283,NULL,'---','2','Chittagong',7509000,1421),(11,3085,NULL,'---','2','Comilla',5304000,1719),(12,2492,NULL,'---','2','Cox\'s Bazar',2275000,913),(13,928,NULL,'---','2','Feni',1420000,1530),(14,2700,NULL,'---','2','Khagrachhari',608000,225),(15,1456,NULL,'---','2','Lakshmipur',1711000,1175),(16,3601,NULL,'---','2','Noakhali',3072000,853),(17,6116,NULL,'---','2','Rangamati',596000,97),(18,1464,NULL,'---','3','Dhaka',11875000,8111),(19,2073,NULL,'---','3','Faridpur',1867000,901),(20,1800,NULL,'---','3','Gazipur',3333000,1852),(21,1490,NULL,'---','3','Gopalganj',1149000,771),(22,2032,NULL,'---','3','Jamalpur',2265000,1115),(23,2689,NULL,'---','3','Kishoreganj',2853000,1061),(24,1145,NULL,'---','3','Madaripur',1149000,1004),(25,1379,NULL,'---','3','Manikganj',1379000,1000),(26,955,NULL,'---','3','Munshiganj',1420000,1487),(27,4363,NULL,'---','3','Mymensingh',5042000,1156),(28,759,NULL,'---','3','Narayanganj',2897000,4139),(29,1141,NULL,'---','3','Narsingdi',2202000,1930),(30,2810,NULL,'---','3','Netrakona',2207000,786),(31,1119,NULL,'---','3','Rajbari',1040000,929),(32,1182,NULL,'---','3','Shariatpur',1146000,970),(33,1364,NULL,'---','3','Sherpur',1334000,978),(34,3414,NULL,'---','3','Tangail',3571000,1046),(35,3959,NULL,'---','4','Bagerhat',1461000,369),(36,1177,NULL,'---','4','Chuadanga',1123000,954),(37,2567,NULL,'---','4','Jessore',2742000,1068),(38,1961,NULL,'---','4','Jhenaidah',1756000,895),(39,4394,NULL,'---','4','Khulna',2294000,522),(40,1601,NULL,'---','4','Kushtia',1933000,1207),(41,1049,NULL,'---','4','Magura',913000,871),(42,509,NULL,'---','4','Meherpur',652000,910),(43,990,NULL,'---','4','Narail',715000,722),(44,3858,NULL,'---','4','Satkhira',1973000,511),(45,2920,NULL,'---','5','Bogra',3371000,1154),(46,965,NULL,'---','5','Joypurhat',909000,942),(47,3436,NULL,'---','5','Naogaon',2576000,750),(48,1896,NULL,'---','5','Natore',1696000,894),(49,1703,NULL,'---','5','Chapainawabganj',1635000,960),(50,2372,NULL,'---','5','Pabna',2497000,1053),(51,2407,NULL,'---','5','Rajshahi',2573000,1069),(52,2498,NULL,'---','5','Sirajganj',3072000,1230),(53,3438,NULL,'---','6','Dinajpur',2970000,864),(54,2179,NULL,'---','6','Gaibandha',2349000,1078),(55,2296,NULL,'---','6','Kurigram',2050000,893),(56,1241,NULL,'---','6','Lalmonirhat',1249000,1006),(57,1580,NULL,'---','6','Nilphamari',1820000,1152),(58,1405,NULL,'---','6','Panchagarh',981000,698),(59,2368,NULL,'---','6','Rangpur',2866000,1210),(60,1810,NULL,'---','6','Thakurgaon',1380000,762),(61,2637,NULL,'---','7','Habiganj',2059000,781),(62,2799,NULL,'---','7','Moulvibazar',1902000,679),(63,3670,NULL,'---','7','Sunamganj',2443000,666),(64,3490,NULL,'---','7','Sylhet',3404000,975);

/*Table structure for table `com_occupation` */

DROP TABLE IF EXISTS `com_occupation`;

CREATE TABLE `com_occupation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_bn` varchar(255) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_82hf4bvud9mx7hehum4gf6t2a` (`parent`),
  CONSTRAINT `FK_82hf4bvud9mx7hehum4gf6t2a` FOREIGN KEY (`parent`) REFERENCES `com_occupation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `com_occupation` */

insert  into `com_occupation`(`id`,`name`,`name_bn`,`parent`) values (1,'Govt. Service',NULL,NULL),(5,'Clerk',NULL,1),(8,'Self Employed',NULL,NULL),(9,'Barbar',NULL,8),(10,'Artist',NULL,8),(11,'Blacksmith','&#2453;&#2494;&#2478;&#2494;&#2480;',8),(18,'Lawyer','&#2438;&#2439;&#2472;&#2460;&#2496;&#2476;&#2496;',8),(19,'Postman','&#2465;&#2494;&#2453;&#2474;&#2495;&#2527;&#2472;',1),(20,'Duftry','&#2470;&#2474;&#2509;&#2468;&#2480;&#2496;',1),(21,'Non Gov. Service','&#2476;&#2503;&#2488;&#2480;&#2453;&#2494;&#2480;&#2495; &#2458;&#2494;&#2453;&#2497;&#2480;&#2495;',NULL),(22,'Teacher','&#2486;&#2495;&#2453;&#2509;&#2487;&#2453;',NULL),(23,'Teacher','&#2486;&#2495;&#2453;&#2509;&#2487;&#2453;',21),(24,'Peon','&#2453;&#2480;&#2472;&#2495;&#2453;',21);

/*Table structure for table `com_properties` */

DROP TABLE IF EXISTS `com_properties`;

CREATE TABLE `com_properties` (
  `id` bigint(20) NOT NULL,
  `coreKey` varchar(255) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `weightage` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_properties` */

insert  into `com_properties`(`id`,`coreKey`,`marks`,`name`,`weightage`) values (1101,'01',NULL,'General Beneficiary (Person)',NULL),(1102,'02',NULL,'Student',NULL),(1103,'03',NULL,'Organization',NULL),(1201,'11',NULL,'DIBS(Dhaka)',NULL),(1202,'01',NULL,'Barisal',NULL),(1203,'02',NULL,'Chittagong',NULL),(1204,'03',NULL,'Comilla',NULL),(1205,'04',NULL,'Dhaka',NULL),(1206,'05',NULL,'Dinajpur',NULL),(1207,'06',NULL,'Jessore',NULL),(1208,'07',NULL,'Rajshahi',NULL),(1209,'08',NULL,'Sylhet',NULL),(1210,'09',NULL,'Madrasah',NULL),(1211,'10',NULL,'Technical',NULL),(1301,'1',NULL,'Strongly Recommended',NULL),(1302,'2',NULL,'Recommended',NULL),(1303,'3',NULL,'Not Recommended',NULL),(1401,'1',NULL,'Blind',NULL),(1402,'2',NULL,'Deaf and dumb',NULL),(1403,'3',NULL,'Missing/defected/disable hands',NULL),(1404,'4',NULL,'Missing/defected/disable legs',NULL),(1405,'5',NULL,'Dumb',NULL),(1406,'6',NULL,'Deaf',NULL),(1407,'7',NULL,'Not Applicable',NULL),(1501,'0',NULL,'N/A',NULL),(1502,'1',NULL,'Male',NULL),(1503,'2',NULL,'Female',NULL),(1504,'3',NULL,'Other',NULL),(1601,'01',NULL,'Building',NULL),(1602,'02',NULL,'Tin Shed',NULL),(1603,'03',NULL,'Semipaka',NULL),(1604,'04',NULL,'Hut',NULL),(1605,'05',NULL,'Made of Mud',NULL),(1606,'06',NULL,'Sheltered by Others',NULL),(1701,'01',NULL,'Urban (Town)',NULL),(1702,'02',NULL,'Rural (Village)',NULL),(1801,'99',NULL,'Others(Mosque, Marriage, Family Maintenance etc.)',NULL),(1802,'01',NULL,'Humanitarian and Disaster Relief',NULL),(1803,'02',NULL,'Education',NULL),(1804,'03',NULL,'Health',NULL),(1805,'04',NULL,'Sports',NULL),(1806,'05',NULL,'Arts, Literature and Culture',NULL),(1807,'06',NULL,'Environment',NULL),(1901,'22',NULL,'Sponsorship',NULL),(1902,'01',NULL,'Donation to the BDR Martyred Family',NULL),(1903,'23',NULL,'Providing Solar system to the poor',NULL),(1904,'02',NULL,'Providing winter cloths to poor people',NULL),(1905,'24',NULL,'Other activities',NULL),(1906,'03',NULL,'Relief to the flood affected people',NULL),(1907,'25',NULL,'Institutions',NULL),(1908,'04',NULL,'Tohfa-e-Ramadan',NULL),(1909,'26',NULL,'Others(marriage and Others Shariah Approved Activities)',NULL),(1910,'05',NULL,'Distribution of sacrificial meat',NULL),(1911,'06',NULL,'Building cyclone centre in coastal area',NULL),(1912,'07',NULL,'Others',NULL),(1913,'08',NULL,'Scholarship',NULL),(1914,'09',NULL,'Donation to the Institutions',NULL),(1915,'10',NULL,'Providing transportation facility',NULL),(1916,'11',NULL,'Sponsorship',NULL),(1917,'12',NULL,'Others(lump=sum donation and others)',NULL),(1918,'13',NULL,'Providing treatment cost to the individuals',NULL),(1919,'14',NULL,'Donation to the Hospital and Institutions',NULL),(1920,'15',NULL,'Others',NULL),(1921,'16',NULL,'Donation to the Institutions',NULL),(1922,'17',NULL,'Others',NULL),(1923,'18',NULL,'Donation to the Institutions',NULL),(1924,'19',NULL,'Donation to the Individuals',NULL),(1925,'20',NULL,'Sponsorship',NULL),(1926,'21',NULL,'Tree Plantation',NULL),(2001,'01',NULL,'Own',NULL),(2002,'02',NULL,'Rent',NULL),(2003,'03',NULL,'Govt Quarter',NULL),(2004,'04',NULL,'Official Quarter',NULL),(2005,'05',NULL,'Sheltered by Others',NULL),(2101,'01',NULL,'Muslim',NULL),(2102,'02',NULL,'Hindu',NULL),(2103,'03',NULL,'Buddhist',NULL),(2104,'04',NULL,'Christian',NULL),(2105,'05',NULL,'Other Tribal cult',NULL),(2201,'1',NULL,'Single',NULL),(2202,'2',NULL,'Married',NULL),(2203,'3',NULL,'Divorced',NULL),(2204,'4',NULL,'Separated',NULL),(2205,'5',NULL,'Widowed',NULL),(2301,'01',NULL,'Collage',NULL),(2302,'02',NULL,'University',NULL),(2303,'03',NULL,'Medical',NULL),(2304,'04',NULL,'Engineering',NULL),(2305,'05',NULL,'Agriculture',NULL),(2306,'06',NULL,'Madrasha',NULL),(2401,'01',NULL,'City Corporation',NULL),(2402,'02',NULL,'District Town',NULL),(2403,'03',NULL,'Upzila Town',NULL),(2404,'04',NULL,'Rural Area',NULL),(2405,'05',NULL,'Divisional town',NULL),(2501,'1',NULL,'Below SSC ',NULL),(2502,'2',NULL,'SSC',NULL),(2503,'3',NULL,'HSC',NULL),(2504,'4',NULL,'Graduation',NULL),(2505,'5',NULL,'Post Graduation',NULL),(2506,'6',NULL,'Illiterate',NULL),(2601,'01',NULL,'Alive',NULL),(2602,'02',NULL,'Late',NULL),(2603,'03',NULL,'Separated',NULL),(2701,'11',NULL,'November',NULL),(2702,'01',NULL,'January',NULL),(2703,'12',NULL,'December',NULL),(2704,'02',NULL,'February',NULL),(2705,'03',NULL,'March',NULL),(2706,'04',NULL,'April',NULL),(2707,'05',NULL,'May',NULL),(2708,'06',NULL,'June',NULL),(2709,'07',NULL,'July',NULL),(2710,'08',NULL,'August',NULL),(2711,'09',NULL,'September',NULL),(2712,'10',NULL,'October',NULL),(2801,'00',NULL,'Head Office Controlled Branches',NULL),(2802,'11',NULL,'Mymensingh Zone',NULL),(2803,'01',NULL,'Dhaka Central Zone',NULL),(2804,'12',NULL,'Chittagong South Zone',NULL),(2805,'02',NULL,'Dhaka South Zone',NULL),(2806,'13',NULL,'Chittagong North Zone',NULL),(2807,'03',NULL,'Dhaka North Zone',NULL),(2808,'14',NULL,'Noakhali Zone',NULL),(2809,'04',NULL,'Rangpur Zone',NULL),(2810,'15',NULL,'Dhaka East Zone',NULL),(2811,'05',NULL,'Bogra Zone',NULL),(2812,'16',NULL,'Jessore Zone',NULL),(2813,'06',NULL,'Khulna Zone',NULL),(2814,'07',NULL,'Comilla Zone',NULL),(2815,'08',NULL,'Sylhet Zone',NULL),(2816,'09',NULL,'Rajshahi Zone',NULL),(2817,'10',NULL,'Barishal Zone',NULL),(2901,'01',NULL,'Barisal',NULL),(2902,'02',NULL,'Chittagong',NULL),(2903,'03',NULL,'Dhaka',NULL),(2904,'04',NULL,'Khulna',NULL),(2905,'05',NULL,'Rajshahi',NULL),(2906,'06',NULL,'Rangpur',NULL),(2907,'07',NULL,'Sylhet',NULL);

/*Table structure for table `com_thana` */

DROP TABLE IF EXISTS `com_thana`;

CREATE TABLE `com_thana` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a66pl9o36kvisydtgy0poscp3` (`district_id`),
  CONSTRAINT `FK_a66pl9o36kvisydtgy0poscp3` FOREIGN KEY (`district_id`) REFERENCES `com_district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=latin1;

/*Data for the table `com_thana` */

insert  into `com_thana`(`id`,`description`,`name`,`district_id`) values (1,'Amtali','Amtali',1),(2,'Bamna','Bamna',1),(3,'Barguna Sadar','Barguna Sadar',1),(4,'Betagi','Betagi',1),(5,'Patharghata','Patharghata',1),(6,'Taltali','Taltali',1),(7,'Muladi','Muladi',2),(8,'Babuganj','Babuganj',2),(9,'Agailjhara','Agailjhara',2),(10,'Barisal Sadar','Barisal Sadar',2),(11,'Bakerganj','Bakerganj',2),(12,'Banaripara','Banaripara',2),(13,'Gaurnadi','Gaurnadi',2),(14,'Hizla','Hizla',2),(15,'Mehendiganj','Mehendiganj',2),(16,'Wazirpur','Wazirpur',2),(17,'Bandarban Sadar','Bandarban Sadar',7),(18,'Thanchi','Thanchi',7),(19,'Lama','Lama',7),(20,'Naikhongchhari','Naikhongchhari',7),(21,'Ali kadam','Ali kadam',7),(22,'Rowangchhari','Rowangchhari',7),(23,'Ruma','Ruma',7),(24,'Brahmanbaria Sadar','Brahmanbaria Sadar',8),(25,'Ashuganj','Ashuganj',8),(26,'Nasirnagar','Nasirnagar',8),(27,'Nabinagar','Nabinagar',8),(28,'Sarail','Sarail',8),(29,'Shahbazpur Town','Shahbazpur Town',8),(30,'Kasba','Kasba',8),(31,'Akhaura','Akhaura',8),(32,'Bancharampur','Bancharampur',8),(33,'Bijoynagar','Bijoynagar',8),(34,'Ainpur','Ainpur',9),(35,'Alumura','Alumura',9),(36,'Vhingulia','Vhingulia',9),(37,'Akania','Akania',9),(38,'Uzani','Uzani',9),(39,'Dighaldhi','Dighaldhi',9),(40,'Nolua','Nolua',9),(41,'Bahari','Bahari',9),(42,'Sikirchar','Sikirchar',9),(43,'Ashwinpur','Ashwinpur',9),(44,'SouthBargoun','SouthBargoun',9),(45,'Anwara','Anwara',10),(46,'Banshkhali','Banshkhali',10),(47,'Boalkhali','Boalkhali',10),(48,'Chandanaish','Chandanaish',10),(49,'Fatikchhari','Fatikchhari',10),(50,'Hathazari','Hathazari',10),(51,'Lohagara','Lohagara',10),(52,'Mirsharai','Mirsharai',10),(53,'Patiya','Patiya',10),(54,'Rangunia','Rangunia',10),(55,'Raozan','Raozan',10),(56,'Sandwip','Sandwip',10),(57,'Satkania','Satkania',10),(58,'Sitakunda','Sitakunda',10),(59,'Chittagong Sadar','Chittagong Sadar',10),(60,'Chittagong Sadar','Pahartali',10),(61,'Chittagong Sadar','Panchlaish',10),(62,'Chittagong Sadar','Chittagong Kotwali',10),(63,'Chittagong Sadar','Chandgaon',10),(64,'Chittagong Sadar','Bandar',10),(65,'Chittagong Sadar','Double Mooring',10),(66,'Chittagong Sadar','Halishohor',10),(67,'Chittagong Sadar','Karnafuly',10),(68,'Chittagong Sadar','Bakoliya',10),(69,'Chittagong Sadar','Baizid',10),(70,'Chittagong Sadar','Patenga Thana',10),(71,'Chittagong Sadar','Khulshi',10),(72,'Chittagong Sadar','Bondor',10),(73,'Chittagong Sadar','Akbor Sha',10),(74,'Chittagong Sadar','EPZ',10),(75,'Chittagong Sadar','Chaowkbazar',10),(76,'Chittagong Sadar','jorargonj thana',10),(77,'Barura','Barura',11),(78,'Brahmanpara','Brahmanpara',11),(79,'Burichong','Burichong',11),(80,'Chandina','Chandina',11),(81,'Chauddagram','Chauddagram',11),(82,'Daudkandi','Daudkandi',11),(83,'Debidwar','Debidwar',11),(84,'Homna','Homna',11),(85,'Comilla Sadar','Comilla Sadar',11),(86,'Laksam','Laksam',11),(87,'Monohorgonj','Monohorgonj',11),(88,'Meghna','Meghna',11),(89,'Muradnagar','Muradnagar',11),(90,'Nangalkot','Nangalkot',11),(91,'Comilla Sadar Dakshin','Comilla Sadar Dakshin',11),(92,'Titas','Titas',11),(93,'Chakaria','Chakaria',12),(94,'Cox\'s Bazar Sadar','Cox\'s Bazar Sadar',12),(95,'Kutubdia','Kutubdia',12),(96,'Maheshkhali','Maheshkhali',12),(97,'Ramu','Ramu',12),(98,'Teknaf','Teknaf',12),(99,'Ukhia','Ukhia',12),(100,'Pekua','Pekua',12),(101,'Feni Sadar','Feni Sadar',13),(102,'Sonagazi','Sonagazi',13),(103,'Fhulgazi','Fhulgazi',13),(104,'Chagalnaiya','Chagalnaiya',13),(105,'Daganbhyan','Daganbhyan',13),(106,'Parshuram','Parshuram',13),(107,'Dighinala','Dighinala',14),(108,'Khagrachhari','Khagrachhari',14),(109,'Lakshmichhari','Lakshmichhari',14),(110,'Mahalchhari','Mahalchhari',14),(111,'Manikchhari','Manikchhari',14),(112,'Matiranga','Matiranga',14),(113,'Panchhari','Panchhari',14),(114,'Ramgarh','Ramgarh',14),(115,'Lakshmipur Sadar','Lakshmipur Sadar',15),(116,'Raipur','Raipur',15),(117,'Ramganj','Ramganj',15),(118,'Ramgati','Ramgati',15),(119,'Kamalnagar','Kamalnagar',15),(120,'Noakhali Sadar','Noakhali Sadar',16),(121,'Begumganj','Begumganj',16),(122,'Chatkhil','Chatkhil',16),(123,'Companiganj','Companiganj',16),(124,'Senbagh','Senbagh',16),(125,'Hatiya','Hatiya',16),(126,'Kabirhat','Kabirhat',16),(127,'Sonaimuri','Sonaimuri',16),(128,'Suborno Char','Suborno Char',16),(129,'Rangamati Sadar','Rangamati Sadar',17),(130,'Belaichhari','Belaichhari',17),(131,'Bagaichhari','Bagaichhari',17),(132,'Barkal','Barkal',17),(133,'Juraichhari','Juraichhari',17),(134,'Rajasthali','Rajasthali',17),(135,'Kaptai','Kaptai',17),(136,'Langadu','Langadu',17),(137,'Nannerchar','Nannerchar',17),(138,'Kaukhali','Kaukhali',17),(139,'Dhamrai','Dhamrai',18),(140,'Dohar','Dohar',18),(141,'Keraniganj','Keraniganj',18),(142,'Nawabganj','Nawabganj',18),(143,'Savar','Savar',18),(144,'Dhaka Sadar','Badda',18),(145,'Dhaka Sadar','Biman Bandar',18),(146,'Dhaka Sadar','Cantonment',18),(147,'Dhaka Sadar','Dhanmondi',18),(148,'Dhaka Sadar','Demra',18),(149,'Dhaka Sadar','Kotwali',18),(150,'Dhaka Sadar','Gulshan',18),(151,'Dhaka Sadar','Hazaribagh',18),(152,'Dhaka Sadar','Kafrul',18),(153,'Dhaka Sadar','Kamringir Char',18),(154,'Dhaka Sadar','Khilgaon',18),(155,'Dhaka Sadar','Lalbagh',18),(156,'Dhaka Sadar','Mugda',18),(157,'Dhaka Sadar','Mirpur',18),(158,'Dhaka Sadar','Mohammadpur',18),(159,'Dhaka Sadar','Motijheel',18),(160,'Dhaka Sadar','Pallabi',18),(161,'Dhaka Sadar','Paltan',18),(162,'Dhaka Sadar','Ramna',18),(163,'Dhaka Sadar','Sabujbagh',18),(164,'Dhaka Sadar','Shyampur',18),(165,'Dhaka Sadar','Sutrapur',18),(166,'Dhaka Sadar','Tejgaon',18),(167,'Dhaka Sadar','Uttara East',18),(168,'Dhaka Sadar','Uttara West',18),(169,'Faridpur Sadar','Faridpur Sadar',19),(170,'Boalmari','Boalmari',19),(171,'Alfadanga','Alfadanga',19),(172,'Madhukhali','Madhukhali',19),(173,'Bhanga','Bhanga',19),(174,'Nagarkanda','Nagarkanda',19),(175,'Charbhadrasan','Charbhadrasan',19),(176,'Sadarpur','Sadarpur',19),(177,'Shaltha','Shaltha',19),(178,'Gazipur Sadar','Gazipur Sadar',20),(179,'Tongi','Tongi',20),(180,'Sreepur','Sreepur',20),(181,'Kaliakoir','Kaliakoir',20),(182,'Kapasia','Kapasia',20),(183,'Kaligonj','Kaligonj',20),(184,'Gopalganj Sadar','Gopalganj Sadar',21),(185,'Kashiani','Kashiani',21),(186,'Kotalipara','Kotalipara',21),(187,'Muksudpur','Muksudpur',21),(188,'Tungipara','Tungipara',21),(189,'Dewanganj','Dewanganj',22),(190,'Baksiganj','Baksiganj',22),(191,'Islampur','Islampur',22),(192,'Jamalpur Sadar','Jamalpur Sadar',22),(193,'Madarganj','Madarganj',22),(194,'Melandaha','Melandaha',22),(195,'Sarishabari','Sarishabari',22),(196,'Narundi Police I.C','Narundi Police I.C',22),(197,'Astagram','Astagram',23),(198,'Bajitpur','Bajitpur',23),(199,'Bhairab','Bhairab',23),(200,'Hossainpur','Hossainpur',23),(201,'Itna','Itna',23),(202,'Karimganj','Karimganj',23),(203,'Katiadi','Katiadi',23),(204,'Kishoreganj Sadar','Kishoreganj Sadar',23),(205,'Kuliarchar','Kuliarchar',23),(206,'Mithamain','Mithamain',23),(207,'Nikli','Nikli',23),(208,'Pakundia','Pakundia',23),(209,'Tarail','Tarail',23),(210,'Madaripur Sadar','Madaripur Sadar',24),(211,'Kalkini','Kalkini',24),(212,'Rajoir','Rajoir',24),(213,'Shibchar','Shibchar',24),(214,'Singair','Singair',25),(215,'Shibalaya','Shibalaya',25),(216,' Saturia',' Saturia',25),(217,' Harirampur',' Harirampur',25),(218,'Ghior','Ghior',25),(219,'Daulatpur','Daulatpur',25),(220,'Lohajang','Lohajang',26),(221,'Sreenagar','Sreenagar',26),(222,'Munshiganj Sadar','Munshiganj Sadar',26),(223,'Sirajdikhan','Sirajdikhan',26),(224,'Tongibari','Tongibari',26),(225,'Gazaria','Gazaria',26),(226,'Bhaluka','Bhaluka',27),(227,'Trishal','Trishal',27),(228,'Haluaghat','Haluaghat',27),(229,'Muktagachha','Muktagachha',27),(230,'Dhobaura','Dhobaura',27),(231,'Fulbaria','Fulbaria',27),(232,'Gaffargaon','Gaffargaon',27),(233,'Gauripur','Gauripur',27),(234,'Ishwarganj','Ishwarganj',27),(235,'Mymensingh Sadar','Mymensingh Sadar',27),(236,'Nandail','Nandail',27),(237,'Phulpur','Phulpur',27),(238,'Tarakanda','Tarakanda',27),(239,'Araihazar','Araihazar',28),(240,'Sonargaon','Sonargaon',28),(241,'Bandar','Bandar',28),(242,'Narayanganj Sadar','Narayanganj Sadar',28),(243,'Rupganj','Rupganj',28),(244,'Belabo','Belabo',29),(245,'Monohardi','Monohardi',29),(246,'Narsingdi Sadar','Narsingdi Sadar',29),(247,'Palash','Palash',29),(248,'Raipura','Raipura',29),(249,'Shibpur','Shibpur',29),(250,'Atpara','Atpara',30),(251,'Barhatta','Barhatta',30),(252,'Durgapur','Durgapur',30),(253,'Khaliajuri','Khaliajuri',30),(254,'Kalmakanda','Kalmakanda',30),(255,'Kendua','Kendua',30),(256,'Madan','Madan',30),(257,'Mohanganj','Mohanganj',30),(258,'Netrokona Sadar','Netrokona Sadar',30),(259,'Purbadhala','Purbadhala',30),(260,'Baliakandi','Baliakandi',31),(261,'Goalandaghat','Goalandaghat',31),(262,'Pangsha','Pangsha',31),(263,'Kalukhali','Kalukhali',31),(264,'Rajbari Sadar','Rajbari Sadar',31),(265,'Shariatpur Sadar','Shariatpur Sadar',32),(266,'Damudya','Damudya',32),(267,'Naria','Naria',32),(268,'Jajira','Jajira',32),(269,'Bhedarganj','Bhedarganj',32),(270,'Gosairhat','Gosairhat',32),(271,'Shakhipur','Shakhipur',32),(272,'Jhenaigati','Jhenaigati',33),(273,'Nakla','Nakla',33),(274,'Nalitabari','Nalitabari',33),(275,'Sherpur Sadar','Sherpur Sadar',33),(276,'Sreebardi','Sreebardi',33),(277,'Tangail Sadar','Tangail Sadar',34),(278,'Sakhipur','Sakhipur',34),(279,'Basail','Basail',34),(280,'Madhupur','Madhupur',34),(281,'Ghatail','Ghatail',34),(282,'Kalihati','Kalihati',34),(283,'Nagarpur','Nagarpur',34),(284,'Mirzapur','Mirzapur',34),(285,'Gopalpur','Gopalpur',34),(286,'Delduar','Delduar',34),(287,'Bhuapur','Bhuapur',34),(288,'Dhanbari','Dhanbari',34),(289,'Bagerhat Sadar','Bagerhat Sadar',35),(290,'Chitalmari','Chitalmari',35),(291,'Fakirhat','Fakirhat',35),(292,'Kachua','Kachua',35),(293,'Mollahat','Mollahat',35),(294,'Mongla','Mongla',35),(295,'Morrelganj','Morrelganj',35),(296,'Rampal','Rampal',35),(297,'Sarankhola','Sarankhola',35),(298,'Alamdanga','Alamdanga',36),(299,'Chuadanga Sadar','Chuadanga Sadar',36),(300,'Jibannagar','Jibannagar',36),(301,'Damurhuda','Damurhuda',36),(302,'Abhaynagar','Abhaynagar',37),(303,'Bagherpara','Bagherpara',37),(304,'Chaugachha','Chaugachha',37),(305,'Jhikargachha','Jhikargachha',37),(306,'Keshabpur','Keshabpur',37),(307,'Jessore Sadar','Jessore Sadar',37),(308,'Manirampur','Manirampur',37),(309,'Sharsha','Sharsha',37),(310,'Jhenaidah Sadar','Jhenaidah Sadar',38),(311,'Maheshpur','Maheshpur',38),(312,'Kaliganj','Kaliganj',38),(313,'Kotchandpur','Kotchandpur',38),(314,'Shailkupa','Shailkupa',38),(315,'Harinakunda','Harinakunda',38),(316,'Terokhada','Terokhada',39),(317,'Batiaghata','Batiaghata',39),(318,'Dacope','Dacope',39),(319,'Dumuria','Dumuria',39),(320,'Dighalia','Dighalia',39),(321,'Koyra','Koyra',39),(322,'Paikgachha','Paikgachha',39),(323,'Phultala','Phultala',39),(324,'Rupsa','Rupsa',39),(325,'Kushtia Sadar','Kushtia Sadar',40),(326,'Kumarkhali','Kumarkhali',40),(327,'Daulatpur','Daulatpur',40),(328,'Mirpur','Mirpur',40),(329,'Bheramara and','Bheramara and',40),(330,'Khoksa','Khoksa',40),(331,'Magura Sadar','Magura Sadar',41),(332,'Mohammadpur','Mohammadpur',41),(333,'Shalikha','Shalikha',41),(334,'Sreepur','Sreepur',41),(335,'Gangni','Gangni',42),(336,'Meherpur Sadar','Meherpur Sadar',42),(337,'Mujibnagar','Mujibnagar',42),(338,'Narail Sadar','Narail Sadar',43),(339,'Kalia','Kalia',43),(340,'Lohagara','Lohagara',43),(341,'Satkhira Sadar','Satkhira Sadar',44),(342,'Assasuni','Assasuni',44),(343,'Debhata','Debhata',44),(344,'Tala','Tala',44),(345,'Kalaroa','Kalaroa',44),(346,'Kaliganj','Kaliganj',44),(347,'Shyamnagar','Shyamnagar',44),(348,'Adamdighi','Adamdighi',45),(349,'Bogra Sadar','Bogra Sadar',45),(350,'Sherpur','Sherpur',45),(351,'Dhunat','Dhunat',45),(352,'Dhupchanchia','Dhupchanchia',45),(353,'Gabtali','Gabtali',45),(354,'Kahaloo','Kahaloo',45),(355,'Nandigram','Nandigram',45),(356,'Shajahanpur','Shajahanpur',45),(357,'Sariakandi','Sariakandi',45),(358,'Shibganj','Shibganj',45),(359,'Sonatala','Sonatala',45),(360,'Joypurhat','Joypurhat',46),(361,'Akkelpur','Akkelpur',46),(362,'Kalai','Kalai',46),(363,'Khetlal','Khetlal',46),(364,'Panchbibi','Panchbibi',46),(365,'Naogaon Sadar','Naogaon Sadar',47),(366,'Mohadevpur','Mohadevpur',47),(367,'Manda','Manda',47),(368,'Niamatpur','Niamatpur',47),(369,'Atrai','Atrai',47),(370,'Raninagar','Raninagar',47),(371,'Patnitala','Patnitala',47),(372,'Dhamoirhat','Dhamoirhat',47),(373,'Sapahar','Sapahar',47),(374,'Porsha','Porsha',47),(375,'Badalgachhi','Badalgachhi',47),(376,'Gurudaspur','Gurudaspur',48),(377,'Natore Sadar','Natore Sadar',48),(378,'Baraigram','Baraigram',48),(379,'Bagatipara','Bagatipara',48),(380,'Lalpur','Lalpur',48),(381,'Singra','Singra',48),(382,'Naldanga','Naldanga',48),(383,'Bholahat','Bholahat',49),(384,'Gomastapur  ','Gomastapur  ',49),(385,'Nachole  ','Nachole  ',49),(386,'Nawabganj Sadar','Nawabganj Sadar',49),(387,'Shibganj','Shibganj',49),(388,'Atgharia','Atgharia',50),(389,'Bera','Bera',50),(390,'Bhangura','Bhangura',50),(391,'Chatmohar','Chatmohar',50),(392,'Faridpur  ','Faridpur  ',50),(393,'Ishwardi','Ishwardi',50),(394,'Pabna Sadar','Pabna Sadar',50),(395,'Santhia','Santhia',50),(396,'Sujanagar','Sujanagar',50),(397,'Bagha','Bagha',51),(398,'Bagmara','Bagmara',51),(399,'Charghat','Charghat',51),(400,'Durgapur','Durgapur',51),(401,'Godagari','Godagari',51),(402,'Mohanpur','Mohanpur',51),(403,'Paba','Paba',51),(404,'Puthia','Puthia',51),(405,'Tanore','Tanore',51),(406,'Sirajganj Sadar','Sirajganj Sadar',52),(407,'Ullahpara','Ullahpara',52),(408,'Shahjadpur','Shahjadpur',52),(409,'Rayganj','Rayganj',52),(410,'Kamarkhanda','Kamarkhanda',52),(411,'Tarash','Tarash',52),(412,'Belkuchi','Belkuchi',52),(413,'Chauhali','Chauhali',52),(414,'Kazipur','Kazipur',52),(415,'Biral','Biral',53),(416,'Birampur','Birampur',53),(417,'Birganj','Birganj',53),(418,'Bochaganj','Bochaganj',53),(419,'Chirirbandar','Chirirbandar',53),(420,'Dinajpur Sadar','Dinajpur Sadar',53),(421,'Ghoraghat','Ghoraghat',53),(422,'Hakimpur','Hakimpur',53),(423,'Kaharole','Kaharole',53),(424,'Khansama','Khansama',53),(425,'Nawabganj','Nawabganj',53),(426,'Parbatipur','Parbatipur',53),(427,'Phulbari .','Phulbari .',53),(428,'Fulchhari','Fulchhari',54),(429,'Gaibandha Sadar','Gaibandha Sadar',54),(430,'Gobindaganj','Gobindaganj',54),(431,'Palashbari','Palashbari',54),(432,'Sadullapur','Sadullapur',54),(433,'Saghata','Saghata',54),(434,'Sundarganj','Sundarganj',54),(435,'Kurigram Sadar','Kurigram Sadar',55),(436,'Nageshwari','Nageshwari',55),(437,'Bhurungamari','Bhurungamari',55),(438,'Phulbari','Phulbari',55),(439,'Rajarhat','Rajarhat',55),(440,'Ulipur','Ulipur',55),(441,'Chilmari','Chilmari',55),(442,'Raomari','Raomari',55),(443,'Char Rajibpur','Char Rajibpur',55),(444,'Patgram','Patgram',56),(445,'Hatibandha','Hatibandha',56),(446,'Kaligonj','Kaligonj',56),(447,'Aditmari','Aditmari',56),(448,'Lalmonirhat Sadar','Lalmonirhat Sadar',56),(449,'Nilphamari Sadar','Nilphamari Sadar',57),(450,'Saidpur ','Saidpur ',57),(451,'Jaldhaka','Jaldhaka',57),(452,'Kishoreganj','Kishoreganj',57),(453,'Domar','Domar',57),(454,'Dimla ','Dimla ',57),(455,'Panchagarh Sadar','Panchagarh Sadar',58),(456,'Debiganj','Debiganj',58),(457,'Boda','Boda',58),(458,'Atwari','Atwari',58),(459,'Tetulia','Tetulia',58),(460,'Badarganj','Badarganj',59),(461,'Mithapukur','Mithapukur',59),(462,'Gangachara','Gangachara',59),(463,'Kaunia','Kaunia',59),(464,'Rangpur Sadar','Rangpur Sadar',59),(465,'Pirgachha','Pirgachha',59),(466,'Pirganj','Pirganj',59),(467,'Taraganj','Taraganj',59),(468,'Thakurgaon Sadar','Thakurgaon Sadar',60),(469,'Pirganj','Pirganj',60),(470,'Baliadangi','Baliadangi',60),(471,'Haripur','Haripur',60),(472,'Ranisankail','Ranisankail',60),(473,'Ajmiriganj','Ajmiriganj',61),(474,'Baniachang','Baniachang',61),(475,'Bahubal','Bahubal',61),(476,'Chunarughat','Chunarughat',61),(477,'Habiganj Sadar','Habiganj Sadar',61),(478,'Lakhai','Lakhai',61),(479,'Madhabpur','Madhabpur',61),(480,'Nabiganj','Nabiganj',61),(481,'Shaistagonj','Shaistagonj',61),(482,'Moulvibazar Sadar','Moulvibazar Sadar',62),(483,'Barlekha','Barlekha',62),(484,'Juri','Juri',62),(485,'Kamalganj','Kamalganj',62),(486,'Kulaura','Kulaura',62),(487,'Rajnagar','Rajnagar',62),(488,'Sreemangal','Sreemangal',62),(489,'Bishwamvarpur','Bishwamvarpur',63),(490,'Chhatak','Chhatak',63),(491,'Derai','Derai',63),(492,'Dharampasha','Dharampasha',63),(493,'Dowarabazar','Dowarabazar',63),(494,'Jagannathpur','Jagannathpur',63),(495,'Jamalganj','Jamalganj',63),(496,'Sullah','Sullah',63),(497,'Sunamganj Sadar','Sunamganj Sadar',63),(498,'Dokkin Sunamganj','Dokkin Sunamganj',63),(499,'Tahirpur','Tahirpur',63),(500,'Sylhet Sadar','Sylhet Sadar',64),(501,'South Surma','South Surma',64),(502,'Golapganj','Golapganj',64),(503,'Osmani Nagar','Osmani Nagar',64),(504,'Balaganj','Balaganj',64),(505,'Bishwanath','Bishwanath',64),(506,'Beanibazar','Beanibazar',64),(507,'Companiganj','Companiganj',64),(508,'Gowainghat','Gowainghat',64),(509,'Jaintiapur','Jaintiapur',64),(510,'Kanaighat','Kanaighat',64),(511,'Zakiganj','Zakiganj',64),(512,'Fenchuganj','Fenchuganj',64);

/*Table structure for table `msg_sms_cluster` */

DROP TABLE IF EXISTS `msg_sms_cluster`;

CREATE TABLE `msg_sms_cluster` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cellNo` varchar(255) DEFAULT NULL,
  `messageBody` varchar(255) DEFAULT NULL,
  `pushedOn` datetime DEFAULT NULL,
  `queuedOn` datetime DEFAULT NULL,
  `sent` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `msg_sms_cluster` */

/*Table structure for table `msg_sms_group` */

DROP TABLE IF EXISTS `msg_sms_group`;

CREATE TABLE `msg_sms_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cell_list` text,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `msg_sms_group` */

/*Table structure for table `msg_sms_info` */

DROP TABLE IF EXISTS `msg_sms_info`;

CREATE TABLE `msg_sms_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `csmSid` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `msiSdn` varchar(255) DEFAULT NULL,
  `msiSdnStatus` varchar(255) DEFAULT NULL,
  `referenceId` varchar(255) DEFAULT NULL,
  `smsText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `msg_sms_info` */

/*Table structure for table `sec_action` */

DROP TABLE IF EXISTS `sec_action`;

CREATE TABLE `sec_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_action` */

/*Table structure for table `sec_component` */

DROP TABLE IF EXISTS `sec_component`;

CREATE TABLE `sec_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_component` */

/*Table structure for table `sec_token` */

DROP TABLE IF EXISTS `sec_token`;

CREATE TABLE `sec_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_on1oois27s8v9s3mi0godjgng` (`username`),
  KEY `FK_qr42pux9qs81ftn0wvarfxmy1` (`user`),
  CONSTRAINT `FK_qr42pux9qs81ftn0wvarfxmy1` FOREIGN KEY (`user`) REFERENCES `sec_user_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `sec_token` */

insert  into `sec_token`(`id`,`password`,`username`,`user`) values (1,'hs7V9h485ik=','mak',1),(12,'qKtRAdZ39cY=','01717659287',12);

/*Table structure for table `sec_user_group` */

DROP TABLE IF EXISTS `sec_user_group`;

CREATE TABLE `sec_user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_group` */

/*Table structure for table `sec_user_group_action` */

DROP TABLE IF EXISTS `sec_user_group_action`;

CREATE TABLE `sec_user_group_action` (
  `GROUP_ID` bigint(20) NOT NULL,
  `ACTION_ID` bigint(20) NOT NULL,
  KEY `FK_qnlp7n7qix7wnysr15grwua0b` (`ACTION_ID`),
  KEY `FK_lh4iceeddectyjnvjtcuqcbvs` (`GROUP_ID`),
  CONSTRAINT `FK_lh4iceeddectyjnvjtcuqcbvs` FOREIGN KEY (`GROUP_ID`) REFERENCES `sec_user_group` (`id`),
  CONSTRAINT `FK_qnlp7n7qix7wnysr15grwua0b` FOREIGN KEY (`ACTION_ID`) REFERENCES `sec_action` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_group_action` */

/*Table structure for table `sec_user_group_user` */

DROP TABLE IF EXISTS `sec_user_group_user`;

CREATE TABLE `sec_user_group_user` (
  `GROUP_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  KEY `FK_joe1aj35mxylr4tn38sdald2e` (`USER_ID`),
  KEY `FK_jtddqmoeoqygxc8nnob3pxbpu` (`GROUP_ID`),
  CONSTRAINT `FK_joe1aj35mxylr4tn38sdald2e` FOREIGN KEY (`USER_ID`) REFERENCES `sec_user_master` (`id`),
  CONSTRAINT `FK_jtddqmoeoqygxc8nnob3pxbpu` FOREIGN KEY (`GROUP_ID`) REFERENCES `sec_user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_group_user` */

/*Table structure for table `sec_user_master` */

DROP TABLE IF EXISTS `sec_user_master`;

CREATE TABLE `sec_user_master` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `cell` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_master` */

insert  into `sec_user_master`(`type`,`id`,`active`,`name`,`applicant_id`,`cell`) values ('Staff',1,'','Khomeni',NULL,NULL),('Student',12,'','Habib Uddin Khan',17020001,'01717659287');

/*Table structure for table `t24_trim` */

DROP TABLE IF EXISTS `t24_trim`;

CREATE TABLE `t24_trim` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t24_trim` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
