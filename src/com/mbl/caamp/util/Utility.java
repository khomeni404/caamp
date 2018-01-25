package com.mbl.caamp.util;

import com.mbl.caamp.common.model.Document;
import com.mbl.caamp.home.BootstrapEngine;
import net.softengine.util.GValidator;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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

public class Utility {

    /**
     * Initialized on boot
     *
     * @see BootstrapEngine#loadProperties()
     */
    @SuppressWarnings("unchecked")
    public static Map<Integer, Map<String, String>> PROPERTY_GROUP_MAP = new HashMap(0);

    @SuppressWarnings("unchecked")
    public static String getPropValue(String propertyCode) {
        try {
            if (GValidator.isDigits(propertyCode) && propertyCode.length() >= 4) {
                String propertyGroupCode = propertyCode.substring(0, 2);
                Map<String, String> propMap = PROPERTY_GROUP_MAP.get(Integer.valueOf(propertyGroupCode));
                return propMap.get(propertyCode);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "--";
    }

    @SuppressWarnings("unchecked")
    public static String getPropValue(String propertyGroupCode, String propertyCode) {
        try {
            if (GValidator.isDigits(propertyCode) && GValidator.isDigits(propertyGroupCode)) {
                Map<String, String> propMap = PROPERTY_GROUP_MAP.get(Integer.valueOf(propertyGroupCode));
                return propMap.get(propertyCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "--";
    }

    /**
     * Initialized on boot
     *
     * @see BootstrapEngine#loadOccupations()
     */
    @SuppressWarnings("unchecked")
    public static Map<Long, String> MASTER_OCCUPATION_MAP = new HashMap(0);

    /**
     * Initialized on boot
     *
     * @see BootstrapEngine#loadOccupations()
     */
    @SuppressWarnings("unchecked")
    public static Map<Long, String> CHILD_OCCUPATION_MAP = new HashMap(0);

    @SuppressWarnings("unchecked")
    public static String getOccupationName(String occupationId) {
        try {
            if (GValidator.isDigits(occupationId)) {
                return CHILD_OCCUPATION_MAP.get(Long.valueOf(occupationId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "--";
    }

    /**
     * Initialized on boot
     *
     * @see BootstrapEngine#loadOccupations()
     */
    @SuppressWarnings("unchecked")
    public static Map<Long, Map<Long, String>> CHILD_OCCUPATION_MAP_MAP = new HashMap(0);


    public static void main(String[] args) {
        String c = getRandomChar(6).toUpperCase();
        System.out.println("c = " + c);
        System.out.println(c.replaceAll("[1I0O]", "X"));
    }

   /* public static Map<String, String> getIncidentTypeMap() {
        return Constants.INCIDENT_TYPE_MAP;
    }

    public static String getIncidentType(String key) {
        try {
            return Constants.INCIDENT_TYPE_MAP.get(key);
        } catch (Exception e) {
            return "";
        }
    }*/



    public static String getUniqueFileName() {
        UUID uuid = UUID.randomUUID();
        String randomUUIDString = uuid.toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = sdf.format(new Date());
        return dateString + "-" + uuid.version() + uuid.variant() + "-" + randomUUIDString;
    }

    public static String generateId_12() {
        DateFormat df = new SimpleDateFormat("yyMMddHHmmss");
        return df.format(new Date());
    }

    public static String getRandomNumber(String format) {
        DecimalFormat df = new DecimalFormat(format);
        Random rand = new Random();
        return df.format(rand.nextInt(50));
    }

    public static String getRandomChar(Integer len) {
        return RandomStringUtils.randomAlphanumeric(len);
    }

    public static String getOtpPassphrase(String cell) {
        StringBuilder sb = new StringBuilder(cell);
        sb.reverse();
        return Constants.OTP_PASSPHRASE_PREFIX + sb;
    }

    public static List<String> generateListOfCode(Integer nos) {

        DecimalFormat df = new DecimalFormat("0000");
        ArrayList<String> list = new ArrayList<String>();
        for (int i = 1; i < nos; i++) {
            list.add(df.format(i));
        }
        Collections.shuffle(list);
        return list;
    }

    public static String getFileExtension(MultipartFile file) {
        String name = file.getOriginalFilename();
        try {
            return name.substring(name.lastIndexOf("."));
        } catch (Exception e) {
            return "";
        }
    }

    public static String getFileNameWithoutExtension(MultipartFile file) {
        String name = file.getOriginalFilename();
        try {
            return name.substring(0, name.lastIndexOf("."));
        } catch (Exception e) {
            return "";
        }
    }

    public static String cutOrPadRight(String str, int size, String padStr) {
        str = str == null ? "" : str;
        int len = str.trim().length();
        str = len > size ? str.substring(0, size) : str;
        return StringUtils.rightPad(str, size, padStr);
    }

    public static String cutOrPadLeft(String str, int size, String padStr) {
        str = str == null ? "" : str;
        int len = str.trim().length();
        str = len > size ? str.substring(0, size) : str;
        return StringUtils.leftPad(str, size, padStr);
    }

    public static PrintWriter getWriter(HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST,GET");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");

        return writer;
    }

    /*public static String getMonth(Integer monthSerial) {
        try {
            return Constants.MONTH_LIST.get(monthSerial);
        } catch (Exception e) {
            return "";
        }
    }*/


    @SuppressWarnings("unchecked")
    public static Map<String, String> getMap(String propertyGroupCode) {
        try {
            return GValidator.isDigits(propertyGroupCode) ?
                    PROPERTY_GROUP_MAP.get(Integer.valueOf(propertyGroupCode)) : null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new HashMap<>(0);
    }

    @SuppressWarnings("unchecked")
    public static Map<String, String> getOptions(String topOption, String propertyGroupCode) {
        Map<String, String> optionMap = GValidator.isDigits(propertyGroupCode) ?
                PROPERTY_GROUP_MAP.get(Integer.valueOf(propertyGroupCode)) : null;
        Map<String, String> data = optionMap == null ? new HashMap() : new HashMap(optionMap);
        data.put("", "--" + topOption + "--");
        return data;
    }


    @SuppressWarnings("unchecked")
    public static Map<String, String> getOptions(String topOption, Map<String, String> optionMap) {
        Map<String, String> data = optionMap == null ? new HashMap() : new HashMap(optionMap);
        data.put("", "--" + topOption + "--");
        return data;
    }

    public static String getDocPath() {
        return Constants.BACK_UP_DOC_URI;
    }

    public static String getDocPath(Document document) {
        if (document == null) return Constants.BACK_UP_DOC_URI;
        try {

            return Constants.DOC_SRC_LEADER + "/"
                    + document.getDiscriminatorValue() + "/"
                    + document.getGivenName()+"."
                    + document.getExtension();
        } catch (Exception e) {
            return Constants.BACK_UP_DOC_URI;
        }
    }




    public static void printMapFiledName() {
        Class<Constants> c = Constants.class;
        for (Field f : c.getDeclaredFields()) {
            int mod = f.getModifiers();
            if (Modifier.isStatic(mod) && Modifier.isPublic(mod) && Modifier.isFinal(mod)) {
                try {
                    if (f.getGenericType().getTypeName().equals(Constants.CONSTANT_MAP_GENERIC) && f.getType().equals(Map.class)) {
                        String name = f.getName();
                        System.out.println("<#assign " + name + " = '" + name + "'/>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * These methods invoked inside this method, has been called from FTL pages
     * SO....oooooo Do not destroy these methods
     */
    private static void callConfirm() {
        getMap(null);
        getOptions(null, new HashMap<String, String>(0));
        getOptions(null, "");
        printMapFiledName();
        getPropValue("ddd");
        getOccupationName("ddd");
         getDocPath(null);

    }
}
