package com.mbl.caamp.security.bean;

import com.mbl.caamp.common.bean.GenericBean;
import com.mbl.caamp.security.model.Action;
import com.mbl.caamp.security.model.Component;
import com.mbl.caamp.security.model.Group;
import net.softengine.util.GValidator;
import org.springframework.validation.BindingResult;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Khomeni
 * Created on : 17-May-17 at 8:22 PM
 */

public class ActionBean extends GenericBean {

    private Long id;

    @Size(min = 5, max = 50, message = "A valid Action name is required within 5-50 character.")
    private String name;

    @Size(min = 5, max = 50, message = "A valid Action value is required within 5-50 character.")
    private String value;

    @NotNull
    private Component component;

    private List<Group> groupList;

    @Override
    public void validate(BindingResult result) {
        Pattern pattern = Pattern.compile("\\s");
        Matcher matcher = pattern.matcher(this.value);
        boolean foundWhiteSpace = matcher.find();
        if (foundWhiteSpace) {
            GValidator.rejectValue(result, "value", "No White Space Allowed in Action Value." );
        }
        if (this.component == null || this.component.getId() == null) {
            GValidator.rejectValue(result, "component.id", "Please Select a Component.");
        }

        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this);
        }
    }

    @Override
    public String info() {
        return this.name;
    }

    @Override
    public Action toModelBean() {
        Action po = new Action(this.id);
        po.setName(this.name);
        po.setValue(this.value);
        if (this.component != null && this.component.getId() != null) {
            po.setComponent(this.component);
        }
        po.setGroupList(this.groupList);
        return po;
    }
    public static ActionBean toBean(Action action) {
        if(action == null) return null;
        ActionBean bean = new ActionBean();
        bean.setId(action.getId());
        bean.setName(action.getName());
        bean.setValue(action.getValue());
        bean.setComponent(bean.getComponent());
        bean.setGroupList(bean.getGroupList());
        return bean;
    }

    //==================

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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public List<Group> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
    }

    public Component getComponent() {
        return component;
    }

    public void setComponent(Component component) {
        this.component = component;
    }
}
