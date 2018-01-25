package com.mbl.caamp.common.bean;

import com.mbl.caamp.common.model.Occupation;
import net.softengine.util.GValidator;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.validator.GenericValidator;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.Encoder;
import org.springframework.validation.BindingResult;

import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 29/11/2017 10:59 AM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 29/11/2017: 29/11/2017 10:59 AM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

public class OccupationBean extends GenericBean {
    private Long id;

    @Size(min = 3, max = 100, message = "Name is required and within 3-100 char.")
    private String name;

    @Size(min = 7, max = 700, message = "Name is required and within 1-100 unicode char.")
    private String nameBN;

    private OccupationBean parentOccupation;


    private List<OccupationBean> childrenList = new ArrayList<>(0);


    @Override
    public void validate(BindingResult result) {
        if (parentOccupation == null || parentOccupation.getId() == null) {
            GValidator.rejectValue(result, "parentOccupation.id", "Parent Occupation is required");
        } else if (parentOccupation.getId() <= 0) {
            this.parentOccupation = null;
        }

        if (!GenericValidator.isBlankOrNull(nameBN)) { //&#2438;&#2478;&#2494;&#2480; &#2472;&#2494;&#2478;
            Encoder encoder = ESAPI.encoder();
            nameBN = encoder.encodeForHTML(nameBN);
            // Decode a few things to open security holes
            nameBN = nameBN.replaceAll("&amp;", "&").replaceFirst("&quot;", "\"").replaceAll("&#x23;", "#").replaceFirst("&#x3d;", "=").replaceAll("&#x3b;", ";");
            // Encode lower-case "on" and upper-case "on" to complicate the required attack vectors to pass
            nameBN = nameBN.replaceAll("on", "&#x6f;&#x6e;").replaceAll("ON", "&#x4f;&#x4e;");
            if (!ESAPI.validator().isValidInput("nameBN", nameBN.replaceAll("&#x","").replaceAll(";",""), "SafeString", 200, true)) {
               GValidator.rejectValue(result, "nameBN", "Only Unicode is acceptable");
            }
        }

        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this, Arrays.asList("nameBN"));
        }
    }

    @Override
    public String info() {
        return this.name;
    }

    @Override
    public Occupation toModelBean() {
        Occupation o = new Occupation();
        o.setId(this.id);
        o.setName(this.name);
        o.setNameBN(this.nameBN);
        if (parentOccupation != null && parentOccupation.getId() != null) {
            Occupation po = parentOccupation.toModelBean();
            o.setParentOccupation(po);
        } else {
            o.setParentOccupation(null);
        }
        return o;
    }


    public static OccupationBean toBean(Occupation po) {
        OccupationBean bean = new OccupationBean();
        bean.setId(po.getId());
        bean.setName(po.getName());
        bean.setNameBN(po.getNameBN());
        Occupation parent = po.getParentOccupation();
        if (po.getParentOccupation() != null) {
            OccupationBean parentBean = OccupationBean.toBean(parent);
            bean.setParentOccupation(parentBean);
        } else {
            bean.setParentOccupation(null);
        }
        return bean;
    }

    public static OccupationBean toBeanAndChildren(Occupation po) {
        OccupationBean bean = new OccupationBean();
        bean.setId(po.getId());
        bean.setName(po.getName());
        bean.setNameBN(po.getNameBN());
        List<Occupation> childrenList = po.getChildrenList();
        if (!CollectionUtils.isEmpty(childrenList)) {
            for (Occupation o : childrenList) {
                bean.getChildrenList().add(OccupationBean.toBean(o));
            }
        }
        return bean;
    }

    //===========================

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

    public String getNameBN() {
        return nameBN;
    }

    public void setNameBN(String nameBN) {
        this.nameBN = nameBN;
    }

    public OccupationBean getParentOccupation() {
        return parentOccupation;
    }

    public void setParentOccupation(OccupationBean parentOccupation) {
        this.parentOccupation = parentOccupation;
    }

    public List<OccupationBean> getChildrenList() {
        return childrenList;
    }

    public void setChildrenList(List<OccupationBean> childrenList) {
        this.childrenList = childrenList;
    }
}
