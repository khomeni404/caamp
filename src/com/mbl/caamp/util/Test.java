package com.mbl.caamp.util;

import com.google.gson.Gson;
import com.mbl.caamp.common.bean.OTP;
import com.mbl.caamp.common.model.Properties;
import com.mbl.caamp.home.BootstrapEngine;
import com.mbl.caamp.admin.model.Project;
import net.softengine.service.Christopher;
import net.softengine.ssl.api.ReplyResult;
import net.softengine.ssl.api.RequestedMethod;
import net.softengine.ssl.api.SMSClient;
import net.softengine.util.ActionResult;
import org.apache.commons.lang.WordUtils;
import org.owasp.esapi.ESAPI;
import org.springframework.validation.BindingResult;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author Khomeni
 * Created on : 20-May-17 at 12:57 AM
 */

public class Test {
    static String data1 = "{\"success\":true,\"dataObject\":\"Staff\",\"errorMap\":{},\"map\":{\"session_user_br_name\":\"Main Branch\",\"session_user_id\":2,\"session_user_groups\":[1,2,3,11,6,7,8,10],\"session_user_br_code\":\"0025\",\"session_user\":{\"shortName\":\"J.Khan\",\"id\":2,\"status\":1,\"name\":\"M. Jamil Hossain Khan\"}}}";
   static String loginInfo = "eyJzdWNjZXNzIjp0cnVlLCJkYXRhT2JqZWN0IjoiU3RhZmYiLCJlcnJvck1hcCI6e30sIm1hcCI6eyJzZXNzaW9uX3VzZXJfYnJfbmFtZSI6Ik1haW4gQnJhbmNoIiwic2Vzc2lvbl91c2VyX2lkIjoyLCJzZXNzaW9uX3VzZXJfZ3JvdXBzIjpbMSwyLDMsMTEsNiw3LDgsMTBdLCJzZXNzaW9uX3VzZXJfYnJfY29kZSI6IjAwMjUiLCJzZXNzaW9uX3VzZXIiOnsic2hvcnROYW1lIjoiSi5LaGFuIiwiaWQiOjIsInN0YXR1cyI6MSwibmFtZSI6Ik0uIEphbWlsIEhvc3NhaW4gS2hhbiJ9fX0gICAgIA==";
    static String data2 = "eyJzdWNjZXNzIjp0cnVlLCJkYXRhT2JqZWN0IjoiU3RhZmYiLCJlcnJvck1hcCI6e30sIm1hcCI6eyJzZXNzaW9uX3VzZXJfYnJfbmFtZSI6Ik1haW4gQnJhbmNoIiwic2Vzc2lvbl91c2VyX2lkIjoyLCJzZXNzaW9uX3VzZXJfZ3JvdXBzIjpbMSwyLDMsMTEsNiw3LDgsMTBdLCJzZXNzaW9uX3VzZXJfYnJfY29kZSI6IjAwMjUiLCJzZXNzaW9uX3VzZXIiOnsic2hvcnROYW1lIjoiSi5LaGFuIiwiaWQiOjIsInN0YXR1cyI6MSwibmFtZSI6Ik0uIEphbWlsIEhvc3NhaW4gS2hhbiJ9fX0gICAgIA==";
    static String data3 = "iQ+3Yjv7DuvFGPeD+yqMRSwq18ureG/X5ml3Jm+Adpy3FN4mZxgTjAt9dcUtl0arvDXFk+5eLsQqdxSDI4lgW+gT1N7MfZVoykq9xHczm0C8yWlnA6lg1w==";

    public static void main(String[] args) {
        Christopher christopher = new Christopher("");
//        Christopher christopher = new Christopher("5");
//        System.out.println(christopher.decrypt(data2));

        System.out.println(christopher.decrypt(data2));
        // S2FtYWwgICA=
        // SmFtYWwgICA=
        // RmFraXIgICA=
        // RmFraXIgICA=

    }
    public static void main44(String[] args) {
        Christopher c = new Christopher("56464#$@#");
        //System.out.println(c.decrypt(loginInfo));
        String d = "{\"success\":true,\"dataObject\":{\"name\":\"Kamal\",\"groupList\":[]},\"map\":{\"session_user_id\":1,\"session_user_groups\":[1,2,3,4],\"session_user\":{\"id\":1,\"active\":true,\"name\":\"Khomeni\"}}}";
        Gson gson = new Gson();
        ActionResult r = gson.fromJson(d, ActionResult.class);
        System.out.println(r);

    }
    public static void main455(String[] args) {

        try {
            File file = new File("E:\\test.xml");
            JAXBContext jaxbContext = JAXBContext.newInstance(OTP.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
            OTP customer = (OTP) jaxbUnmarshaller.unmarshal(file);
            System.out.println(customer);

        } catch (JAXBException e) {
            e.printStackTrace();
        }

    }
    public static void main23(String[] args) {
        try {
            String s = "";
            String e = "mak@pak.com";
            System.out.println(ESAPI.validator().isValidInput("", s, "SafeString", 100, true));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void validateSafeString(BindingResult result, Object object) {
        for (Field f : Project.class.getDeclaredFields()) {
            int mod = f.getModifiers();
            if (Modifier.isPrivate(mod)) {
                if (Modifier.isPrivate(mod)) {
                    try {
                        if (f.getType().equals(String.class)) {
                            String name = f.getName();
                            String methodName = "get" + WordUtils.capitalize(name);
                            Method method = object.getClass().getMethod(methodName);
                            Object value = method.invoke(object);

                            // TODO validate string by "Enterprise Security API" or Customized Strategy
                            System.out.println(name + " = " + value.toString() );
                        }
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
            }
        }
    }

    public static void main32(String args[]) {
        List<String> ftlConstants = new ArrayList<>();
        List<String> javaConstants = new ArrayList<>();
        Class<BootstrapEngine> c = BootstrapEngine.class;
        Object o = new BootstrapEngine();
        int groupCode = 10;
        Properties pg;
        for (Field f : c.getDeclaredFields()) {
            int mod = f.getModifiers();
            if (Modifier.isPrivate(mod)) {
                //if (Modifier.isStatic(mod) && Modifier.isPublic(mod) && Modifier.isFinal(mod)) {
                try {
                    if (f.getName().startsWith("PG_") && f.getGenericType().getTypeName().equals(Constants.CONSTANT_MAP_GENERIC) && f.getType().equals(Map.class)) {
                        String name = f.getName();//.toLowerCase();
                        ftlConstants.add("<#assign " + name + " = '" + groupCode + "'/>");
                        javaConstants.add("String " + name + " = '" + groupCode + "';");
                        //name = name.replaceAll("_", " ");
                        name = WordUtils.capitalize(name);
//                        System.out.println("put(\""+sl+++"\", \""+name+"\");");

                        /*Map<String, String> data = (Map<String, String>) f.get(o);
                        int cc = 1;
                        for (String k : data.keySet()) {
                            *//*pg = new PropertyGroup();
                            String formatted = String.format("%02d", cc++);
                            pg.setId(Long.valueOf(groupCode + formatted));
                            pg.setName(data.get(k));
                            pg.setCoreKey(k);
                            System.out.println(pg.getId());*//*

                        }*/
                        groupCode++;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        ftlConstants.stream().forEach(System.out::println);
        System.out.println(" ============== ");
        javaConstants.stream().forEach(System.out::println);
    }


    public static void main2(String[] args) throws Exception {
        //System.out.println(Validator.validateEmailAddress("khomeni", "cell", true, null));
    }


    public static void sendSms(String[] args) throws Exception {
        SMSClient client1 = new SMSClient(Constants.ISSL_UID, Constants.ISSL_PASSWORD, Constants.ISSL_SID);
        ReplyResult replyResult = client1.sendSMS(RequestedMethod.POST, Arrays.asList("880146544306"),
                "O amar joti boti");
        System.out.println(replyResult.getMessage());
    }
}
