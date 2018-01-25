<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'view-project_of_admin'>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility!/>

<div class="col-lg-9 col-xs-12 col-sm-9">
    <div class="widget-box widget-color-green">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter">Project Info</h5>
        </div>
        <div class="widget-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-main">
                        <div class="row">
                            <div class="col-lg-9">
                                <form id="data-form" action="${ctx}/admin/editProject.se" method="POST"
                                      class="form-horizontal"
                                      role="form">
                                    <input type="hidden" name="id" value="${project.id!}">

                                    <table class="table table-striped table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="col-md-3 se-label">Project Name</td>
                                            <td class="col-md-9 se-label-value">${(project.name)!}</td>
                                        </tr>
                                        <tr>
                                            <td class="se-label">Context</td>
                                            <td class="se-label-value">${(project.ctx)!}</td>
                                        </tr>
                                        <tr>
                                            <td class="se-label">Description</td>
                                            <td class="se-label-value">${(project.description)!}</td>
                                        </tr>
                                        <tr>
                                            <td class="se-label">Server IP</td>
                                            <td class="se-label-value">
                                                <#list project.serverIPList as IP>
                                                    ${IP!}
                                                    <br/>
                                                </#list>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="se-label">Application Link</td>
                                            <td class="se-label-value">
                                                <#list project.linkList as URI>
                                                    <a target="_blank" href="${URI!}">${URI!}</a>
                                                    <br/>
                                                </#list>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                <#--</div>-->
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

                            <button type="button" onclick="$('#data-form').submit()"
                                    class="btn btn-md btn-success btn-white btn-round">
                                <i class="ace-icon fa fa-users green bigger-125 blue"></i>
                                Edit
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

</@layout.admin_layout>