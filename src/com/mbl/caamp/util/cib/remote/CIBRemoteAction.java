package com.mbl.caamp.util.cib.remote;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

import ibbl.cib.remote.bean.InquiryBean;
import ibbl.cib.remote.bean.RemoteTrResultBean;
import ibbl.cib.remote.bean.TransCarrier;
import ibbl.cib.util.PropertyUtil;
import ibbl.cib.util.RemoteActionList;
import ibbl.cib.util.RemoteDataList;
import ibbl.common.util.GeneralUtil;
import ibbl.common.util.GlobalConfigurationPool;
import ibbl.core.MessageBuilder;
import ibbl.core.StrutsDispatcher;
import ibbl.deposit.common.util.DepositDictionary;
import ibbl.deposit.common.util.IActionDataList;
import ibbl.deposit.common.web.fb.RemoteForm;
import ibbl.security.bean.LoginInfoBean;
import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.util.List;

/**
 * Copyright (C) 2002-2003 Islami Bank Bangladesh Limited
 * <p/>
 * Original author: Ayatullah Khomeni<br/>
 * Date: 18/01/2016
 * Last modification by: ayat $
 * Last modification on 18/01/2016: 5:10 PM
 * Current revision: : 1.1.1.1
 * <p/>
 * Revision History:
 * ------------------
 */

public class CIBRemoteAction extends Action {
    public ActionForward execute(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        String className = this.getClass().getName();
        GeneralUtil.printMessage(className, "execute()", DepositDictionary.ENTRY_POINT);

        /*Receiving data from Remote request*/
        RemoteForm form = (RemoteForm) actionForm;
        String message = form.getRemoteMessage();

        XStream xStream = new XStream(new DomDriver("UTF-8"));
        Class[] depClasses = new Class[]{
              TransCarrier.class,  InquiryBean.class, RemoteTrResultBean.class
        };
        xStream.processAnnotations(depClasses);
        xStream.alias("transCarrier", TransCarrier.class);

        TransCarrier reqDataBean = (TransCarrier) xStream.fromXML(message);
        if (reqDataBean == null) {
            return null;
        }

        String action_Key = RemoteActionList.ACTION_REMOTE_CIB_SERVICE_CHARGE_REALIZATION;

        /**
         * Only one InquiryBean has been sent from 'CIB Module' in <code>TransCarrier inquiryBeanList;</code>.
         * In future there can be two or more InquiryBean sent.
         */
        List<InquiryBean> inquiryList = reqDataBean.getInquiryBeanList();
        InquiryBean inquiryBean = inquiryList.get(0);

        LoginInfoBean remoteLoginInfoBean = new LoginInfoBean();
        remoteLoginInfoBean.setUserName(reqDataBean.getRemoteUserId());
        remoteLoginInfoBean.setPassword(reqDataBean.getRemotePassword());
        remoteLoginInfoBean.setUIDData(reqDataBean.getRemoteSecretKey());
        remoteLoginInfoBean.setBrCode(inquiryBean.getBrCode());

        RemoteTrResultBean resultBean = new RemoteTrResultBean();
        String authMessage = verifyCribSystemAccess(httpServletRequest, reqDataBean);
        if (BooleanUtils.toBoolean(authMessage)) {
            MessageBuilder request = new MessageBuilder();
            request.addData(action_Key, RemoteDataList.REMOTE_DATA_INQUIRY_BEAN, inquiryBean);
            request.addData(action_Key, RemoteDataList.REMOTE_DATA_TRANS_CARRIER, reqDataBean);
            request.addData(action_Key, IActionDataList.DATA_USER_LOGIN_INFO, remoteLoginInfoBean);

            try {
                StrutsDispatcher strutsDispatcher = new StrutsDispatcher();
                MessageBuilder response = strutsDispatcher.execute(request);
                if (response != null) {
                    resultBean = (RemoteTrResultBean) response.getData(action_Key, RemoteDataList.REMOTE_CIB_RESULT_BEAN, RemoteTrResultBean.class);
                } else {
                    resultBean.setSuccess(false);
                    resultBean.setMessage("No response from eIBS business dispatcher");
                }
            } catch (Exception e) {
                resultBean.setSuccess(false);
                resultBean.setException(e);
                e.printStackTrace();
            }
        } else {
            resultBean.setSuccess(false);
            resultBean.setMessage(authMessage);
        }


        xStream = new XStream();
        String xml = xStream.toXML(resultBean);
        byte[] messageBytes = xml.getBytes();

        ByteArrayOutputStream stream = new ByteArrayOutputStream(messageBytes.length);
        stream.write(messageBytes);
        httpServletResponse.setContentType("text/xml");
        httpServletResponse.setContentLength(messageBytes.length);
        stream.writeTo(httpServletResponse.getOutputStream());
        httpServletResponse.getOutputStream().flush();
        return null;
    }

    private String verifyCribSystemAccess(HttpServletRequest request, TransCarrier carrier) {
        try {
            String ipAddress = request.getHeader("X-FORWARDED-FOR");
            if (GenericValidator.isBlankOrNull(ipAddress)) {
                ipAddress = request.getRemoteAddr();
            }
            if (GenericValidator.isBlankOrNull(ipAddress) || (!ipAddress.equals("192.168.36.231") && !ipAddress.equals("192.168.37.231"))) {
                return "No Access ! Requested from an Unauthorized source/machine.";
            }
            GlobalConfigurationPool gcp = GlobalConfigurationPool.getInstance();
            String remoteUserID = gcp.getProperty("CIB_REMOTE_CHARGE_USER_ID");
            String remoteUserPass = gcp.getProperty("CIB_REMOTE_CHARGE_PASSWORD");
            String secretKey = gcp.getProperty("CIB_REMOTE_CHARGE_SECRET_KEY");
            if (secretKey.equals(carrier.getRemoteSecretKey()) && remoteUserPass.equals(carrier.getRemotePassword())) {
                return "true";
            } else {
                return "Remote Secret Key or Remote Password is not verified.";
            }
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}