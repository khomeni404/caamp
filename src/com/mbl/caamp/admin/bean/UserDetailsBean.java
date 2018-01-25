package com.mbl.caamp.admin.bean;

import com.mbl.caamp.admin.model.Staff;
import com.mbl.caamp.admin.model.WorkStation;
import com.mbl.caamp.common.bean.GenericBean;
import com.mbl.caamp.admin.model.Designation;
import com.mbl.caamp.admin.model.UserDetails;
import net.softengine.model.User;
import net.softengine.util.GValidator;
import net.softengine.util.SessionUtil;
import org.springframework.validation.BindingResult;

import javax.validation.constraints.Size;
import java.util.Arrays;
import java.util.Date;

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

public class UserDetailsBean extends GenericBean {

    private Long id;

    @Size(min = 11, max = 11, message = "11 digit Employee ID is required.")
    private String employeeID; // e.g 20180103001

    // @Size(min = 3, max = 100, message = "3-100 character Employee name is required.")
    // private String name;

    @Size(min = 3, max = 10, message = "3-10 character Short name is required.")
    private String shortName;

    @Size(min = 11, max = 11, message = "11 digit Cell Phone No is required.")
    private String cell;

    @Size(min = 10, max = 100, message = "10-100 char email Address is required.")
    private String email;

    @Size(min = 3, max = 12, message = "3-12 digit Phone / Extension is required.")
    private String phoneExt;

    @Size(min = 6, max = 50, message = "6-50 character Username is required.")
    private String username;

    @Size(min = 6, max = 50, message = "6-50 character Password is required.")
    private String password;

    private WorkStation workStation;

    private Date lastLogin;

    private Date lastUpdate;

    private Designation designation;

    private User user;

    private String staffGroupData;

    private String operator;

    @Override
    public void validate(BindingResult result) {
        if (user == null || GValidator.isBlankOrNull(user.getName())) {
            GValidator.rejectValue(result, "user.name", "3-100 character Employee name is required");
        }
        if (user == null || user.getStatus() == null) {
            GValidator.rejectValue(result, "user.status", "Status Selection is required");
        }
        if (workStation == null || GValidator.isBlankOrNull(workStation.getCode())) {
            GValidator.rejectValue(result, "workStation.code", "Work Station Selection is required");
        }
        if (designation == null || designation.getId() == null) {
            GValidator.rejectValue(result, "designation.id", "Designation Selection is required");
        }
        GValidator.validateEmailAddress(result, email, "email", true);

        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this, Arrays.asList("password", "email"));
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

    public UserDetails toUserDetails() {
        UserDetails details = new UserDetails();
        details.setId(this.id);
        details.setEmployeeID(this.employeeID);
        details.setCell(this.cell);
        details.setEmail(this.email);
        details.setPhoneExt(this.phoneExt);
        details.setLastUpdate(new Date());
        if (this.designation != null && this.designation.getId() != null) {
            details.setDesignation(this.designation);
        }

        if (this.workStation != null && !GValidator.isBlankOrNull(this.workStation.getCode())) {
            details.setWorkStation(this.workStation);
        }
        details.setOperator(SessionUtil.getSessionUser());
        return details;
    }

    public static UserDetailsBean toUserDetailsBean(UserDetails po) {
        if (po == null) return null;
        UserDetailsBean bean = new UserDetailsBean();
        bean.setId(po.getId());
        bean.setEmployeeID(po.getEmployeeID());
        bean.setCell(po.getCell());
        bean.setEmail(po.getEmail());
        bean.setPhoneExt(po.getPhoneExt());
        bean.setLastUpdate(po.getLastUpdate());
        bean.setDesignation(po.getDesignation());
        bean.setWorkStation(po.getWorkStation());

        User user1 = po.getUser();
        bean.setUser(user1);
        if (user1 instanceof Staff) {
            bean.setShortName(((Staff) user1).getShortName());
        }

        return bean;
    }

    // ====================================


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
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

    public WorkStation getWorkStation() {
        return workStation;
    }

    public void setWorkStation(WorkStation workStation) {
        this.workStation = workStation;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public Designation getDesignation() {
        return designation;
    }

    public void setDesignation(Designation designation) {
        this.designation = designation;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStaffGroupData() {
        return staffGroupData;
    }

    public void setStaffGroupData(String staffGroupData) {
        this.staffGroupData = staffGroupData;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}
