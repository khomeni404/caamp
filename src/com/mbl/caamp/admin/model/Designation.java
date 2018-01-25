package com.mbl.caamp.admin.model;

import com.mbl.caamp.common.model.GenericModel;

import javax.persistence.*;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 23/11/2017 11:06 AM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 23/11/2017: 23/11/2017 11:06 AM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Entity
@Table(name = "AD_DESIGNATION")
public class Designation extends GenericModel {

    public Designation(){}
    public Designation(Long id){this.id = id;}

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Double weight;

    private String name;

    private String alias;


    @Override
    public String info() {
        return this.name+" ("+this.alias+")";
    }

    // ============================================


    public Long getId() {
        return id;
    }

    public String getIdS() {
        return id.toString();
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
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
}
