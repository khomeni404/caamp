<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "pass-change_of_security">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility!/>
    <#assign ctx = rc.getContextPath()/>
    <#assign changeType = PassChangeBean.changeType!/>
    <#include '../template/constant.ftl'>
    <#escape x as x?html>
    <div class="col-lg-6 col-xs-12 col-sm-12">
        <div class="widget-box widget-color-green">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">${changeType!} Password</h5>
            </div>

            <div class="widget-body">
                <form id="data-form" action="${ctx}/security/${changeType?lower_case!}Password.se" method="POST"
                      class="form-horizontal"
                      role="form">
                    <@spring.formHiddenInput 'PassChangeBean.userDetails.id'/>
                    <@spring.formHiddenInput 'PassChangeBean.userDetails.employeeID'/>
                    <@spring.formHiddenInput 'PassChangeBean.changeType'/>
                    <@spring.formHiddenInput 'PassChangeBean.userDetails.user.id'/>

                    <div class="widget-main">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label no-padding-right" for="incident-type">Employee
                                        Name
                                        <span class="se-mandatory">*</span></label>

                                    <div class="col-sm-8">
                                        <@spring.formInput  "PassChangeBean.userDetails.user.name" "class='form-control' readonly placeholder='e.g. Md. Ayatullah'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <#if changeType = 'Update'>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="incident-type">Old/Current
                                            Password
                                            <span class="se-mandatory">*</span></label>

                                        <div class="col-sm-8">
                                            <@spring.formInput  "PassChangeBean.oldPassword" "class='form-control' placeholder='Existing Password'" />
                                            <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                </#if>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label no-padding-right" for="incident-type">New
                                        Password
                                        <span class="se-mandatory">*</span></label>

                                    <div class="col-sm-8">
                                        <@spring.formInput  "PassChangeBean.newPassword" "class='form-control' placeholder='New Password'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <#if changeType = 'Update'>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="incident-type">Retype
                                            New
                                            Password
                                            <span class="se-mandatory">*</span></label>

                                        <div class="col-sm-8">
                                            <@spring.formInput  "PassChangeBean.reNewPassword" "class='form-control' placeholder='New Password Again'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                </#if>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <@spring.formHiddenInput  "PassChangeBean.errors"/>
                        <@spring.showErrors " & ", "err-msg" />
                        <div class='space'></div>
                    </div>
                    <div class="widget-toolbox padding-8 clearfix">
                        <div class="btn-group pull-right">
                            <button type="button" onclick="window.location = '${ctx}/admin/dashboard.se'"
                                    class="btn btn-md btn-danger btn-white btn-round">
                                <i class="ace-icon fa fa-home bigger-120 blue"></i>
                                Home
                            </button>
                            <button type="submit"
                                    class="btn btn-md btn-success btn-white btn-round">
                                <i class="ace-icon fa fa-floppy-o green bigger-125 blue"></i>
                                ${changeType} Pass
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </#escape>
</@layout.admin_layout>