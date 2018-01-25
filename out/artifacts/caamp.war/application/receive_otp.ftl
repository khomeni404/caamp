<#import "../template/open/open_layout.ftl" as layout>
<@layout.open_layout "${(title)!}", 'application'>
    <#assign ctx = rc.getContextPath()/>
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign OTP = OTP/>
<div class="row">
    <div class="col-lg-6 col-lg-offset-3 col-xs-12 col-sm-12">
        <div class="widget-box widget-color-green">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">Student Registration : PIN Verify</h5>
            </div>

            <div class="widget-body">
                <form id="incident-form" action="${ctx}/reg/completeRegistration.se" method="POST"
                      class="form-horizontal"
                      role="form">
                    <@spring.formHiddenInput  "OTP.sender" />
                    <@spring.formHiddenInput  "OTP.cell" />
                    <@spring.formHiddenInput  "OTP.life" />

                    <div class="widget-main">
                        <div class="col-xs-12">
                            <div class="space-6"></div>
                            <p style="font-weight: bold"> We sent a code to <span
                                    style="color: #a1450e">${OTP.cell!}</span>.
                                <br>Please type code below and Verify
                            </p>
                        </div>
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Verification Code</label>

                                <div class="col-sm-8">
                                    <span class="block input-icon input-icon-right">
                                        <@spring.formInput  "OTP.code" "class='form-control' placeholder='Code' autofocus" />
                                        <@spring.showErrors " & ", "err-msg" />
                                        <i class="ace-icon fa fa-envelope"></i>
                                    </span>
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
                                        Verify
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


<script type="text/javascript">
    $(function () {
//        $('#code').select();
        $('#code').focus();
    });
</script>

</@layout.open_layout>