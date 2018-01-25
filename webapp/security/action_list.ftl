<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "occupation">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>
    <#assign Group = group/>
    <#assign DataList = dataList/>
    <#include '../template/constant.ftl'>

<div class="row">
    <div class="col-sm-12">
        <div class="widget-box widget-color-blue2">
            <div class="widget-header">
                <h4 class="widget-title lighter smaller"><b>Actions of ${Group.name!}</b></h4>
                <#--<br/> <span>${Group.description!}</span>
                <hr/>-->
            </div>

            <div class="widget-body">
                <form id="data-form" action="${ctx}/security/assignActionToGroup.se" method="POST"
                      class="form-horizontal"
                      role="form">
                    <input type="hidden" value="${Group.id!}" name="groupId"/>

                    <div class="widget-main padding-8">
                    <div class="row">

                    <#--Customized Tree View-->
                        <#assign counter = 0>
                        <#list DataList as data>
                            <div class="col-lg-3"> <#--Please change <#if counter%(12/3)=0>-->
                                <div id="my-action-list" class="control-group">
                                    <#assign Component = data.component!>
                                    <label class="control-label bolder blue">

                                        <b class="bolder blue" style="cursor: pointer"
                                           onclick="toggleActions('${Component.id}');"><i id="comp-sign-${Component.id}" class="fa fa-plus-square-o bigger-115"></i>  ${Component.name!}
                                            Component</b>
                                    </label>

                                    <div id="actions-${Component.id}" style="display: none">
                                        <#assign ActionMapList = data.actionMapList!>
                                        <#if ActionMapList?has_content>
                                            <div class="checkbox"
                                                 style="padding-left: 18px">
                                                <label>
                                                    <input class="ace ace-checkbox-1"
                                                           onclick="selectAllActions(this, 'action-${Component.id}')"
                                                           value="" type="checkbox"/>
                                                    <span class="lbl"> All Actions</span>
                                                </label>
                                            </div>
                                            <#list ActionMapList as actionMap>
                                                <#assign Action = actionMap.action>
                                                <div class="checkbox"
                                                     style="padding-left: 18px">
                                                    <label>
                                                        <input name="jsonArray"
                                                               class="ace ace-checkbox-2 action-${Component.id}" ${actionMap.checked!}
                                                               value="{id:${Action.id!}}" type="checkbox"/>
                                                        <span class="lbl"> ${Action.name!}</span>
                                                    </label>
                                                </div>
                                            </#list>
                                        <#else >
                                            <div class="checkbox">
                                                <label>
                                                    <span class="lbl"> No Action Found !</span>
                                                </label>
                                            </div>
                                        </#if>
                                    </div>
                                </div>

                            </div>
                            <#assign counter = counter+1>
                            <#if counter % (12/3) = 0>
                            </div>
                            <div class="row">
                            </#if>
                        </#list>


                    </div>
                    </div>

                    <div class="widget-toolbox padding-8 clearfix">
                        <div class="pull-left"><b>N.B. </b><span style="color: red"> Assigning Actions to the Group will be affected for the certain Project after the Project Restarted.</span></div>
                        <div class="btn-group pull-right">
                            <button type="button" onclick="window.location = '${ctx}/security/groupList.se'"
                                    class="btn btn-md btn-danger btn-white btn-round">
                                <i class="ace-icon fa fa-backward bigger-120 blue"></i>
                                Action List
                            </button>

                            <button type="submit"
                                    class="btn btn-md btn-success btn-white btn-round">
                                <i class="ace-icon fa fa-exchange green bigger-125 blue "></i>
                                Assign Actions
                            </button>
                        </div>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    function selectAllActions(parentDOM, className) {
        var isChecked = $(parentDOM).is(":checked");

        $('.' + className).each(function (i, obj) {
            console.log(i);
            $(obj).prop('checked', isChecked);
        });
    }

    function toggleActions(compId) {
        $('#actions-' + compId).toggle();
        var compSign = $('#comp-sign-' + compId);
        console.log(compSign.attr('class'));
        if (compSign.attr('class').indexOf('minus') !== -1) {
            compSign.attr('class', 'fa fa-plus-square-o bigger-110');
        } else {
            compSign.attr('class', 'fa fa-minus-square-o bigger-110');
        }
    }
</script>

</@layout.admin_layout>
