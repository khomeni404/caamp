package com.mbl.caamp.util.cib.util;


/**
 * Copyright &copy; 2002-2003 Islami Bank Bangladesh Limited
 * <p>
 * Original author: Khomeni
 * <br/> Date: 01/01/2017
 * </p>
 */
public interface RemoteDataList {
    String REMOTE_DATA_INQUIRY_BEAN = "inquiryBean";
    String REMOTE_DATA_TRANS_CARRIER = "transCarrier";
    String REMOTE_CIB_RESULT_BEAN = "cib.remote.result.bean";

    String REMOTE_CHARGE_USER_ID = PropertyUtil.get("CIB_REMOTE_CHARGE_USER_ID_192.168.36.231");
    String REMOTE_CHARGE_PASSWORD = PropertyUtil.get("CIB_REMOTE_CHARGE_PASSWORD_192.168.36.231");
    String REMOTE_CHARGE_SECRET_KEY = PropertyUtil.get("CIB_REMOTE_CHARGE_SECRET_KEY_192.168.36.231");

    /*static void main(String[] args) {
        System.out.println(REMOTE_DATA_INQUIRY_BEAN);
        System.out.println(REMOTE_CIB_RESULT_BEAN);
        System.out.println(REMOTE_CHARGE_USER_ID);
        System.out.println(REMOTE_CHARGE_PASSWORD);
        System.out.println(REMOTE_CHARGE_SECRET_KEY);
    }*/
}
