package com.mbl.caamp.common.bean;

import com.mbl.caamp.common.model.Document;
import com.mbl.caamp.admin.model.UserDetails;
import com.mbl.caamp.util.Constants;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Copyright &copy; 2002-2003 Islami Bank Bangladesh Limited
 * <p>
 * Original author: Khomeni
 * Date: 11/12/2017 12:52 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 11/12/2017: 11/12/2017 12:52 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

public class DocumentBean extends GenericBean{

    private Long id;

    @Size(min = 3, max = 100, message = "Type is required")
    private String type;

    // @Size(min = 4, max = 6, message = "Doc Indicator Code")
    private String indicator;

    private String note;

    private String title;

    private String originalName;

    private String givenName;

    private String resourceDirectory;

    private String extension;

    private UserDetails owner;

    private Date recordDate;

    private MultipartFile document;

    @Transient
    public String getDiscriminatorValue() {
        DiscriminatorValue val = this.getClass().getAnnotation(DiscriminatorValue.class);
        return val == null ? this.getClass().getSimpleName() : val.value();
    }

    @Override
    public void validate(BindingResult result) {
        if (this.owner == null || !GValidator.isDigits(this.owner.getEmployeeID()) || this.owner.getId() == null) {
            GValidator.rejectValue(result, "errors", "Real Document Owner not Found !");
        }

        if (GValidator.isBlankOrNull(this.document.getOriginalFilename())) {
            GValidator.rejectValue(result, "document", "PLease Select a Document !");
        }else  if (type.equals(Constants.SIGNATURE)) {
            if(this.document == null || this.document.getSize() < Constants.MIN_SIGNATURE_SIZE || this.document.getSize() > Constants.MAX_SIGNATURE_SIZE) {
                GValidator.rejectValue(result, "document", "Signature File size must be between " + Constants.MIN_SIGNATURE_SIZE + " and " + Constants.MAX_SIGNATURE_SIZE);
            }
        } else if (type.equals(Constants.AVATAR)) {
            if(this.document == null || this.document.getSize() < Constants.MIN_AVATAR_SIZE || this.document.getSize() > Constants.MAX_AVATAR_SIZE) {
                GValidator.rejectValue(result, "document", "Avatar File size must be between " + Constants.MIN_AVATAR_SIZE + " and " + Constants.MAX_AVATAR_SIZE);
            }
        } else {
            GValidator.rejectValue(result, "errors", "No Authorized Doc Type found !");
        }

        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    @Override
    public String info() {
        return null;
    }

    @Override
    public Document toModelBean() {
        return null;
    }
    public DocumentBean toBean(Document document) {
        return null;
    }

    ///==================================
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIndicator() {
        return indicator;
    }

    public void setIndicator(String indicator) {
        this.indicator = indicator;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOriginalName() {
        return originalName;
    }

    public String getExtension() {
        return extension;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getResourceDirectory() {
        return resourceDirectory;
    }

    public void setResourceDirectory(String resourceDirectory) {
        this.resourceDirectory = resourceDirectory;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public UserDetails getOwner() {
        return owner;
    }

    public void setOwner(UserDetails owner) {
        this.owner = owner;
    }

    public MultipartFile getDocument() {
        return document;
    }

    public void setDocument(MultipartFile document) {
        this.document = document;
    }

}
