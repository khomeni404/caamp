package com.mbl.caamp.security;


import com.google.gson.Gson;
import com.mbl.caamp.admin.bean.NewUserReqBean;
import com.mbl.caamp.admin.bean.ProjectBean;
import com.mbl.caamp.admin.model.NewUserReq;
import com.mbl.caamp.admin.model.Project;
import com.mbl.caamp.admin.model.Staff;
import com.mbl.caamp.admin.model.UserDetails;
import com.mbl.caamp.common.service.GenericController;
import com.mbl.caamp.security.bean.TokenBean;
import com.mbl.caamp.security.model.Token;
import com.mbl.caamp.security.service.AuthAuthTokenServiceImpl;
import com.mbl.caamp.security.service.interfaces.SecurityService;
import com.mbl.caamp.util.Constants;
import net.softengine.service.Christopher;
import net.softengine.util.ActionResult;
import net.softengine.util.GValidator;
import net.softengine.util.SessionUtil;
import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 07/12/2017 2:22 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 04/12/2017: 07/12/2017 2:22 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Controller
@RequestMapping("/auth/")
public class AuthenticationController extends GenericController {

    @Autowired
    public AuthAuthTokenServiceImpl authService;

    @Autowired
    public SecurityService securityService;

    @RequestMapping(value = "/login.se", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView login(Model model, @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Login", message));
        if (!model.containsAttribute(Constants.TOKEN_BEAN)) {
            TokenBean token = new TokenBean();
            // Default username and pass in developing mode
            token.setUsername("mak");
            token.setPassword("man");
            token.setUsername("jamil420");
            token.setPassword("jaMil@548");
            token.setBrCode("0125");
            model.addAttribute(Constants.TOKEN_BEAN, token);
        }

        if (!model.containsAttribute(Constants.NEW_USER_REQ_BEAN)) {
            NewUserReqBean bean = new NewUserReqBean();
            bean.setCell("01717659287");
            bean.setEmail("mak@pak.com");
            bean.setPhoneExt("458");
            bean.setEmployeeID("20180103001");
            bean.setDesignation("EO");
            bean.setPosting("MISD");
            model.addAttribute(Constants.NEW_USER_REQ_BEAN, bean);
        }

        if (!model.containsAttribute("dataTarget")) {
            model.addAttribute("dataTarget", "login-box");
        }
        return new ModelAndView("/home/staff_login");
    }

    @RequestMapping(value = "/authenticateUser.se", method = RequestMethod.POST)
    public ModelAndView authenticateUser(@ModelAttribute @Valid TokenBean tokenBean,
                                         BindingResult result, RedirectAttributes attributes, HttpServletRequest request) throws Exception {
        attributes.addAttribute("dataTarget", "login-box");
        tokenBean.validateStaffToken(result);
        if (result.hasErrors()) {
            addRedirectAttributes(tokenBean, result, attributes);
            return new ModelAndView("redirect:/auth/login.se");
        }
        tokenBean.setProjectId(Constants.PROJECT_ID);
        tokenBean.setSecretKey(Constants.SECRET_KEY);
        ActionResult actionResult = authService.sesaaAuthentication(tokenBean, request);
        if (actionResult.isSuccess()) {
            Object principal = actionResult.getDataObject();
            if (principal instanceof Staff) {
                //return new ModelAndView("redirect:/admin/dashboard.se?message=" + actionResult.getMsg());
                return new ModelAndView("redirect:/auth/appBoard.se?message=" + actionResult.getMsg());
            }
            return new ModelAndView("redirect:/");
        } else {
            actionResult.copyError(result);
            addRedirectAttributes(tokenBean, result, attributes);
            return new ModelAndView("redirect:/auth/login.se");
        }
    }

    @RequestMapping(value = "/authorizeUser.se", method = RequestMethod.GET)
    public ModelAndView authorizeUser(@ModelAttribute @Valid TokenBean tokenBean,
                                         BindingResult result, RedirectAttributes attributes, HttpServletRequest request) throws Exception {
        attributes.addAttribute("dataTarget", "login-box");
        tokenBean.validateStaffToken(result);
        if (result.hasErrors()) {
            addRedirectAttributes(tokenBean, result, attributes);
            return new ModelAndView("redirect:/auth/login.se");
        }
        // tokenBean.setProjectId(Constants.PROJECT_ID);
        tokenBean.setSecretKey(Constants.SECRET_KEY);
        tokenBean.setEncrypted(true);
        ActionResult actionResult = authService.sesaaAuthentication(tokenBean, request);
        if (actionResult.isSuccess()) {
            Object principal = actionResult.getDataObject();
            if (principal instanceof Staff) {
                return new ModelAndView("redirect:/admin/dashboard.se?message=" + actionResult.getMsg());
//                return new ModelAndView("redirect:/auth/appHome.se?message=" + actionResult.getMsg());
            }/* else if (principal instanceof  Vendor) {
                System.out.println("Vendor's are not authorized.");
            } else if (principal instanceof  SystemEngineer) {
                System.out.println("System Engineer's are not authorized.");
            }*/
            return new ModelAndView("redirect:/");
        } else {
            actionResult.copyError(result);
            addRedirectAttributes(tokenBean, result, attributes);
            return new ModelAndView("redirect:/auth/login.se");
        }
    }


    @RequestMapping(value = "/appBoard.se", method = RequestMethod.GET)
    public ModelAndView appBoard(@RequestParam(required = false) String message, Model model) {
        model.addAllAttributes(getModelMap("App Home", message));
        List<Project> projects = commonService.search(Project.class);
        model.addAttribute("projectList", projects);
        model.addAttribute("ProjectBean", new ProjectBean());
        return new ModelAndView("home/app_board");
    }

    @RequestMapping(value = "/autoLogin.se", method = RequestMethod.GET)
    public RedirectView autoLogin(@RequestParam Long projectId, HttpServletRequest request) {
        /*request.setAttribute(View.RESPONSE_STATUS_ATTRIBUTE, HttpStatus.TEMPORARY_REDIRECT);
        request.setAttribute("username", "01717659287");
        request.setAttribute("password", "4569287");
        request.setAttribute("brCode", "1007");*/
        Project project = commonService.get(Project.class, projectId);
        StringBuilder sb = new StringBuilder(project.getLoadBal());
        sb.append("/auth/authorizeUser.se");
        sb.append("?projectId=");
        sb.append(projectId);
        sb.append("&user.id=");
        sb.append(SessionUtil.getSessionUserId());
        Token token = commonService.get(Token.class, "user", SessionUtil.getSessionUser());
        sb.append("&username=");
        sb.append(token.getUsername());
        sb.append("&password=");
        sb.append(token.getPassword());
        return new RedirectView(new String(sb));
    }

    @RequestMapping(value = "/saveNewUserReq.se", method = RequestMethod.POST)
    public ModelAndView saveNewUserReq(@ModelAttribute @Valid NewUserReqBean newUserReqBean,
                                       BindingResult result, RedirectAttributes attributes) throws Exception {
        newUserReqBean.validate(result);
        attributes.addFlashAttribute("dataTarget", "new-user-req-box");
        if (result.hasErrors()) {
            return redirectErrorWithAttributes(newUserReqBean, result, attributes, "/auth/login.se");
        }
        NewUserReq duplicateRequest = commonService.getLight(NewUserReq.class, "employeeID", newUserReqBean.getEmployeeID(), Arrays.asList("id"));
        if (duplicateRequest != null) {
            GValidator.rejectValue(result, "employeeID", "Request of this ID been sent Already.");
            return redirectErrorWithAttributes(newUserReqBean, result, attributes, "/auth/login.se");
        }

        UserDetails duplicateUserDetails = commonService.getLight(UserDetails.class, "employeeID", newUserReqBean.getEmployeeID(), Arrays.asList("id"));
        if (duplicateUserDetails != null) {
            GValidator.rejectValue(result, "employeeID", "This ID Already registered.");
            return redirectErrorWithAttributes(newUserReqBean, result, attributes, "/auth/login.se");
        }
        boolean saved = commonService.save(newUserReqBean.toModelBean());
        attributes.addAttribute("message", saved ? "New User Request send Successfully." : "Sorry to save.");
        return new ModelAndView("redirect:/home/dashboard.se");

    }

    @RequestMapping(value = "/userAuthenticationService.se", method = RequestMethod.GET)
    public
    @ResponseBody
    String userAuthenticationService(@ModelAttribute @Valid TokenBean tokenBean, HttpServletRequest request) throws Exception {
        Gson gson = new Gson();
        ActionResult actionResult = new ActionResult(false);
        try {
            tokenBean.validateRemoteStaffToken(actionResult);
            if (actionResult.hasError()) {
                return gson.toJson(actionResult);
            }

            actionResult = authService.authenticateAndLoadCredentials(tokenBean, request);
            Object dataObject = actionResult.getDataObject();
            if (dataObject != null)
                actionResult.setDataObject(dataObject.getClass().getSimpleName());

            String secretKey = Constants.CONFIG.getPropertyValue("SECRET_KEY_PROJECT_".concat(tokenBean.getProjectId().toString()));
            Christopher c = new Christopher(secretKey);
            String data = gson.toJson(actionResult);
            data = c.encrypt(data);
            return data;
//            return ESAPI.encoder().canonicalize(data);
//            return gson.toJson(actionResult);
        } catch (Exception e) {
            return gson.toJson(new ActionResult(false, "Gson parse Exception from CAAMP."));
        }
    }


    @RequestMapping(value = "/projectAuthorizationService.se", method = RequestMethod.GET)
    public
    @ResponseBody
    String projectAuthorizationService(@RequestParam String key) throws Exception {
        if (!GenericValidator.isBlankOrNull(key)) {
            try {
//                Christopher christopher = new Christopher(SecurityConstants.PROJECT_ID_PASS_PHRASE);
//                Long projectId = Long.valueOf(christopher.decrypt(key.trim()));
                Map<Long, List<String>> actionListMap = securityService.getGroupActionListMap(Long.valueOf(key));
                Gson gson = new Gson();
                //return christopher.encrypt(gson.toJson(actionListMap));
                return gson.toJson(actionListMap);
            } catch (Exception e) {
                return "";
            }
        } else {
            return "";
        }
    }


}
