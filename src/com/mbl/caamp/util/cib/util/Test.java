package com.mbl.caamp.util.cib.util;

import ibbl.cib.remote.bean.TransCarrier;
import ibbl.common.util.GlobalConfigurationPool;
import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.validator.GenericValidator;

import javax.servlet.http.HttpServletRequest;

/**
 * Copyright (C) 2002-2003 Islami Bank Bangladesh Limited
 * <p/>
 * Original author: Ayatullah Khomeni<br/>
 * Date: 18/01/2016
 * Last modification by: ayat $
 * Last modification on 18/01/2016: 5:57 PM
 * Current revision: : 1.1.1.1
 * <p/>
 * Revision History:
 * ------------------
 */
public class Test {
    public static void main(String[] args) {
        String rr = verifyCribSystemAccess("", null);
        System.out.println(BooleanUtils.toBoolean(""));
        System.out.println(rr);
    }


    private static String verifyCribSystemAccess(String ipAddress, TransCarrier carrier) {
       /* String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (GenericValidator.isBlankOrNull(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }*/
        if (GenericValidator.isBlankOrNull(ipAddress) || (!ipAddress.equals("192.168.36.231") && !ipAddress.equals("192.168.37.231"))) {
            return "No Access ! Requested from an Unauthorized source/machine.";
        } else
            return "true";
    }
}

