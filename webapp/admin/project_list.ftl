<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'project-list'>
    <#escape x as x?html>
        <#assign ctx = rc.getContextPath()/>
        <#assign IU = Utility/>
        <#include '../template/constant.ftl'>
    <div class="col-lg-12 col-xs-12 col-sm-12">
        <div class="widget-box widget-color-green">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter"><b>Project List</b></h5>

                <div class="widget-toolbar">
                    <button type="submit" onclick="window.location = '${ctx}/admin/createProject.se'"
                            class="btn btn-xs btn-inverse btn-round">
                        <i class="ace-icon fa fa-plus bigger-125"></i>
                        <b>New Project</b>
                    </button>
                </div>

            <span class="pull-right">

            </span>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-lg-12 col-xs-12 center">
                            <#assign counter = 1>
                            <#list projectList as Project>
                                <div class="dropdown dropdown-preview">
                                    <ul class="dropdown-menu dropdown-danger">
                                        <li>
                                            <a href="#" class="btn btn-info" tabindex="-1"><b>${Project.name!}</b></a>
                                        </li>

                                        <li>
                                            <a href="#" tabindex="-1">Version: <b>1.3.25</b></a>
                                        </li>

                                        <li>
                                            <a href="#" tabindex="-1">Release: <b>Jun-12-2017</b></a>
                                        </li>

                                        <li>
                                            <a href="${ctx}/security/groupList.se?projectId=${Project.id!}">Group
                                                List</a>
                                        </li>

                                        <li>
                                            <a href="${ctx}/admin/viewProject.se?id=${Project.id!}">View</a>
                                        </li>

                                        <li class="divider"></li>

                                        <li class="dropdown-hover">
                                            <a href="#" tabindex="-1" class="clearfix">
                                                <span class="pull-left">App Links</span>

                                                <i class="ace-icon fa fa-caret-right pull-right"></i>
                                            </a>

                                            <ul class="dropdown-menu dropdown-danger">
                                                <#assign uriList = Project.linkList>
                                                <#list uriList as uri>
                                                    <li>
                                                        <a href="${uri!}" target="_blank" tabindex="-1"> Application
                                                            Link ${uri?index+1!}</a>
                                                    </li>
                                                </#list>
                                            </ul>
                                        </li>

                                        <li>
                                            <a href="${Project.loadBal!}" tabindex="-1">Load Balancer</a>
                                        </li>
                                        <li>
                                            <a target="_blank" href="${Project.loadBal!}/auth/autoLogin.se"
                                               tabindex="-1">Direct Login</a>
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
    </#escape>
</@layout.admin_layout>