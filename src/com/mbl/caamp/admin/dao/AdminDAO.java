package com.mbl.caamp.admin.dao;

import com.mbl.caamp.common.model.Properties;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * <br/> Date: 30/11/2017
 * </p>
 */
public interface AdminDAO {
    List<Properties> getPropertyGroupList(Integer groupCode);

    List<Long> getAssignedGroupIdList(Long userId);

    Object searchUser(DetachedCriteria dc);
}
