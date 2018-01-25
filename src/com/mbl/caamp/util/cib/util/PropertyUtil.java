package com.mbl.caamp.util.cib.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Copyright (C) 2002-2003 Islami Bank Bangladesh Limited
 * <p>
 * Original author: Ayatullah Khomeni
 * Date: 30/12/2015
 * Last modification by: ayat $
 * Last modification on 30/12/2015: 10:58 AM
 * Current revision: : 1.1.1.1
 * <p>
 * Revision History:
 * ------------------
 */
public class PropertyUtil {
    public static String get(String propName) {
        Properties prop = new Properties();
        InputStream input = null;
        String propValue = "";
        try {
            input = PropertyUtil.class.getClassLoader().getResourceAsStream("sys-config.properties");
            if (input == null) {
                return "\'cib-config.properties\' file not found";
            }
            prop.load(input);
            propValue = prop.getProperty(propName);
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return propValue;

    }

    public static void main(String[] args) {
        System.out.println(PropertyUtil.get("REMOTE_CHARGE_SECRET_KEY"));

    }
}
