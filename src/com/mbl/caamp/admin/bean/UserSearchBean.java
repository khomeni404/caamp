package com.mbl.caamp.admin.bean;

import com.mbl.caamp.common.bean.GenericBean;
import net.softengine.model.User;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import javax.validation.constraints.Size;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 21/11/2017 12:56 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 21/11/2017: 21/11/2017 12:56 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

public class UserSearchBean extends GenericBean {

    private Long id;

    private String employeeID; // e.g 20180103001

    private String name;

    private String cell;

    private String username;

    private String workStation;

    private String designation;


    @Override
    public void validate(BindingResult result) {
        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }


    public void validateSearchCriteria(BindingResult result) {
        if (GValidator.isBlankOrNull(this.employeeID) && GValidator.isBlankOrNull(this.name)
               && GValidator.isBlankOrNull(this.cell)
                && GValidator.isBlankOrNull(this.workStation) && GValidator.isBlankOrNull(this.designation)
                ) {
            GValidator.rejectValue(result, "errors", "One Criteria Selection is required");
        }
        //GValidator.rejectEmptyString(result, this.employeeID, "employeeID", "Employee ID is required");
        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    @Override
    public String info() {
        return null;
    }

    @Override
    public Object toModelBean() {
        return null;
    }

    // ====================================

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getCell() {
        return cell;
    }

    public void setCell(String cell) {
        this.cell = cell;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getWorkStation() {
        return workStation;
    }

    public void setWorkStation(String workStation) {
        this.workStation = workStation;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
}
