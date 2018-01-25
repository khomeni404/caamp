<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  "${title!}", "family-info" >
    <#assign ctx = rc.getContextPath()/>

    <#if message??>
    <#else >
        <#import "/spring.ftl" as spring/>
        <#assign IU = Utility!/>
        <#assign MasterOccupationMap = occupationBeanMap!/>
        <#assign Application = Application!/>
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
                    <h5 class="widget-title bigger lighter"><b>Family Information</b></h5>
                </div>

                <div class="widget-body">
                    <div class="widget-main">
                        <div class="row">
                            <div class="col-lg-6 col-xs-12">

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">
                                    Father State<span class="se-mandatory">*</span>
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getPropValue(FamilyInfoBean.fatherState)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Father Education<span
                                        class="se-mandatory">*</span>
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getPropValue(FamilyInfoBean.fatherEducation)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Father Occupation <span
                                        class="se-mandatory">*</span>
                                </label>

                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getOccupationName(FamilyInfoBean.fatherOccupation)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Father Cell No<span
                                        class="se-mandatory">*</span>
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${FamilyInfoBean.fatherCell!'---'}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Mother State<span
                                        class="se-mandatory">*</span>
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getPropValue(FamilyInfoBean.motherState)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Mother Education<span
                                        class="se-mandatory">*</span>
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getPropValue(FamilyInfoBean.motherEducation)!}
                                </label>

                            </div>


                            <div class="col-lg-6 col-xs-12">

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Mother Occupation <span
                                        class="se-mandatory">*</span>
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getOccupationName(FamilyInfoBean.motherOccupation)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Mother Cell No<span
                                        class="se-mandatory">*</span>
                                </label>

                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(FamilyInfoBean.motherCell)!'--'}
                                </label>


                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Guardian Name<span
                                        class="se-mandatory">*</span>
                                </label>

                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(FamilyInfoBean.guardianName)!'--'}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label"
                                       for="guardianRelation">Guardian Relation<span
                                        class="se-mandatory">*</span>
                                </label>

                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(FamilyInfoBean.guardianRelation)!'--'}
                                </label>



                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label"
                                       for="guardianOccupation">Guardian Occupation<span
                                        class="se-mandatory">*</span>
                                </label>
                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${IU.getOccupationName(FamilyInfoBean.guardianOccupation)!}
                                </label>

                                <label class="col-lg-4 col-sm-12 col-xs-12 se-label"
                                       for="guardianCellNo">Guardian Cell No<span class="se-mandatory">*</span>
                                </label>

                                <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                                ${(FamilyInfoBean.guardianCellNo)!'--'}
                                </label>

                            </div>
                        </div> <#--row-->
                    </div> <#--widget-main-->

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
                            <button type="button" onclick="window.location = '${ctx}/app/editFamilyData.se'"
                                    class="btn btn-md btn-success btn-white btn-round">
                                <i class="ace-icon fa fa-pencil bigger-125 red2"></i>
                                Edit
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </#if>
</@layout.student_layout>

