package com.mbl.caamp.admin.service;

import com.mbl.caamp.admin.bean.UserSearchBean;
import com.mbl.caamp.admin.model.NewUserReq;
import com.mbl.caamp.admin.model.Staff;
import com.mbl.caamp.common.bean.OccupationBean;
import com.mbl.caamp.common.dao.DaoFactory;
import com.mbl.caamp.common.model.Occupation;
import com.mbl.caamp.common.model.Properties;
import com.mbl.caamp.admin.bean.UserDetailsBean;
import com.mbl.caamp.security.model.Group;
import com.mbl.caamp.admin.model.Project;
import com.mbl.caamp.admin.model.UserDetails;
import com.mbl.caamp.security.model.Token;
import net.softengine.model.User;
import net.softengine.util.ActionResult;
import net.softengine.util.GValidator;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 22/11/2017 3:22 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 22/11/2017: 22/11/2017 3:22 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class AdminServiceImpl extends DaoFactory implements AdminService {

    @Override
    public List<Properties> getPropertyGroupList(Integer groupCode) {
        return adminDAO.getPropertyGroupList(groupCode);
    }

    @Override
    public List<OccupationBean> getOccupationBeanList() {
        DetachedCriteria dc = DetachedCriteria.forClass(Occupation.class).add(Restrictions.isNull("parentOccupation"));
        List<Occupation> occupationList = commonDAO.search(dc);
        return occupationList.stream().map(OccupationBean::toBeanAndChildren).collect(Collectors.toList());

    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public ActionResult saveStaff(UserDetailsBean userDetailsBean) {
        ActionResult actionResult = new ActionResult(false);
        User staffBean = userDetailsBean.getUser();
        Staff staffPO = new Staff();
        staffPO.setStatus(staffBean.getStatus());
        staffPO.setShortName(userDetailsBean.getShortName());
        staffPO.setName(staffBean.getName());

        staffPO.setGroupList(null);
        boolean saved = commonDAO.save(staffPO);

        if (saved) {
            UserDetails userDetails = userDetailsBean.toUserDetails();
            userDetails.setUser(staffPO);
            saved = commonDAO.save(userDetails);
            actionResult.setDataObject(userDetails.getId());
        }

        if (saved) {
            Token token = new Token(userDetailsBean.getUsername(), userDetailsBean.getPassword());
            token.setUser(staffPO);
            saved = commonDAO.save(token);
        }
        if (saved) {
            NewUserReq userReq = commonDAO.get(NewUserReq.class, "employeeID", userDetailsBean.getEmployeeID());
            if (userReq != null) {
                commonDAO.delete(userReq);
            }
        }
        actionResult.setSuccess(saved);
        return actionResult;
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public ActionResult updateStaff(UserDetailsBean userDetailsBean) {
        ActionResult actionResult = new ActionResult(false);

        User staffBean = userDetailsBean.getUser();
        Staff staffPO = new Staff();
        staffPO.setId(staffBean.getId());
        staffPO.setStatus(staffBean.getStatus());
        staffPO.setShortName(userDetailsBean.getShortName());
        staffPO.setName(staffBean.getName());

        staffPO.setGroupList(null);
        boolean saved = commonDAO.update(staffPO);

        if (saved) {
            UserDetails userDetails = userDetailsBean.toUserDetails();
            userDetails.setUser(staffPO);
            saved = commonDAO.update(userDetails);
        }

        actionResult.setSuccess(saved);
        return actionResult;

    }

    @Override
    public Map<String, List<Map<String, String>>> getUserGroupDataMapList(Long userId) {
        Map<String, List<Map<String, String>>> map = new HashMap<>();
        List<Project> projectList = commonDAO.search(Project.class);
        for (Project p : projectList) {
            List<Long> assignedGroupIds = adminDAO.getAssignedGroupIdList(userId);
            List<Group> groupList = commonDAO.search(Group.class, "project", p);

            List<Map<String, String>> dataList = new ArrayList<>();
            Map<String, String> dataMap;
            for (Group group : groupList) {
                dataMap = new HashMap<>();
                Long groupId = group.getId();
                dataMap.put("id", groupId.toString());
                dataMap.put("name", group.getName());
                boolean isAssigned = assignedGroupIds.contains(groupId);
                dataMap.put("checked", isAssigned ? "checked" : "");
                dataList.add(dataMap);
            }
            map.put(p.getName(), dataList);
        }
        return map;
    }

    @Override
    public ArrayList searchUser(UserSearchBean searchBean) {
        DetachedCriteria dc = DetachedCriteria.forClass(UserDetails.class);
        dc.createAlias("workStation", "WS");
        dc.createAlias("user", "User");
        dc.setProjection(Projections.projectionList()
                        .add(Projections.property("id").as("ID"))
                        .add(Projections.property("employeeID").as("EMP_ID"))
                        .add(Projections.property("User.name").as("NAME"))
                        .add(Projections.property("User.status").as("STATUS"))
                        .add(Projections.property("cell").as("CELL"))
                        .add(Projections.property("WS.code").as("WS_CODE"))
                        .add(Projections.property("WS.name").as("WS_NAME"))
                        .add(Projections.property("WS.alias").as("WS_ALIAS"))
        );

        String employeeID = searchBean.getEmployeeID();
        if (!GValidator.isBlankOrNull(employeeID)) {
            dc.add(Restrictions.like("employeeID", employeeID, MatchMode.ANYWHERE));
        }

        String name = searchBean.getName();
        if (!GValidator.isBlankOrNull(name)) {
            dc.add(Restrictions.like("User.name", name, MatchMode.ANYWHERE));
        }

        String cell = searchBean.getCell();
        if (!GValidator.isBlankOrNull(cell)) {
            dc.add(Restrictions.like("cell", cell, MatchMode.ANYWHERE));
        }

        String workStation = searchBean.getWorkStation();
        if (!GValidator.isBlankOrNull(workStation)) {
            dc.add(Restrictions.or(
                    Restrictions.like("WS.code", workStation, MatchMode.ANYWHERE),
                    Restrictions.like("WS.name", workStation, MatchMode.ANYWHERE)
            ));

        }
        return (ArrayList) adminDAO.searchUser(dc.setResultTransformer(DetachedCriteria.ALIAS_TO_ENTITY_MAP));
    }
}
