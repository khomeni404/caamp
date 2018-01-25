package com.mbl.caamp.util.cib.remote.bean;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.io.Serializable;

/**
 * Copyright &copy; 2002-2003 Islami Bank Bangladesh Limited
 * <p>
 * Original author: Ayatullah Khomeni
 * <br/> Date: 01/01/2017
 * <br/> Last modification by: ayat $
 * <br/> Last modification on 01/01/2017: 3:05 PM
 * <br/> Current revision: : 1.1.1.1
 * </p>
 * Revision History:
 * ------------------
 */
@XStreamAlias("inquiryBean")
public class InquiryBean implements Serializable {
    private String inqNo;
    private String custId;
    private String brCode;
    private Double keyCost;
    private Double linkingCost;
    private Integer costStatus;
    private String chargeableAccount;
    private String instrumentNo;
    private String chargedBy;
    private String drTrID;
    private String crTrID;

    public InquiryBean() {
    }

    public Double getTotalCost() {
        return Double.valueOf(this.keyCost.doubleValue() + this.linkingCost.doubleValue());
    }

    public Double getKeyCost() {
        return this.keyCost;
    }

    public void setKeyCost(Double keyCost) {
        this.keyCost = keyCost;
    }

    public Double getLinkingCost() {
        return this.linkingCost;
    }

    public void setLinkingCost(Double linkingCost) {
        this.linkingCost = linkingCost;
    }

    public Integer getCostStatus() {
        return this.costStatus;
    }

    public void setCostStatus(Integer costStatus) {
        this.costStatus = costStatus;
    }

    public String getChargeableAccount() {
        return this.chargeableAccount;
    }

    public void setChargeableAccount(String chargeableAccount) {
        this.chargeableAccount = chargeableAccount;
    }

    public String getInstrumentNo() {
        return this.instrumentNo;
    }

    public void setInstrumentNo(String instrumentNo) {
        this.instrumentNo = instrumentNo;
    }

    public String getInqNo() {
        return this.inqNo;
    }

    public void setInqNo(String inqNo) {
        this.inqNo = inqNo;
    }

    public String getCustId() {
        return this.custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getBrCode() {
        return this.brCode;
    }

    public void setBrCode(String brCode) {
        this.brCode = brCode;
    }

    public String getChargedBy() {
        return this.chargedBy;
    }

    public void setChargedBy(String chargedBy) {
        this.chargedBy = chargedBy;
    }

    public String getDrTrID() {
        return this.drTrID;
    }

    public void setDrTrID(String drTrID) {
        this.drTrID = drTrID;
    }

    public String getCrTrID() {
        return this.crTrID;
    }

    public void setCrTrID(String crTrID) {
        this.crTrID = crTrID;
    }

}
