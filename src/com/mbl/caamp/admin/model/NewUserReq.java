package com.mbl.caamp.admin.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Copyright @ Soft Engine [www.soft-engine.net].
 * Created on 21-Jan-18 at 3:41 PM
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 21-Jan-18
 * Version : 1.0
 */

@Entity
@Table(name = "AD_NEW_USER_REQUEST")
public class NewUserReq implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "emp_id", length = 20)
    private String employeeID;

    @Column(name = "full_name", length = 100)
    private String fullName;

    @Column(length = 50)
    private String posting;

    @Column(length = 50)
    private String designation;

    @Column(length = 11)
    private String cell;

    @Column(length = 100)
    private String email;

    @Column(name = "ph_or_ext", length = 12)
    private String phoneExt;

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

    public String getPhoneExt() {
        return phoneExt;
    }

    public void setPhoneExt(String phoneExt) {
        this.phoneExt = phoneExt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
