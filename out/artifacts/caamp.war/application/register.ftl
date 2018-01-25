<#import "../template/open/open_layout.ftl" as layout>
<@layout.open_layout "${(title)!}", 'application'>
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign OTP = OTP/>
<div class="row">
    <div class="col-lg-6 col-xs-12 col-sm-12">
        <div class="widget-box widget-color-blue">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter"><b>Instruction to Apply</b></h5>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <ul class="list-unstyled spaced2">
                        <li>
                            <i class="ace-icon fa fa-check green"></i>
                            You have to register with a mobile phone no and name.
                        </li>

                        <li>
                            <i class="ace-icon fa fa-check green"></i>
                            The mobile phone no will be your 'username'.
                        </li>

                        <li>
                            <i class="ace-icon fa fa-check green"></i>
                            After registration a password will be sent using SMS.
                        </li>

                        <li>
                            <i class="ace-icon fa fa-check green"></i>
                            Login to the system with <b>Mobile phone no</b> & <b>Password</b>
                        </li>

                        <li>
                            <i class="ace-icon fa fa-check green"></i>
                            And Fill Up Application.
                        </li>
                    </ul>
                </div>

                <div>
                    <a href="#" class="btn btn-block btn-primary">
                    <#--<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
                        <span>Buy</span>-->
                    </a>
                </div>
            </div>
        </div>
    </div>


    <div class="col-lg-6 col-xs-12 col-sm-12">
        <div class="widget-box widget-color-green">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">Student Registration Form</h5>
            </div>

            <div class="widget-body">
                <form id="data-form" action="${ctx}/reg/collectOTP.se" method="POST" class="form-horizontal"
                      role="form">
                    <div class="widget-main">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="col-sm-5 control-label no-padding-right" for="incident-type">Full Name as
                                    Certificate</label>

                                <div class="col-sm-7">
                                    <@spring.formInput  "OTP.sender" "class='form-control' placeholder='Full Name as per certificate'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label no-padding-right" for="incident-type">Mobile Phone
                                    No.</label>

                                <div class="col-sm-7">
                                    <@spring.formInput  "OTP.cell" "class='form-control' placeholder='11 Digit Cell no' maxlength='11'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>


                            <div class="space-4"></div>


                            <div class="clearfix form-actions">
                                <div class="col-lg-10 col-lg-offset-1 col-md-offset-3 col-md-9">
                                    <button type="reset" class="btn btn-white btn-info btn-bold col-lg-6 col-xs-12">
                                        <i class="ace-icon fa fa-refresh bigger-120 blue"></i>
                                        Reset
                                    </button>
                                    <button type="submit" class="btn btn-white btn-info btn-bold col-lg-6 col-xs-12">
                                        <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
                                        Register
                                    </button>
                                </div>
                            </div>


                        </div>
                    </div>

                    <div>
                        <a href="#" class="btn btn-block btn-success">
                        <#--<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
                            <span>View Result</span>-->
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</@layout.open_layout>