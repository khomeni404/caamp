package com.mbl.caamp.admin.dao;

import com.mbl.caamp.common.model.Properties;
import com.mbl.caamp.security.model.Group;
import net.softengine.util.GValidator;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 30/11/2017 3:15 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on : 30/11/2017 3:15 PM
 * Current revision: : 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Repository
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public class AdminDaoImpl implements AdminDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;


    @Override
    @SuppressWarnings("unchecked")
    public List<Properties> getPropertyGroupList(Integer groupCode) {
        Long start = Long.valueOf(groupCode + "00");
        Long end = Long.valueOf(groupCode + "99");
        DetachedCriteria dc = DetachedCriteria.forClass(Properties.class)
                .add(Restrictions.and(
                        Restrictions.gt("id", start),
                        Restrictions.le("id", end)
                )).addOrder(Order.asc("coreKey"));
                //.add(Restrictions.be("id", groupCode.toString(), MatchMode.START));
        //dc.setResultTransformer(Transformers.aliasToBean(PropertyGroup.class));
        return (List<Properties>) hibernateTemplate.findByCriteria(dc);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Long> getAssignedGroupIdList(Long userId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Group.class)
                .createAlias("groupMemberList", "Mem")
                .setProjection(Projections.property("id"))
                .add(Restrictions.eq("Mem.id", userId));
        return (List<Long>) hibernateTemplate.findByCriteria(criteria);
    }

    public Object searchUser(DetachedCriteria dc) {
        return  hibernateTemplate.findByCriteria(dc);
    }
}
