package com.mbl.caamp.common.bean;

import net.softengine.service.Christopher;
import com.mbl.caamp.util.Utility;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 22/11/2017 12:35 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 22/11/2017: 22/11/2017 12:35 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */
@XmlRootElement
public class OTP implements Serializable {
    private int id;
    private String code;

    private String cell;

    private Long life; // second

    @Size(min = 3, max = 100,message = "Name is required within 3-100 Character")
    private String sender;

    private Long projectCode;

    public OTP() {
    }

    public OTP(Long life, String cell, String sender) {
        this.life = life; // in Second
        this.cell = cell;
        this.sender = sender;
    }

    public String getEncryptedCode(String code) {
        Christopher christopher = new Christopher(Utility.getOtpPassphrase(this.cell));
        String createdOn = String.valueOf(new Date().getTime());
        return christopher.encrypt(code + "_" + createdOn);
    }

    public void validate(BindingResult result) {
        GValidator.validateCellNo(this.cell, "cell", result);
        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    public void validate(HttpSession session, BindingResult result, String receivedCode) {
        if (GValidator.isBlankOrNull(receivedCode)) {
            result.rejectValue("code", "", new Object[]{"'code'"}, "Code is required.");
        } else {
            String encryptedOtp = (String) session.getAttribute("OTP_" + this.cell);
            if (GValidator.isBlankOrNull(this.cell) || GValidator.isBlankOrNull(this.sender) || GValidator.isBlankOrNull(encryptedOtp)) {
                result.rejectValue("", "", new Object[]{""}, "System/Internet Problem, Try again.");
            }

            Christopher christopher = new Christopher(Utility.getOtpPassphrase(this.cell));
            String otpAndTime = christopher.decrypt(encryptedOtp);
            String[] data = otpAndTime.split("[_]");

            if (data.length != 2) {
                result.rejectValue("", "", new Object[]{""}, "System/Internet Problem, Try again.");
            }

            String originalCode = data[0];

            if (!originalCode.equals(receivedCode)) {
                result.rejectValue("code", "", new Object[]{"'code'"}, "Wrong Code.");
            }
            Long openTime = Long.valueOf(data[1]);
            Long timeNow = new Date().getTime();
            Long ageInSec = (timeNow - openTime)/1000;
            if (ageInSec > this.life) {
                 result.rejectValue("code", "", new Object[]{"'code'"}, "Exceed time limit. Invalidated CODE. Please try from the first.");
            }

        }

        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    public String getCell() {
        return cell;
    }

    public int getId() {
        return id;
    }

    @XmlElement
    public void setId(int id) {
        this.id = id;
    }

    @XmlElement
    public void setCell(String cell) {
        this.cell = cell;
    }

    public Long getLife() {
        return life;
    }

    @XmlElement
    public void setLife(Long life) {
        this.life = life;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Long getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(Long projectCode) {
        this.projectCode = projectCode;
    }

    public String getCode() {
        return code;
    }


    public void setCode(String code) {
        this.code = code;
    }
}
