<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  '${(title)!}', 'photo-n-doc' >
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility!/>
    <#assign App = app!/>
    <#assign Project = App.project!/>
    <#assign mandatoryDocList = Project.mandatoryDocList!/>
    <#assign upDocMap = uploadedDocMap!/>
    <#assign manDocMapList = mandatoryDocMapList!/>
    <#include '../template/constant.ftl'>

<#list manDocMapList as map>
<#assign Properties = map.properties!>
<div class="col-xs-12 col-sm-3 widget-container-col">
    <div class="widget-box">
        <div class="widget-header center">
            <h5 class="widget-title smaller green"><b>${IU.getPropValue(DOC_INDICATOR, Properties.id?string)!}</b></h5>
        </div>

        <div class="widget-body">
            <div class="widget-main padding-6 center">
                <div class="row">
                    <div class="col-sm-12">
                        <span class="profile-picture">
                            <img id="avatar" class="editable img-responsive backup_picture" alt="Da da da da"
                                 style="width: 150px; height: 188px"   src="${IU.getDocPath(upDocMap[Properties.id?string])!}"/>
                        </span>
                        <form action="${ctx}/app/attachDocument.se" method="post">
                            <input type="hidden" name="type" value="${(map.type)!}">
                            <input type="hidden" name="indicator" value="${(Properties.id?string)!}">
                            <div class="form-group">
                                <button type="submit" class="btn btn-white btn-success btn-bold col-lg-12 col-xs-12">
                                    <i class="ace-icon fa fa-folder bigger-120 blue"></i>
                                    Attach/Edit ${(map.type)!}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</#list>

</@layout.student_layout>