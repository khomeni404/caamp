package com.mbl.caamp.security.service;


import com.google.gson.Gson;
import com.mbl.caamp.admin.model.*;
import com.mbl.caamp.common.dao.CommonDAO;
import com.mbl.caamp.security.bean.TokenBean;
import com.mbl.caamp.security.dao.SecurityDAO;
import com.mbl.caamp.security.model.*;
import com.mbl.caamp.security.service.interfaces.AuthAuthTokenService;
import com.mbl.caamp.util.Constants;
import net.softengine.model.User;
import net.softengine.util.ActionResult;
import net.softengine.util.PropertyUtil;
import net.softengine.util.SecurityConstants;
import net.softengine.util.SecurityUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.util.stream.Collectors;

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
//@Transactional //(propagation = Propagation.REQUIRED, readOnly = true)
public class AuthAuthTokenServiceImpl implements AuthAuthTokenService {

    @Autowired
    public SecurityDAO securityDAO;

    @Autowired
    public CommonDAO commonDAO;


    /**
     * Core Method for Authenticate and Authorize an User
     * Inside this system Use "authenticateAndLoadCredentials(TokenBean tokenBean)"
     * From outside from this system use sesaaResponseByGET(TokenBean tokenBean)
     * or sesaaResponseByPOST(TokenBean tokenBean)
     *
     * @param tokenBean TokenBean
     * @param request   HttpServletRequest
     * @return ActionResult
     */
    public ActionResult sesaaAuthentication(TokenBean tokenBean, HttpServletRequest request) {
        ActionResult sesaaResponse;
        try {
             sesaaResponse = authenticateAndLoadCredentials(tokenBean, request);
            // ActionResult sesaaResponse = getStaticSesaaResponse();
            // ActionResult sesaaResponse = sesaaResponseByGET(tokenBean);
            // ActionResult sesaaResponse = sesaaResponseByPOST(tokenBean);
            if (sesaaResponse.isSuccess()) {
                SecurityUtil.setAuthenticationAndAuthorizationToken(sesaaResponse);
                sesaaResponse.setMsg("Logged in successfully");
            }
        } catch (Exception e) {
            sesaaResponse = new ActionResult(false);
            sesaaResponse.putError("errors", e.getMessage());
        }
        return sesaaResponse;
    }

    @SuppressWarnings("unchecked")
    @Override
    public ActionResult authenticateAndLoadCredentials(TokenBean tokenBean, HttpServletRequest request) {
        ActionResult actionResult;
        try {
            Project project = commonDAO.get(Project.class, tokenBean.getProjectId());
            Token realToken = commonDAO.get(Token.class, "username", tokenBean.getUsername());
            actionResult = verifySystemAccess(tokenBean, project, request);
            if (actionResult.hasError()) return actionResult;

            actionResult = securityDAO.getActiveUserDetails(realToken, tokenBean);
            if (actionResult.hasError()) return actionResult;

            UserDetails ud = (UserDetails) actionResult.getDataObject();
            User user = ud.getUser();
            actionResult.setDataObject(user);

            if (user instanceof Staff) {
                ((Staff) user).setGroupList(null);
                Map<String, Object> map = getAuthenticationToken(user, ud.getWorkStation());
                map.forEach(actionResult::put);
                actionResult.put(SecurityConstants.SESSION_USER_ASSIGNED_GROUPS, getAuthorizations(user));
                actionResult.setSuccess(Boolean.TRUE);
            } else {
                actionResult.setSuccess(Boolean.FALSE);
                actionResult.putError("username", "User is not Staff !");
            }

        } catch (Exception e) {
            actionResult = new ActionResult(Boolean.FALSE);
            actionResult.putError("errors", e.getMessage());
        }
        return actionResult;
    }


    /**
     * Getting Authentication Token for logged User
     *
     * @param principal
     * @param workStation
     */
    @Override
    @SuppressWarnings("unchecked")
    public Map<String, Object> getAuthenticationToken(Object principal, WorkStation workStation) {
        Map<String, Object> map = new HashMap<>();
        if (principal != null && principal instanceof User) {
            User loggedUser = (User) principal;
            map.put(SecurityConstants.SESSION_USER, loggedUser);
            map.put(SecurityConstants.SESSION_USER_ID, loggedUser.getId());
            if (principal instanceof Staff && workStation != null) {
                map.put(SecurityConstants.SESSION_USER_BRC, workStation.getCode());
                map.put(SecurityConstants.SESSION_USER_BRN, workStation.getName());
            } else {
                // Gossip with Khomeni
            }

            System.out.println("User's HttpSession initialized successfully.");
        }
        return map;
    }


    /**
     * Return Authorizations for Logged user
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<Long> getAuthorizations(User loggedUser) {
        /*List<String> actionNameList = securityDAO.findAllActionNames(loggedUser);
        // privilegeBeanList.stream().map(PrivilegeBean::getPrivilegeID).collect(Collectors.toList());
        session.setAttribute(SecurityConstants.SESSION_USER_GRANTED_ACTION_NAMES, actionNameList);
        System.out.println("User's HttpSession initialized successfully.");
        // session.setAttribute(SecurityConstants.SESSION_USER_GRANTED_MAPPINGS, new ArrayList<>());*/

        List<Group> groupList;
        if (loggedUser instanceof Staff) {
            groupList = commonDAO.search(Group.class, "groupMemberList", "id", loggedUser.getId());
        } else {
            groupList = new ArrayList<>(0);
        }
        if (!CollectionUtils.isEmpty(groupList)) {
            return groupList.stream().map(Group::getId).collect(Collectors.toList());
        } else {
            return new ArrayList<>();
        }

    }

    public ActionResult getStaticSesaaResponse() {
        String data = "{\"success\":true, \"dataObject\":\"Staff\",  \"msg\":\"Login Successfully\", \"map\":{\"session_user_id\":1,\"session_user_groups\":[1,3,4],\"session_user\":{\"id\":1,\"active\":true,\"name\":\"Masura Akter Joti\"}}}";
        Gson gson = new Gson();
        return gson.fromJson(data, ActionResult.class);
    }

    private ActionResult verifySystemAccess(TokenBean tokenBean, Project project, HttpServletRequest request) {
        ActionResult result = new ActionResult(false);
        try {
            String remoteIP = request.getHeader("X-FORWARDED-FOR");
            if (GenericValidator.isBlankOrNull(remoteIP)) {
                remoteIP = request.getRemoteAddr();
            }
            if (project == null) {
                return result.returnError("errors", "This Project is not Registered with CAAMP.");
            }
            List<String> ipAddressList = project.getServerIPList();
            if (CollectionUtils.isEmpty(ipAddressList) || GenericValidator.isBlankOrNull(remoteIP)) {
                return result.returnError("errors", " No associated Server IP address found with the Project");
            } else if (!ipAddressList.contains(remoteIP)) {
                return result.returnError("errors", "No Access ! Requested from an Unauthorized source/machine.");
            }

            String secretKey = PropertyUtil.getInstance("local-config").getPropertyValue("SECRET_KEY_PROJECT_101");
            if (secretKey.equals(tokenBean.getSecretKey())) {
                result.setSuccess(true);
                return result;
            } else {
                return result.returnError("errors", "Unauthorized Access.");
            }
        } catch (Exception e) {
            result = new ActionResult(false);
            result.setMsg("Developer Msg: " + e.getMessage());
            result.putError("errors", "System Failed !.");
            return result;
        }

    }

    public ActionResult sesaaResponseByGET(TokenBean tokenBean) throws Exception {
        String USER_AGENT = "Mozilla/5.0";
        String url = Constants.CAAMP_URL + "/auth/authenticateUserService.se?username=" + tokenBean.getUsername() + "&password=" + tokenBean.getPassword();

        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // optional default is GET
        con.setRequestMethod("GET");

        //add request header
        con.setRequestProperty("User-Agent", USER_AGENT);

        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'GET' request to URL : " + url);
        System.out.println("Response Code : " + responseCode);

        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        //print result
        String data = response.toString();
        Gson gson = new Gson();
        return gson.fromJson(data, ActionResult.class);
    }

    public ActionResult sesaaResponseByPOST(TokenBean tokenBean) throws Exception {
        String USER_AGENT = "Mozilla/5.0";
        String url = Constants.CAAMP_URL + "/auth/authenticateUserService.se";
        String urlParameters = "username=" + tokenBean.getUsername() + "&password=" + tokenBean.getPassword();

        URL obj = new URL(url);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

        //add reuqest header
        con.setRequestMethod("POST");
        con.setRequestProperty("User-Agent", USER_AGENT);
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

        // Send post request
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + urlParameters);
        System.out.println("Response Code : " + responseCode);

        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        //print result
        String data = response.toString();
        Gson gson = new Gson();
        return gson.fromJson(data, ActionResult.class);
    }

}
