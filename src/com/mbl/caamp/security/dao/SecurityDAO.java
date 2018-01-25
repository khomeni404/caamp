package com.mbl.caamp.security.dao;

import com.mbl.caamp.admin.model.Staff;
import com.mbl.caamp.security.bean.TokenBean;
import com.mbl.caamp.security.model.Group;
import com.mbl.caamp.security.model.Token;
import com.mbl.caamp.admin.model.UserDetails;
import net.softengine.model.User;
import net.softengine.util.ActionResult;

import java.util.List;
import java.util.Map;

/**
 * @author Khomeni
 *         Created on : 17-May-17 at 9:08 PM
 */


public interface SecurityDAO {
    List<String> findAllActionNames(User loggedUser);

    ActionResult getActiveUserDetails(Token realToken, TokenBean tokenBean);

    User getUser(Token token);

    Staff getStaff(String casmUserOID);

    UserDetails getStaffDetails(String employeeID);

    List<Long> getAssignedActionIdList(Group group);

    Map<Long, List<String>> getGroupActionListMap(Long projectId);

    List<String> getActionValueList(Long groupId);


}
