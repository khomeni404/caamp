<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "add-action_of_security">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>
    <#include '../template/constant.ftl'>

<div class="col-lg-6 col-lg-offset-3 col-xs-12 col-sm-12">
    <div class="widget-box widget-color-green">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter">Add new Action</h5>
        </div>

        <div class="widget-body">
            <form id="data-form" action="${ctx}/security/saveAction.se" method="POST" class="form-horizontal"
                  role="form">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Action Name
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "ActionBean.name" "class='form-control' placeholder='Action Name'" />
                                <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Action
                                    Value <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "ActionBean.value" "class='form-control' placeholder='The value of Action. e.g.method name'" />
                                <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Project <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "ActionBean.helper", IU.getOptions('Select a Project', projectMap)!,  "onchange='loadSelector(this, \"#component\\\\.id\")' class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Component <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "ActionBean.component.id", IU.getOptions('Select a Option', actionMap!)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
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
<script type="text/javascript">
    function loadSelector(thisObj, target) {
        $.ajax({
            type: "GET",
            url: '${ctx}/ajax/getComponentListSelector.se',
            data: {
                projectId: thisObj.value
            },
            dataType: "text",
            cache: false,
            success: function (response) {
                $(target).empty().append(response).trigger("chosen:updated");
//                $('#component\\.id').empty().append(response).trigger("chosen:updated");
            }
        });
    }
</script>