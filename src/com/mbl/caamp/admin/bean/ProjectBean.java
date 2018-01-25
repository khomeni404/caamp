package com.mbl.caamp.admin.bean;


import com.mbl.caamp.admin.model.Project;
import com.mbl.caamp.common.bean.GenericBean;
import com.mbl.caamp.security.model.Component;
import com.mbl.caamp.security.model.Group;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 23/11/2017 10:50 AM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 23/11/2017: 23/11/2017 10:50 AM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

public class ProjectBean extends GenericBean {

    private Long id; // 101, 102 etc

    private String name;

    private String ctx;

    private String description;

    private List<Component> componentList = new ArrayList<>();

    private List<Group> groupList = new ArrayList<>();

    private List<String> serverIPList = new ArrayList<>();

    private List<String> serverPortList = new ArrayList<>();

    private List<String> authorList = new ArrayList<>();

    private List<String> linkList = new ArrayList<>();

    @Override
    public void validate(BindingResult result) {
        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    @Override
    public String info() {
        return this.name;
    }

    @Override
    public Project toModelBean() {
        Project bean = new Project();
        /*bean.setId(this.icode);
        bean.setLevel(this.level);
        bean.setTitle(this.title);
        bean.setAppStart(DateUtil.getStartOfDay(this.appStart));
        bean.setAppEnd(DateUtil.getEndOfDay(this.appEnd));
        bean.setStatus(this.status);
        bean.setMandatoryDocList(this.mandatoryDocList);*/

        return bean;
    }

    public static ProjectBean toBean(Project project) {
        if(project == null) return null;
        ProjectBean bean = new ProjectBean();
        /*bean.setCode(project.getCode());
        bean.setLevel(project.getLevel());
        bean.setTitle(project.getTitle());
        bean.setAppStart(project.getAppStart());
        bean.setAppEnd(project.getAppEnd());
        bean.setStatus(project.getStatus());
        bean.setMandatoryDocList(project.getMandatoryDocList());*/
        
        return bean;
    }

    // ===========================================


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

    public String getCtx() {
        return ctx;
    }

    public void setCtx(String ctx) {
        this.ctx = ctx;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Component> getComponentList() {
        return componentList;
    }

    public void setComponentList(List<Component> componentList) {
        this.componentList = componentList;
    }

    public List<Group> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
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

    public List<String> getLinkList() {
        return linkList;
    }

    public void setLinkList(List<String> linkList) {
        this.linkList = linkList;
    }
}
