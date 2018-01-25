package com.mbl.caamp.util.cib.remote.bean;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Copyright &copy; 2002-2003 Islami Bank Bangladesh Limited
 * <p>
 * Original author: Ayatullah Khomeni
 * <br/> Date: 01/01/2017
 * <br/> Last modification by: ayat $
 * <br/> Last modification on 01/01/2017: 3:06 PM
 * <br/> Current revision: : 1.1.1.1
 * </p>
 * Revision History:
 * ------------------
 */

@XStreamAlias("transCarrier")
public class TransCarrier  implements Serializable {
    private String crHead = "10067500";
    private String desc = "CIB Service Charge";
    private  String trCode = "103"; // TRANSFER
    private  String trType = "102"; // Transfer Credit (to T_GEN_TRANS)
    private String refAccNo = "";
    private String originIBCode = "101";
    private String remoteUserId;
    private String remotePassword;
    private String remoteSecretKey;
    private String actionKey;
    private List<InquiryBean> inquiryBeanList = new ArrayList();

    public TransCarrier() {
    }

    public String getCrHead() {
        return this.crHead;
    }

    public void setCrHead(String crHead) {
        this.crHead = crHead;
    }

    public String getDesc() {
        return this.desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getTrCode() {
        return this.trCode;
    }

    public void setTrCode(String trCode) {
        this.trCode = trCode;
    }

    public String getTrType() {
        return this.trType;
    }

    public void setTrType(String trType) {
        this.trType = trType;
    }

    public String getRefAccNo() {
        return this.refAccNo;
    }

    public void setRefAccNo(String refAccNo) {
        this.refAccNo = refAccNo;
    }

    public String getOriginIBCode() {
        return this.originIBCode;
    }

    public void setOriginIBCode(String originIBCode) {
        this.originIBCode = originIBCode;
    }

    public String getRemoteUserId() {
        return this.remoteUserId;
    }

    public void setRemoteUserId(String remoteUserId) {
        this.remoteUserId = remoteUserId;
    }

    public String getRemotePassword() {
        return this.remotePassword;
    }

    public void setRemotePassword(String remotePassword) {
        this.remotePassword = remotePassword;
    }

    public String getRemoteSecretKey() {
        return this.remoteSecretKey;
    }

    public void setRemoteSecretKey(String remoteSecretKey) {
        this.remoteSecretKey = remoteSecretKey;
    }

    public String getActionKey() {
        return this.actionKey;
    }

    public void setActionKey(String actionKey) {
        this.actionKey = actionKey;
    }

    public List<InquiryBean> getInquiryBeanList() {
        return this.inquiryBeanList;
    }

    public void setInquiryBeanList(List<InquiryBean> inquiryBeanList) {
        this.inquiryBeanList = inquiryBeanList;
    }

}
