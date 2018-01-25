package com.mbl.caamp.util.cib.remote.bl;


import com.ibbl.cbs.bean.CBSAdviceBean;
import ibbl.cib.remote.bean.InquiryBean;
import ibbl.cib.remote.bean.RemoteTrResultBean;
import ibbl.cib.remote.bean.TransCarrier;
import ibbl.cib.util.RemoteActionList;
import ibbl.cib.util.RemoteDataList;
import ibbl.cib.util.Util;
import ibbl.common.util.GeneralUtil;
import ibbl.core.GlobalDictionary;
import ibbl.core.MessageBuilder;
import ibbl.deposit.common.util.IActionDataList;
import ibbl.deposit.common.util.IWebDataList;
import ibbl.gl.bean.GenVoucherBean;
import ibbl.gl.bean.TransResponseBean;
import ibbl.gl.bl.ILedger;
import ibbl.gl.bl.TransactionManagerBL;
import ibbl.gl.bl.VoucherBL;
import ibbl.remittance.bean.AdviceBean;
import ibbl.remote.bl.co.RemoteBLControllerImpl;
import ibbl.security.bean.LoginInfoBean;

import java.text.ParseException;
import java.util.Date;


/**
 * Copyright (C) 2002-2003 Islami Bank Bangladesh Limited
 * <p/>
 * Original author: Ayatullah Khomeni<br/>
 * Date: 18/01/2016
 * Last modification by: ayat $
 * Last modification on 18/01/2016: 5:15 PM
 * Current revision: : 1.1.1.1
 * <p/>
 * Revision History:
 * ------------------
 */

public class CIBChargeTransferBLCO extends RemoteBLControllerImpl {
    public String execute(String action, String xml) {
        req = new MessageBuilder(xml);
        login = (LoginInfoBean) req.getData(action, IActionDataList.DATA_USER_LOGIN_INFO, LoginInfoBean.class);

        setLogin(login);
        this.action = action;

        if (notify.getMaxNotifyLevel() > GlobalDictionary.INFO_LEVEL) {
            return processMsg(false);
        }
        RemoteTrResultBean resultBean = new RemoteTrResultBean();
        if (action.equals(RemoteActionList.ACTION_REMOTE_CIB_SERVICE_CHARGE_REALIZATION)) {
            InquiryBean inquiry = (InquiryBean) req.getData(
                    action, RemoteDataList.REMOTE_DATA_INQUIRY_BEAN, InquiryBean.class);
            TransCarrier transCarrier = (TransCarrier) req.getData(
                    action, RemoteDataList.REMOTE_DATA_TRANS_CARRIER, TransCarrier.class);
            try {
                txID = tx.beginTransactionByBrCode(localBrCode);
                remoteBrCode = inquiry.getBrCode();

                TransResponseBean[] trb = postTx(inquiry, transCarrier);

                String acNo = inquiry.getChargeableAccount();
                if (notify.isError() || trb == null) {
                    resultBean.setSuccess(false);
                    resultBean.setMessage("Charge can not be debited from A/C no. " + acNo); // TODO.. change ISSUE_CHEQUE_NOT_CHARGE_REALIZE
                    //resultBean.setData(inquiry);
                    res.addData(action, RemoteDataList.REMOTE_CIB_RESULT_BEAN, resultBean);
                    return processMsg(false);
                } else {
                    double totalCost = inquiry.getKeyCost() + inquiry.getLinkingCost();
                    resultBean.setSuccess(true);
                    String drTrID = trb[0].getTransID();
                    String crTrID = trb[1].getTransID();
                    resultBean.setDrTrID(drTrID);
                    resultBean.setCrTrID(crTrID);
                    resultBean.setMessage("Charge has been debited from Customer Account (" + acNo + ")." +
                            "<br/>Dr Transaction ID: " + drTrID +
                            "<br/>Cr Transaction ID: " + crTrID
                    ); // TODO.. change ISSUE_CHEQUE_CHARGE_REALIZE
                    res.addData(action, RemoteDataList.REMOTE_CIB_RESULT_BEAN, resultBean);
                    forwardKey = IWebDataList.FORWARD_SUCCESS;
                    return processMsg(true);
                }
            } catch (Exception e) {
                e.printStackTrace();
                resultBean.setSuccess(false);
                resultBean.setException(e);
                resultBean.setErrorTrace(e.getMessage());
                res.addData(action, RemoteDataList.REMOTE_CIB_RESULT_BEAN, resultBean);
                return processMsg(false);
            }
        } else {
            resultBean.setSuccess(false);
            resultBean.setErrorTrace("No Action Key Found !!");
            res.addData(action, RemoteDataList.REMOTE_CIB_RESULT_BEAN, resultBean);
            return processMsg(false);
        }
    }

    public TransResponseBean[] postTx(InquiryBean inquiry, TransCarrier transCarrier) {

        if (inquiry == null) {
            notify.addError(GlobalDictionary.NOTIFY_ZERO_LENGTH, "EFT Info");
            return null;
        }

        Date when = GeneralUtil.getActiveTransDate(login);
        ILedger ledger = new TransactionManagerBL(login, txID, null, null);
        String groupTxID = ledger.generateGroupTransID();

        GenVoucherBean voucherBean = Util.makeCIBGenVoucher(inquiry, transCarrier);
        voucherBean.setTransDate(when);

        VoucherBL voucherBL = new VoucherBL(login, txID, null, groupTxID);
        voucherBL.setBatchTransaction(true);
        voucherBL.setMinBalanceCheck(false);

        TransResponseBean[] responseBeen = voucherBL.entryVoucher(voucherBean);
        if (voucherBL.getNotify().isError()) {
            this.notify.add(voucherBL.getNotify().getNotify());
            return null;
        }

        ledger = new TransactionManagerBL(login, txID, groupTxID, null);
        ledger.setBatchTransaction(true);

        return responseBeen;
    }

    /**
     * @param cbsAdviceBean
     * @return AdviceBean
     * @throws java.text.ParseException
     */

    /**
     * Not Implemented yet for CIB
     */
    public AdviceBean toAdviceBean(CBSAdviceBean cbsAdviceBean) throws ParseException {
        AdviceBean advBean = new AdviceBean();
        /*advBean.setAdviceNo(cbsAdviceBean.getAdviceNo());
        advBean.setAdviceID(cbsAdviceBean.getAdviceNo());

        if (cbsAdviceBean.getAdviceInstruction() == CBSDictionary.ADVICE_INSTRUCTION_ISSUE) {
            advBean.setAdviceID(advBean.getAdviceNo());
            advBean.setIssueDate(when);
        } else {
            advBean.setIssueDate(DateUtil.toDate(cbsAdviceBean.getBusinessDate(), DateUtil.DATE_FORMAT_YYYY_MM_DD_NO_SEPARATOR));
        }
        advBean.setAdviceType(Integer.parseInt(cbsAdviceBean.getAdviceType()));
        advBean.setTransactionCode(cbsAdviceBean.getTrCode());
        advBean.setSourceBrCode(cbsAdviceBean.getSrcIBCode());
        advBean.setDestinationBrCode(cbsAdviceBean.getDestIBCode());

        FinAmount amount = new FinAmount();
        amount.setValue(Double.parseDouble(cbsAdviceBean.getTotalAmount()));

        advBean.setAmount(amount);

        if (advBean.getAdviceType() == InstrumentDictionary.INSTRUMENT_TYPE_IBCA) {
            advBean.setCreditIBGA(advBean.getSourceBrCode());
            advBean.setDebitIBGA(advBean.getDestinationBrCode());
        } else {
            advBean.setDebitIBGA(advBean.getSourceBrCode());
            advBean.setCreditIBGA(advBean.getDestinationBrCode());
        }

        advBean.setStatus(RemittanceDictionary.REM_STATUS_ADVICE_ISSUED);
        advBean.setNote(cbsAdviceBean.getNote());

        AdviceParticularsBean[] apbs = new AdviceParticularsBean[1];

        AdviceParticularsBean apb = new AdviceParticularsBean();
        apb.setInstrumentNo(advBean.getAdviceNo());
        apb.setParticular(cbsAdviceBean.getNote());
        apb.setInstrumentAmount(amount);
        apb.setParticular("CIB Service Charge Realization Advice");
        apbs[0] = apb;

        advBean.setAdviceParticulars(apbs);
*/
        return advBean;

    }


}
