<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "occupation_of_config">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>
    <#include '../template/constant.ftl'>


<div class="col-lg-6 col-lg-offset-3 col-xs-12 col-sm-12">
    <div class="widget-box widget-color-green">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter">Add new Occupation</h5>
        </div>

        <div class="widget-body">
            <form id="data-form" action="${ctx}/admin/saveOccupation.se" method="POST"
                  class="form-horizontal"
                  role="form">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Parent
                                    Occupation</label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "OccupationBean.parentOccupation.id", IU.getOptions('Select a Option', occupationMap)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                                <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Occupation
                                    Name
                                    <span class="se-mandatory">*</span>
                                </label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "OccupationBean.name" "class='form-control' placeholder='Occupation Name'" />
                                <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">&#2472;&#2494;&#2478;
                                    (&#2476;&#2494;&#2434;&#2482;&#2494;&#2468;&#2503;)
                                    <span class="help-span" text="Unicode Character is required. PLease type using Avro"><i class="fa fa-question bigger-150"></i></span>
                                </label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "OccupationBean.nameBN" "class='form-control' placeholder='&#2472;&#2494;&#2478; (&#2476;&#2494;&#2434;&#2482;&#2494;&#2468;&#2503;)'" />
                                <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="widget-toolbox padding-8 clearfix">
                    <div class="btn-group pull-right">
                        <button type="submit" class="btn btn-md btn-danger btn-white btn-round">
                            <i class="ace-icon fa fa-floppy-o bigger-125"></i>
                            Save
                        </button>

                        <button type="button" onclick="$('#data-form').trigger('reset');"
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

