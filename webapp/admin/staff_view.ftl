<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'dashboard'>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility!/>
    <#if userDetails??>
        <#assign UserDetails = userDetails!/>
        <#assign User = UserDetails.user!/>
        <#assign Avatar = UserDetails.avatar!/>
        <#assign AvatarPath><#if Avatar.id??>${IU.getDocPath(Avatar)!}<#else >${IU.getDocPath()!}</#if></#assign>
        <#assign Signature = UserDetails.signature!/>
        <#assign SignaturePath><#if Signature.id??>${IU.getDocPath(Signature)!}<#else >${IU.getDocPath()!}</#if></#assign>
        <#assign WorkStation = UserDetails.workStation!/>
        <#include '../template/constant.ftl'>

    <div class="col-lg-9 col-xs-12 col-sm-9">
        <div class="widget-box widget-color-green" <#--style="margin: 10px 10px 10px 10px "-->>
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">Employee Info</h5>
            </div>
            <div class="widget-body">
                <div class="row">
                    <div class="col-md-12">


                        <div class="widget-main">
                            <div class="row">
                                <div class="col-lg-9">
                                    <form id="data-form" action="${ctx}/admin/viewUserGroups.se" method="POST"
                                          class="form-horizontal"
                                          role="form">
                                        <input type="hidden" name="staffId" value="${User.id!}">

                                        <table class="table table-striped table-bordered">
                                            <tbody>
                                            <tr>
                                                <td class="col-md-3 se-label">Employee Name</td>
                                                <td class="col-md-9 se-label-value"> ${(User.name)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Employee ID</td>
                                                <td class="se-label-value"> ${(UserDetails.employeeID)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Short Name</td>
                                                <td class="se-label-value"> ${(User.shortName)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Cell Phone</td>
                                                <td class="se-label-value"> ${(UserDetails.cell)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Phone/Extension</td>
                                                <td class="se-label-value"> ${(UserDetails.phoneExt)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Email</td>
                                                <td class="se-label-value"> ${(UserDetails.email)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Branch Name</td>
                                                <td class="se-label-value"> ${(WorkStation.info())!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Last Update</td>
                                                <td class="se-label-value"> ${(UserDetails.lastUpdate)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Last Login</td>
                                                <td class="se-label-value">
                                                    ${(UserDetails.lastLogin)!'Never Loged-in'}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Designation</td>
                                                <td class="se-label-value"> ${(UserDetails.designation.name)!}</td>
                                            </tr>
                                            <tr>
                                                <td class="se-label">Access Status</td>
                                                <td class="se-label-value">
                                                    <b>
                                                        <#assign active = User.status>
                                                        <#if active=1>Active<#else ><span style="color: red">Inactive</span></#if>
                                                    </b>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    <#--</div>-->
                                    </form>
                                </div>
                                <div class="col-lg-3">
                                    <form id="avatar-form" action="${ctx}/admin/attachDocument.se" method="post"
                                          class="">
                                        <input type="hidden" name="employeeID" value="${UserDetails.employeeID!}">
                                        <input type="hidden" name="type" value="Avatar">
                                        <input type="hidden" name="indicator" value="10">
                                        <span class="profile-picture pointer tooltip-error"
                                              onclick="$(this).closest('form').submit()"
                                              title="Click to Attach/Edit Avatar">
                                            <img id="avatar" class="editable img-responsive backup_picture" alt="Avatar"
                                                 style="width: 150px; height: 188px" src="${AvatarPath!}"/>
                                        </span>
                                    </form>

                                    <form action="${ctx}/admin/attachDocument.se" method="post"
                                          title="Click to Attach/Edit Signature">
                                        <input type="hidden" name="employeeID" value="${UserDetails.employeeID!}">
                                        <input type="hidden" name="type" value="Signature">
                                        <input type="hidden" name="indicator" value="10">
                                    <span class="profile-picture pointer" onclick="$(this).closest('form').submit()"
                                          style="margin-top: 10px">
                                        <img id="signature" class="editable img-responsive backup_picture"
                                             alt="Signature"
                                             style="width: 150px; height: 38px" src="${SignaturePath!}"/>
                                    </span>
                                    </form>

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
                                <button type="button"
                                        onclick="window.location = '${ctx}/security/changePassword.se?employeeID=${UserDetails.employeeID!}'"
                                        class="btn btn-md btn-info btn-white btn-round">
                                    <i class="ace-icon fa fa-key bigger-120 blue"></i>
                                    Reset Password
                                </button>
                                <button type="button"
                                        onclick="window.location = '${ctx}/admin/editStaff.se?id=${UserDetails.id!}'"
                                        class="btn btn-md btn-warning btn-white btn-round">
                                    <i class="ace-icon fa fa-pencil-square-o bigger-120 blue"></i>
                                    Edit
                                </button>
                                <button type="button" onclick="$('#data-form').submit()"
                                        class="btn btn-md btn-success btn-white btn-round">
                                    <i class="ace-icon fa fa-users green bigger-125 blue"></i>
                                    View / Edit Groups
                                </button>
                            </div>
                        </div>

                    </div>
                <#--<div class="col-md-4">
                    <div class="widget-main center">
                        <div class="row">
                            <div class="col-sm-12">
                                <form action="${ctx}/admin/attachDocument.se" method="post"  class="">
                                    <input type="hidden" name="employeeID" value="${StaffDetails.employeeID!}">
                                    <input type="hidden" name="type" value="Avatar">
                                    <input type="hidden" name="indicator" value="10">
                                    <span class="profile-picture pointer tooltip-error" onclick="$(this).closest('form').submit()" title="Click to Attach/Edit Avatar">
                                        <img id="avatar" class="editable img-responsive backup_picture" alt="Avatar"
                                             style="width: 150px; height: 188px" src="${AvatarPath!}"/>
                                    </span>
                                </form>

                                <form action="${ctx}/admin/attachDocument.se" method="post" title="Click to Attach/Edit Signature">
                                    <input type="hidden" name="employeeID" value="${StaffDetails.employeeID!}">
                                    <input type="hidden" name="type" value="Signature">
                                    <input type="hidden" name="indicator" value="10">
                                    <span class="profile-picture pointer" onclick="$(this).closest('form').submit()" style="margin-top: 10px">
                                        <img id="signature" class="editable img-responsive backup_picture" alt="Signature"
                                             style="width: 150px; height: 38px" src="${SignaturePath!}"/>
                                    </span>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>-->
                </div>
            </div>
        </div>
    </div>
    </#if>
</@layout.admin_layout>