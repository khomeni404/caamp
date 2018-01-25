package com.mbl.caamp.security.bean;

import com.mbl.caamp.common.bean.GenericBean;
import com.mbl.caamp.security.model.Token;
import com.mbl.caamp.admin.model.UserDetails;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import javax.validation.constraints.Size;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 07/12/2017 2:22 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 04/12/2017: 07/12/2017 2:22 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

public class PassChangeBean extends GenericBean {
    private Long id;

    @Size(min = 5, max = 6, message = "Change Type Not Defined.")
    private String changeType;

    private UserDetails userDetails;

    private String oldPassword;

    @Size(min = 6, max = 50, message = "Required. Minimum 6 character & maximum 50.")
    private String newPassword;

    private String reNewPassword;


    @Override
    public void validate(BindingResult result) {
        if (this.userDetails == null || this.userDetails.getId() == null || GValidator.isBlankOrNull(this.userDetails.getEmployeeID())) {
            GValidator.rejectValue(result, "userDetails.user.name", "No valid User ID Found !.");
        }else if (this.userDetails.getUser() == null || this.userDetails.getUser().getId() == null) {
            GValidator.rejectValue(result, "userDetails.user.name", "No valid User id Found !.");
        }
    }

    public void validateForUpdate(BindingResult result) {
        if (GValidator.isBlankOrNull(this.oldPassword)) {
            GValidator.rejectValue(result, "oldPassword", "Old Password is Required.");
        }

        if (GValidator.isBlankOrNull(this.reNewPassword)) {
            GValidator.rejectValue(result, "reNewPassword", "Required. Minimum 6 character & maximum 50.");
        }

        if (!GValidator.isBlankOrNull(this.newPassword) && !GValidator.isBlankOrNull(this.reNewPassword) && !this.newPassword.equals(this.reNewPassword)) {
            GValidator.rejectValue(result, "reNewPassword", "This doesn't matched with \"New Password\"");
        }

        if (!result.hasErrors()) {
            // GValidator.validateSafeString(result, this);
        }
    }

    public void validateForReset(BindingResult result) {

        if (!GValidator.isBlankOrNull(this.newPassword) && !GValidator.isBlankOrNull(this.reNewPassword) && !this.newPassword.equals(this.reNewPassword)) {
            GValidator.rejectValue(result, "reNewPassword", "This doesn't matched with \"New Password\"");
        }

        if (!result.hasErrors()) {
            // GValidator.validateSafeString(result, this);
        }
    }

    @Override
    public String info() {
        return null;
    }

    @Override
    public Token toModelBean() {
        return null;
    }

    public static PassChangeBean toBean(Token token) {
        return null;
    }


    // =============================


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getReNewPassword() {
        return reNewPassword;
    }

    public void setReNewPassword(String reNewPassword) {
        this.reNewPassword = reNewPassword;
    }

    public String getChangeType() {
        return changeType;
    }

    public void setChangeType(String changeType) {
        this.changeType = changeType;
    }

    public UserDetails getUserDetails() {
        return userDetails;
    }

    public void setUserDetails(UserDetails userDetails) {
        this.userDetails = userDetails;
    }
}
