package com.mbl.caamp.admin.model;

import com.mbl.caamp.security.model.Component;
import com.mbl.caamp.security.model.Group;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 23/11/2017 11:26 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 23/11/2017: 23/11/2017 11:36 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */


@Entity
@Table(name = "AD_PROJECT")
public class Project implements Serializable {
    public Project() {
    }

    public Project(Long id) {
        this.id = id;
    }

    @Id
    private Long id; // 101, 102 etc

    @Column(length = 50)
    private String name;

    @Column(length = 10)
    private String ctx;

    @Column(name = "load_balancer", length = 100)
    private String loadBal;

    @Column(length = 150)
    private String description;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "project")
    @Fetch(FetchMode.SELECT)
    private List<Component> componentList = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "project")
    @Fetch(FetchMode.SELECT)
    private List<Group> groupList = new ArrayList<>();

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    @CollectionTable(name = "SEC_APP_IPS", joinColumns = @JoinColumn(name = "APP_ID"))
    @Column(name = "IP_ADDRESS")
    private List<String> serverIPList = new ArrayList<>();

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    @CollectionTable(name = "SEC_APP_PORT", joinColumns = @JoinColumn(name = "app_id"))
    @Column(name = "port_no")
    private List<String> serverPortList = new ArrayList<>();

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    @CollectionTable(name = "SEC_APP_AUTHORS", joinColumns = @JoinColumn(name = "app_id"))
    @Column(name = "emp_id")
    private List<String> authorList = new ArrayList<>();


    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    @CollectionTable(name = "SEC_APP_LINKS", joinColumns = @JoinColumn(name = "app_id"))
    @Column(name = "uri") // URI can be URL, URN, Load Balancer IP etc
    private List<String> linkList = new ArrayList<>();

    public Long getId() {
        return id;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCtx() {
        return ctx;
    }

    public void setCtx(String ctx) {
        this.ctx = ctx;
    }

    public String getLoadBal() {
        return loadBal;
    }

    public void setLoadBal(String loadBal) {
        this.loadBal = loadBal;
    }

    public List<Component> getComponentList() {
        return componentList;
    }

    public void setComponentList(List<Component> componentList) {
        this.componentList = componentList;
    }

    public List<String> getServerIPList() {
        return serverIPList;
    }

    public void setServerIPList(List<String> serverIPList) {
        this.serverIPList = serverIPList;
    }

    public List<String> getServerPortList() {
        return serverPortList;
    }

    public void setServerPortList(List<String> serverPortList) {
        this.serverPortList = serverPortList;
    }

    public List<String> getAuthorList() {
        return authorList;
    }

    public void setAuthorList(List<String> authorList) {
        this.authorList = authorList;
    }

    public List<Group> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
    }

    public List<String> getLinkList() {
        return linkList;
    }

    public void setLinkList(List<String> linkList) {
        this.linkList = linkList;
    }
}
