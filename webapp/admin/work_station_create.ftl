<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "work-station-add">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility/>
    <#assign ctx = rc.getContextPath()/>

<div class="col-lg-5 col-xs-12 col-sm-12">
    <div class="widget-box widget-color-green">
        <div class="widget-header">
            <h5 class="widget-title bigger lighter">Add new Work Station</h5>
        </div>

        <div class="widget-body">
            <form id="data-form" action="${ctx}/admin/saveWorkStation.se" method="POST" class="form-horizontal"
                  role="form">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Station Type <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "WorkStationBean.type", IU.getOptions('Select a Type', typeMap)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Station Code
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "WorkStationBean.code" "class='form-control' placeholder='e.g. 125, D011'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Station Name
                                    <span class="se-mandatory">*</span></label>
                                <div class="col-sm-8">
                                    <@spring.formInput  "WorkStationBean.name" "class='form-control' placeholder='e.g. MIS Division'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Alias Name</label>
                                <div class="col-sm-8">
                                    <@spring.formInput  "WorkStationBean.alias" "class='form-control' placeholder='e.g. FAD / MISD etc.'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="incident-type">Address
                                    <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formInput  "WorkStationBean.address" "class='form-control' placeholder='e.g. 37, Dilkusha C/A, Dhaka.'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right"
                                       for="incident-type">Institute Name <span class="se-mandatory">*</span></label>

                                <div class="col-sm-8">
                                    <@spring.formSingleSelect "WorkStationBean.institute.id", IU.getOptions('Select an Institute', instituteMap)!,  "class='chosen-select form-control col-lg-12 col-xs-12'"/>
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

<div class="col-md-7 col-sm-6">
    <table>

        <#list stationList as station>
            <tr style="padding: 2px 0 2px 0; border-bottom: 1px solid #fd992a">
                <td><b>${(station?index+1)!}.</b></td>
                <td>${station.code!}</td>
                <#--<td class="col-md-6 pointer">
                    <a href="${ctx}/admin/viewUserDetails.se?id=${resultMap.ID!}" title="Click to View ${resultMap.NAME!} details">${resultMap.NAME!}</a>
                </td>-->
                <td class="col-md-4">${(station.name)!}</td>
                <td class="col-md-4">${(station.address)!}</td>
                <td class="col-md-4">${(station.institute.name)!}</td>
            </tr>
        </#list>
    </table>
</div>

</@layout.admin_layout>