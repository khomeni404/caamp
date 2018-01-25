<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "add-group_of_security">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>
    <#include '../template/constant.ftl'>

<div class="col-lg-6 col-lg-offset-3 col-xs-12 col-sm-12">
    <div class="widget-box widget-color-green">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter">Add new Group</h5>
        </div>

        <div class="widget-body">
            <form id="data-form" action="${ctx}/security/saveGroup.se" method="POST" class="form-horizontal"
                  role="form">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Group Name
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "GroupBean.name" "class='form-control' placeholder='Group Name'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Description <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "GroupBean.description" "class='form-control' placeholder='e.g. Work/Job/Purpose'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Project <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "GroupBean.project.id", IU.getOptions('Select a Project', projectMap)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
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