package com.mbl.caamp.common.bean;

import org.springframework.validation.BindingResult;

import java.io.Serializable;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 21/11/2017 10:50 AM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 21/11/2017: 21/11/2017 12:50 AM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

public abstract class GenericBean implements Serializable {

    /**
     * This is a helper property to use in ftl pages
     * only to print some unused property
     */
    private String helper;

    /**
     * Other Errors will be send using this prop
     */
    private String errors;

    /**
     * Set Validation Error to the BindingResult
     * @param result BindingResult
     */
    public abstract void validate(BindingResult result);

    /**
     * Method returns basic information of Object holds.
     * @return String
     */
    public abstract String info();

    /**
     * To convert UIBean to Model Bean
     * @return Model Bean
     */
    public abstract Object toModelBean();

    @Override
    public String toString() {
        return super.toString(); // info();
    }

    public String getHelper() {
        return helper;
    }

    public void setHelper(String helper) {
        this.helper = helper;
    }

    public String getErrors() {
        return errors;
    }

    public void setErrors(String errors) {
        this.errors = errors;
    }
}
