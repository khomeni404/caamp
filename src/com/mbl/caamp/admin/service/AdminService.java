package com.mbl.caamp.admin.service;

import com.mbl.caamp.admin.bean.UserSearchBean;
import com.mbl.caamp.common.bean.OccupationBean;
import com.mbl.caamp.common.model.Properties;
import com.mbl.caamp.admin.bean.UserDetailsBean;
import net.softengine.util.ActionResult;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
public interface AdminService {
    List<Properties> getPropertyGroupList(Integer groupCode);

    List<OccupationBean> getOccupationBeanList();

    ActionResult saveStaff(UserDetailsBean userDetailsBean);

    ActionResult updateStaff(UserDetailsBean userDetailsBean);

    Map<String, List<Map<String, String>>> getUserGroupDataMapList(Long userId);

    ArrayList searchUser(UserSearchBean searchBean);
}
