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

insert  into `ad_branch`(`br_code`,`br_name`,`zone`,`dist`,`ad_br_code`,`bb_code`) values ('001','Alanga Br, Tangail','11',NULL,NULL,'00374'),('002','Bandura Br, Nawabgonj','02',NULL,NULL,'00542'),('003','Dakbangla Br, Jhenaihdah','16',NULL,NULL,'00455'),('004','Chaprashirhat Br, Noakhali','14',NULL,NULL,'00168'),('005','Court Bazar SME/Krishi Br.','12',NULL,NULL,'00086'),('006','Chormuguria Br, Madaripur','10',NULL,NULL,'00248'),('007','Mohastangor Br, Bogra','05',NULL,NULL,'00362'),('008','Keshorehat Br, Rajshahi','09',NULL,NULL,'00837'),('009','Shayestaganj SME/Krishi BranchEnum, Habiganj','08',NULL,NULL,'00243'),('010','Ziranibazar Br, Dhaka','03',NULL,NULL,'00543'),('011','Fultola SME Br, Khulna','06',NULL,NULL,'00384'),('012','Muktagacha SME Br, Mymensingh','11',NULL,NULL,'00314'),('013','Shantahar SME/Krishi BranchEnum, Bogra','05',NULL,NULL,'00363'),('014','Daudkandi SME Br, Comilla','07',NULL,NULL,'00068'),('015','Kahaloo   SME Center, Bogra','05',NULL,NULL,'00364'),('016','Kalampur  SME Center, Savar','03',NULL,NULL,'00544'),('017','BoroDarogarhat  SME Center, Sitakundo','13',NULL,NULL,'00524'),('018','Akhaura  SME Center, B.Baria','07',NULL,NULL,'00069'),('019','Borhanuddin SME Center, Bhola','10',NULL,NULL,'00413'),('020','Sonargoan SME Center, Narayangonj','15',NULL,NULL,'00512'),('021','Parshuram SME Center, Feni','14',NULL,NULL,'00021'),('022','Sujanagar SME Center, Pabna','09',NULL,NULL,'00022'),('023','Burichong SME Center, Comilla','07',NULL,NULL,'00023'),('102','Local Office','00',NULL,'0862','00011'),('103','Agrabad Br., Ctg.','00',NULL,'0866','00001'),('104','Sylhet','08',NULL,'0867','00004'),('105','Chawk Mugoltolly Br. (C.M.B), Dhaka.','01',NULL,'0863','00010'),('106','Khatungonj Br., Ctg.','00',NULL,'0869','00002'),('107','Khulna','06',NULL,'0868','00021'),('108','Narayangonj Br., N.Gonj.','15',NULL,'0865','00015'),('109','Foreign Exchange  Br.','00',NULL,'0864','00013'),('110','Islampur Br., Dhaka.','02',NULL,'0872','00012'),('111','Barisal','10',NULL,'0910','00050'),('112','Bogra','05',NULL,'0873','00075'),('113','Rajshahi','09',NULL,'0879','00085'),('114','Moulvi Bazar Br., Moulvi Bazar.','08',NULL,NULL,'00008'),('115','Pabna','09',NULL,'0884','00080'),('116','Cox-s Bazar Br.,Cox-s Bazar.','12',NULL,NULL,'00006'),('117','Rangpur','04',NULL,'0917','00090'),('118','Nawabpur Road Br.','00',NULL,'0871','00014'),('119','Narsingdi Br., Narsingdi.','15',NULL,'0896','00016'),('120','Kishorgonj Br., Kishorgonj.','11',NULL,NULL,'00009'),('121','Comilla','07',NULL,'0912','00005'),('122','Feni, Feni.','14',NULL,NULL,'00007'),('124','Anderkilla Br., Ctg.','12',NULL,'0874','00003'),('125','Jessore Br., Jessore.','16',NULL,'0886','00442'),('126','Chowmuhani Br., Noakhali.','14',NULL,'0895','00162'),('127','Zinzira Br., Dhaka.','02',NULL,NULL,'00215'),('128','Beani Bazar Br., Sylhet.','08',NULL,NULL,'00203'),('129','New Market Br., Dhaka.','01',NULL,'0889','00214'),('130','Savar Br., Dhaka.','03',NULL,'0920','00218'),('131','Mirpur Br., Dhaka.','01',NULL,'0878','00217'),('132','C-N-Gonj Br.,C-N-Gonj.','09',NULL,'0900','00622'),('133','Kustia','16',NULL,'0883','00482'),('134','Chandpur Br., Chandpur.','07',NULL,NULL,'00025'),('135','Noapara Br., Jessore.','16',NULL,'0905','00443'),('136','Farmgate Br., Dhaka.','01',NULL,'0880','00216'),('137','Jublee Road Br., Ctg.','13',NULL,'0875','00035'),('138','Dinajpur','04',NULL,'0897','00562'),('139','Laksam Br.,Comilla.','07',NULL,NULL,'00062'),('140','Mymensing','11',NULL,'0911','00312'),('141','Chiringa Br., Cox-s Bazar.','12',NULL,NULL,'00082'),('142','Biswanath Br., Sylhet.','08',NULL,NULL,'00206'),('143','Satkhira Br., Satkhira.','06',NULL,'0918','00532'),('144','Naogaon Br., Naogaon.','05',NULL,NULL,'00611'),('145','Mouchak Br., Dhaka.','01',NULL,'0890','00219'),('146','Chaktai Br.,Ctg.','12',NULL,NULL,'00045'),('147','Teknaf Br.,Cox-s Bazar.','12',NULL,NULL,'00072'),('148','Faridpur','06',NULL,NULL,'00230'),('149','Sirajgonj Br., Sirajgonj.','05',NULL,NULL,'00682'),('150','Mongla Br., Bagerhat.','06',NULL,NULL,'00382'),('151','Amin Bazar Br., Dhaka.','03',NULL,NULL,'00220'),('152','Saidpur Br., Nilphamari.','04',NULL,'0881','00631'),('153','Joypurhat','05',NULL,NULL,'00571'),('154','Shahjadpur Br., Sirajgonj.','05',NULL,NULL,'00683'),('155','Nazipur Br., Naogaon.','09',NULL,NULL,'00612'),('156','Lohagara Br.,Ctg.','12',NULL,NULL,'00019'),('157','Ramna Br., Dhaka.','00',NULL,'0876','00221'),('158','GazipurChawrasta Br.,Gazipur.','15',NULL,'0915','00212'),('159','Tangail Br.,Tangail.','11',NULL,NULL,'00371'),('160','Jhikorgacha Br.,Jessore.','16',NULL,NULL,'00421'),('161','Jamalpur','11',NULL,NULL,'00251'),('162','Chawk BazarBr., Ctg.','12',NULL,NULL,'00018'),('163','Patiya Br.,Ctg.','12',NULL,NULL,'00020'),('164','Benaple Br.,Jessore.','16',NULL,'0914','00444'),('165','Kashinathpur Br., Pabna.','09',NULL,NULL,'00081'),('166','Amberkhana Br.,Sylhet.','08',NULL,NULL,'00207'),('167','Station Road Br.,Ctg.','13',NULL,'0877','00046'),('168','Bashurhat Br., Noakhali.','14',NULL,NULL,'00163'),('169','Kolaroa Br., Satkhira.','06',NULL,NULL,'00533'),('170','Hathazari Br., Ctg.','13',NULL,NULL,'00047'),('171','Madhabdi Br., Narsingdi.','15',NULL,'0904','00700'),('172','Palash Br., Narsingdi.','15',NULL,NULL,'00017'),('173','Highway Br Sherpur,Bogra','05',NULL,NULL,'00361'),('174','Bhola Br., Bhola.','10',NULL,NULL,'00411'),('175','Jhenaidah Br., Jhenaidah.','16',NULL,NULL,'00453'),('176','Ashugonj,B.Baria.','07',NULL,NULL,'00063'),('177','Gulshan Br., Dhaka.','00',NULL,'0888','00222'),('178','Tarakandi Br., Jamalpur.','11',NULL,NULL,'00252'),('179','Bangshal Br., Dhaka.','01',NULL,'0882','00223'),('180','Bagerhat Br.,Bagerhat.','06',NULL,NULL,'00381'),('181','Manikgonj','03',NULL,NULL,'00301'),('182','Daulatpur Br., Khulna.','06',NULL,NULL,'00022'),('183','Jhalokati Br., Jhalokati.','10',NULL,NULL,'00415'),('184','Natore','09',NULL,NULL,'00640'),('185','Gaibanda Br., Gaibanda.','05',NULL,NULL,'00580'),('186','Kaligonj Br.,Satkhira.','06',NULL,NULL,'00534'),('187','Munshigonj Br., Munshigonj.','02',NULL,NULL,'00307'),('188','Sherpur Br.-Sherpur','11',NULL,NULL,'00321'),('189','Hajigonj Br.,Chandpur.','07',NULL,NULL,'00026'),('190','Laxmipur Br., Laxmipur.','14',NULL,NULL,'00150'),('191','Mohakhali Br., Dhaka.','03',NULL,'0909','00224'),('192','Patuakhali Br., Patuakhali.','10',NULL,NULL,'00401'),('193','CDA-Avenue Br.,Ctg.','13',NULL,NULL,'00036'),('194','Thakurgaon','04',NULL,NULL,'00670'),('195','Kurigram Br., Kurigram.','04',NULL,NULL,'00720'),('196','B.Baria Br., B.Baria.','07',NULL,NULL,'00064'),('197','Sadarghat Br., Dhaka.','02',NULL,'0903','00225'),('198','Hobigonj Br., Hobigonj.','08',NULL,NULL,'00208'),('199','Laldighirpar Br., Sylhet.','08',NULL,NULL,'00204'),('200','Pirojpur Br., Pirojpur.','06',NULL,NULL,'00056'),('201','Rangamati Br., Rangamati.','13',NULL,NULL,'00067'),('202','Pahartali Br.,Ctg.','13',NULL,'0908','00037'),('203','Cantonment Br., Dhaka.','03',NULL,NULL,'00226'),('204','Jatrabari Br., Dhaka.','15',NULL,NULL,'00227'),('205','Dhanmondi Br., Dhaka.','01',NULL,'0907','00228'),('206','Paltan Br., Dhaka.','01',NULL,'0885','00229'),('207','Uttara Br., Dhaka.','01',NULL,'0898','00231'),('208','Gopalgonj Br., Gopalgonj.','06',NULL,NULL,'00242'),('209','Shyamoli Br., Dhaka.','01',NULL,'0899','00232'),('210','Mirpur-1 Br.Dhaka','03',NULL,'0902','00233'),('211','Shibgonj Br., C-N-Gonj.','09',NULL,NULL,'00623'),('212','Nilphamari Br., Nilphamari.','04',NULL,NULL,'00632'),('213','Head Office Complex Br.','00',NULL,'0887','00234'),('214','Sreemongal Br., Moulvibazar','08',NULL,NULL,'00195'),('215','Elephant Road Br., Dhaka','01',NULL,'0891','00235'),('216','Tongi Br., Gazipur','03',NULL,NULL,'00213'),('217','Madaripur Br., Madaripur','10',NULL,NULL,'00246'),('218','Haji Camp Br., Dhaka','03',NULL,NULL,'00236'),('219','Gobindagonj Br., Gaibanda','05',NULL,NULL,'00581'),('220','Goalabazar Br., Sylhet','08',NULL,NULL,'00202'),('221','Sitakundo BranchEnum','13',NULL,NULL,'00038'),('222','Kawran Bazar BranchEnum, Dhaka','01',NULL,'0893','00238'),('223','VIP Road BranchEnum','01',NULL,'0892','00237'),('224','IDB Bhaban BranchEnum','02',NULL,NULL,'00239'),('225','Maijdee Court BranchEnum','14',NULL,NULL,'00164'),('226','Rampura BranchEnum','03',NULL,'0894','00240'),('227','Eidgaon Br.Cox-s bazar','12',NULL,NULL,'00083'),('228','Bhairab BranchEnum, Kishorgong','11',NULL,NULL,'00316'),('229','Ishwardi','09',NULL,NULL,'00079'),('230','Chuadanga Br, Chuadanga','16',NULL,NULL,'00485'),('231','Chhatak BranchEnum, Sunamgonj','08',NULL,NULL,'00201'),('232','Paikgacha BranchEnum, Khulna','06',NULL,NULL,'00023'),('233','Nawabgonj BranchEnum,Dhaka','02',NULL,NULL,'00209'),('234','Barguna BranchEnum, Barguna','10',NULL,NULL,'00412'),('235','Raipur Br,Laxmipur','14',NULL,NULL,'00151'),('236','Kumarkhali Br,Kustia','16',NULL,NULL,'00483'),('237','Chouddagram Br,Comilla','07',NULL,NULL,'00061'),('238','Birampur Br,Dinajpur','04',NULL,NULL,'00563'),('239','Bandertilla Br,Ctg.','13',NULL,NULL,'00034'),('240','Khilgaon Br, Dhaka','15',NULL,NULL,'00241'),('241','Moralgonj Br,Bagerhat','06',NULL,NULL,'00383'),('242','Rajbari Br,Rajbari.','16',NULL,NULL,'00256'),('243','Panchogar Br, Panchogar','04',NULL,NULL,'00560'),('244','Shanthia Br, Pabna','09',NULL,NULL,'00078'),('245','Dupchanchia Br, Bogra','05',NULL,NULL,'00076'),('246','Magura Br, Magura','16',NULL,NULL,'00501'),('247','Companygonj Br, Comilla','07',NULL,NULL,'00727'),('248','Kanaighat Br, Sylhet','08',NULL,NULL,'00721'),('249','Sonagazi Br, Feni','14',NULL,NULL,'00722'),('250','Modhupur Br, Tangail','11',NULL,NULL,'00723'),('251','Shariatpur Br, Shariatpur','10',NULL,NULL,'00724'),('252','Barayarhat Br, Chittagong','13',NULL,NULL,'00725'),('253','Lalmonirhat Br, Lalmonirhat','04',NULL,NULL,'00726'),('254','Ramgonj Br, Laxmipur','14',NULL,NULL,'00152'),('255','Faridgonj Br, Chandpur','07',NULL,NULL,'00027'),('256','Kulaura Br, Moulvibazar','08',NULL,NULL,'00196'),('257','Jaldhaka, Nilphamari','04',NULL,NULL,'00633'),('258','Gouripur, Comilla','07',NULL,NULL,'00065'),('259','Shampur, Dhaka','02',NULL,NULL,'00350'),('260','Netrokona Br, Netrokona','11',NULL,NULL,'00330'),('261','Bank Road Br, Noakhali','14',NULL,NULL,'00391'),('262','Meherpur Br, Meherpur','16',NULL,NULL,'00471'),('263','Norail Br, Norail','16',NULL,NULL,'00461'),('264','Rohanpur Br, Chapai Nawabgonj','09',NULL,NULL,'00624'),('265','Poradoho Br, Kushtia','16',NULL,NULL,'00484'),('266','Shawndip Br, Chittagong','13',NULL,NULL,'00521'),('267','Mohammadpur Krishi Market Br, Dhaka','02',NULL,NULL,'00541'),('268','Fatikchori Br, Chittagong','13',NULL,NULL,'00522'),('269','Tekerhat Br, Madaripur','10',NULL,NULL,'00247'),('270','Bancharampur Br, B. Baria','07',NULL,NULL,'00591'),('271','Torki Bondor, Barishal','10',NULL,NULL,'00350'),('272','Jagannatpur Br, Sunamganj','08',NULL,NULL,'00272'),('273','Chatkhil Br, Noakhali','14',NULL,NULL,'00273'),('274','Pallabi Br, Mirpur','03',NULL,NULL,'00373'),('275','Chowgacha Br, Jessore','16',NULL,NULL,'00275'),('276','Gulshan Circle-1 Br, Dhaka ','01',NULL,'0901','00230'),('277','Nabinagar Br, Brahmanbaria ','07',NULL,NULL,'00277'),('278','Belkuchi Br, Sirajganj ','05',NULL,NULL,'00278'),('279','New Market Br,Rajshahi','09',NULL,NULL,'00279'),('280','Bhulta Br,(Rupgonj)Narayangonj','15',NULL,NULL,'00280'),('281','Miarhat Br,Pirojpur','10',NULL,NULL,'00281'),('282','Damodya Br,Shariatpur','10',NULL,NULL,'00282'),('283','Ganakbari Br,Savar','03',NULL,NULL,'00283'),('284','Barolekha Br, Moulvi Bazar','08',NULL,NULL,'00284'),('285','Chhagalnaiya Br,Feni','14',NULL,NULL,'00285'),('286','Chachkoir Br,Natore','09',NULL,NULL,'00286'),('287','Kaliganj Br,Jhenaidah','16',NULL,NULL,'00287'),('288','Dewanhat Br,Chittagong','13',NULL,NULL,'00288'),('289','Dohar Br,Dhaka','02',NULL,NULL,'00289'),('290','Panthapath Br, Dhaka','02',NULL,NULL,'00290'),('291','Senbagh Br,Noakhali','14',NULL,NULL,'00291'),('292','Kanchpur Br,N-Gonj','15',NULL,NULL,'00292'),('293','Sunamgonj Br, Sylhet','08',NULL,'0913','00293'),('294','Keranihat Br, Chittagong','12',NULL,NULL,'00294'),('295','Dagonbhuyian Br, Feni','14',NULL,NULL,'00295'),('296','Mawna Br, Gazipur','15',NULL,NULL,'00296'),('297','Bandarban Br, Bandarban','12',NULL,NULL,'00297'),('298','Nazumiarhat Br, Chittagong','13',NULL,NULL,'00298'),('300','Kotchandpur Br, Kotchandpur, Jhenaidah.','16',NULL,NULL,'00300'),('301','Khagrachari Br, Khagrachari','13',NULL,NULL,'00301'),('302','Sundargonj Br, Gaibandha','04',NULL,NULL,'00302'),('303','Fulbaria Br, Mymensingh ','11',NULL,NULL,'00303'),('304','O.R. Nizam Road, Chittagong','13',NULL,NULL,'00304'),('305','Matlab, Chandpur','07',NULL,NULL,'00305'),('306','Bhandaria, Pirojpur','10',NULL,NULL,'00306'),('307','Sreenagar, Munshigonj','02',NULL,NULL,'00307'),('308','Mohadevpur, Naogaon','09',NULL,NULL,'00308'),('309','zindabazar, Sylhet','08',NULL,NULL,'00197'),('310','Badda, Dhaka','03',NULL,NULL,'00375'),('311','Motijheel, Dhaka','01',NULL,'0906','00376'),('312','Baragola, Bogra','05',NULL,NULL,'00312'),('313','Raozan, Chittagong ','13',NULL,NULL,'00313'),('314','Chandina, Comilla ','07',NULL,NULL,'00314'),('316','KDA Avenue Br.','06',NULL,NULL,'00316'),('317','Ullapara, Sirajgonj','05',NULL,NULL,'00317'),('318','Hatkhola, Barisal','10',NULL,NULL,'00318'),('319','Baneswar, Rajshahi','09',NULL,NULL,'00319'),('320','Bhanga, Faridpur','06',NULL,NULL,'00320'),('321','Dakshin Surma, Sylhet','08',NULL,NULL,'00321'),('322','Patgram, Lalmonirhat','04',NULL,NULL,'00322'),('323','Jibon Nagar, Chuadanga','16',NULL,NULL,'00323'),('324','Board Bazar, Gazipur','03',NULL,NULL,'00324'),('325','Nandigram, Bogra','05',NULL,NULL,'00325'),('326','Mirerswarai, Chittagong','13',NULL,NULL,'00326'),('327','Nabiganj SME/Krishi BranchEnum, Hobiganj','08',NULL,NULL,'00327'),('328','Lalbag BranchEnum, Dhaka','02',NULL,NULL,'00328'),('329','Banshkhali BranchEnum, Chittagong','12',NULL,NULL,'00329'),('330','Moheshkhali SME/Krishi BranchEnum, Chittagong','12',NULL,NULL,'00330'),('331','Bakshiganj BranchEnum, Jamalpur','11',NULL,NULL,'00251'),('332','Mogbazar BranchEnum, Dhaka','03',NULL,'0919','00378'),('333','Dhap BranchEnum, Rangpur','04',NULL,NULL,'00090'),('334','Halishahar, Chittagong','13',NULL,NULL,'00090'),('335','Chandraganj, Laxmipur','14',NULL,NULL,'00090'),('336','Shyamnagar, Shatkhira','06',NULL,NULL,'00336'),('337','Gandaria Br., Dhaka','02',NULL,NULL,'00380'),('338','Konabari Br.,Gazipur.','15',NULL,NULL,'00338'),('339','College Road Br., Feni','14',NULL,NULL,'00339'),('340','Nitaiganj Br., N.Gonj.','15',NULL,NULL,'00340'),('341','Terry Patty Br, Comilla','07',NULL,NULL,'00341'),('342','Baridhara Br.,Dhaka','03',NULL,'0916','00342'),('343','Katiadi,Kishoreganj','11',NULL,NULL,'00317'),('344','Kosba, B. Baria','07',NULL,NULL,'00592'),('345','Trisal, Mymensingh','11',NULL,NULL,'00315'),('346','Bangodda,Comilla','07',NULL,NULL,'00097'),('347','Shetabgonj,Dinajpur','04',NULL,NULL,'00564'),('348','Bahaddarhat, Chittagong','12',NULL,NULL,'00520'),('349','Shapahar, Naogaon','09',NULL,NULL,'00614'),('350','Ramu, Coxs Bazar','12',NULL,NULL,'00087'),('351','Wiseghat, Dhaka','02',NULL,NULL,'00107'),('352','Araihazar','15',NULL,NULL,'00171'),('353','Charfashion, Bhola','10',NULL,NULL,'00410'),('354','Subarnachar, Noakhali','14',NULL,NULL,'00169'),('355','Bhurungamari, Kurigram','04',NULL,NULL,'00721'),('356','Gazipur Sadar, Gazipur','15',NULL,NULL,'00262'),('357','Naria, Shariatpur','10',NULL,NULL,'00801'),('359','Sachar Bazar, Kachua, Chandpur','07',NULL,NULL,'00042'),('360','Sonaimuri,Noakhali','14',NULL,NULL,'00043'),('361','Kadamtoli,Chittagong','13',NULL,NULL,'00044'),('362','Roumari BranchEnum, Kurigram','11',NULL,NULL,'00601'),('363','Fatulla BranchEnum,Narayangonj','15',NULL,NULL,'00109'),('364','Kamrangir Char, Dhaka','02',NULL,NULL,'00111'),('365','GolapgonjBr.Sylhet','08',NULL,NULL,'00502'),('366','Pekua, Coxs Bazar','12',NULL,NULL,'00052'),('367','Anwara,Chittagonj','12',NULL,NULL,'00053'),('368','LALMOHAN, BHOLA','10',NULL,NULL,'00402'),('369','Panchbibi Br., Joypurhat','05',NULL,NULL,'38067'),('370','Hazirhat Br., Laxmipur.','14',NULL,NULL,'51009'),('371','Boalkhali Br., Ctg','12',NULL,NULL,'15130'),('372','Oxyzen Moor Br., Ctg','13',NULL,NULL,'15587'),('373','Mirzapur','11',NULL,NULL,'0112'),('374','Sarankhola','06',NULL,NULL,'0245'),('375','Dholaikhal','02',NULL,NULL,'0113'),('376','Kapasia','15',NULL,NULL,'0114'),('377','Monohardi','15',NULL,NULL,'00377'),('378','Kalkini','10',NULL,NULL,'00378'),('379','Ati Bazar','02',NULL,NULL,'00379'),('380','Kalurghat Br.','12',NULL,NULL,'00380'),('381','Bhawanigonj Br.','09',NULL,NULL,'00381'),('382','Chandanaish Br.','12',NULL,NULL,'00382'),('383','Sonargaon Janapath Road Br.','03',NULL,NULL,'00383'),('384','Pirganj BranchEnum,Rangpur','04',NULL,NULL,'00384'),('385','Singair BranchEnum','03',NULL,NULL,'00385'),('386','Kalapara Br., Patuakhali.','10',NULL,NULL,'00386'),('387','Debiganj Br.','04',NULL,NULL,'00387'),('388','Keshabpur BranchEnum, Jessore','16',NULL,NULL,'54112'),('389','Manda Br., Naogaon.','09',NULL,NULL,'56410'),('390','Pangsha Br,Rajbari.','16',NULL,NULL,'00256'),('391','Banani Br., Dhaka.','03',NULL,NULL,'52604'),('392','Bakerganj Br.Barishal','10',NULL,NULL,'06022'),('393','Rajapur Br.Jhalokati','10',NULL,NULL,'42055'),('394','Lohagara Br, Narail','16',NULL,NULL,'65046'),('395','Raipura Br.Narsingdi','15',NULL,NULL,'00395'),('396','Donia Br.,Dhaka.','15',NULL,NULL,'00396'),('397','Shibaloy Br.Manikgonj','03',NULL,NULL,'00397'),('398','Bhaluka Br. Mymensingh','11',NULL,NULL,'00398'),('399','Nimotla Br.,Munshigonj.','02',NULL,NULL,'59166'),('400','Tungipara Br.,Gopalgonj','06',NULL,NULL,'06022'),('401','Fakirhat Br.,Bagerhat.','06',NULL,NULL,'01046'),('402','Alamdanga Br,Chuadanga','16',NULL,NULL,'18004'),('403','Chatmohar BranchEnum, Pabna','09',NULL,NULL,'76064'),('404','Hemayetpur Br., Savar','03',NULL,NULL,'26050'),('405','Satkania Br., CTG','12',NULL,NULL,'15706'),('406','Agrabad Com. Area Br','00',NULL,NULL,'15060'),('407','Sonatola Br., Bogra','05',NULL,NULL,'10298'),('408','Mathbaria Br., Pirojpur.','06',NULL,NULL,'79052'),('409','Comilla Cantonment BranchEnum','07',NULL,NULL,'00005'),('410','Nikunja BranchEnum, Dhaka','03',NULL,NULL,'26018');

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

/*Table structure for table `com_district` */

DROP TABLE IF EXISTS `com_district`;

CREATE TABLE `com_district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` double DEFAULT NULL,
  `BB_ID` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `DIVISION_ID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `PPK` int(11) DEFAULT NULL,
  `bbID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `com_district` */

insert  into `com_district`(`id`,`area`,`BB_ID`,`description`,`DIVISION_ID`,`name`,`population`,`PPK`,`bbID`) values (1,1831,NULL,'---','1','Barguna',882000,481,NULL),(2,2785,NULL,'---','1','Barisal',2291000,823,NULL),(3,3403,NULL,'---','1','Bhola',1758000,517,NULL),(4,749,NULL,'---','1','Jhalokati',596000,795,NULL),(5,3221,NULL,'---','1','Patuakhali',1517000,471,NULL),(6,1308,NULL,'---','1','Pirojpur',1103000,844,NULL),(7,4479,NULL,'---','2','Bandarban',383000,86,NULL),(8,1927,NULL,'---','2','Brahmanbaria',2808000,1457,NULL),(9,1704,NULL,'---','2','Chandpur',2393000,1404,NULL),(10,5283,NULL,'---','2','Chittagong',7509000,1421,NULL),(11,3085,NULL,'---','2','Comilla',5304000,1719,NULL),(12,2492,NULL,'---','2','Cox\'s Bazar',2275000,913,NULL),(13,928,NULL,'---','2','Feni',1420000,1530,NULL),(14,2700,NULL,'---','2','Khagrachhari',608000,225,NULL),(15,1456,NULL,'---','2','Lakshmipur',1711000,1175,NULL),(16,3601,NULL,'---','2','Noakhali',3072000,853,NULL),(17,6116,NULL,'---','2','Rangamati',596000,97,NULL),(18,1464,NULL,'---','3','Dhaka',11875000,8111,NULL),(19,2073,NULL,'---','3','Faridpur',1867000,901,NULL),(20,1800,NULL,'---','3','Gazipur',3333000,1852,NULL),(21,1490,NULL,'---','3','Gopalganj',1149000,771,NULL),(22,2032,NULL,'---','3','Jamalpur',2265000,1115,NULL),(23,2689,NULL,'---','3','Kishoreganj',2853000,1061,NULL),(24,1145,NULL,'---','3','Madaripur',1149000,1004,NULL),(25,1379,NULL,'---','3','Manikganj',1379000,1000,NULL),(26,955,NULL,'---','3','Munshiganj',1420000,1487,NULL),(27,4363,NULL,'---','3','Mymensingh',5042000,1156,NULL),(28,759,NULL,'---','3','Narayanganj',2897000,4139,NULL),(29,1141,NULL,'---','3','Narsingdi',2202000,1930,NULL),(30,2810,NULL,'---','3','Netrakona',2207000,786,NULL),(31,1119,NULL,'---','3','Rajbari',1040000,929,NULL),(32,1182,NULL,'---','3','Shariatpur',1146000,970,NULL),(33,1364,NULL,'---','3','Sherpur',1334000,978,NULL),(34,3414,NULL,'---','3','Tangail',3571000,1046,NULL),(35,3959,NULL,'---','4','Bagerhat',1461000,369,NULL),(36,1177,NULL,'---','4','Chuadanga',1123000,954,NULL),(37,2567,NULL,'---','4','Jessore',2742000,1068,NULL),(38,1961,NULL,'---','4','Jhenaidah',1756000,895,NULL),(39,4394,NULL,'---','4','Khulna',2294000,522,NULL),(40,1601,NULL,'---','4','Kushtia',1933000,1207,NULL),(41,1049,NULL,'---','4','Magura',913000,871,NULL),(42,509,NULL,'---','4','Meherpur',652000,910,NULL),(43,990,NULL,'---','4','Narail',715000,722,NULL),(44,3858,NULL,'---','4','Satkhira',1973000,511,NULL),(45,2920,NULL,'---','5','Bogra',3371000,1154,NULL),(46,965,NULL,'---','5','Joypurhat',909000,942,NULL),(47,3436,NULL,'---','5','Naogaon',2576000,750,NULL),(48,1896,NULL,'---','5','Natore',1696000,894,NULL),(49,1703,NULL,'---','5','Chapainawabganj',1635000,960,NULL),(50,2372,NULL,'---','5','Pabna',2497000,1053,NULL),(51,2407,NULL,'---','5','Rajshahi',2573000,1069,NULL),(52,2498,NULL,'---','5','Sirajganj',3072000,1230,NULL),(53,3438,NULL,'---','6','Dinajpur',2970000,864,NULL),(54,2179,NULL,'---','6','Gaibandha',2349000,1078,NULL),(55,2296,NULL,'---','6','Kurigram',2050000,893,NULL),(56,1241,NULL,'---','6','Lalmonirhat',1249000,1006,NULL),(57,1580,NULL,'---','6','Nilphamari',1820000,1152,NULL),(58,1405,NULL,'---','6','Panchagarh',981000,698,NULL),(59,2368,NULL,'---','6','Rangpur',2866000,1210,NULL),(60,1810,NULL,'---','6','Thakurgaon',1380000,762,NULL),(61,2637,NULL,'---','7','Habiganj',2059000,781,NULL),(62,2799,NULL,'---','7','Moulvibazar',1902000,679,NULL),(63,3670,NULL,'---','7','Sunamganj',2443000,666,NULL),(64,3490,NULL,'---','7','Sylhet',3404000,975,NULL);

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

/*Table structure for table `sec_logged_users` */

DROP TABLE IF EXISTS `sec_logged_users`;

CREATE TABLE `sec_logged_users` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `cell` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_logged_users` */

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
  CONSTRAINT `FK_jtddqmoeoqygxc8nnob3pxbpu` FOREIGN KEY (`GROUP_ID`) REFERENCES `sec_user_group` (`id`),
  CONSTRAINT `FK_joe1aj35mxylr4tn38sdald2e` FOREIGN KEY (`USER_ID`) REFERENCES `sec_user_master` (`id`)
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
