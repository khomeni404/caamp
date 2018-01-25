<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "occupation">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>
    <#include '../template/constant.ftl'>


<div class="col-lg-12 col-xs-12 col-sm-12">
    <div class="widget-box widget-color-green">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter"><b>Add New Project</b></h5>
        </div>

        <div class="widget-body">
            <form id="data-form" action="${ctx}/admin/saveProject.se" method="POST"
                  class="form-horizontal"
                  role="form">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-lg-6 col-xs-12">

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Project Code
                                    <span class="se-mandatory">*</span></label>
                                <div class="col-sm-8">
                                    <@spring.formInput  "ProjectBean.code" "class='form-control' placeholder='Project Code'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Project Title
                                    <span class="se-mandatory">*</span></label>
                                <div class="col-sm-8">
                                    <@spring.formInput  "ProjectBean.title" "class='form-control' placeholder='Project Title'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Project Level
                                    <span class="se-mandatory">*</span></label>
                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "ProjectBean.level", IU.getOptions('Select a Option', PROJECT_LEVEL)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Project
                                    Status
                                    <span class="se-mandatory">*</span></label>
                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "ProjectBean.status", IU.getOptions('Select a Option', PROJECT_STATUS)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Application
                                    Open
                                    <span class="se-mandatory">*</span></label>
                                <div class="col-sm-8">
                                    <div class="input-daterange input-group">
                                        <@spring.formInput  "ProjectBean.appStart" "class='input-sm form-control' placeholder='Application Start' data-date-format='dd/mm/yyyy'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                        <span class="input-group-addon">
                                                    <i class="fa fa-exchange"></i>
                                                </span>
                                        <@spring.formInput  "ProjectBean.appEnd" "class='input-sm form-control' placeholder='Application End' data-date-format='dd/mm/yyyy'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-xs-12">
                            <div class="form-group">
                                <label class="col-sm-12 control-label no-padding-right"
                                       for="incident-type">Mandatory Doc</label>

                            <div class="col-sm-6">
                            <div class="control-group">
                                <#assign c = 0>
                                <#list docIndicatorMapList as map>
                                    <#assign Properties = map.properties>
                                <#--${field!} <br>-->
                                    <div class="checkbox" style="padding-left: 18px">
                                        <label>
                                            <input name="mandatoryDocList[${c}]"
                                                   class="ace ace-checkbox-2" ${map.checked!}
                                                   value="${Properties.id!}" type="checkbox"/>
                                            <span class="lbl"> ${Properties.name!'--'}</span>
                                        </label>
                                    </div>
                                    <#assign c = c + 1>

                                    <#if c == 8>
                                    <#--To make another Col after print 8 checkbox-->
                                    </div>
                                    </div>

                                    <div class="col-sm-6">
                                    <div class="control-group">
                                    </#if>

                                </#list>
                            </div>
                            </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="widget-toolbox padding-8 clearfix">
                    <div class="btn-group pull-right">
                        <button type="submit"
                                class="btn btn-md btn-danger btn-white btn-round">
                            <i class="ace-icon fa fa-floppy-o bigger-125"></i>
                            Save
                        </button>

                        <button type="reset"
                                class="btn btn-md btn-success btn-white btn-round">
                            <i class="ace-icon fa fa-refresh bigger-125 red2"></i>
                            Reset
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

</@layout.admin_layout>

