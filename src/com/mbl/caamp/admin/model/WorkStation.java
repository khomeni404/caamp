package com.mbl.caamp.admin.model;

import com.mbl.caamp.common.model.GenericModel;
import net.softengine.model.User;
import net.softengine.util.GValidator;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;

/**
 * Copyright @ Soft Engine [www.soft-engine.net].
 * Created on 16-Jan-18 at 11:36 AM
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 16-Jan-18
 * Version : 1.0
 */

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "type", discriminatorType = DiscriminatorType.STRING)
@Table(name = "AD_WORK_STATION_MASTER")
public class WorkStation extends GenericModel {

    @Id
    @Column(length = 4)
    private String code;

    @Column(length = 100)
    private String name;

    @Column(length = 10)
    private String alias;

    @Column(length = 200)
    private String address;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    private Institute institute;

    @Override
    public String info() {
        return this.code + ": " + (GValidator.isBlankOrNull(this.alias) ? this.name : this.alias);
    }

    @Transient
    public String getDiscriminatorValue() {
        DiscriminatorValue val = this.getClass().getAnnotation(DiscriminatorValue.class);
        return val == null ? this.getClass().getSimpleName() : val.value();
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
}
