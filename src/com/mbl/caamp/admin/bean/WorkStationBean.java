package com.mbl.caamp.admin.bean;

import com.mbl.caamp.admin.model.Branch;
import com.mbl.caamp.admin.model.Division;
import com.mbl.caamp.admin.model.Institute;
import com.mbl.caamp.admin.model.WorkStation;
import com.mbl.caamp.common.bean.GenericBean;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import javax.persistence.DiscriminatorValue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Copyright @ Soft Engine [www.soft-engine.net].
 * Created on 16-Jan-18 at 11:36 AM
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 16-Jan-18
 * Version : 1.0
 */

public class WorkStationBean extends GenericBean {

    @Size(min = 6, max = 15, message = "Select Type")
    private String type;

    @Size(min = 3, max = 4, message = "Please Type Code (3-4 char)")
    private String code;

    @Size(min = 3, max = 100)
    private String name;

    private String alias;

    @Size(min = 3, max = 100)
    private String address;

    @NotNull
    private Institute institute;

    @Override
    public void validate(BindingResult result) {
        if (institute == null || institute.getId() == null) {
            GValidator.rejectValue(result, "institute.id", "Please select an Institute.");
        }
        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    @Override
    public String info() {
        return this.code + ": " + (GValidator.isBlankOrNull(this.alias) ? this.name : this.alias);
    }

    @Override
    public WorkStation toModelBean() {
        if (this.type.equals(new Branch().getDiscriminatorValue())) {
            Branch ws = new Branch();
            ws.setCode(this.code);
            ws.setName(this.name);
            ws.setAlias(this.alias);
            ws.setAddress(this.address);
            if (institute != null && institute.getId() != null) {
                ws.setInstitute(this.institute);
            }
            return ws;
        } else if (this.type.equals(new Division().getDiscriminatorValue())) {
            Division ws = new Division();
            ws.setCode(this.code);
            ws.setName(this.name);
            ws.setAlias(this.alias);
            ws.setAddress(this.address);
            if (institute != null && institute.getId() != null) {
                ws.setInstitute(this.institute);
            }
            return ws;
        } else {
            WorkStation ws = new WorkStation();
            ws.setCode(this.code);
            ws.setName(this.name);
            ws.setAlias(this.alias);
            ws.setAddress(this.address);
            if (institute != null && institute.getId() != null) {
                ws.setInstitute(this.institute);
            }
            return ws;
        }

    }

    public static WorkStationBean toBean(WorkStation po) {
        return null;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Institute getInstitute() {
        return institute;
    }

    public void setInstitute(Institute institute) {
        this.institute = institute;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
