package com.mbl.caamp.common;

import com.mbl.caamp.admin.model.Branch;
import com.mbl.caamp.common.model.District;
import com.mbl.caamp.common.model.PoliceStation;
import com.mbl.caamp.common.service.GenericController;
import com.mbl.caamp.security.model.Component;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.Encoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 26/11/2017 4:10 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 26/11/2017: 26/11/2017 4:10 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Controller
@RequestMapping("/ajax/")
public class AjaxController extends GenericController {

    private static Encoder encoder = ESAPI.encoder();
    private static String SELECT_OPTION = "<option value=\"\">--Select--</option>";

    @RequestMapping(method = RequestMethod.GET, value = "getDistrictListSelector.se")
    public @ResponseBody String getDistrictListSelector(@RequestParam String divisionId) {
        List<District> districtList = commonService.search(District.class, "divisionId", divisionId);
        String s = SELECT_OPTION;
        for (District d : districtList) {
            s += "<option value=\"" + encoder.encodeForHTMLAttribute(d.getId().toString()) + "\">" + encoder.encodeForHTML(d.getName()) + "</option>";
        }
        return s;
    }

    @RequestMapping(method = RequestMethod.GET, value = "getPoliceStationListSelector.se")
    public @ResponseBody String getPoliceStationListSelector(@RequestParam Long districtId) {
        List<PoliceStation> policeStationList = commonService.search(PoliceStation.class, "district", "id", districtId);
        String s = SELECT_OPTION;
        for (PoliceStation d : policeStationList) {
            s += "<option value=\"" + encoder.encodeForHTMLAttribute(d.getId().toString()) + "\">" + encoder.encodeForHTML(d.getName()) + "</option>";
        }
        return s;
    }

    @RequestMapping(method = RequestMethod.GET, value = "getBranchListSelector.se")
    public @ResponseBody String getBranchListSelector(@RequestParam Long districtId) {
        List<Branch> branchList = commonService.search(Branch.class, "district", "id", districtId);
        String result = SELECT_OPTION;
        for (Branch branch : branchList) {
            result += "<option value=\"" + encoder.encodeForHTMLAttribute(branch.getBrCode()) + "\">" + encoder.encodeForHTML(branch.getName()) + "</option>";
        }
        return result;
    }

    @RequestMapping(method = RequestMethod.GET, value = "getComponentListSelector.se")
    public @ResponseBody String getComponentListSelector(@RequestParam Long projectId) {
        List<Component> branchList = commonService.search(Component.class, "project", "id", projectId);
        String result = SELECT_OPTION;
        for (Component component : branchList) {
            result += "<option value=\"" + encoder.encodeForHTMLAttribute(component.getId().toString()) + "\">" + encoder.encodeForHTML(component.getName()) + "</option>";
        }
        return result;
    }
}
