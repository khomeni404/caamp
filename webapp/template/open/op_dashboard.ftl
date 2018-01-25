<#import "../../template/open/open_layout.ftl" as layout>
<@layout.open_layout "${(title)!}", 'dashboard'>
    <#assign ctx = rc.getContextPath()/>
    <#import "/spring.ftl" as spring/>

    <#escape x as x?html>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <h3 class="header smaller lighter green">Projects</h3>

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
                    </ul>
                </div>
            </#list>

        </div>
    </div>
    </#escape>
</@layout.open_layout>