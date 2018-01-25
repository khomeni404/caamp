package com.mbl.caamp.security.service;

import com.mbl.caamp.admin.model.UserDetails;
import com.mbl.caamp.common.dao.DaoFactory;
import com.mbl.caamp.security.bean.PassChangeBean;
import com.mbl.caamp.security.dao.SecurityDAO;
import com.mbl.caamp.security.model.*;
import com.mbl.caamp.security.service.interfaces.SecurityService;
import net.softengine.service.Christopher;
import net.softengine.util.ActionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 21/11/2017 1:56 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 21/11/2017: 21/11/2017 1:56 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Service
@Transactional(propagation = Propagation.REQUIRED, readOnly = true, rollbackFor = Exception.class)
public class SecurityServiceImpl extends DaoFactory implements SecurityService {

    @Autowired
    public SecurityDAO securityDAO;

    @Override
    public List<Map<String, Object>> getGroupActionDataMapList(Long groupId) {
        Group group = commonDAO.get(Group.class, groupId);
        List<Long> assignedActionIds = securityDAO.getAssignedActionIdList(group);
        List<Component> componentList = commonDAO.search(Component.class, "project", group.getProject());

        List<Map<String, Object>> dataList = new ArrayList<>();
        Map<String, Object> dataMap;
        for (Component component : componentList) {
            dataMap = new HashMap<>();
            dataMap.put("component", component);
            List<Action> actions = commonDAO.search(Action.class, "component", component);
            List<Map<String, Object>> actionMapList = new ArrayList<>();
            Map<String, Object> actionMap;
            for (Action action : actions) {
                Long actionId = action.getId();
                boolean isAssigned = assignedActionIds.contains(actionId);
                actionMap = new HashMap<>();
                actionMap.put("checked", isAssigned ? "checked" : "");
                actionMap.put("action", action);
                actionMapList.add(actionMap);
            }
            dataMap.put("actionMapList", actionMapList);
            dataList.add(dataMap);

        }

        return dataList;
    }


    @Override
    public Map<Long, List<String>> getGroupActionListMap(Long projectId) {
        return securityDAO.getGroupActionListMap(projectId);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
    public ActionResult updatePassword(PassChangeBean passChangeBean) {
        ActionResult result = new ActionResult(false);
        UserDetails details = passChangeBean.getUserDetails();
        if (details == null) {
            return result.returnError("errors", "NO User Details Found !");
        }
        Token realToken = commonDAO.get(Token.class, "user", details.getUser());
        if (realToken == null) {
            return result.returnError("errors", "No token Found !");
        }

        String username = realToken.getUsername();
        Christopher christopher = new Christopher(username);
        String newPass = passChangeBean.getNewPassword();


        String realPass = christopher.decrypt(realToken.getPassword());
        String oldPass = passChangeBean.getOldPassword();
        String reNewPass = passChangeBean.getReNewPassword();

        // TODO... implement password strategy
        if (!oldPass.equals(realPass)) {
            return result.returnError("oldPassword", "Password Doesn't matched !");
        } else if (newPass.equals(realPass)) {
            return result.returnError("newPassword", "New Password should not be equal Old Password !");
        } else if (!newPass.equals(reNewPass)) {
            return result.returnError("reNewPassword", "This doesn't matched with \"New Password\"");
        }

        String encryptedNewPass = christopher.encrypt(newPass);
        realToken.setPassword(encryptedNewPass);
        boolean updated = commonDAO.update(realToken);
        if (updated) {
            result.setSuccess(true);
            result.setMsg("Password Changed Successfully.");
        }

        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
    public ActionResult resetPassword(PassChangeBean passChangeBean) {
        ActionResult result = new ActionResult(false);
        UserDetails details = passChangeBean.getUserDetails();
        if (details == null) {
            return result.returnError("errors", "NO User Details Found !");
        }
        Token realToken = commonDAO.get(Token.class, "user", details.getUser());
        if (realToken == null) {
            return result.returnError("errors", "No token Found !");
        }

        String username = realToken.getUsername();
        Christopher christopher = new Christopher(username);
        String newPass = passChangeBean.getNewPassword();

        String encryptedNewPass = christopher.encrypt(newPass);
        realToken.setPassword(encryptedNewPass);
        boolean updated = commonDAO.update(realToken);
        if (updated) {
            result.setSuccess(true);
            result.setMsg("Password Reset Successfully.");
        }

        return result;
    }
}