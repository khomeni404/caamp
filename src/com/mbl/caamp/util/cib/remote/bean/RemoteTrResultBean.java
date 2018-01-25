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
@XStreamAlias("remoteTrResultBean")
public class RemoteTrResultBean  implements Serializable {
    private boolean success;
    private String message;
    private Exception exception;
    private String errorTrace;
    private String drAccount;
    private String drTrID;
    private String crTrID;

    public RemoteTrResultBean() {
    }

    public boolean isSuccess() {
        return this.success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
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

    public Exception getException() {
        return this.exception;
    }

    public void setException(Exception exception) {
        this.exception = exception;
    }

    public String getErrorTrace() {
        return this.errorTrace;
    }

    public void setErrorTrace(String errorTrace) {
        this.errorTrace = errorTrace;
    }

    public String getDrAccount() {
        return this.drAccount;
    }

    public void setDrAccount(String drAccount) {
        this.drAccount = drAccount;
    }

}
