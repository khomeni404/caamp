<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  '${(title)!}', 'personal-info' >
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#assign PersonalInfoBean = PersonalInfoBean/>
    <#assign Application = Application!/>
    <#include '../template/constant.ftl'>

<div class="row">
    <div class="col-lg-12 col-sm-6">
        <div class="widget-box widget-color-green">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">Personal Information</h5>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-lg-6 col-xs-12">
                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Student ID
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${Application.applicantId}
                            </label>

                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Student
                                Name <span class="se-mandatory">*</span>
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${(PersonalInfoBean.studentName)!}
                            </label>

                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Father
                                Name <span class="se-mandatory">*</span>
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${(PersonalInfoBean.fatherName)!}
                            </label>

                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Mother
                                Name <span class="se-mandatory">*</span>
                            </label>

                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${(PersonalInfoBean.motherName)!'---'}
                            </label>


                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Education
                                Level
                            </label>

                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${IU.getPropValue(PersonalInfoBean.educationLevelCode)!'---'}
                            </label>


                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Student Type
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${IU.getPropValue(PersonalInfoBean.studentType)!'---'}
                            </label>


                        </div>


                        <div class="col-lg-6 col-xs-12">

                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Date of Birth <span
                                    class="se-mandatory">*</span>
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${(PersonalInfoBean.dob)!'---'}
                            </label>


                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Sex <span
                                    class="se-mandatory">*</span>
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${IU.getPropValue(PersonalInfoBean.sex)!'---'}
                            </label>


                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Cell Phone <span
                                    class="se-mandatory">*</span>
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${(PersonalInfoBean.cellNo)!'---'}
                            </label>


                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">National ID No.
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${(PersonalInfoBean.nid)!'---'}
                            </label>


                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Religion<span
                                    class="se-mandatory">*</span>
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${IU.getPropValue(PersonalInfoBean.religion)!'--'}
                            </label>

                            <label class="col-lg-4 col-sm-12 col-xs-12 se-label">Email Address
                            </label>
                            <label class="col-lg-8 col-sm-12 col-xs-12 se-label-value">
                            ${(PersonalInfoBean.emailAddress)!'---'}
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
                        <button type="button" onclick="window.location = '${ctx}/app/editPersonalData.se'"
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
</@layout.student_layout>

