package com.mbl.caamp.security.model;

import com.mbl.caamp.admin.model.Project;

import javax.persistence.*;
import java.io.Serializable;

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
@Table(name = "SEC_COMPONENT")
public class Component  implements Serializable {
    public Component() {
    }

    public Component(Long id) {
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String prefix;

    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    private Project project;

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

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
