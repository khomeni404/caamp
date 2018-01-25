package com.mbl.caamp.security.bean;

import com.mbl.caamp.common.bean.GenericBean;
import com.mbl.caamp.security.model.Token;
import net.softengine.model.User;
import net.softengine.util.ActionResult;
import net.softengine.util.GValidator;
import org.apache.commons.validator.GenericValidator;
import org.springframework.validation.BindingResult;

import javax.validation.constraints.AssertTrue;
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

public class TokenBean extends GenericBean {
    private Long id;

    @Size(min = 3, max = 20, message = "Username can be minimum 3 character & max 20")
    private String username;

    @Size(min = 3, max = 50, message = "Password can be minimum 3 character & max 50")
    private String password;
    
    private boolean isEncrypted;

    private String brCode;

    private User user;

    private Long projectId;

    private String secretKey;

    @Override
    public void validate(BindingResult result) {
        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    public void validateStaffToken(BindingResult result) {
        // GValidator.validateBrCode(result, this.brCode);
        // ValidationUtils.rejectIfEmptyOrWhitespace(result, "username", "username.required", "Please type your username");
        // ValidationUtils.rejectIfEmptyOrWhitespace(result, "password", "password.required", "Please type your password.");
        if (!GValidator.isSafeString(this.username)) {
            GValidator.rejectValue(result, "username", "Found Suspicious Character.");
        }
    }

    public void validateRemoteStaffToken(ActionResult actionResult) {
        // GValidator.validateBrCode(result, this.brCode);
        if (this.projectId == null) {
            // actionResult.putError("errors", "Project ID not Found !");
            actionResult.putError("errors", "Unauthorized/Suspicious Request.");
        }
        if (GenericValidator.isBlankOrNull(this.secretKey)) {
            // actionResult.putError("errors", "Secret key not Found.");
            actionResult.putError("errors", "Unauthorized/Suspicious Request.");
        }
        if (!GValidator.isSafeString(this.username)) {
            actionResult.putError("username", "Found Suspicious Character.");
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

    public static TokenBean toBean(Token token) {
        return null;
    }


    // =============================


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public boolean isEncrypted() {
        return isEncrypted;
    }

    public void setEncrypted(boolean isEncrypted) {
        this.isEncrypted = isEncrypted;
    }

    public String getBrCode() {
        return brCode;
    }

    public void setBrCode(String brCode) {
        this.brCode = brCode;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }
}
