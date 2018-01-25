package com.mbl.caamp.admin;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mbl.caamp.admin.bean.ProjectBean;
import com.mbl.caamp.admin.bean.UserSearchBean;
import com.mbl.caamp.admin.bean.WorkStationBean;
import com.mbl.caamp.admin.model.*;
import com.mbl.caamp.common.bean.DocumentBean;
import com.mbl.caamp.common.model.*;
import com.mbl.caamp.common.model.Properties;
import com.mbl.caamp.common.service.GenericController;
import com.mbl.caamp.admin.bean.UserDetailsBean;
import com.mbl.caamp.security.model.Group;
import com.mbl.caamp.security.model.Token;
import com.mbl.caamp.util.Constants;
import net.softengine.model.User;
import net.softengine.util.ActionResult;
import net.softengine.util.GValidator;
import net.softengine.util.SessionUtil;
import org.apache.commons.collections.CollectionUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.support.BindingAwareModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc. (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 23/08/2017 3:15 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 23/08/2017: 23/08/2017 3:15 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */
@Controller
@RequestMapping("/admin/")
public class AdminController extends GenericController {
    @RequestMapping(value = "/dashboard.se")
    private ModelAndView dashboard(Model model, @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Dashboard", message));
        return new ModelAndView("/template/admin/ad_dashboard");
    }

    @RequestMapping(value = "/createStaff.se")
    public ModelAndView createStaff(Model model,
                                    @RequestParam(required = false) Long newUserReqId,
                                    @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Staff", message));

        if (!model.containsAttribute(Constants.USER_DETAILS_BEAN)) {
            UserDetailsBean bean = new UserDetailsBean();
            /*bean.setEmployeeID("20180103001");
            User user = new User();
            user.setName("M. Jamil Hossain Khan");
            user.setActive(true);
            bean.setUser(user);
            bean.setShortName("J.Khan");
            bean.setCell("01717569999");
            bean.setUsername("jamil420");
            bean.setPassword("jaMil@548");
            bean.setDesignation(new Designation(13L));*/


            if (newUserReqId != null) {
                NewUserReq nur = commonService.get(NewUserReq.class, newUserReqId);
                User u = new User();
                u.setName(nur.getFullName());
                bean.setUser(u);
                bean.setEmployeeID(nur.getEmployeeID());
                bean.setCell(nur.getCell());
                bean.setEmail(nur.getEmail());
                bean.setPhoneExt(nur.getPhoneExt());
                model.addAttribute("posting", nur.getPosting());
                model.addAttribute("designation", nur.getDesignation());
            }
            model.addAttribute(Constants.USER_DETAILS_BEAN, bean);
        }

        List<WorkStation> brList = commonService.search(WorkStation.class);
        Map<String, String> workStationMap = brList.stream().collect(Collectors.toMap(WorkStation::getCode, WorkStation::info));
        model.addAttribute("workStationMap", workStationMap);

        List<Designation> designationList = commonService.search(Designation.class);
        Map<String, String> designationMap = designationList.stream().collect(Collectors.toMap(Designation::getIdS, Designation::info));
        model.addAttribute("designationMap", designationMap);
        model.addAttribute("statusMap", Constants.USER_STATUS_MAP);



        return new ModelAndView("/admin/staff_create");
    }

    @RequestMapping(value = "/saveStaff.se", method = RequestMethod.POST)
    public ModelAndView saveStaff(@ModelAttribute("userDetailsBean") @Valid UserDetailsBean userDetailsBean,
                                  BindingResult result, RedirectAttributes attributes) throws IOException {
        userDetailsBean.validate(result);
        if (result.hasErrors()) {
            addRedirectAttributes(userDetailsBean, result, attributes);
            return new ModelAndView("redirect:/admin/createStaff.se");
        }

        UserDetails duplicate = commonService.getLight(UserDetails.class, "employeeID", userDetailsBean.getEmployeeID(), Arrays.asList("id"));
        if (duplicate != null) {
            GValidator.rejectValue(result, "employeeID", "Already Used");
            addRedirectAttributes(userDetailsBean, result, attributes);
            return new ModelAndView("redirect:/admin/createStaff.se");
        }

        Token duplicateToken = commonService.getLight(Token.class, "username", userDetailsBean.getUsername(), Arrays.asList("id"));
        if (duplicateToken != null) {
            GValidator.rejectValue(result, "username", "Already Used");
            addRedirectAttributes(userDetailsBean, result, attributes);
            return new ModelAndView("redirect:/admin/createStaff.se");
        }
        ActionResult saved = adminService.saveStaff(userDetailsBean);// commonService.save(member);
        String message = saved.isSuccess() ? "Staff Saved Successfully" : "Sorry System Problem";
        attributes.addAttribute("message", message);
        attributes.addAttribute("id", saved.getDataObject());
        return new ModelAndView("redirect:/admin/viewUserDetails.se");
    }

    @RequestMapping(value = "/editStaff.se")
    public ModelAndView editStaff(Model model, @RequestParam(required = false) String message, @RequestParam Long id) {
        model.addAllAttributes(getModelMap("Staff", message));

        if (!model.containsAttribute(Constants.USER_DETAILS_BEAN)) {
            UserDetailsBean actionBean = UserDetailsBean.toUserDetailsBean(commonService.get(UserDetails.class, id));
            model.addAttribute(Constants.USER_DETAILS_BEAN, actionBean);
        }

        List<WorkStation> brList = commonService.search(WorkStation.class);
        Map<String, String> workStationMap = brList.stream().collect(Collectors.toMap(WorkStation::getCode, WorkStation::info));
        model.addAttribute("workStationMap", workStationMap);

        List<Designation> designationList = commonService.search(Designation.class);
        Map<String, String> designationMap = designationList.stream().collect(Collectors.toMap(Designation::getIdS, Designation::info));
        model.addAttribute("designationMap", designationMap);
        model.addAttribute("statusMap", Constants.USER_STATUS_MAP);
        return new ModelAndView("/admin/staff_edit");
    }

    @RequestMapping(value = "/updateStaff.se", method = RequestMethod.POST)
    public ModelAndView updateStaff(@ModelAttribute("userDetailsBean") @Valid UserDetailsBean userDetailsBean,
                                    BindingResult result, RedirectAttributes attributes) throws IOException {
        userDetailsBean.validate(result);
        attributes.addAttribute("id", userDetailsBean.getId());
        if (result.hasErrors()) {
            addRedirectAttributes(userDetailsBean, result, attributes);
            return new ModelAndView("redirect:/admin/editStaff.se");
        }

        UserDetails duplicate = commonService.getLight(UserDetails.class, "employeeID", userDetailsBean.getEmployeeID(), Arrays.asList("id"));
        if (duplicate != null && !duplicate.getId().equals(userDetailsBean.getId())) {
            GValidator.rejectValue(result, "employeeID", "This ID Already Used");
            addRedirectAttributes(userDetailsBean, result, attributes);
            return new ModelAndView("redirect:/admin/editStaff.se");
        }

        ActionResult saved = adminService.updateStaff(userDetailsBean); // new ActionResult(false); //

        String message = saved.isSuccess() ? "Staff Updated Successfully" : "Sorry System Problem";
        attributes.addAttribute("message", message);
        attributes.addAttribute("id", userDetailsBean.getId());
        return new ModelAndView("redirect:/admin/viewUserDetails.se");
    }


    @RequestMapping(value = "/searchUser.se")
    public ModelAndView searchUser(@RequestParam(required = false) String message, Model model) {
        model.addAllAttributes(getModelMap("Search User", message));

        if (!model.containsAttribute(Constants.USER_SEARCH_BEAN)) {
            UserSearchBean bean = new UserSearchBean();
            bean.setEmployeeID("003");
            model.addAttribute(Constants.USER_SEARCH_BEAN, bean);
        }
        return new ModelAndView("/admin/staff_search");
    }

    @RequestMapping(value = "/userList.se", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView userList(@RequestParam(required = false) String message,
                                 @ModelAttribute("userDetailsBean") @Valid UserSearchBean userDetailsBean,
                                 BindingResult result, RedirectAttributes attributes, Model model) {
        userDetailsBean.validateSearchCriteria(result);
        if (result.hasErrors()) {
            addRedirectAttributes(userDetailsBean, result, attributes);
            return new ModelAndView("redirect:/admin/searchUser.se");
        }
        model.addAllAttributes(getModelMap("Search User", message));
        ArrayList resultList = adminService.searchUser(userDetailsBean);

        //UserDetails userDetails = commonService.get(UserDetails.class, "employeeID", userDetailsBean.getEmployeeID());
        if (CollectionUtils.isEmpty(resultList)) {
            GValidator.rejectValue(result, "employeeID", "Employee Not Found ! <br>This can be happen if concern employee doesn't registered with CAAMP.");
        }
        if (result.hasErrors()) {
            addRedirectAttributes(userDetailsBean, result, attributes);
            return new ModelAndView("redirect:/admin/searchUser.se");
        }

        if (resultList.size() == 1) {
            return new ModelAndView("redirect:/admin/viewUserDetails.se?id=" + ((Map) resultList.get(0)).get("ID"));
        } else {
            model.addAttribute(Constants.USER_SEARCH_BEAN, userDetailsBean);
            model.addAttribute("resultList", resultList);
            return new ModelAndView("/admin/staff_search");
        }

    }
    @RequestMapping(value = "/newUserReqList.se")
    public ModelAndView newUserReqList(@RequestParam(required = false) String message, Model model) {
        model.addAllAttributes(getModelMap("New User Req.", message));

        List newUserReqList = commonService.search(NewUserReq.class);
        model.addAttribute("newUserReqList", newUserReqList);
        return new ModelAndView("/admin/new_user_req_list");
    }

    @RequestMapping(value = "/viewUserDetails.se", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView viewUserDetails(@RequestParam(required = false) String message,
                                        @RequestParam(required = false) Long id,
                                        @RequestParam(required = false) String employeeID,
                                        Model model) {
        model.addAllAttributes(getModelMap("View User", message));
        UserDetails userDetails;
        if (id != null) {
            userDetails = commonService.get(UserDetails.class, id);
        }else if (!GValidator.isBlankOrNull(employeeID)) {
            userDetails = commonService.get(UserDetails.class, "employeeID", employeeID);
        } else {
            userDetails = commonService.get(UserDetails.class, "user", SessionUtil.getSessionUser());
        }
        model.addAttribute("userDetails", userDetails);
        return new ModelAndView("/admin/staff_view");
    }

    @RequestMapping(value = "/viewUserGroups.se")
    public ModelAndView viewUserGroups(@RequestParam(required = false) String message,
                                       @RequestParam(required = false) Long staffId) throws IOException {
        Map<String, Object> modelMap = getModelMap("Group List", message);
        Staff staff = commonService.get(Staff.class, staffId);
        modelMap.put("staff", staff);
        Map<String, List<Map<String, String>>> dataList = adminService.getUserGroupDataMapList(staffId);
        modelMap.put("dataListMap", dataList);
        return new ModelAndView("admin/staff_groups", modelMap);
    }

    @RequestMapping(value = "/updateUserGroups.se", method = RequestMethod.POST)
    public ModelAndView updateUserGroups(@RequestParam(required = false) String message,
                                         @RequestParam Long staffId,
                                         @RequestParam String jsonArray) throws IOException {
        Map<String, Object> map = getModelMap("Group of User", message);
        Gson gson = new Gson();
        Type type = new TypeToken<List<Group>>() {
        }.getType();
        List<Group> groupList = gson.fromJson("[" + jsonArray + "]", type);
        Staff member = commonService.get(Staff.class, staffId);
        member.setGroupList(groupList);
        commonService.update(member);
        map.put("message", "Groups been assigned successfully.");
        map.put("staffId", staffId);
        return new ModelAndView("redirect:/admin/viewUserGroups.se", map);
    }

    @RequestMapping(value = "/propertyGroupList.se")
    public ModelAndView propertyGroupList(@RequestParam(required = false) String message) {
        Map<String, Object> map = getModelMap("Property", message);
        Map<String, String> propertyGroupMap = new HashMap<>();
        Constants.PROPERTY_GROUP_TYPES.forEach((k, v) -> propertyGroupMap.put(k.toString(), v));
        map.put("propertyGroupMap", propertyGroupMap);
        return new ModelAndView("/admin/property_group_list", map);
    }


    @RequestMapping(value = "/createWorkStation.se")
    public ModelAndView createWorkStation(Model model, @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Staff", message));

        if (!model.containsAttribute(Constants.WORK_STATION_BEAN)) {
            WorkStationBean bean = new WorkStationBean();
            bean.setCode("D784");
            bean.setName("Legal Affairs Division");
            model.addAttribute(Constants.WORK_STATION_BEAN, bean);
        }

        List<WorkStation> stationList = commonService.search(WorkStation.class);
        model.addAttribute("stationList", stationList);

        List<Institute> instituteList = commonService.search(Institute.class);
        Map<String, String> instituteMap = instituteList.stream().collect(Collectors.toMap(Institute::getIdS, Institute::getName));
        model.addAttribute("instituteMap", instituteMap);

        Map<String, String> typeMap = new HashMap<>();
        String branchDV = new Branch().getDiscriminatorValue();
        typeMap.put(branchDV, branchDV);
        String divisionDV = new Division().getDiscriminatorValue();
        typeMap.put(divisionDV, divisionDV);
        String wsDV = new WorkStation().getDiscriminatorValue();
        typeMap.put(wsDV, wsDV);
        model.addAttribute("typeMap", typeMap);

        return new ModelAndView("/admin/work_station_create");
    }

    @RequestMapping(value = "/saveWorkStation.se", method = RequestMethod.POST)
    public ModelAndView saveWorkStation(@ModelAttribute("workStationBean") @Valid WorkStationBean workStationBean,
                                        BindingResult result, RedirectAttributes attributes) throws IOException {
        workStationBean.validate(result);
        if (result.hasErrors()) {
            addRedirectAttributes(workStationBean, result, attributes);
            return new ModelAndView("redirect:/admin/createWorkStation.se");
        }
        Boolean saved;
        try {
            saved = commonService.save(workStationBean.toModelBean());
        } catch (DataIntegrityViolationException e) {
            GValidator.rejectValue(result, "code", "This code Already Used");
            addRedirectAttributes(workStationBean, result, attributes);
            return new ModelAndView("redirect:/admin/createWorkStation.se");
        }
        String message = saved ? "Work Station Saved Successfully" : "Sorry System Problem";
        attributes.addAttribute("success", saved);
        attributes.addAttribute("message", message);
        return new ModelAndView("redirect:/admin/createWorkStation.se");
    }


    @RequestMapping(value = "/createProject.se")
    public ModelAndView createProject(Model model,
                                      @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Project Create", message));
        ProjectBean projectBean;
        if (!model.containsAttribute(Constants.PROJECT_BEAN)) {
            projectBean = new ProjectBean();
            model.addAttribute(Constants.PROJECT_BEAN, projectBean);
        }

        List<Long> mandatoryDocList = Arrays.asList(Constants.APPLICANT_PHOTO_INDICATOR_ID/*, other defaults if need*/);
        List<Map<String, Object>> docIndicatorMapList = new ArrayList<>();
        Map<String, Object> docIndicatorMap;

        DetachedCriteria dc = DetachedCriteria.forClass(Properties.class)
                .add(Restrictions.and(
                        Restrictions.ge("id", Long.valueOf(Constants.DOC_INDICATOR + "00")),
                        Restrictions.lt("id", Long.valueOf(Constants.DOC_INDICATOR + "99"))
                )).addOrder(Order.asc("id"));
        List<Properties> propertiesList = commonService.search(dc);
        for (Properties prop : propertiesList) {
            docIndicatorMap = new HashMap<>();
            docIndicatorMap.put("properties", prop);
            docIndicatorMap.put("checked", mandatoryDocList.contains(prop.getId()) ? "checked" : "");
            docIndicatorMapList.add(docIndicatorMap);
        }
        model.addAttribute("docIndicatorMapList", docIndicatorMapList);

        return new ModelAndView("/admin/project_create");
    }

    @RequestMapping(value = "/saveProject.se", method = RequestMethod.POST)
    public ModelAndView saveProject(@ModelAttribute("projectBean") @Valid ProjectBean projectBean,
                                    BindingResult result, RedirectAttributes attributes) {
        projectBean.validate(result);
        if (result.hasErrors()) {
            addRedirectAttributes(projectBean, result, attributes);
            return new ModelAndView("redirect:/admin/createProject.se");
        }
        boolean updated = commonService.save(projectBean.toModelBean());
        Map<String, Object> map = new HashMap<>();
        map.put("id", projectBean.getId());
        map.put("message", updated ? "Project Updated Successfully" : "Sorry for this time");
        return new ModelAndView("redirect:/admin/projectList.se", map);
    }


    @RequestMapping(value = "/projectList.se")
    public ModelAndView projectList(@RequestParam(required = false) String message) {
        Map<String, Object> map = getModelMap("Project List", message);
        List<Project> projects = commonService.search(Project.class);
        map.put("projectList", projects);
        return new ModelAndView("/admin/project_list", map);
    }


    @RequestMapping(value = "/viewProject.se")
    public ModelAndView viewProject(@RequestParam(required = false) String message,
                                    @RequestParam Long id) {
        Map<String, Object> map = getModelMap("Project View", message);
        Project project = commonService.get(Project.class, id);
        map.put("project", project);
        return new ModelAndView("/admin/project_view", map);
    }

    @RequestMapping(value = "/editProject.se")
    public ModelAndView editProject(@RequestParam String id, Model model,
                                    @RequestParam(required = false) String message) {
        model.addAllAttributes(getModelMap("Project Edit", message));
        ProjectBean projectBean;
        if (!model.containsAttribute(Constants.PROJECT_BEAN)) {
            projectBean = ProjectBean.toBean(commonService.get(Project.class, id));
            model.addAttribute(Constants.PROJECT_BEAN, projectBean);
        } else {
            projectBean = (ProjectBean) ((BindingAwareModelMap) model).get(Constants.PROJECT_BEAN);
        }
        List<String> mandatoryDocList = null;// projectBean.getMandatoryDocList();
        List<Map<String, Object>> docIndicatorMapList = new ArrayList<>();
        Map<String, Object> docIndicatorMap;

        DetachedCriteria dc = DetachedCriteria.forClass(Properties.class)
                .add(Restrictions.and(
                        Restrictions.ge("id", Long.valueOf(Constants.DOC_INDICATOR + "00")),
                        Restrictions.lt("id", Long.valueOf(Constants.DOC_INDICATOR + "99"))
                )).addOrder(Order.asc("id"));
        List<Properties> propertiesList = commonService.search(dc);
        for (Properties prop : propertiesList) {
            docIndicatorMap = new HashMap<>();
            docIndicatorMap.put("properties", prop);
            docIndicatorMap.put("checked", mandatoryDocList.contains(prop.getId().toString()) ? "checked" : "");
            docIndicatorMapList.add(docIndicatorMap);
        }
        model.addAttribute("docIndicatorMapList", docIndicatorMapList);

        return new ModelAndView("/admin/project_edit");
    }

    @RequestMapping(value = "/updateProject.se", method = RequestMethod.POST)
    public ModelAndView updateProject(@ModelAttribute("projectBean") @Valid ProjectBean projectBean,
                                      BindingResult result, RedirectAttributes attributes) {
        projectBean.validate(result);
        if (result.hasErrors()) {
            addRedirectAttributes(projectBean, result, attributes);
            return new ModelAndView("redirect:/admin/editProject.se?id=" + projectBean.getId());
        }
        boolean updated = commonService.update(projectBean.toModelBean());
        Map<String, Object> map = new HashMap<>();
        map.put("id", projectBean.getId());
        map.put("message", updated ? "Project Updated Successfully" : "Sorry for this time");
        return new ModelAndView("redirect:/admin/projectList.se", map);
    }

    @RequestMapping(value = "/districtList.se")
    public ModelAndView districtList(@RequestParam(required = false) String message) {
        Map<String, Object> map = getModelMap("District List", message);
        map.put("districtList", commonService.search(District.class, Order.asc("name")));
        return new ModelAndView("/admin/district_list", map);
    }

    @RequestMapping(value = "/policeStationList.se")
    public ModelAndView policeStationList(@RequestParam(required = false) String message,
                                          @RequestParam Long distId) {
        Map<String, Object> map = getModelMap("PS List", message);
        map.put("thanaList", commonService.search(PoliceStation.class, "district", new District(distId)));
        return new ModelAndView("/admin/thana_list", map);
    }


    @RequestMapping(value = "/userList.se")
    public ModelAndView userList(@RequestParam(required = false) String message) {
        Map<String, Object> map = getModelMap("User List", message);
        map.put("userDetailsList", commonService.search(UserDetails.class));
        return new ModelAndView("admin/user_list", map);
    }


    @RequestMapping(value = "/attachDocument.se")
    public ModelAndView attachDocument(Model model,
                                       @RequestParam String employeeID,
                                       @RequestParam String type) throws IOException {
        model.addAllAttributes(getModelMap("Document"));
        UserDetails userDetails = commonService.get(UserDetails.class, "employeeID", employeeID);

        if (!model.containsAttribute(Constants.DOCUMENT_BEAN)) {
            DocumentBean documentBean = new DocumentBean();
            documentBean.setType(type);
            documentBean.setIndicator(null);
            documentBean.setOwner(userDetails);
            model.addAttribute(Constants.DOCUMENT_BEAN, documentBean);
        }

        return new ModelAndView("/admin/staff_doc_attach");
    }

    @RequestMapping(value = "/saveDocument.se")
    public ModelAndView saveDocument(@ModelAttribute("documentBean") @Valid DocumentBean documentBean,
                                     BindingResult result, RedirectAttributes attributes) throws IOException {
        documentBean.validate(result);
        if (result.hasErrors()) {
            attributes.addAttribute("type", documentBean.getType());
            attributes.addAttribute("employeeID", documentBean.getOwner().getEmployeeID());
            addRedirectAttributes(documentBean, Constants.DOCUMENT_BEAN, result, attributes);
            return new ModelAndView("redirect:/admin/attachDocument.se");
        }

        ActionResult actionResult = fileService.writeAndSaveDocument(documentBean);

        return new ModelAndView("redirect:/admin/viewUserDetails.se?employeeID=" + documentBean.getOwner().getEmployeeID());
    }

}
