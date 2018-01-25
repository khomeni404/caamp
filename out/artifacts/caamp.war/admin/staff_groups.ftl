<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!} : <b>${staff.name!}</b>", "occupation">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>
    <#assign Staff = staff/>
    <#assign DataListMap = dataListMap/>
    <#include '../template/constant.ftl'>
<form id="data-form" action="${ctx}/admin/updateUserGroups.se" method="POST"
      class="form-horizontal"
      role="form">
    <input type="hidden" value="${Staff.id!}" name="staffId"/>

    <div class="row">
        <#assign counter = 0/>
        <#assign projectList = DataListMap?keys/>
        <#list projectList as project>
            <#assign DataList = DataListMap[project]/>
            <div class="col-sm-6">
                <div class="widget-box widget-color-orange">
                    <div class="widget-header">
                        <h4 class="widget-title lighter smaller"><b>${project!}</b></h4>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main padding-8">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="my-action-list" class="control-group">
                                        <#list DataList as group>
                                            <div class="checkbox" style="padding-left: 18px">
                                                <label>
                                                    <input name="jsonArray" class="ace ace-checkbox-2" ${group.checked!}
                                                           value="{id:${group.id!}}" type="checkbox"/>
                                                    <span class="lbl"> ${(group.name)!'--'}</span>
                                                </label>
                                            </div>
                                        </#list>
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

                                <button type="submit"
                                        class="btn btn-md btn-success btn-white btn-round">
                                    <i class="ace-icon fa fa-exchange green bigger-125 blue"></i>
                                    Update Groups
                                </button>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <#assign counter = counter+1/>
        <#if counter % 2 = 0>
        </div><div class="row">
        </#if>
        </#list>

    </div>

</form>
</@layout.admin_layout>
