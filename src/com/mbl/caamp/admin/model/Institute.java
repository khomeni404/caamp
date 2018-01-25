package com.mbl.caamp.admin.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Copyright @ Soft Engine [www.soft-engine.net].
 * Created on 16-Jan-18 at 12:13 PM
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 16-Jan-18
 * Version : 1.0
 */

@Entity
@Table(name = "AD_INSTITUTE")
public class Institute implements Serializable {
    public Institute() {
    }
    public Institute(Long id) {
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String address;

    public Long getId() {
        return id;
    }

    public String getIdS() {
        return id.toString();
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
