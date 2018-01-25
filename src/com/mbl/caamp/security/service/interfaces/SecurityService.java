package com.mbl.caamp.security.service.interfaces;

import com.mbl.caamp.security.bean.PassChangeBean;
import net.softengine.util.ActionResult;

import java.util.List;
import java.util.Map;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 09/12/2017 9:17 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 09/12/2017: 09/12/2017 9:17 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */


public interface SecurityService {
    List<Map<String, Object>> getGroupActionDataMapList(Long groupId);

    Map<Long, List<String>> getGroupActionListMap(Long projectId);

    ActionResult updatePassword(PassChangeBean passChangeBean);

    ActionResult resetPassword(PassChangeBean passChangeBean);
}
