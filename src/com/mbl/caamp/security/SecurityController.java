package com.mbl.caamp.security;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mbl.caamp.admin.model.Project;
import com.mbl.caamp.admin.model.UserDetails;
import com.mbl.caamp.common.service.GenericController;
import com.mbl.caamp.security.bean.ActionBean;
import com.mbl.caamp.security.bean.GroupBean;
import com.mbl.caamp.security.bean.PassChangeBean;
import com.mbl.caamp.security.model.*;
import com.mbl.caamp.security.service.interfaces.SecurityService;
import com.mbl.caamp.util.Constants;
import net.softengine.util.ActionResult;
import net.softengine.util.GValidator;
import net.softengine.util.SessionUtil;
import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 16/06/2017 2:12 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 16/06: 16/06 2:12 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Controller
@RequestMapping("/security/")
public class SecurityController extends GenericController {
    @Autowired
    private SecurityService securityService;


    @RequestMapping(value = "/createAction.se")
    public ModelAndView createAction(Model model, @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Action", message));

        if (!model.containsAttribute(Constants.ACTION_BEAN)) {
            ActionBean actionBean = new ActionBean();
            model.addAttribute(Constants.ACTION_BEAN, actionBean);
        }

        List<Project> projectList = commonService.search(Project.class);
        Map<String, String> projectMap = projectList.stream().collect(Collectors.toMap(o -> o.getId().toString(), Project::getName));
        model.addAttribute("projectMap", projectMap);
        return new ModelAndView("/security/action_create");
    }

    @RequestMapping(value = "/saveAction.se", method = RequestMethod.POST)
    public ModelAndView saveAction(@ModelAttribute("actionBean") @Valid ActionBean actionBean,
                                   BindingResult result, RedirectAttributes attributes) throws IOException {
        actionBean.validate(result);
        if (result.hasErrors()) {
            addRedirectAttributes(actionBean, result, attributes);
            return new ModelAndView("redirect:/security/createAction.se");
        }
        // todo... Duplicate checking Action duplicate = commonService.get(Action.class, "value", )
        boolean saved = commonService.save(actionBean.toModelBean());
        String message = saved ? "Action Saved Successfully" : "Sorry System Problem";
        return new ModelAndView("redirect:/security/createAction.se?message=" + message);
    }

    @RequestMapping(value = "/createGroup.se")
    public ModelAndView createGroup(Model model, @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Group", message));

        if (!model.containsAttribute(Constants.GROUP_BEAN)) {
            GroupBean actionBean = new GroupBean();
            model.addAttribute(Constants.GROUP_BEAN, actionBean);
        }

        List<Project> projectList = commonService.search(Project.class);
        Map<String, String> projectMap = projectList.stream().collect(Collectors.toMap(o -> o.getId().toString(), Project::getName));
        model.addAttribute("projectMap", projectMap);
        return new ModelAndView("/security/group_create");
    }

    @RequestMapping(value = "/saveGroup.se", method = RequestMethod.POST)
    public ModelAndView saveGroup(@ModelAttribute @Valid GroupBean groupBean,
                                   BindingResult result, RedirectAttributes attributes) throws IOException {
        groupBean.validate(result);
        if (result.hasErrors()) {
            addRedirectAttributes(groupBean, result, attributes);
            return new ModelAndView("redirect:/security/createGroup.se");
        }
        // todo... Duplicate checking Action duplicate = commonService.get(Action.class, "value", )
        boolean saved = commonService.save(groupBean.toModelBean());
        String message = saved ? "Group Saved Successfully" : "Sorry System Problem";
        attributes.addAttribute("message", message);
        attributes.addAttribute("projectId", groupBean.getProject().getId());
        return new ModelAndView("redirect:/security/groupList.se");
    }

    @RequestMapping(value = "/groupList.se")
    public ModelAndView groupList(@RequestParam(required = false) String message,
                                  @RequestParam(required = false) Long userId,
                                  @RequestParam(required = false) Long projectId) throws IOException {
        Map<String, Object> map = getModelMap("Group List", message);
//        DetachedCriteria dc = DetachedCriteria.forClass(Action.class).add(Restrictions.isNull("parentAction"));
        List<Group> groupList = commonService.search(Group.class, "project", "id", projectId == null ? Constants.PROJECT_ID : projectId);
        //List<ActionBean> actionBeanList = actionList.stream().map(ActionBean::toBean).collect(Collectors.toList());
        map.put("groupList", groupList);
        map.put("projectId", projectId);
        return new ModelAndView("/security/group_list", map);
    }




    /**
     * Assigning Actions to Group
     *
     * @param message
     * @param groupId
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/actionList.se")
    public ModelAndView actionList(@RequestParam(required = false) String message,
                                   @RequestParam Long groupId) throws IOException {
        Map<String, Object> modelMap = getModelMap("Action List", message);
        Group group = commonService.get(Group.class, groupId);
        modelMap.put("group", group);
        List<Map<String, Object>> dataList = securityService.getGroupActionDataMapList(groupId);
        modelMap.put("dataList", dataList);
        return new ModelAndView("/security/action_list", modelMap);
    }

    @RequestMapping(value = "/assignActionToGroup.se", method = RequestMethod.POST)
    public ModelAndView assignActionToGroup(@RequestParam(required = false) String message,
                                            @RequestParam Long groupId,
                                            @RequestParam(required = false) String jsonArray) throws IOException {
        Map<String, Object> map = getModelMap("Action", message);

        Gson gson = new Gson();
        Type type = new TypeToken<List<Action>>() {
        }.getType();

        if (GValidator.isBlankOrNull(jsonArray)) {
            map.put("message", "All Actions removed Successfully");
            Group group = commonService.get(Group.class, groupId);
            group.setActionList(null);
            commonService.update(group);
        } else {
            List<Action> actionList = gson.fromJson("[" + jsonArray + "]", type);
            Group group = commonService.get(Group.class, groupId);
            group.setActionList(actionList);
            commonService.update(group);
            map.put("message", "Actions assigned Successfully");
        }

        map.put("groupId", groupId);
        return new ModelAndView("redirect:/security/actionList.se", map);
    }


    @RequestMapping(value = "/changePassword.se", method = RequestMethod.GET)
    public ModelAndView changePassword(Model model, @RequestParam(required = false) String employeeID) throws Exception {

        PassChangeBean passChangeBean;
        if (!model.containsAttribute(Constants.PASS_CHANGE_BEAN)) {
            passChangeBean = new PassChangeBean();
            UserDetails userDetails;
            if (GenericValidator.isBlankOrNull(employeeID)) {
                userDetails = commonService.get(UserDetails.class, "user", SessionUtil.getSessionUser());
                passChangeBean.setChangeType(Constants.CHANGE_TYPE_UPDATE);
            } else {
                userDetails = commonService.get(UserDetails.class, "employeeID", employeeID);
                passChangeBean.setChangeType(Constants.CHANGE_TYPE_RESET);
            }
            // User user = userDetails.getUser();
            passChangeBean.setUserDetails(userDetails);
            model.addAttribute(Constants.PASS_CHANGE_BEAN, passChangeBean);
        }
        return new ModelAndView("/security/change_password");

    }

    @RequestMapping(value = "/updatePassword.se", method = RequestMethod.POST)
    public ModelAndView updatePassword(@ModelAttribute @Valid PassChangeBean passChangeBean,
                                       BindingResult result, RedirectAttributes attributes) throws Exception {

        passChangeBean.validate(result);
        passChangeBean.validateForUpdate(result);
        String changeType = passChangeBean.getChangeType();
        if (Constants.CHANGE_TYPE_RESET.equals(changeType) && passChangeBean.getUserDetails() != null) {
            attributes.addAttribute("employeeID", passChangeBean.getUserDetails().getEmployeeID());
        }

        if (result.hasErrors()) {
            addRedirectAttributes(passChangeBean, result, attributes);
            return new ModelAndView("redirect:/security/changePassword.se");
        }

        ActionResult actionResult = securityService.updatePassword(passChangeBean);
        if (actionResult.isSuccess()) {
            attributes.addAttribute("message", actionResult.getMsg());
            return new ModelAndView("redirect:/admin/dashboard.se");
        } else {
            actionResult.copyError(result);
            addRedirectAttributes(passChangeBean, result, attributes);
            return new ModelAndView("redirect:/security/changePassword.se");
        }
    }

    @RequestMapping(value = "/resetPassword.se", method = RequestMethod.POST)
    public ModelAndView resetPassword(@ModelAttribute @Valid PassChangeBean passChangeBean,
                                      BindingResult result, RedirectAttributes attributes) throws Exception {
        passChangeBean.validate(result);
        passChangeBean.validateForReset(result);
        if (result.hasErrors()) {
            addRedirectAttributes(passChangeBean, result, attributes);
            return new ModelAndView("redirect:/security/changePassword.se");
        }

        ActionResult actionResult = securityService.resetPassword(passChangeBean);
        if (actionResult.isSuccess()) {
            attributes.addAttribute("message", actionResult.getMsg());
            return new ModelAndView("redirect:/admin/dashboard.se");
        } else {
            actionResult.copyError(result);
            addRedirectAttributes(passChangeBean, result, attributes);
            return new ModelAndView("redirect:/security/changePassword.se");
        }
    }
}
