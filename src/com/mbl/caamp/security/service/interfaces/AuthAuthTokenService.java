package com.mbl.caamp.security.service.interfaces;

import com.mbl.caamp.admin.model.WorkStation;
import com.mbl.caamp.security.bean.TokenBean;
import net.softengine.model.User;
import net.softengine.util.ActionResult;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

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

public interface AuthAuthTokenService {

    ActionResult sesaaAuthentication(TokenBean tokenBean, HttpServletRequest request);

    ActionResult authenticateAndLoadCredentials(TokenBean token, HttpServletRequest request);

    Map<String, Object> getAuthenticationToken(Object principal, WorkStation workStation);

    List<Long> getAuthorizations(User loggedUser);

    ActionResult getStaticSesaaResponse();

    ActionResult sesaaResponseByGET(TokenBean tokenBean) throws Exception;

    ActionResult sesaaResponseByPOST(TokenBean tokenBean) throws Exception;

}
