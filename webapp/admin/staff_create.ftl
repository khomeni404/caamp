<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "staff-add">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>
    <#include '../template/constant.ftl'>

<div class="col-lg-12 col-xs-12 col-sm-12">
    <div class="widget-box widget-color-green">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter">Add new Staff</h5>
        </div>

        <div class="widget-body">
            <form id="data-form" action="${ctx}/admin/saveStaff.se" method="POST" class="form-horizontal"
                  role="form">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Employee ID
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.employeeID" "class='form-control' maxlength='11' placeholder='e.g. 20180103001'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Full Name
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.user.name" "class='form-control' maxlength='100' placeholder='e.g. Md. Ayatullah'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Short Name
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.shortName" "class='form-control' maxlength='10' placeholder='e.g. Ayat'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Work Station / Posting <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "UserDetailsBean.workStation.code", IU.getOptions('Select a Staion', workStationMap)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                    <span>${posting!}</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Designation <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "UserDetailsBean.designation.id", IU.getOptions('Select a Option', designationMap)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                    <span>${designation!}</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="cell">Cell Phone
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.cell" "class='form-control' maxlength='11' placeholder='e.g. 01758000000'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="email">Email Address
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.email" "class='form-control' maxlength='100' placeholder='Corporate Email Address'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Phone / Extension
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.phoneExt" "class='form-control' maxlength='12' placeholder='Phone or Extension'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Username (Perm.)
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.username" "class='form-control' maxlength='50' placeholder='e.g. jamil420'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Password (Temp.)
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "UserDetailsBean.password" "class='form-control' maxlength='50' placeholder='e.g. jaMil@548'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Access Status <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "UserDetailsBean.user.status", IU.getOptions('Select a Status', statusMap)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                        </div>

                    </div>
                </div>


                <div class="widget-toolbox padding-8 clearfix">
                    <div class="btn-group pull-right">
                        <button type="button" onclick="window.location = '${ctx}/admin/dashboard.se'"
                                class="btn btn-md btn-danger btn-white btn-round">
                            <i class="ace-icon fa fa-home bigger-120 blue"></i>
                            Home
                        </button>
                        <button type="reset"
                                class="btn btn-md btn-success btn-white btn-round">
                            <i class="ace-icon fa fa-refresh bigger-125 red2"></i>
                            Reset
                        </button>
                        <button type="submit"
                                class="btn btn-md btn-success btn-white btn-round">
                            <i class="ace-icon fa fa-floppy-o green bigger-125 blue"></i>
                            Save
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</@layout.admin_layout>