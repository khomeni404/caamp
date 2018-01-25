<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'search-staff_of_security'>
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#include '../template/constant.ftl'>

<div class="col-md-4 col-sm-6">
    <div class="widget-box widget-color-green2">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter"><b>Employee Search</b></h5>
        </div>

        <div class="widget-body">
            <form action="${ctx}/admin/userList.se" method="POST"
                  class="form-horizontal"
                  role="form">
                <div class="widget-main">
                    <div class="row">

                        <div class="col-lg-12 col-xs-12">

                            <div class="form-group">
                                <label class="col-md-12 control-label-l">User ID / Employee ID</label>

                                <div class="col-lg-12 col-sm-12 col-xs-12">
                                    <@spring.formInput  "UserSearchBean.employeeID" "autoFocus class='form-control' maxlength='100'  placeholder='e.g. 20180103001'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12 control-label-l">Full Name / Nick Name</label>

                                <div class="col-md-12">
                                    <@spring.formInput  "UserSearchBean.name" "class='form-control' placeholder='Full Name / Nick Name'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12 control-label-l">Contact Number</label>

                                <div class="col-md-12">
                                    <@spring.formInput  "UserSearchBean.cell" "class='form-control' placeholder='Cell/Phone/Fax/Tel'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12 control-label-l">Work Station</label>

                                <div class="col-md-12">
                                    <@spring.formInput  "UserSearchBean.workStation" "class='form-control' placeholder='Name / Code / Br Code'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <@spring.formHiddenInput  "UserSearchBean.errors" />
                                    <@spring.showErrors " & ", "err-msg" />
                            </div>
                        </div>

                    </div>
                </div>

                <div class="widget-toolbox padding-8 clearfix">
                    <div class="btn-group pull-right">
                        <button type="button" onclick="window.location = '${ctx}/admin/dashboard.se'"
                                class="btn btn-md btn-danger btn-white btn-round">
                            <i class="ace-icon fa fa-backward bigger-120 blue"></i>
                            Back
                        </button>
                        <button type="reset"
                                class="btn btn-md btn-success btn-white btn-round">
                            <i class="ace-icon fa fa-refresh bigger-125 red2"></i>
                            Reset
                        </button>
                        <button type="submit"
                                class="btn btn-md btn-success btn-white btn-round">
                            <i class="ace-icon fa fa-search green bigger-125 blue"></i>
                            Search
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="col-md-8 col-sm-6">
    <table>
        <#list resultList as resultMap>
            <tr style="padding: 2px 0 2px 0; border-bottom: 1px solid #fd992a">
                <td><b>${(resultMap?index+1)!}.</b></td>
                <td class="col-md-1">${resultMap.EMP_ID!}</td>
                <td class="col-md-6 pointer">
                    <a href="${ctx}/admin/viewUserDetails.se?id=${resultMap.ID!}" title="Click to View ${resultMap.NAME!} details">${resultMap.NAME!}</a>
                </td>
                <td class="col-md-4">${resultMap.WS_ALIAS!resultMap.WS_NAME!'--'}</td>
                <td class="col-md-1">${resultMap.CELL!}</td>

            </tr>
        </#list>
    </table>
</div>
</@layout.admin_layout>