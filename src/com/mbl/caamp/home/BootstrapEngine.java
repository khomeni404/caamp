package com.mbl.caamp.home;

import com.mbl.caamp.admin.service.AdminService;
import com.mbl.caamp.common.service.CommonService;
import com.mbl.caamp.security.dao.SecurityDAO;
import com.mbl.caamp.util.Constants;
import freemarker.core.HTMLOutputFormat;
import freemarker.template.Configuration;
import net.softengine.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.*;


/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 16/5/2017 1:56 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 16/5/2017: 16/5/2017 2:50 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Component
public class BootstrapEngine {

    @Autowired
    private CommonService commonService;

    @Autowired
    private AdminService adminService;
    @Autowired
    private SecurityDAO securityDAO;


    @PostConstruct
    private void initFreemarkerConfiguration() {
        Configuration configuration = (Configuration) new Configuration().clone();
        /*configuration.setAutoEscapingPolicy(Configuration.ENABLE_IF_DEFAULT_AUTO_ESCAPING_POLICY);
        configuration.setIncompatibleImprovements(Configuration.getVersion());
        */
        configuration.setOutputFormat(HTMLOutputFormat.INSTANCE);
        //FreeMarkerConfigurer
        System.out.println(Configuration.getVersion());
    }

    @PostConstruct
    @SuppressWarnings("unchecked")
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    private void initProperties2DB() {
        /*List l = commonService.search(Properties.class);
        if (!CollectionUtils.isEmpty(l)) {
            return;
        }

        Class<BootstrapEngine> c = BootstrapEngine.class;
        Object o = new BootstrapEngine();
        Properties pg;
        for (Field f : c.getDeclaredFields()) {
            int mod = f.getModifiers();
            if (Modifier.isPrivate(mod)) {
                try {
                    String fieldName = f.getName();
                    if (fieldName.startsWith("PG_")) {
                        //&& f.getGenericType().getTypeName().equals(Constants.CONSTANT_MAP_GENERIC) && f.getType().equals(Map.class)
                        Map<Integer, String> data = (Map<Integer, String>) f.get(o);
                        int cc = 1;
                        for (Integer k : data.keySet()) {
                            pg = new Properties();
                            String formatted = String.format("%02d", cc++);
                            pg.setId(Long.valueOf(fieldName.split("[_]")[1] + formatted));
                            pg.setName(data.get(k));
                            pg.setCoreKey(String.format("%02d", k));
                            System.out.println(pg.getId());
                            commonService.save(pg);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }*/


    }

    @PostConstruct
    @SuppressWarnings("unchecked")
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    private void loadProperties() {
        /*try {
            Map<Integer, Map<String, String>> propertyList = new HashMap();
            Map<String, String> map;
            List<String> ftlConstants = new ArrayList<>();
            List<String> javaConstants = new ArrayList<>();
            for (Integer groupCode : Constants.PROPERTY_GROUP_TYPES.keySet()) {
                List<Properties> list = adminService.getPropertyGroupList(groupCode);
                map = list.stream().collect(
                        Collectors.toMap(d -> d.getId().toString(), Properties::getName)
                );
                propertyList.put(groupCode, map);

                String name = Constants.PROPERTY_GROUP_TYPES.get(groupCode).toUpperCase();
                name = name.replaceAll(" ", "_");

                ftlConstants.add("<#assign " + name + " = '" + groupCode + "'/>");
                javaConstants.add("String " + name + " = '" + groupCode + "';");

            }

            Utility.PROPERTY_GROUP_MAP = propertyList;
            System.out.println("All Properties has been initialized");

            System.out.println(" =======Please put these code below to constants.ftl======= ");
            ftlConstants.stream().forEach(System.out::println);

            System.out.println(" =======Ensure, These Property exists in Constants.java======= ");
            javaConstants.stream().forEach(System.out::println);
        } catch (Exception e) {
            System.out.println("Properties can't initialized");
            throw e;
        }*/
    }


    @PostConstruct
    @SuppressWarnings("unchecked")
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    private void loadOccupations() {
        /*try {
            DetachedCriteria dc1 = DetachedCriteria.forClass(Occupation.class).add(Restrictions.isNull("parentOccupation"));
            List<Occupation> parentOccupationList = commonService.search(dc1);

            Utility.MASTER_OCCUPATION_MAP = parentOccupationList.stream().collect(
                    Collectors.toMap(Occupation::getId, Occupation::getName)
            );

            Map<Long, String> occupationMap = new HashMap();
            Map<Long, Map<Long, String>> occupationMapMap = new HashMap();
            Map<Long, String> map;
            for (Occupation occupation : parentOccupationList) {
                List<Occupation> list = commonService.search(Occupation.class, "parentOccupation", occupation);// occupation.getChildrenList();
                map = list.stream().collect(
                        Collectors.toMap(Occupation::getId, Occupation::info)
                );
                occupationMapMap.put(occupation.getId(), map);
                occupationMap.putAll(map);
            }

            Utility.CHILD_OCCUPATION_MAP = occupationMap;
            Utility.CHILD_OCCUPATION_MAP_MAP = occupationMapMap;
            System.out.println("All Occupations has been initialized");

        } catch (Exception e) {
            System.out.println("Occupations can't initialized");
            throw e;
        }*/
    }


    @PostConstruct
    @SuppressWarnings("unchecked")
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    private void loadGroupActions() {
        try {
            SecurityUtil.GROUP_ACTION_LIST_MAP = securityDAO.getGroupActionListMap(Constants.PROJECT_ID);
            /*Map<Long, List<String>>  mmm  = securityDAO.getGroupActionListMap(Constants.PROJECT_ID);
            System.out.println("Group-Actions has been initialized");

            Gson g = new Gson();
            String data = g.toJson(mmm);
            Type type = new TypeToken<Map<Long, List<String>>>(){}.getType();
            Map<Long, List<String>> m = g.fromJson(data, type);
            System.out.println(m.get(1L));*/

           /* String url = "http://localhost:8082/sesaam/auth/userAuthorizationService.se?key=nr/lNAET94A=";
            String response = SecurityUtil.responseFromGET(url);
            System.out.println(response);*/
        } catch (Exception e) {
            System.out.println("Group-Actions can't initialized");
        }
    }

    public static void main(String[] args) {
        for (Integer key : Constants.PROPERTY_GROUP_TYPES.keySet()) {
            String name = Constants.PROPERTY_GROUP_TYPES.get(key).toUpperCase();
            name = name.replaceAll(" ", "_");
            System.out.println("String " + name + " = \"" + key + "\";");
        }
    }

    @PostConstruct
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    private void initStudentPrivilege() {
        /*int counter = 0;
        if (CollectionUtils.isEmpty(commonService.search(Action.class, Arrays.asList("id")))) {
            List<PrivilegeBean> ll = SecurityService.getPrivilegeList();
            for (PrivilegeBean pb : ll) {
                Action action = new Action();
                action.setPrivilegeID(pb.getPrivilegeID());
                action.setActionName(pb.getPrivilegeName());
                action.setMapping("user11");
                commonService.save(action);
                if (counter++ > 5) break;
            }
        }*/

    }


    /**
     * This is to record 5 Action with Granted privilege for test purpose
     *
     * @param userid
     */
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void init5TestPrivilege(String userid) {
        int counter = 0;
        /*if (CollectionUtils.isEmpty(commonService.search(Action.class, "mapping", userid))) {
            for (PrivilegeBean pb : ll) {
                Action action = new Action();
                action.setPrivilegeID(pb.getPrivilegeID());
                action.setActionName(pb.getPrivilegeName());
                action.setMapping(userid);
                commonService.save(action);
                if (counter++ > 5) break;
            }
        }*/

    }


    private SortedMap<Integer, String> PG_11_BENEFICIARY_TYPES = new TreeMap<Integer, String>() {{
        put(1, "General Beneficiary (Person)");
        put(2, "Student");
        put(3, "Organization");
    }};

    private SortedMap<Integer, String> PG_12_BOARD_NAMES = new TreeMap<Integer, String>() {{
        put(1, "Barisal");
        put(2, "Chittagong");
        put(3, "Comilla");
        put(4, "Dhaka");
        put(5, "Dinajpur");
        put(6, "Jessore");
        put(7, "Rajshahi");
        put(8, "Sylhet");
        put(9, "Madrasah");
        put(10, "Technical");
        put(11, "DIBS(Dhaka)");
    }};

    private SortedMap<Integer, String> PG_13_BRANCH_RECOMMENDATIONS = new TreeMap<Integer, String>() {{
        put(1, "Strongly Recommended");
        put(2, "Recommended");
        put(3, "Not Recommended");
    }};

    private SortedMap<Integer, String> PG_14_CHALLENGE_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Blind");
        put(2, "Deaf and dumb");
        put(3, "Missing/defected/disable hands");
        put(4, "Missing/defected/disable legs");
        put(5, "Dumb");
        put(6, "Deaf");
        put(7, "Not Applicable");
    }};

    private SortedMap<Integer, String> PG_15_SEX_TYPES = new TreeMap<Integer, String>() {{
        put(0, "N/A");
        put(1, "Male");
        put(2, "Female");
        put(3, "Other");
    }};

    private SortedMap<Integer, String> PG_16_HOUSE_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Building");
        put(2, "Tin Shed");
        put(3, "Semipaka");
        put(4, "Hut");
        put(5, "Made of Mud");
        put(6, "Sheltered by Others");
    }};

    private SortedMap<Integer, String> PG_17_STUDENT_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Urban (Town)");
        put(2, "Rural (Village)");
    }};

    private SortedMap<Integer, String> PG_18_SECTOR_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Humanitarian and Disaster Relief");
        put(2, "Education");
        put(3, "Health");
        put(4, "Sports");
        put(5, "Arts, Literature and Culture");
        put(6, "Environment");
        put(99, "Others(Mosque, Marriage, Family Maintenance etc.)");
    }};

    private SortedMap<Integer, String> PG_19_SUB_SECTOR_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Donation to the BDR Martyred Family");
        put(2, "Providing winter cloths to poor people");
        put(3, "Relief to the flood affected people");
        put(4, "Tohfa-e-Ramadan");
        put(5, "Distribution of sacrificial meat");
        put(6, "Building cyclone centre in coastal area");
        put(7, "Others");
        put(8, "Scholarship");
        put(9, "Donation to the Institutions");
        put(10, "Providing transportation facility");
        put(11, "Sponsorship");
        put(12, "Others(lump=sum donation and others)");
        put(13, "Providing treatment cost to the individuals");
        put(14, "Donation to the Hospital and Institutions");
        put(15, "Others");
        put(16, "Donation to the Institutions");
        put(17, "Others");
        put(18, "Donation to the Institutions");
        put(19, "Donation to the Individuals");
        put(20, "Sponsorship");
        put(21, "Tree Plantation");
        put(22, "Sponsorship");
        put(23, "Providing Solar system to the poor");
        put(24, "Other activities");
        put(25, "Institutions");
        put(26, "Others(marriage and Others Shariah Approved Activities)");
    }};


    private SortedMap<Integer, String> PG_20_RESIDENT_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Own");
        put(2, "Rent");
        put(3, "Govt Quarter");
        put(4, "Official Quarter");
        put(5, "Sheltered by Others");
    }};

    private SortedMap<Integer, String> PG_21_RELIGION_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Muslim");
        put(2, "Hindu");
        put(3, "Buddhist");
        put(4, "Christian");
        put(5, "Other Tribal cult");
    }};

    private SortedMap<Integer, String> PG_22_MARITAL_STATUSES = new TreeMap<Integer, String>() {{
        put(1, "Single");
        put(2, "Married");
        put(3, "Divorced");
        put(4, "Separated");
        put(5, "Widowed");
    }};

    private SortedMap<Integer, String> PG_23_INSTITUTE_TYPES = new TreeMap<Integer, String>() {{
        put(1, "Collage");
        put(2, "University");
        put(3, "Medical");
        put(4, "Engineering");
        put(5, "Agriculture");
        put(6, "Madrasha");
    }};

    private SortedMap<Integer, String> PG_24_INSTITUTE_LOCATIONS = new TreeMap<Integer, String>() {{
        put(1, "City Corporation");
        put(2, "District Town");
        put(3, "Upzila Town");
        put(4, "Rural Area");
        put(5, "Divisional town");
    }};

    private SortedMap<Integer, String> PG_25_PARENT_EDUCATIONS = new TreeMap<Integer, String>() {{
        put(1, "Below SSC ");
        put(2, "SSC");
        put(3, "HSC");
        put(4, "Graduation");
        put(5, "Post Graduation");
        put(6, "Illiterate");
    }};

    private SortedMap<Integer, String> PG_26_PARENT_STATES = new TreeMap<Integer, String>() {{
        put(1, "Alive");
        put(2, "Late");
        put(3, "Separated");
    }};

    List<String> MONTH_LIST = Arrays.asList("", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

    //Map<String, String> MONTH_NAMES = IntStream.range(0, Constants.MONTH_LIST.size()).boxed().collect(Collectors.toMap(String::valueOf, Constants.MONTH_LIST::get));


    private SortedMap<Integer, String> PG_27_MONTH_NAMES = new TreeMap<Integer, String>() {{
        put(1, "January");
        put(2, "February");
        put(3, "March");
        put(4, "April");
        put(5, "May");
        put(6, "June");
        put(7, "July");
        put(8, "August");
        put(9, "September");
        put(10, "October");
        put(11, "November");
        put(12, "December");
    }};

    private SortedMap<Integer, String> PG_28_ZONE_NAMES = new TreeMap<Integer, String>() {{
        put(0, "Head Office Controlled Branches");
        put(1, "Dhaka Central Zone");
        put(2, "Dhaka South Zone");
        put(3, "Dhaka North Zone");
        put(4, "Rangpur Zone");
        put(5, "Bogra Zone");
        put(6, "Khulna Zone");
        put(7, "Comilla Zone");
        put(8, "Sylhet Zone");
        put(9, "Rajshahi Zone");
        put(10, "Barishal Zone");
        put(11, "Mymensingh Zone");
        put(12, "Chittagong South Zone");
        put(13, "Chittagong North Zone");
        put(14, "Noakhali Zone");
        put(15, "Dhaka East Zone");
        put(16, "Jessore Zone");
    }};

    private SortedMap<Integer, String> PG_29_DIVISION_NAMES = new TreeMap<Integer, String>() {{
        put(1, "Barisal");
        put(2, "Chittagong");
        put(3, "Dhaka");
        put(4, "Khulna");
        put(5, "Rajshahi");
        put(6, "Rangpur");
        put(7, "Sylhet");
    }};

    private SortedMap<Integer, String> PG_30_PROJECT_LEVEL = new TreeMap<Integer, String>() {{
        put(1, "SSC");
        put(2, "HSC");
        put(3, "Graduation");
    }};

    private SortedMap<Integer, String> PG_31_PROJECT_STATUS = new TreeMap<Integer, String>() {{
        put(1, "Sanctioned");
        put(2, "Collecting Application");
        put(3, "Processing");
        put(4, "Disbursing (Live)");
        put(5, "Closed");
    }};


    /**
     * @see Constants#PHOTO_INDICATOR_PREFIX etc
     */
    private SortedMap<Integer, String> PG_32_DOC_INDICATOR = new TreeMap<Integer, String>() {{
        // Photo
        put(1101, "Applicant Photo");
        put(1102, "Father Photo");
        put(1103, "Mother Photo");
        put(1104, "Guardian Photo");

        // Mark-sheet
        put(1201, "JSC Mark-sheet");
        put(1202, "SSC/Equivalent Mark-sheet");
        put(1203, "HSC/Equivalent Mark-sheet");

        // Certificate
        put(1301, "Income Certificate");
        put(1302, "Birth Certificate");
        put(1303, "JSC Certificate");
        put(1304, "SSC/Equivalent Certificate");
        put(1305, "HSC/Equivalent Certificate");

        // Identity
        put(1401, "National ID");
        put(1402, "Passport");
        put(1403, "Driving Licence");


    }};

}
