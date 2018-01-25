package com.mbl.caamp.util;

import com.mbl.caamp.admin.bean.*;
import com.mbl.caamp.admin.model.Staff;
import com.mbl.caamp.common.bean.DocumentBean;
import com.mbl.caamp.common.bean.OccupationBean;
import com.mbl.caamp.common.model.*;
import com.mbl.caamp.security.bean.ActionBean;
import com.mbl.caamp.security.bean.GroupBean;
import com.mbl.caamp.security.bean.PassChangeBean;
import com.mbl.caamp.security.bean.TokenBean;
import net.softengine.util.PropertyUtil;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;


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


public interface Constants {
    PropertyUtil CONFIG = PropertyUtil.getInstance("local-config");
    Long PROJECT_ID = Long.valueOf(CONFIG.getPropertyValue("PROJECT_ID"));
    String SECRET_KEY = Constants.CONFIG.getPropertyValue("SECRET_KEY_PROJECT_101");
    String CAAMP_URL = CONFIG.getPropertyValue("CAAMP_URL");
    String DOC_PATH = CONFIG.getPropertyValue("DOC_PATH");
    String DOC_SRC_LEADER = CONFIG.getPropertyValue("DOC_SRC_LEADER");
    String BACK_UP_DOC_URI = CONFIG.getPropertyValue("BACK_UP_DOC_URI");

    long MIN_AVATAR_SIZE = Long.valueOf(CONFIG.getPropertyValue("MIN_AVATAR_SIZE"));
    long MAX_AVATAR_SIZE = Long.valueOf(CONFIG.getPropertyValue("MAX_AVATAR_SIZE"));

    long MIN_SIGNATURE_SIZE = Long.valueOf(CONFIG.getPropertyValue("MIN_SIGNATURE_SIZE"));
    long MAX_SIGNATURE_SIZE = Long.valueOf(CONFIG.getPropertyValue("MAX_SIGNATURE_SIZE"));

    String ISSL_UID = "fairvision";
    String ISSL_PASSWORD = "fvPl#fvS@9874"; // 566483816
    String ISSL_SID = "fairvision";

    String OTP_PASSPHRASE_PREFIX = "sTUDENT$%cEll&$$#*Number#";
    String CONSTANT_MAP_GENERIC = "java.util.Map<java.lang.Integer, java.lang.String>";
    String NO_APP_FOUND_MESSAGE = "May be you have not apply yet, apply from Home Page first.";

    String ACTION_BEAN = ActionBean.class.getSimpleName();
    String GROUP_BEAN = GroupBean.class.getSimpleName();
    String STAFF = Staff.class.getSimpleName();
    String WORK_STATION_BEAN = WorkStationBean.class.getSimpleName();
    String USER_DETAILS_BEAN = UserDetailsBean.class.getSimpleName();
    String USER_SEARCH_BEAN = UserSearchBean.class.getSimpleName();
    String DOCUMENT_BEAN = DocumentBean.class.getSimpleName();
    String AVATAR = Avatar.class.getSimpleName();
    String SIGNATURE = Signature.class.getSimpleName();
    String TOKEN_BEAN = TokenBean.class.getSimpleName();
    String OTP = com.mbl.caamp.common.bean.OTP.class.getSimpleName();
    String PROJECT_BEAN = ProjectBean.class.getSimpleName();
    String OCCUPATION_BEAN = OccupationBean.class.getSimpleName();
    String PRESENT_ADDRESS = PresentAddress.class.getSimpleName();
    String PERMANENT_ADDRESS = PermanentAddress.class.getSimpleName();
    String PASS_CHANGE_BEAN = PassChangeBean.class.getSimpleName();
    String NEW_USER_REQ_BEAN = NewUserReqBean.class.getSimpleName();

    SimpleDateFormat SDF_MM = new SimpleDateFormat("MM");
    SimpleDateFormat SDF_YY = new SimpleDateFormat("yy");
    SimpleDateFormat SDF_YYYY = new SimpleDateFormat("yyyy");
    SimpleDateFormat SDF_DD_MM_YYYY = new SimpleDateFormat("dd/MM/yyyy");

    String CHANGE_TYPE_UPDATE = "Update";
    String CHANGE_TYPE_RESET = "Reset";

    Integer PROPERTY_GROUP_NAMES = 10;

    Map<String, String> USER_STATUS_MAP = new HashMap<String, String>() {{
        put("0", "Inactive");
        put("1", "Active");
    }};
    /**
     * Please sync/add these property to `/webapp/template/constants.ftl` too.
     */
    Integer BENEFICIARY_TYPES = 11;
    Integer BOARD_NAMES = 12;
    Integer BRANCH_RECOMMENDATIONS = 13;
    Integer CHALLENGE_TYPES = 14;
    Integer SEX_TYPES = 15;
    Integer HOUSE_TYPES = 16;
    Integer STUDENT_TYPES = 17;
    Integer SECTOR_TYPES = 18;
    Integer SUB_SECTOR_TYPES = 19;
    Integer RESIDENT_TYPES = 20;
    Integer RELIGION_TYPES = 21;
    Integer MARITAL_STATUSES = 22;
    Integer INSTITUTE_TYPES = 23;
    Integer INSTITUTE_LOCATIONS = 24;
    Integer PARENT_EDUCATIONS = 25;
    Integer PARENT_STATES = 26;
    Integer MONTH_NAMES = 27;
    Integer ZONE_NAMES = 28;
    Integer DIVISION_NAMES = 29;
    Integer PROJECT_LEVEL = 30;
    Integer PROJECT_STATUS = 31;
    Integer DOC_INDICATOR = 32;



    /**
     * @see com.mbl.caamp.home.BootstrapEngine#PG_32_DOC_INDICATOR
     */
    String PHOTO_INDICATOR_PREFIX = "11";
    String MARKSHEET_INDICATOR_PREFIX = "12";
    Long APPLICANT_PHOTO_INDICATOR_ID = 3201L;

    /**
     * Used in Property ID
     * @see Properties#id
     * This can be used in FTL pages, so plese check before deprecated or destroy
     */
    SortedMap<Integer, String> PROPERTY_GROUP_TYPES = new TreeMap<Integer, String>(){{
        put(BENEFICIARY_TYPES, "Beneficiary Types");
        put(BOARD_NAMES, "Board Names");
        put(BRANCH_RECOMMENDATIONS, "Branch Recommendations");
        put(CHALLENGE_TYPES, "Challenge Types");
        put(SEX_TYPES, "Sex Types");
        put(HOUSE_TYPES, "House Types");
        put(STUDENT_TYPES, "Student Types");
        put(SECTOR_TYPES, "Sector Types");
        put(SUB_SECTOR_TYPES, "Sub Sector Types");
        put(RESIDENT_TYPES, "Resident Types");
        put(RELIGION_TYPES, "Religion Types");
        put(MARITAL_STATUSES, "Marital Statuses");
        put(INSTITUTE_TYPES, "Institute Types");
        put(INSTITUTE_LOCATIONS, "Institute Locations");
        put(PARENT_EDUCATIONS, "Parent Educations");
        put(PARENT_STATES, "Parent States");
        put(MONTH_NAMES, "Month Names");
        put(ZONE_NAMES, "Zone Names");
        put(DIVISION_NAMES, "Division Names");
        put(PROJECT_LEVEL, "Project Level");
        put(PROJECT_STATUS, "Project Status");
        put(DOC_INDICATOR, "Document Indicator");
    }};

   /*

    Map<String, String> DISTRICT_NAMES = new HashMap<String, String>() {{
        put("01", "BAGERHAT");
        put("02", "BANDARBAN");
        put("03", "BARGUNA");
        put("04", "BARISAL");
        put("05", "BHOLA");
        put("06", "BOGRA");
        put("07", "BRAHMANBARIA");
        put("08", "CHANDPUR");
        put("09", "CHAPAINABABGANJ");
        put("10", "CHITTAGONG");
        put("11", "CHUADANGA");
        put("12", "COMILLA");
        put("13", "COXS BAZAR");
        put("14", "DHAKA");
        put("15", "DINAJPUR");
        put("16", "FARIDPUR");
        put("17", "FENI");
        put("18", "GAIBANDHA");
        put("19", "GAZIPUR");
        put("20", "GOPALGANJ");
        put("21", "HABIGANJ");
        put("22", "JAMALPUR");
        put("23", "JESSORE");
        put("24", "JHALOKATI");
        put("25", "JHENAIDAH");
        put("26", "JOYPURHAT");
        put("27", "KHAGRACHHARI");
        put("28", "KHULNA");
        put("29", "KISHOREGONJ");
        put("30", "KURIGRAM");
        put("31", "KUSHTIA");
        put("32", "LAKSHMIPUR");
        put("33", "LALMONIRHAT");
        put("34", "MADARIPUR");
        put("35", "MAGURA");
        put("36", "MANIKGANJ");
        put("37", "MAULVIBAZAR");
        put("38", "MEHERPUR");
        put("39", "MUNSHIGANJ");
        put("40", "MYMENSINGH");
        put("41", "NAOGAON");
        put("42", "NARAIL");
        put("43", "NARAYANGANJ");
        put("44", "NARSINGDI");
        put("45", "NATORE");
        put("46", "NETRAKONA");
        put("47", "NILPHAMARI");
        put("48", "NOAKHALI");
        put("49", "PABNA");
        put("50", "PANCHAGARH");
        put("51", "PATUAKHALI");
        put("52", "PIROJPUR");
        put("53", "RAJBARI");
        put("54", "RAJSHAHI");
        put("55", "RANGAMATI");
        put("56", "RANGPUR");
        put("57", "SATKHIRA");
        put("58", "SHARIATPUR");
        put("59", "SHERPUR");
        put("60", "SIRAJGANJ");
        put("61", "SUNAMGANJ");
        put("62", "SYLHET");
        put("63", "TANGAIL");
        put("64", "THAKURGAON");
    }};


    Map<String, String> INCIDENT_TYPE_MAP = new HashMap<String, String>() {{
        put("0", "");
        put("1", "Internet");
        put("2", "eIBS");
        put("3", "Database");
        put("4", "Network");
        put("5", "Hardware");
        put("6", "Others");
    }};*/

}
