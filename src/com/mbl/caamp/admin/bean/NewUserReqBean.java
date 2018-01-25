package com.mbl.caamp.admin.bean;

import com.mbl.caamp.admin.model.NewUserReq;
import com.mbl.caamp.common.bean.GenericBean;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Arrays;

/**
 * Copyright @ Soft Engine [www.soft-engine.net].
 * Created on 21-Jan-18 at 3:41 PM
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 21-Jan-18
 * Version : 1.0
 */

public class NewUserReqBean extends GenericBean{

    private Long id;

    @Size(min = 11, max = 11, message = "11 Digit Employee ID is required")
    private String employeeID;

    @Size(min = 3, max = 100, message = "Full Name is required [Min-3, Max-100 Char]")
    private String fullName;

    @Size(min = 2, max = 50, message = "Type Place of posting. [e.g. Branch Name with Branch Code/Division Name etc.]")
    private String posting;

    @Size(min = 2, max = 50, message = "Designation is Required.")
    private String designation;

    @Size(min = 11, max = 11, message = "11 Digit Cell no is required.")
    private String cell;

    private String email;

    @Size(min = 3, max = 12, message = "Phone/Extension No is required (3-12 digit)")
    private String phoneExt;

    @Override
    public void validate(BindingResult result) {
        GValidator.validateEmailAddress(result, email, "email", true);
        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this, Arrays.asList("email"));
        }
    }

    @Override
    public String info() {
        return null;
    }

    @Override
    public NewUserReq toModelBean() {
        NewUserReq po = new NewUserReq();
        po.setId(this.id);
        po.setCell(this.cell);
        po.setEmail(this.email);
        po.setPhoneExt(this.phoneExt);
        po.setDesignation(this.designation);
        po.setEmployeeID(this.employeeID);
        po.setPosting(this.posting);
        po.setFullName(this.fullName);
        return po;
    }

    public NewUserReqBean toUIBean(NewUserReq req) {
        return null;
    }

    //==========================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPosting() {
        return posting;
    }

    public void setPosting(String posting) {
        this.posting = posting;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getCell() {
        return cell;
    }

    public void setCell(String cell) {
        this.cell = cell;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneExt() {
        return phoneExt;
    }

    public void setPhoneExt(String phoneExt) {
        this.phoneExt = phoneExt;
    }
}
