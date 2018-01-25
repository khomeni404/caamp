package com.mbl.caamp.security.bean;

import com.mbl.caamp.admin.model.Project;
import com.mbl.caamp.admin.model.Staff;
import com.mbl.caamp.common.bean.GenericBean;
import com.mbl.caamp.security.model.Action;
import com.mbl.caamp.security.model.Group;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 21/11/2017 2:12 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 21/11/2017: 21/11/2017 2:12 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Entity
@Table(name = "SEC_USER_GROUP")
public class GroupBean extends GenericBean {
    public GroupBean(){}
    public GroupBean(Long id){this.id = id;}

    private Long id;

    @Size(min = 4, max = 100)
    private String name;

    @Size(min = 10, max = 100)
    private String description;

    private Project project;

    private List<Staff> groupMemberList;

    private List<Action> actionList = new ArrayList<>();

    @Override
    public void validate(BindingResult result) {
        if (!GValidator.isBlankOrNull(name) && name.toUpperCase().contains("GROUP")) {
            GValidator.rejectValue(result, "name", "Avoid \"Group\" word from name.");
        }
        if (project == null || this.project.getId() == null) {
            GValidator.rejectValue(result, "project.id", "Select a Project.");
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
    public Object toModelBean() {
        Group group = new Group();
        group.setName(this.name);
        group.setDescription(this.description);
        group.setProject(this.project);
        return group;
    }

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

    public List<Staff> getGroupMemberList() {
        return groupMemberList;
    }

    public void setGroupMemberList(List<Staff> groupMemberList) {
        this.groupMemberList = groupMemberList;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public List<Action> getActionList() {
        return actionList;
    }

    public void setActionList(List<Action> actionList) {
        this.actionList = actionList;
    }
}
