<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  "${title!}", "family-info" >
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility!/>
    <#assign MasterOccupationMap = occupationBeanMap!/>
    <#assign FamilyInfoBean = FamilyInfoBean!/>
    <#assign FOccupation = FOccupation!/>
    <#assign MOccupation = MOccupation!/>
    <#assign GOccupation = GOccupation!/>
    <#assign GroupOccupation = GroupOccupation!/>
    <#include "../template/constant.ftl"/>
<div class="row">
    <div class="col-lg-12 col-sm-6">
        <div class="widget-box widget-color-green">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">Family Information</h5>
            </div>

            <div class="widget-body">
                <form id="data-form" action="${ctx}/app/saveFamilyData.se" method="POST"
                      class="form-horizontal"
                      role="form">
                    <@spring.formHiddenInput "FamilyInfoBean.id"/>
                    <@spring.formHiddenInput "FamilyInfoBean.applicantId"/>
                    <@spring.formHiddenInput "FamilyInfoBean.applicationId"/>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="widget-main">
                                <div class="col-lg-4 col-xs-12">
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="fatherState">Father State<span class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.fatherState" IU.getOptions('Select State', PARENT_STATES) "class='form-control'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="fatherEducation">Father Education<span
                                                class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.fatherEducation" IU.getOptions('Select State', PARENT_EDUCATIONS) "class='form-control'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="fatherOccupation">Father Occupation Type
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.helper" IU.getOptions('Select', MasterOccupationMap) "onchange='loadOccupationSelector(this, \"#fatherOccupation\")' class='form-control col-lg-12 col-xs-12'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="fatherOccupation">Father Occupation <span
                                                class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.fatherOccupation" IU.getOptions('Select', FOccupation) "class='chosen-select form-control'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="fatherCell">Father Cell No<span class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formInput  "FamilyInfoBean.fatherCell" "class='form-control' placeholder='Father Cell' maxlength='100'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>

                                </div>

                            <#--2nd Column-->
                                <div class="col-lg-4 col-xs-12">
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="motherState">Mother State<span class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.motherState" IU.getOptions('Select State', PARENT_STATES) "class='form-control'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="motherEducation">Mother Education<span
                                                class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.motherEducation" IU.getOptions('Select Education', PARENT_EDUCATIONS) "class='form-control'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="motherOccupation">Mother Occupation Type
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.helper" IU.getOptions('Select', MasterOccupationMap) "onchange='loadOccupationSelector(this, \"#motherOccupation\")' class='form-control col-lg-12 col-xs-12'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="motherOccupation">Mother Occupation <span
                                                class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.motherOccupation" IU.getOptions('Select', MOccupation) "class='chosen-select form-control col-lg-12 col-xs-12'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="motherCell">Mother Cell No<span class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formInput  "FamilyInfoBean.motherCell" "class='form-control' placeholder='Father Cell' maxlength='100'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>

                                </div>

                            <#--3rd Column-->
                                <div class="col-lg-4 col-xs-12">
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="guardianName">Guardian Name<span class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formInput  "FamilyInfoBean.guardianName" "class='form-control'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="guardianRelation">Guardian Relation<span
                                                class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formInput  "FamilyInfoBean.guardianRelation" "class='form-control'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="guardianOccupation">Guardian Occupation Type
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.helper" IU.getOptions('Select', MasterOccupationMap) "onchange='loadOccupationSelector(this, \"#guardianOccupation\")' class='form-control col-lg-12 col-xs-12'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="guardianOccupation">Guardian Occupation<span
                                                class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect  "FamilyInfoBean.guardianOccupation" IU.getOptions('Select', GOccupation) "class='chosen-select form-control '" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="guardianCellNo">Guardian Cell No<span
                                                class="se-mandatory">*</span>
                                        </label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formInput  "FamilyInfoBean.guardianCellNo" "class='form-control' maxlength='100'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                        </div>
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
                            <button type="submit"
                                    class="btn btn-md btn-danger btn-white btn-round">
                                <i class="ace-icon fa fa-floppy-o bigger-125 green"></i>
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
</div>

</@layout.student_layout>

<script type="text/javascript">
    $(function () {
        // $('#guardianOccupation').trigger("chosen:updated");
    });

    function loadOccupationSelector(thisObj, target) {
        $.ajax({
            type: "GET",
            url: '${ctx}/ajax/getOccupationListSelector.se',
            data: {
                parentId: thisObj.value
            },
            dataType: "text",
            cache: false,
            success: function (response) {
                $(target).empty().append(response).trigger("chosen:updated");
            }
        });
    }
</script>
