package com.mbl.caamp.security.dao;


import com.mbl.caamp.admin.model.Staff;
import com.mbl.caamp.security.bean.TokenBean;
import com.mbl.caamp.security.model.Action;
import com.mbl.caamp.security.model.Group;
import com.mbl.caamp.security.model.Token;
import com.mbl.caamp.admin.model.UserDetails;
import net.softengine.service.Christopher;
import net.softengine.model.User;
import net.softengine.util.ActionResult;
import org.apache.commons.collections.CollectionUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 07/12/2017 9.9 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 04/12/2017: 07/12/2017 9.9 PM
 * Current revision: 1.0.0: 1.1 $
 * </p>
 * Revision History:
 * ------------------
 */

@Repository
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public class SecurityDaoImpl implements SecurityDAO {

    @Autowired
    HibernateTemplate hibernateTemplate;

    @Override
    @SuppressWarnings("unchecked")
    public List<String> findAllActionNames(User loggedUser) {
        DetachedCriteria dc = DetachedCriteria.forClass(Action.class)
                .createAlias("groupList", "Group")
                .createAlias("Group.userList", "User")
                .setProjection(Projections.distinct(Projections.property("name")))
                .add(Restrictions.isNotNull("name"))
                .add(Restrictions.eq("User", loggedUser));

        hibernateTemplate.findByCriteria(dc);

        return new ArrayList<>();
    }

    @Override
    @SuppressWarnings("unchecked")
    public ActionResult getActiveUserDetails(Token realToken, TokenBean tokenBean) {
        ActionResult result = new ActionResult(false);

        if (realToken == null) {
            result.putError("username", "No Such Username Found !");
            return result;
        }
        String userPassword;
        if (!tokenBean.isEncrypted()) {
            Christopher christopher = new Christopher(tokenBean.getUsername());
            userPassword = christopher.encrypt(tokenBean.getPassword());
        } else {
            userPassword = tokenBean.getPassword();
        }

        if (!realToken.getPassword().equals(userPassword)) {
            result.putError("password", "Password doesn't matched !");
            return result;
        } else {
            User user = realToken.getUser();
            if (user.isActive()) {
                DetachedCriteria dc2 = DetachedCriteria.forClass(UserDetails.class)
                        .add(Restrictions.eq("user", user));
                List<UserDetails> dataList = (List<UserDetails>) hibernateTemplate.findByCriteria(dc2);
                if (!CollectionUtils.isEmpty(dataList)) {
                    UserDetails ud = dataList.get(0);
                   // ud.setUser(ud.getUser());
                    result.setDataObject(ud);
                    result.setSuccess(true);
                    return result;
                } else {
                    result.putError("username", "No Details Info found for this user !");
                    return result;
                }
            } else {
                result.putError("username", "This user State is inactive !");
                return result;
            }
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public User getUser(Token token) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Token.class)//.createAlias("user", "U")
                .setProjection(Projections.property("user"))
                .add(Restrictions.eq("username", token.getUsername()))
                .add(Restrictions.eq("password", token.getPassword()));
        List modelList = hibernateTemplate.findByCriteria(criteria);
        return CollectionUtils.isEmpty(modelList) ? null : (User) modelList.get(0);
    }

    @Override
    @SuppressWarnings("unchecked")
    public Staff getStaff(String employeeID) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Staff.class)
                .createAlias("staffDetails", "SD")
                .add(Restrictions.eq("SD.employeeID", employeeID));
        List modelList = hibernateTemplate.findByCriteria(criteria);
        return CollectionUtils.isEmpty(modelList) ? null : (Staff) modelList.get(0);
    }


    @Override
    @SuppressWarnings("unchecked")
    public UserDetails getStaffDetails(String employeeID) {
        DetachedCriteria criteria = DetachedCriteria.forClass(UserDetails.class)
                .add(Restrictions.eq("employeeID", employeeID));
        List modelList = hibernateTemplate.findByCriteria(criteria);
        return CollectionUtils.isEmpty(modelList) ? null : (UserDetails) modelList.get(0);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Long> getAssignedActionIdList(Group group) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Action.class)
                .createAlias("groupList", "Group")
                .setProjection(Projections.property("id"))
                .add(Restrictions.eq("Group.id", group.getId()));
        return (List<Long>) hibernateTemplate.findByCriteria(criteria);
    }

    @Override
    @SuppressWarnings("unchecked")
    public Map<Long, List<String>> getGroupActionListMap(Long projectId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Group.class)
                .createAlias("project", "Project")
                .setProjection(Projections.property("id"))
                .add(Restrictions.eq("Project.id", projectId));
        List<Long> groupIdList = (List<Long>) hibernateTemplate.findByCriteria(criteria);

        Map<Long, List<String>> groupListMap = new HashMap();
        for (Long groupId : groupIdList) {
            List<String> actionValueList = getActionValueList(groupId);
            groupListMap.put(groupId, actionValueList);
        }
        return groupListMap;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<String> getActionValueList(Long groupId) {
        DetachedCriteria dc = DetachedCriteria.forClass(Action.class)
                .createAlias("groupList", "Group")
                .setProjection(Projections.property("value"))
                .add(Restrictions.eq("Group.id", groupId));
        return (List<String>) hibernateTemplate.findByCriteria(dc);
    }
}
