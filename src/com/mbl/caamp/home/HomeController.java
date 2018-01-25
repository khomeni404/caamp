package com.mbl.caamp.home;

import com.google.gson.Gson;

import com.mbl.caamp.admin.model.Project;
import com.mbl.caamp.common.bean.OTP;
import com.mbl.caamp.common.service.GenericController;
import net.softengine.util.SecurityConstants;
import net.softengine.util.SessionUtil;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.Encoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;


/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 21/11/2017 12:38 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 21/11/2017: 21/11/2017 12:38 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */


@Controller
@RequestMapping(value = {"/home/", "/"}, method = {RequestMethod.GET, RequestMethod.HEAD})
public class HomeController extends GenericController {

    @RequestMapping(value = "/home.se", method = RequestMethod.HEAD)
    public ModelAndView home() {
//       return new ModelAndView("redirect:/home/dashboard.se");
        return new ModelAndView("redirect:/auth/login.se");
    }

    @RequestMapping(value = {"/dashboard.se", "/"})
    public ModelAndView dashboard(@RequestParam(required = false) String message) {
        Map<String, Object> map = new HashMap<>();
        map.put("title", "CAAMP");
        map.put("message", message);

        /*List<Project> projectList = commonService.search(Project.class);
        map.put("projectList", projectList);*/

        /*if (SessionUtil.getSessionUser() != null) {
            return new ModelAndView("redirect:/home/logout.se");
        }*/

        /*try {

            File file = new File("E:\\test.xml");
            JAXBContext jaxbContext = JAXBContext.newInstance(OTP.class);
            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
            OTP otp1 = (OTP) jaxbUnmarshaller.unmarshal(file);
            System.out.println(otp1);
            URL url = new URL("http://localhost/casir/home/getTestXml.se");
            OTP otp2 = (OTP) jaxbUnmarshaller.unmarshal(url);
            System.out.println(otp2);
        } catch (JAXBException e) {
            e.printStackTrace();
        } catch (Exception e) {

        }*/

        List<Project> projects = commonService.search(Project.class);
        map.put("projectList", projects);
        return new ModelAndView("/template/open/op_dashboard", map);
        //return new ModelAndView("/template/dashboard", map);
    }


    @RequestMapping(method = RequestMethod.GET, value = "/logout.se")
    public ModelAndView logout(@RequestParam(required = false) String message) {
        HttpSession userSession = SessionUtil.getSession();
        userSession.removeAttribute(SecurityConstants.SESSION_USER);
        userSession.removeAttribute(SecurityConstants.SESSION_USER_CASM_OID);
        userSession.removeAttribute(SecurityConstants.SESSION_USER_CASM_USER_ID);
        userSession.removeAttribute(SecurityConstants.SESSION_USER_GRANTED_ACTION_NAMES);
        userSession.removeAttribute(SecurityConstants.SESSION_USER_GRANTED_MAPPINGS);
        userSession.invalidate();
        // return new ModelAndView("redirect:/auth/login.se", "message", message);
        return new ModelAndView("redirect:/auth/login.se");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/getTestXml.se")
    public
    @ResponseBody
    String getTestXml() {
        Encoder encoder = ESAPI.encoder();
        String s = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                "<otp id=\"100\">\n" +
                "    <id>23</id>\n" +
                "    <cell>01717659287</cell>\n" +
                "    <code>Khomeni</code>\n" +
                "</otp>";
        //return encoder.encodeForXML(s);
        OTP otp = new OTP(12L, "01717", "Khomeni");
        otp.setId(154);
        Gson gson = new Gson();
        List<OTP> otpList = Arrays.asList(otp, otp, otp);
        return gson.toJson(otpList);

    }
}
