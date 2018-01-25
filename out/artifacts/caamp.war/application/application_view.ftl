<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  '${(title)!}', 'application' >
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility!/>
    <#assign ApplicationBean = ApplicationBean!/>
    <#include '../template/constant.ftl'>

<div>
    <div id="user-profile-1" class="user-profile row" style="height: 100%">
        <div class="col-lg-3 col-lg-offset-2 col-xs-12 col-sm-3 center">
            <div>
                <span class="profile-picture">
                    <img class="img-responsive" alt="Photo"
                         style="width: 150px; height: 188px"   src="${IU.getDocPath(photo)!}"/>
                </span>

                <div class="space-4"></div>

                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                    <div class="inline position-relative">
                        <a href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                            <i class="ace-icon fa fa-circle light-green"></i>
                            &nbsp;
                            <span class="white">${(ApplicationBean.student.cell)!}</span>
                        </a>

                        <ul class="align-left dropdown-menu dropdown-caret dropdown-lighter">
                            <li class="dropdown-header"> Change Status</li>

                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-circle green"></i>
                                    &nbsp;
                                    <span class="green">Available</span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-circle red"></i>
                                    &nbsp;
                                    <span class="red">Busy</span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-circle grey"></i>
                                    &nbsp;
                                    <span class="grey">Invisible</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="space-6"></div>
        </div>

        <div class="col-lg-5 col-xs-12 col-sm-9">
            <div class="widget-box widget-color-green" <#--style="margin: 10px 10px 10px 10px "-->>
                <div class="widget-header">
                    <h5 class="widget-title bigger lighter">Application</h5>
                </div>
                <div class="widget-body">
                    <br>
                        <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Applicant ID</label>
                        <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            : ${ApplicationBean.applicantId!}</label>

                        <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Applicant Name</label>
                        <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            : ${(ApplicationBean.student.name)!}</label>

                        <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Applicant Cell</label>
                        <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            : ${(ApplicationBean.student.cell)!}</label>
                        
                        <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Apply District</label>
                        <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value"
                               for="branch">: ${(ApplicationBean.district.name)!}</label>

                        <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Apply Branch</label>
                        <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            : ${(ApplicationBean.branch.name)!}</label>
                    <br>

                    <div class="row" style="text-align: center; padding: 10px 10px 10px 10px">
                        <div class="btn-group col-lg-12 col-sm-12 col-xs-12">
                            <button class="btn btn-info btn-white col-lg-2 col-sm-2 col-xs-2">
                                <#assign piOk> <#if ApplicationBean.piOK?string = 'true'>fa-check-square-o green<#else >
                                    fa-exclamation-triangle red</#if></#assign>
                                <i class="normal-icon ace-icon fa ${piOk!} bigger-130"></i>
                            </button>

                            <button class="btn btn-info btn-white col-lg-7 col-sm-7 col-xs-7 pointer"
                                    onclick="window.location = '${ctx}/app/viewPersonalData.se'">
                                <b>Personal Information</b>
                            </button>

                            <button data-toggle="dropdown" class="btn btn-info btn-white dropdown-toggle col-lg-2 col-sm-2 col-xs-2">
                                <span class="ace-icon fa fa-caret-down icon-only"></span>
                            </button>

                            <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                    <a href="${ctx}/app/createPersonalData.se"><b>View Personal Info</b></a>
                                </li>
                                <li>
                                    <a href="${ctx}/app/createPersonalData.se"><b>Edit Personal Info</b></a>
                                </li>

                            </ul>
                        </div>
                        <p></p>

                        <div class="btn-group col-lg-12 col-sm-12 col-xs-12">
                            <button class="btn btn-info btn-white col-lg-2 col-sm-2 col-xs-2">
                                <#assign fiOk> <#if ApplicationBean.fiOK?string = 'true'>fa-check-square-o green<#else >
                                    fa-exclamation-triangle red</#if></#assign>
                                <i class="normal-icon ace-icon fa ${fiOk!} bigger-130"></i>
                            </button>

                            <button class="btn btn-info btn-white col-lg-7 col-sm-7 col-xs-7 pointer"
                                    onclick="window.location = '${ctx}/app/viewFamilyData.se'">
                               <b> Family Information</b>
                            </button>

                            <button data-toggle="dropdown" class="btn btn-info btn-white dropdown-toggle col-lg-2 col-sm-2 col-xs-2">
                                <span class="ace-icon fa fa-caret-down icon-only"></span>
                            </button>

                            <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                    <a href="${ctx}/app/viewFamilyData.se"><b>View Family Info</b></a>
                                </li>
                                <li>
                                    <a href="${ctx}/app/createFamilyData.se"><b>Edit Family Info</b></a>
                                </li>

                            </ul>
                        </div>

                        <#list  ApplicationBean.addressList as Address>
                            <div class="btn-group col-lg-12 col-sm-12 col-xs-12">
                                <button class="btn btn-info btn-white col-lg-2 col-sm-2 col-xs-2">
                                    <#assign fiOk> <#if ApplicationBean.fiOK?string = 'true'>fa-check-square-o green<#else >
                                        fa-exclamation-triangle red</#if></#assign>
                                    <i class="normal-icon ace-icon fa ${fiOk!} bigger-130"></i>
                                </button>

                                <button class="btn btn-info btn-white col-lg-7 col-sm-7 col-xs-7 pointer"
                                        onclick="window.location = '${ctx}/app/createAddress.se'">
                                    <b> ${Address.note}</b>
                                </button>

                                <button data-toggle="dropdown" class="btn btn-info btn-white dropdown-toggle col-lg-2 col-sm-2 col-xs-2">
                                    <span class="ace-icon fa fa-caret-down icon-only"></span>
                                </button>

                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <a href="${ctx}/app/createAddress.se"><b>View Addresses</b></a>
                                    </li>
                                    <li>
                                        <a href="${ctx}/app/createAddress.se"><b>Edit Addresses</b></a>
                                    </li>

                                </ul>
                            </div>
                        </#list>
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>

</@layout.student_layout>

