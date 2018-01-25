package com.mbl.caamp.admin.model;

import org.apache.commons.validator.GenericValidator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * <br/> Date: 23/11/2017
 * </p>
 */
public enum BranchEnum {
    _001("001", "00374", "11", "Alanga Br, Tangail", null),
    _002("002", "00542", "02", "Bandura Br, Nawabgonj", null),
    _003("003", "00455", "16", "Dakbangla Br, Jhenaihdah", null),
    _004("004", "00168", "14", "Chaprashirhat Br, Noakhali", null),
    _005("005", "00086", "12", "Court Bazar SME/Krishi Br.", null),
    _006("006", "00248", "10", "Chormuguria Br, Madaripur", null),
    _007("007", "00362", "05", "Mohastangor Br, Bogra", null),
    _008("008", "00837", "09", "Keshorehat Br, Rajshahi", null),
    _009("009", "00243", "08", "Shayestaganj SME/Krishi Branch, Habiganj", null),
    _010("010", "00543", "03", "Ziranibazar Br, Dhaka", null),
    _011("011", "00384", "06", "Fultola SME Br, Khulna", null),
    _012("012", "00314", "11", "Muktagacha SME Br, Mymensingh", null),
    _013("013", "00363", "05", "Shantahar SME/Krishi Branch, Bogra", null),
    _014("014", "00068", "07", "Daudkandi SME Br, Comilla", null),
    _015("015", "00364", "05", "Kahaloo   SME Center, Bogra", null),
    _016("016", "00544", "03", "Kalampur  SME Center, Savar", null),
    _017("017", "00524", "13", "BoroDarogarhat  SME Center, Sitakundo", null),
    _018("018", "00069", "07", "Akhaura  SME Center, B.Baria", null),
    _019("019", "00413", "10", "Borhanuddin SME Center, Bhola", null),
    _020("020", "00512", "15", "Sonargoan SME Center, Narayangonj", null),
    _021("021", "00021", "14", "Parshuram SME Center, Feni", null),
    _022("022", "00022", "09", "Sujanagar SME Center, Pabna", null),
    _023("023", "00023", "07", "Burichong SME Center, Comilla", null),
    _102("102", "00011", "00", "Local Office", "0862"),
    _103("103", "00001", "00", "Agrabad Br., Ctg.", "0866"),
    _104("104", "00004", "08", "Sylhet", "0867"),
    _105("105", "00010", "01", "Chawk Mugoltolly Br. (C.M.B), Dhaka.", "0863"),
    _106("106", "00002", "00", "Khatungonj Br., Ctg.", "0869"),
    _107("107", "00021", "06", "Khulna", "0868"),
    _108("108", "00015", "15", "Narayangonj Br., N.Gonj.", "0865"),
    _109("109", "00013", "00", "Foreign Exchange  Br.", "0864"),
    _110("110", "00012", "02", "Islampur Br., Dhaka.", "0872"),
    _111("111", "00050", "10", "Barisal", "0910"),
    _112("112", "00075", "05", "Bogra", "0873"),
    _113("113", "00085", "09", "Rajshahi", "0879"),
    _114("114", "00008", "08", "Moulvi Bazar Br., Moulvi Bazar.", null),
    _115("115", "00080", "09", "Pabna", "0884"),
    _116("116", "00006", "12", "Cox-s Bazar Br.,Cox-s Bazar.", null),
    _117("117", "00090", "04", "Rangpur", "0917"),
    _118("118", "00014", "00", "Nawabpur Road Br.", "0871"),
    _119("119", "00016", "15", "Narsingdi Br., Narsingdi.", "0896"),
    _120("120", "00009", "11", "Kishorgonj Br., Kishorgonj.", null),
    _121("121", "00005", "07", "Comilla", "0912"),
    _122("122", "00007", "14", "Feni, Feni.", null),
    _124("124", "00003", "12", "Anderkilla Br., Ctg.", "0874"),
    _125("125", "00442", "16", "Jessore Br., Jessore.", "0886"),
    _126("126", "00162", "14", "Chowmuhani Br., Noakhali.", "0895"),
    _127("127", "00215", "02", "Zinzira Br., Dhaka.", null),
    _128("128", "00203", "08", "Beani Bazar Br., Sylhet.", null),
    _129("129", "00214", "01", "New Market Br., Dhaka.", "0889"),
    _130("130", "00218", "03", "Savar Br., Dhaka.", "0920"),
    _131("131", "00217", "01", "Mirpur Br., Dhaka.", "0878"),
    _132("132", "00622", "09", "C-N-Gonj Br.,C-N-Gonj.", "0900"),
    _133("133", "00482", "16", "Kustia", "0883"),
    _134("134", "00025", "07", "Chandpur Br., Chandpur.", null),
    _135("135", "00443", "16", "Noapara Br., Jessore.", "0905"),
    _136("136", "00216", "01", "Farmgate Br., Dhaka.", "0880"),
    _137("137", "00035", "13", "Jublee Road Br., Ctg.", "0875"),
    _138("138", "00562", "04", "Dinajpur", "0897"),
    _139("139", "00062", "07", "Laksam Br.,Comilla.", null),
    _140("140", "00312", "11", "Mymensing", "0911"),
    _141("141", "00082", "12", "Chiringa Br., Cox-s Bazar.", null),
    _142("142", "00206", "08", "Biswanath Br., Sylhet.", null),
    _143("143", "00532", "06", "Satkhira Br., Satkhira.", "0918"),
    _144("144", "00611", "05", "Naogaon Br., Naogaon.", null),
    _145("145", "00219", "01", "Mouchak Br., Dhaka.", "0890"),
    _146("146", "00045", "12", "Chaktai Br.,Ctg.", null),
    _147("147", "00072", "12", "Teknaf Br.,Cox-s Bazar.", null),
    _148("148", "00230", "06", "Faridpur", null),
    _149("149", "00682", "05", "Sirajgonj Br., Sirajgonj.", null),
    _150("150", "00382", "06", "Mongla Br., Bagerhat.", null),
    _151("151", "00220", "03", "Amin Bazar Br., Dhaka.", null),
    _152("152", "00631", "04", "Saidpur Br., Nilphamari.", "0881"),
    _153("153", "00571", "05", "Joypurhat", null),
    _154("154", "00683", "05", "Shahjadpur Br., Sirajgonj.", null),
    _155("155", "00612", "09", "Nazipur Br., Naogaon.", null),
    _156("156", "00019", "12", "Lohagara Br.,Ctg.", null),
    _157("157", "00221", "00", "Ramna Br., Dhaka.", "0876"),
    _158("158", "00212", "15", "GazipurChawrasta Br.,Gazipur.", "0915"),
    _159("159", "00371", "11", "Tangail Br.,Tangail.", null),
    _160("160", "00421", "16", "Jhikorgacha Br.,Jessore.", null),
    _161("161", "00251", "11", "Jamalpur", null),
    _162("162", "00018", "12", "Chawk BazarBr., Ctg.", null),
    _163("163", "00020", "12", "Patiya Br.,Ctg.", null),
    _164("164", "00444", "16", "Benaple Br.,Jessore.", "0914"),
    _165("165", "00081", "09", "Kashinathpur Br., Pabna.", null),
    _166("166", "00207", "08", "Amberkhana Br.,Sylhet.", null),
    _167("167", "00046", "13", "Station Road Br.,Ctg.", "0877"),
    _168("168", "00163", "14", "Bashurhat Br., Noakhali.", null),
    _169("169", "00533", "06", "Kolaroa Br., Satkhira.", null),
    _170("170", "00047", "13", "Hathazari Br., Ctg.", null),
    _171("171", "00700", "15", "Madhabdi Br., Narsingdi.", "0904"),
    _172("172", "00017", "15", "Palash Br., Narsingdi.", null),
    _173("173", "00361", "05", "Highway Br Sherpur,Bogra", null),
    _174("174", "00411", "10", "Bhola Br., Bhola.", null),
    _175("175", "00453", "16", "Jhenaidah Br., Jhenaidah.", null),
    _176("176", "00063", "07", "Ashugonj,B.Baria.", null),
    _177("177", "00222", "00", "Gulshan Br., Dhaka.", "0888"),
    _178("178", "00252", "11", "Tarakandi Br., Jamalpur.", null),
    _179("179", "00223", "01", "Bangshal Br., Dhaka.", "0882"),
    _180("180", "00381", "06", "Bagerhat Br.,Bagerhat.", null),
    _181("181", "00301", "03", "Manikgonj", null),
    _182("182", "00022", "06", "Daulatpur Br., Khulna.", null),
    _183("183", "00415", "10", "Jhalokati Br., Jhalokati.", null),
    _184("184", "00640", "09", "Natore", null),
    _185("185", "00580", "05", "Gaibanda Br., Gaibanda.", null),
    _186("186", "00534", "06", "Kaligonj Br.,Satkhira.", null),
    _187("187", "00307", "02", "Munshigonj Br., Munshigonj.", null),
    _188("188", "00321", "11", "Sherpur Br.-Sherpur", null),
    _189("189", "00026", "07", "Hajigonj Br.,Chandpur.", null),
    _190("190", "00150", "14", "Laxmipur Br., Laxmipur.", null),
    _191("191", "00224", "03", "Mohakhali Br., Dhaka.", "0909"),
    _192("192", "00401", "10", "Patuakhali Br., Patuakhali.", null),
    _193("193", "00036", "13", "CDA-Avenue Br.,Ctg.", null),
    _194("194", "00670", "04", "Thakurgaon", null),
    _195("195", "00720", "04", "Kurigram Br., Kurigram.", null),
    _196("196", "00064", "07", "B.Baria Br., B.Baria.", null),
    _197("197", "00225", "02", "Sadarghat Br., Dhaka.", "0903"),
    _198("198", "00208", "08", "Hobigonj Br., Hobigonj.", null),
    _199("199", "00204", "08", "Laldighirpar Br., Sylhet.", null),
    _200("200", "00056", "06", "Pirojpur Br., Pirojpur.", null),
    _201("201", "00067", "13", "Rangamati Br., Rangamati.", null),
    _202("202", "00037", "13", "Pahartali Br.,Ctg.", "0908"),
    _203("203", "00226", "03", "Cantonment Br., Dhaka.", null),
    _204("204", "00227", "15", "Jatrabari Br., Dhaka.", null),
    _205("205", "00228", "01", "Dhanmondi Br., Dhaka.", "0907"),
    _206("206", "00229", "01", "Paltan Br., Dhaka.", "0885"),
    _207("207", "00231", "01", "Uttara Br., Dhaka.", "0898"),
    _208("208", "00242", "06", "Gopalgonj Br., Gopalgonj.", null),
    _209("209", "00232", "01", "Shyamoli Br., Dhaka.", "0899"),
    _210("210", "00233", "03", "Mirpur-1 Br.Dhaka", "0902"),
    _211("211", "00623", "09", "Shibgonj Br., C-N-Gonj.", null),
    _212("212", "00632", "04", "Nilphamari Br., Nilphamari.", null),
    _213("213", "00234", "00", "Head Office Complex Br.", "0887"),
    _214("214", "00195", "08", "Sreemongal Br., Moulvibazar", null),
    _215("215", "00235", "01", "Elephant Road Br., Dhaka", "0891"),
    _216("216", "00213", "03", "Tongi Br., Gazipur", null),
    _217("217", "00246", "10", "Madaripur Br., Madaripur", null),
    _218("218", "00236", "03", "Haji Camp Br., Dhaka", null),
    _219("219", "00581", "05", "Gobindagonj Br., Gaibanda", null),
    _220("220", "00202", "08", "Goalabazar Br., Sylhet", null),
    _221("221", "00038", "13", "Sitakundo Branch", null),
    _222("222", "00238", "01", "Kawran Bazar Branch, Dhaka", "0893"),
    _223("223", "00237", "01", "VIP Road Branch", "0892"),
    _224("224", "00239", "02", "IDB Bhaban Branch", null),
    _225("225", "00164", "14", "Maijdee Court Branch", null),
    _226("226", "00240", "03", "Rampura Branch", "0894"),
    _227("227", "00083", "12", "Eidgaon Br.Cox-s bazar", null),
    _228("228", "00316", "11", "Bhairab Branch, Kishorgong", null),
    _229("229", "00079", "09", "Ishwardi", null),
    _230("230", "00485", "16", "Chuadanga Br, Chuadanga", null),
    _231("231", "00201", "08", "Chhatak Branch, Sunamgonj", null),
    _232("232", "00023", "06", "Paikgacha Branch, Khulna", null),
    _233("233", "00209", "02", "Nawabgonj Branch,Dhaka", null),
    _234("234", "00412", "10", "Barguna Branch, Barguna", null),
    _235("235", "00151", "14", "Raipur Br,Laxmipur", null),
    _236("236", "00483", "16", "Kumarkhali Br,Kustia", null),
    _237("237", "00061", "07", "Chouddagram Br,Comilla", null),
    _238("238", "00563", "04", "Birampur Br,Dinajpur", null),
    _239("239", "00034", "13", "Bandertilla Br,Ctg.", null),
    _240("240", "00241", "15", "Khilgaon Br, Dhaka", null),
    _241("241", "00383", "06", "Moralgonj Br,Bagerhat", null),
    _242("242", "00256", "16", "Rajbari Br,Rajbari.", null),
    _243("243", "00560", "04", "Panchogar Br, Panchogar", null),
    _244("244", "00078", "09", "Shanthia Br, Pabna", null),
    _245("245", "00076", "05", "Dupchanchia Br, Bogra", null),
    _246("246", "00501", "16", "Magura Br, Magura", null),
    _247("247", "00727", "07", "Companygonj Br, Comilla", null),
    _248("248", "00721", "08", "Kanaighat Br, Sylhet", null),
    _249("249", "00722", "14", "Sonagazi Br, Feni", null),
    _250("250", "00723", "11", "Modhupur Br, Tangail", null),
    _251("251", "00724", "10", "Shariatpur Br, Shariatpur", null),
    _252("252", "00725", "13", "Barayarhat Br, Chittagong", null),
    _253("253", "00726", "04", "Lalmonirhat Br, Lalmonirhat", null),
    _254("254", "00152", "14", "Ramgonj Br, Laxmipur", null),
    _255("255", "00027", "07", "Faridgonj Br, Chandpur", null),
    _256("256", "00196", "08", "Kulaura Br, Moulvibazar", null),
    _257("257", "00633", "04", "Jaldhaka, Nilphamari", null),
    _258("258", "00065", "07", "Gouripur, Comilla", null),
    _259("259", "00350", "02", "Shampur, Dhaka", null),
    _260("260", "00330", "11", "Netrokona Br, Netrokona", null),
    _261("261", "00391", "14", "Bank Road Br, Noakhali", null),
    _262("262", "00471", "16", "Meherpur Br, Meherpur", null),
    _263("263", "00461", "16", "Norail Br, Norail", null),
    _264("264", "00624", "09", "Rohanpur Br, Chapai Nawabgonj", null),
    _265("265", "00484", "16", "Poradoho Br, Kushtia", null),
    _266("266", "00521", "13", "Shawndip Br, Chittagong", null),
    _267("267", "00541", "02", "Mohammadpur Krishi Market Br, Dhaka", null),
    _268("268", "00522", "13", "Fatikchori Br, Chittagong", null),
    _269("269", "00247", "10", "Tekerhat Br, Madaripur", null),
    _270("270", "00591", "07", "Bancharampur Br, B. Baria", null),
    _271("271", "00350", "10", "Torki Bondor, Barishal", null),
    _272("272", "00272", "08", "Jagannatpur Br, Sunamganj", null),
    _273("273", "00273", "14", "Chatkhil Br, Noakhali", null),
    _274("274", "00373", "03", "Pallabi Br, Mirpur", null),
    _275("275", "00275", "16", "Chowgacha Br, Jessore", null),
    _276("276", "00230", "01", "Gulshan Circle-1 Br, Dhaka ", "0901"),
    _277("277", "00277", "07", "Nabinagar Br, Brahmanbaria ", null),
    _278("278", "00278", "05", "Belkuchi Br, Sirajganj ", null),
    _279("279", "00279", "09", "New Market Br,Rajshahi", null),
    _280("280", "00280", "15", "Bhulta Br,(Rupgonj)Narayangonj", null),
    _281("281", "00281", "10", "Miarhat Br,Pirojpur", null),
    _282("282", "00282", "10", "Damodya Br,Shariatpur", null),
    _283("283", "00283", "03", "Ganakbari Br,Savar", null),
    _284("284", "00284", "08", "Barolekha Br, Moulvi Bazar", null),
    _285("285", "00285", "14", "Chhagalnaiya Br,Feni", null),
    _286("286", "00286", "09", "Chachkoir Br,Natore", null),
    _287("287", "00287", "16", "Kaliganj Br,Jhenaidah", null),
    _288("288", "00288", "13", "Dewanhat Br,Chittagong", null),
    _289("289", "00289", "02", "Dohar Br,Dhaka", null),
    _290("290", "00290", "02", "Panthapath Br, Dhaka", null),
    _291("291", "00291", "14", "Senbagh Br,Noakhali", null),
    _292("292", "00292", "15", "Kanchpur Br,N-Gonj", null),
    _293("293", "00293", "08", "Sunamgonj Br, Sylhet", "0913"),
    _294("294", "00294", "12", "Keranihat Br, Chittagong", null),
    _295("295", "00295", "14", "Dagonbhuyian Br, Feni", null),
    _296("296", "00296", "15", "Mawna Br, Gazipur", null),
    _297("297", "00297", "12", "Bandarban Br, Bandarban", null),
    _298("298", "00298", "13", "Nazumiarhat Br, Chittagong", null),
    _300("300", "00300", "16", "Kotchandpur Br, Kotchandpur, Jhenaidah.", null),
    _301("301", "00301", "13", "Khagrachari Br, Khagrachari", null),
    _302("302", "00302", "04", "Sundargonj Br, Gaibandha", null),
    _303("303", "00303", "11", "Fulbaria Br, Mymensingh ", null),
    _304("304", "00304", "13", "O.R. Nizam Road, Chittagong", null),
    _305("305", "00305", "07", "Matlab, Chandpur", null),
    _306("306", "00306", "10", "Bhandaria, Pirojpur", null),
    _307("307", "00307", "02", "Sreenagar, Munshigonj", null),
    _308("308", "00308", "09", "Mohadevpur, Naogaon", null),
    _309("309", "00197", "08", "zindabazar, Sylhet", null),
    _310("310", "00375", "03", "Badda, Dhaka", null),
    _311("311", "00376", "01", "Motijheel, Dhaka", "0906"),
    _312("312", "00312", "05", "Baragola, Bogra", null),
    _313("313", "00313", "13", "Raozan, Chittagong ", null),
    _314("314", "00314", "07", "Chandina, Comilla ", null),
    _316("316", "00316", "06", "KDA Avenue Br.", null),
    _317("317", "00317", "05", "Ullapara, Sirajgonj", null),
    _318("318", "00318", "10", "Hatkhola, Barisal", null),
    _319("319", "00319", "09", "Baneswar, Rajshahi", null),
    _320("320", "00320", "06", "Bhanga, Faridpur", null),
    _321("321", "00321", "08", "Dakshin Surma, Sylhet", null),
    _322("322", "00322", "04", "Patgram, Lalmonirhat", null),
    _323("323", "00323", "16", "Jibon Nagar, Chuadanga", null),
    _324("324", "00324", "03", "Board Bazar, Gazipur", null),
    _325("325", "00325", "05", "Nandigram, Bogra", null),
    _326("326", "00326", "13", "Mirerswarai, Chittagong", null),
    _327("327", "00327", "08", "Nabiganj SME/Krishi Branch, Hobiganj", null),
    _328("328", "00328", "02", "Lalbag Branch, Dhaka", null),
    _329("329", "00329", "12", "Banshkhali Branch, Chittagong", null),
    _330("330", "00330", "12", "Moheshkhali SME/Krishi Branch, Chittagong", null),
    _331("331", "00251", "11", "Bakshiganj Branch, Jamalpur", null),
    _332("332", "00378", "03", "Mogbazar Branch, Dhaka", "0919"),
    _333("333", "00090", "04", "Dhap Branch, Rangpur", null),
    _334("334", "00090", "13", "Halishahar, Chittagong", null),
    _335("335", "00090", "14", "Chandraganj, Laxmipur", null),
    _336("336", "00336", "06", "Shyamnagar, Shatkhira", null),
    _337("337", "00380", "02", "Gandaria Br., Dhaka", null),
    _338("338", "00338", "15", "Konabari Br.,Gazipur.", null),
    _339("339", "00339", "14", "College Road Br., Feni", null),
    _340("340", "00340", "15", "Nitaiganj Br., N.Gonj.", null),
    _341("341", "00341", "07", "Terry Patty Br, Comilla", null),
    _342("342", "00342", "03", "Baridhara Br.,Dhaka", "0916"),
    _343("343", "00317", "11", "Katiadi,Kishoreganj", null),
    _344("344", "00592", "07", "Kosba, B. Baria", null),
    _345("345", "00315", "11", "Trisal, Mymensingh", null),
    _346("346", "00097", "07", "Bangodda,Comilla", null),
    _347("347", "00564", "04", "Shetabgonj,Dinajpur", null),
    _348("348", "00520", "12", "Bahaddarhat, Chittagong", null),
    _349("349", "00614", "09", "Shapahar, Naogaon", null),
    _350("350", "00087", "12", "Ramu, Coxs Bazar", null),
    _351("351", "00107", "02", "Wiseghat, Dhaka", null),
    _352("352", "00171", "15", "Araihazar", null),
    _353("353", "00410", "10", "Charfashion, Bhola", null),
    _354("354", "00169", "14", "Subarnachar, Noakhali", null),
    _355("355", "00721", "04", "Bhurungamari, Kurigram", null),
    _356("356", "00262", "15", "Gazipur Sadar, Gazipur", null),
    _357("357", "00801", "10", "Naria, Shariatpur", null),
    _359("359", "00042", "07", "Sachar Bazar, Kachua, Chandpur", null),
    _360("360", "00043", "14", "Sonaimuri,Noakhali", null),
    _361("361", "00044", "13", "Kadamtoli,Chittagong", null),
    _362("362", "00601", "11", "Roumari Branch, Kurigram", null),
    _363("363", "00109", "15", "Fatulla Branch,Narayangonj", null),
    _364("364", "00111", "02", "Kamrangir Char, Dhaka", null),
    _365("365", "00502", "08", "GolapgonjBr.Sylhet", null),
    _366("366", "00052", "12", "Pekua, Coxs Bazar", null),
    _367("367", "00053", "12", "Anwara,Chittagonj", null),
    _368("368", "00402", "10", "LALMOHAN, BHOLA", null),
    _369("369", "38067", "05", "Panchbibi Br., Joypurhat", null),
    _370("370", "51009", "14", "Hazirhat Br., Laxmipur.", null),
    _371("371", "15130", "12", "Boalkhali Br., Ctg", null),
    _372("372", "15587", "13", "Oxyzen Moor Br., Ctg", null),
    _373("373", "0112", "11", "Mirzapur", null),
    _374("374", "0245", "06", "Sarankhola", null),
    _375("375", "0113", "02", "Dholaikhal", null),
    _376("376", "0114", "15", "Kapasia", null),
    _377("377", "00377", "15", "Monohardi", null),
    _378("378", "00378", "10", "Kalkini", null),
    _379("379", "00379", "02", "Ati Bazar", null),
    _380("380", "00380", "12", "Kalurghat Br.", null),
    _381("381", "00381", "09", "Bhawanigonj Br.", null),
    _382("382", "00382", "12", "Chandanaish Br.", null),
    _383("383", "00383", "03", "Sonargaon Janapath Road Br.", null),
    _384("384", "00384", "04", "Pirganj Branch,Rangpur", null),
    _385("385", "00385", "03", "Singair Branch", null),
    _386("386", "00386", "10", "Kalapara Br., Patuakhali.", null),
    _387("387", "00387", "04", "Debiganj Br.", null),
    _388("388", "54112", "16", "Keshabpur Branch, Jessore", null),
    _389("389", "56410", "09", "Manda Br., Naogaon.", null),
    _390("390", "00256", "16", "Pangsha Br,Rajbari.", null),
    _391("391", "52604", "03", "Banani Br., Dhaka.", null),
    _392("392", "06022", "10", "Bakerganj Br.Barishal", null),
    _393("393", "42055", "10", "Rajapur Br.Jhalokati", null),
    _394("394", "65046", "16", "Lohagara Br, Narail", null),
    _395("395", "00395", "15", "Raipura Br.Narsingdi", null),
    _396("396", "00396", "15", "Donia Br.,Dhaka.", null),
    _397("397", "00397", "03", "Shibaloy Br.Manikgonj", null),
    _398("398", "00398", "11", "Bhaluka Br. Mymensingh", null),
    _399("399", "59166", "02", "Nimotla Br.,Munshigonj.", null),
    _400("400", "06022", "06", "Tungipara Br.,Gopalgonj", null),
    _401("401", "01046", "06", "Fakirhat Br.,Bagerhat.", null),
    _402("402", "18004", "16", "Alamdanga Br,Chuadanga", null),
    _403("403", "76064", "09", "Chatmohar Branch, Pabna", null),
    _404("404", "26050", "03", "Hemayetpur Br., Savar", null),
    _405("405", "15706", "12", "Satkania Br., CTG", null),
    _406("406", "15060", "00", "Agrabad Com. Area Br", null),
    _407("407", "10298", "05", "Sonatola Br., Bogra", null),
    _408("408", "79052", "06", "Mathbaria Br., Pirojpur.", null),
    _409("409", "00005", "07", "Comilla Cantonment Branch", null),
    _410("410", "26018", "03", "Nikunja Branch, Dhaka", null);


    public final String CODE;
    public final String BB_CODE;
    public final String ZONE_CODE;
    public final String NAME;
    public final String AD_BR_CODE;

    BranchEnum(final String CODE, final String BB_CODE, final String ZONE_CODE, final String NAME, final String AD_BR_CODE) {
        this.CODE = CODE;
        this.BB_CODE = BB_CODE;
        this.ZONE_CODE = ZONE_CODE;
        this.NAME = NAME;
        this.AD_BR_CODE = AD_BR_CODE;
    }

    private static final Map<String, BranchEnum> BranchEnum_MAP = new HashMap<>();

    static {
        for (BranchEnum pops : BranchEnum.values()) {
            BranchEnum_MAP.put(pops.CODE, pops);
        }
    }

    public static BranchEnum get(final String IB_CODE) {
        return BranchEnum_MAP.get(IB_CODE);
    }


    public static void main(String[] args) {
        //System.out.println("calculatePeriodicityOfPayment(3000,5) = " + calculatePeriodicityOfPayment(0, 0));
        // customizedPeriodicity(60);
        int str = 4;
        //System.out.println(_001.toString());
        printBranchEnumes();
        List<BranchEnum> getList = getList("01");
        List<BranchEnum> adList = getAdBrList();
        System.out.println(getList.size());
    }

    @SuppressWarnings("unchecked")
    public static List<BranchEnum> getList() {
        return new ArrayList(EnumSet.allOf(BranchEnum.class));
    }

    @SuppressWarnings("unchecked")
    public static List<BranchEnum> getList(String zoneCode) {
        return getList().stream().filter(BranchEnum -> BranchEnum.ZONE_CODE.equals(zoneCode)).collect(Collectors.toList());
    }

    @SuppressWarnings("unchecked")
    public static List<String> getBrcList(String zoneCode) {
        return getList().stream().filter(BranchEnum -> BranchEnum.ZONE_CODE.equals(zoneCode)).map(BranchEnum -> BranchEnum.CODE).collect(Collectors.toList());
    }

    @SuppressWarnings("unchecked")
    public static List<BranchEnum> getAdBrList() {
        return getList().stream().filter(BranchEnum -> !GenericValidator.isBlankOrNull(BranchEnum.AD_BR_CODE)).collect(Collectors.toList());
    }

    /**
     * Transient Method : To check is this BranchEnum is AD or NOT
     *
     * @return boolean Result
     */
    public boolean isAdBranchEnum() {
        return !GenericValidator.isBlankOrNull(this.AD_BR_CODE);
    }

    @Override
    public String toString() {
        return this.CODE + " : " + this.NAME + (isAdBranchEnum() ? " (AD)" : "");
    }

    static Session localSession;
    static Session liveSession; // live cibnew schema

    @SuppressWarnings("unchecked")
    public static void printBranchEnumes() {
        //SessionFactory liveFact = new Configuration().configure("cib.old.schema.xml").buildSessionFactory();
        SessionFactory localFact = new Configuration().configure().buildSessionFactory();

        //liveSession = liveFact.openSession();
        localSession = localFact.openSession();

        try {
            /*localSession.beginTransaction();
            List<BranchEnumPO> BranchEnumPOList = localSession.createCriteria(BranchEnumPO.class)
                    .add(Restrictions.eq("isZonalOffice", "N"))
                    .add(Restrictions.eq("bankCode", "42")).addOrder(Order.asc("ibCode")).list();
            int sl = 1;
            for (BranchEnumPO br : BranchEnumPOList) {
                boolean adBr = br.isAdBranchEnum();
                String adbc = adBr ? ("\"" + br.getAdBrCode() + "\"") : null;
                System.out.println("_"+ br.getIbCode() +"(\""+ br.getIbCode() +"\", \""+ br.getBbCode() +"\", \""+ br.getZoneCode() +"\", \""+( br.getBranchEnumName().replaceAll("'", "-")) +"\", "+adbc+"),");
//                System.out.print(br.getIbCode() + ",");
            }*/


            localSession.getTransaction().rollback();
            localSession.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
