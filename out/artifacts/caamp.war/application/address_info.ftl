<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  '${(title)!}', 'addresses' >
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility!/>
    <#assign PresentPO = presentPO!/>
    <#assign PermanentPO = permanentPO!/>

    <#include "../template/constant.ftl"/>
<div class="row">

<#--###  Present Address Part  ###-->
    <#if presentPO??>
        <div id="present-address-view" class="col-lg-6 col-sm-6 col-xs-12">
            <div class="widget-box widget-color-green">
                <div class="widget-header">
                    <h5 class="widget-title bigger lighter"><b>Present Address</b></h5>
                </div>

                <div class="widget-body">
                    <div class="widget-main">
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Address Line 1
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PresentPO.line1)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Address Line 2
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PresentPO.line2)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Police Station
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PresentPO.ps.name)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Police Station
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PresentPO.ps.district.name)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Division
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getPropValue(PresentPO.ps.district.divisionId)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Post Office
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PresentPO.po)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Post Code
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PresentPO.pc)!}
                                </label>
                            </div>
                        </div>

                    </div>
                    <div class="widget-toolbox padding-8 clearfix">
                        <div class="btn-group pull-left">
                            <button type="button"
                                    onclick="window.location = '${ctx}/app/viewApplication.se'"
                                    class="btn btn-md btn-danger btn-white btn-round btn-bold">
                                <i class="ace-icon fa fa-backward bigger-120 blue"></i>
                                Back
                            </button>
                        </div>
                        <div class="btn-group pull-right">
                            <button type="button" onclick="togglePresentAddressBlokes()"
                                    class="btn btn-md btn-danger btn-white btn-round">
                                <i class="ace-icon fa fa-pencil bigger-125 green"></i>
                                Edit
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <#--<#else >-->
    </#if>
    <div id="present-address-form" style="<#if presentPO??>display: none</#if>" class="col-lg-6 col-sm-6 col-xs-12">
        <div class="widget-box widget-color-purple">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter"><b>Present Address</b></h5>
            </div>

            <div class="widget-body">
                <form id="data-form" action="${ctx}/app/savePresentAddress.se" method="POST"
                      class="form-horizontal"
                      role="form">
                    <@spring.formHiddenInput "PresentAddress.id"/>
                    <@spring.formHiddenInput "PresentAddress.type"/>
                    <div class="widget-main">
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="holder.name">Holder Name<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formHiddenInput  "PresentAddress.holder.id"/>
                                    <@spring.formInput  "PresentAddress.holder.name" "readonly class='form-control'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="divisionCode">Division<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PresentAddress.divisionCode" IU.getOptions('Select Division', DIVISION_NAMES) "onchange='loadDistrictListSelector(this.value);' class='form-control'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="district.id">District<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PresentAddress.district.id" IU.getOptions('Select District', districtMapPresent) "class='form-control' onchange='getPoliceStationListSelector(this.value);'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="ps.id">Police Station/Thana<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PresentAddress.ps.id" IU.getOptions('Select Police Station', psMapPresent) "class='form-control'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="line1">House No./Road No./Floor etc.<span
                                            class="se-mandatory">*</span> <span
                                            class="se-hints pull-right"><span>i.e.</span> H#42 / Road#2 / 2nd Floor</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PresentAddress.line1" "class='form-control' placeholder='House No./Para/etc' maxlength='100'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="line2">Village/Sector/Block/Para. <span
                                            class="se-hints pull-right"><span>i.e.</span> Nazrul Avenue / Joarder Para / Vill-Bagdanga</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PresentAddress.line2" "class='form-control' placeholder='Road No./Village/etc.' maxlength='100'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="po">Post Office
                                    </label>

                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PresentAddress.po" "class='form-control' placeholder='Post Office Name' maxlength='100'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>

                                    <label class="col-lg-2 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="pc">Post Code
                                    </label>

                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PresentAddress.pc" "class='form-control' placeholder='4 digit Post Code' maxlength='4'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="widget-toolbox padding-8 clearfix">
                        <div class="btn-group pull-left">
                            <button type="button"
                                    onclick="window.location = '${ctx}/app/viewApplication.se'"
                                    class="btn btn-md btn-danger btn-white btn-round btn-bold">
                                <i class="ace-icon fa fa-backward bigger-120 blue"></i>
                                Back
                            </button>
                        </div>
                        <div class="btn-group pull-right">
                            <button type="reset"
                                    class="btn btn-md btn-success btn-white btn-round">
                                <i class="ace-icon fa fa-refresh bigger-125 red2"></i>
                                Reset
                            </button>
                            <button type="submit"
                                    class="btn btn-md btn-danger btn-white btn-round">
                                <i class="ace-icon fa fa-floppy-o bigger-125 green"></i>
                                <#if presentPO??>Update<#else >Save</#if>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<#--</#if>-->


<#--###  Permanent Address Part  ###-->
    <#if permanentPO??>
        <div id="permanent-address-view" class="col-lg-6 col-sm-6 col-xs-12">
            <div class="widget-box widget-color-green">
                <div class="widget-header">
                    <h5 class="widget-title bigger lighter"><b>Permanent Address</b></h5>
                </div>

                <div class="widget-body">
                    <div class="widget-main">
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Address Line 1
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PermanentPO.line1)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Address Line 2
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PermanentPO.line2)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Police Station
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PermanentPO.ps.name)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Police Station
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PermanentPO.ps.district.name)!}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Division
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getPropValue(PermanentPO.ps.district.divisionId)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Post Office
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PermanentPO.po)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Post Code
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(PermanentPO.pc)!}
                                </label>

                            </div>
                        </div>
                    </div>

                    <div class="widget-toolbox padding-8 clearfix">
                        <div class="btn-group pull-left">
                            <button type="button"
                                    onclick="window.location = '${ctx}/app/viewApplication.se'"
                                    class="btn btn-md btn-danger btn-white btn-round btn-bold">
                                <i class="ace-icon fa fa-backward bigger-120 blue"></i>
                                Back
                            </button>
                        </div>
                        <div class="btn-group pull-right">
                            <button type="button" onclick="togglePermanentAddressBlokes()"
                                    class="btn btn-md btn-danger btn-white btn-round">
                                <i class="ace-icon fa fa-pencil bigger-125 green"></i>
                                Edit
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <#--<#else >-->
    </#if>
    <div id="permanent-address-form" style="<#if permanentPO??>display: none</#if>" class="col-lg-6 col-sm-6 col-xs-12">
        <div class="widget-box widget-color-purple">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter"><b>Permanent Address</b></h5>
            </div>

            <div class="widget-body">
                <form id="data-form" action="${ctx}/app/savePermanentAddress.se" method="POST"
                      class="form-horizontal"
                      role="form">
                    <@spring.formHiddenInput "PermanentAddress.id"/>
                    <@spring.formHiddenInput "PermanentAddress.type"/>
                    <div class="widget-main">

                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="holder.name">Holder Name<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formHiddenInput  "PermanentAddress.holder.id"/>
                                    <@spring.formInput  "PermanentAddress.holder.name" "readonly class='form-control'"/>
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="divisionCode">Division<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PermanentAddress.divisionCode" IU.getOptions('Select Division', DIVISION_NAMES) "onchange='loadDistrictListSelector(this.value);' class='form-control'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="district.id">District<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PermanentAddress.district.id" IU.getOptions('Select District', districtMapPermanent) "class='form-control' onchange='getPoliceStationListSelector(this.value);'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="ps.id">Police Station/Thana<span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-8 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PermanentAddress.ps.id" IU.getOptions('Select Police Station', psMapPermanent) "class='form-control'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="line1">House No./Road No./Floor etc.<span
                                            class="se-mandatory">*</span> <span
                                            class="se-hints pull-right"><span>i.e.</span> H#42 / Road#2 / 2nd Floor</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PermanentAddress.line1" "class='form-control' placeholder='House No./Para/etc' maxlength='100'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="line2">Village/Sector/Block/Para. <span
                                            class="se-hints pull-right"><span>i.e.</span> Nazrul Avenue / Joarder Para / Vill-Bagdanga</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PermanentAddress.line2" "class='form-control' placeholder='Road No./Village/etc.' maxlength='100'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="po">Post Office
                                    </label>

                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PermanentAddress.po" "class='form-control' placeholder='Post Office Name' maxlength='100'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>

                                    <label class="col-lg-2 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="pc">Post Code
                                    </label>

                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PermanentAddress.pc" "class='form-control' placeholder='4 digit Post Code' maxlength='4'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="widget-toolbox padding-8 clearfix">
                        <div class="btn-group pull-left">
                            <button type="button"
                                    onclick="window.location = '${ctx}/app/viewApplication.se'"
                                    class="btn btn-md btn-danger btn-white btn-round btn-bold">
                                <i class="ace-icon fa fa-backward bigger-120 blue"></i>
                                Back
                            </button>
                        </div>
                        <div class="btn-group pull-right">
                            <button type="reset"
                                    class="btn btn-md btn-success btn-white btn-round">
                                <i class="ace-icon fa fa-refresh bigger-125 red2"></i>
                                Reset
                            </button>
                            <button type="submit"
                                    class="btn btn-md btn-danger btn-white btn-round">
                                <i class="ace-icon fa fa-floppy-o bigger-125 green"></i>
                                <#if permanentPO??>Update<#else >Save</#if>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<#--</#if>-->
</div>

</@layout.student_layout>

<script type="text/javascript">
    $(function () {
        //$('#guardianOccupation').trigger("chosen:updated");
        var divisionCode = $('#divisionCode').val();
        console.log('divisionCode = ' + divisionCode);
        var districtId = $('#district\\.id').val();
        console.log('districtId = ' + districtId);
    });

    function togglePresentAddressBlokes() {
        $('#present-address-view').toggle();
        $('#present-address-form').toggle();
    }
    function togglePermanentAddressBlokes() {
        $('#permanent-address-view').toggle();
        $('#permanent-address-form').toggle();
    }

    function loadDistrictListSelector(divisionId) {
        $.ajax({
            type: "GET",
            url: '${ctx}/ajax/getDistrictListSelector.se',
            data: {
                divisionId: divisionId
            },
            dataType: "text",
            cache: false,
            success: function (response) {
                $('#district\\.id').empty().append(response).trigger("chosen:updated");
                $('#ps\\.id').empty().append('<option value="">--Select District First--</option>').trigger("chosen:updated");
            }
        });
    }

    function getPoliceStationListSelector(districtId) {
        $.ajax({
            type: "GET",
            url: '${ctx}/ajax/getPoliceStationListSelector.se',
            data: {
                districtId: districtId
            },
            dataType: "text",
            cache: false,
            success: function (response) {
                $('#ps\\.id').empty().append(response).trigger("chosen:updated");
            }
        });
    }
</script>
