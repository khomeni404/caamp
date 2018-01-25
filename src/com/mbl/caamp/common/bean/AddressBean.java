package com.mbl.caamp.common.bean;

import com.mbl.caamp.common.model.*;
import net.softengine.model.User;
import com.mbl.caamp.util.Constants;
import net.softengine.util.GValidator;
import org.owasp.esapi.ESAPI;
import org.springframework.validation.BindingResult;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Arrays;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 03/12/2017 3:33 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 03/12/2017: 03/12/2017 3:33 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

public class AddressBean extends GenericBean {

    private Long id;

    @Size(min = 3, max = 30, message = "Address Type is Required")
    private String type;

    @NotNull
    private User holder;

    @Size(min = 2, max = 200, message = "Address line is Required. Please type House No, Road No, Village, Para, Lane etc in these two line.")
    private String line1;

    @Size(max = 200, message = "Can't exceed 100 char")
    private String line2;

    @Size(min = 3, max = 100, message = "RequiredCan't exceed 100 char")
    private String po;

    @Size(min = 4, max = 4, message = "Type 4 digit Post Code Please.")
    private String pc;

    private PoliceStation ps;

    private District district;

    @Size(min = 4, max = 4, message = "Select a Division Please.")
    private String divisionCode;

    @Override
    public void validate(BindingResult result) {
        GValidator.rejectEmptyString(result, "divisionCode", "", "Division Selection is required.");

        GValidator.validateDigits(result, this.pc, "pc", "Please Type only Digit");

        if (holder == null || holder.getId() == null) {
            GValidator.rejectValue(result, "holder.name", "Holder is required");
            this.holder = null;
        }

        if (ps == null || ps.getId() == null) {
            GValidator.rejectValue(result, "ps.id", "Thana is required");
            this.ps = null;
        }

        if (district == null || district.getId() == null) {
            GValidator.rejectValue(result, "district.id", "District is required");
            this.district = null;
        }

        if (!ESAPI.validator().isValidInput("", line1, "address", 200, true)) {
            GValidator.rejectValue(result, "line1", "Address is not valid. <a class=\"invalid-address-help-gritter\" href=\"#\">Help</a>");
        }

        if (!ESAPI.validator().isValidInput("", line2, "address", 200, true)) {
            GValidator.rejectValue(result, "line2", "Address is not valid. <a class=\"invalid-address-help-gritter\" href=\"#\">Help</a>");
        }

        if (!result.hasErrors()) {
            GValidator.validateSafeString(result, this, Arrays.asList("line1", "line2"));
        }
    }

    @Override
    public String info() {
        return null;
    }

    @Override
    public Address toModelBean() {
        Address address;
        if (Constants.PRESENT_ADDRESS.equals(this.type)) {
            address = new PresentAddress();
            address.setNote("Present Address");
        } else if (Constants.PERMANENT_ADDRESS.equals(this.type)) {
            address = new PermanentAddress();
            address.setNote("Permanent Address");
        } else {
            address = new Address();
            address.setNote(this.type);
        }
        address.setId(this.id);
        address.setLine1(this.line1);
        address.setLine2(this.line2);
        address.setPo(this.po);
        address.setPc(this.pc);
        address.setPs(this.ps);
        return address;
    }


    public static AddressBean toBean(Address address) {
        if (address == null) return null;
        AddressBean bean = new AddressBean();

        bean.setType(address.getClass().getSimpleName());
        bean.setId(address.getId());
        // address.setHolder(this.holder);
        bean.setLine1(address.getLine1());
        bean.setLine2(address.getLine2());
        bean.setPo(address.getPo());
        bean.setPc(address.getPc());
        PoliceStation policeStation = address.getPs();
        bean.setPs(policeStation);
        if (policeStation != null) {
            District district = policeStation.getDistrict();
            bean.setDistrict(district);
            if (district != null) {
                String divisionCode = district.getDivisionId();
                bean.setDivisionCode(divisionCode);
            }
        }
        User holder = address.getHolder();
        if (holder != null) {
            bean.setHolder(holder);
        }

        return bean;
    }

    // ===============================
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public User getHolder() {
        return holder;
    }

    public void setHolder(User holder) {
        this.holder = holder;
    }

    public String getLine1() {
        return line1;
    }

    public void setLine1(String line1) {
        this.line1 = line1;
    }

    public String getLine2() {
        return line2;
    }

    public void setLine2(String line2) {
        this.line2 = line2;
    }

    public String getPo() {
        return po;
    }

    public void setPo(String po) {
        this.po = po;
    }

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc;
    }

    public PoliceStation getPs() {
        return ps;
    }

    public void setPs(PoliceStation ps) {
        this.ps = ps;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public String getDivisionCode() {
        return divisionCode;
    }

    public void setDivisionCode(String divisionCode) {
        this.divisionCode = divisionCode;
    }
}
