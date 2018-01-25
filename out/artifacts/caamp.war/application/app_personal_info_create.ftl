<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  '${(title)!}', 'personal-info' >
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#assign PersonalInfoBean = PersonalInfoBean/>
    <#include '../template/constant.ftl'>

<div class="row">
    <div class="col-lg-12 col-sm-6">
        <div class="widget-box widget-color-green">
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">Personal Information : ${PersonalInfoBean.id!'--'}</h5>
            </div>

            <div class="widget-body">
                <form id="data-form" action="${ctx}/app/savePersonalData.se" method="POST"
                      class="form-horizontal"
                      role="form">
                    <@spring.formHiddenInput "PersonalInfoBean.id"/>
                    <@spring.formHiddenInput "PersonalInfoBean.applicationId"/>
                    <div class="widget-main">
                        <div class="row">
                            <div class="col-lg-4 col-xs-12">
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="studentId">Student
                                        ID <span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.applicantId" "class='form-control' readonly" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="studentName">Student
                                        Name <span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.studentName" "class='form-control' readonly" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="fatherName">Father
                                        Name <span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.fatherName" "class='form-control' placeholder='Father Name' maxlength='100'" />
                                                <@spring.showErrors "<br>", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="motherName">Mother
                                        Name <span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.motherName" "class='form-control' placeholder='Mother Name' maxlength='100'" />
                                    <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="educationLevelCode">Education
                                        Level
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.educationLevelCode" "class='form-control' placeholder='Education Level'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-xs-12">
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="studentType">Student
                                        Type X
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PersonalInfoBean.studentType" IU.getOptions('Choose a Type', STUDENT_TYPES) "class='chosen-select form-control col-lg-12' data-placeholder='Choose a Type...'"/>
                                                <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="dob">Date
                                        of Birth <span class="se-mandatory">*</span>
                                    </label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <div class="input-group"><span class="input-group-addon"> <i
                                                class="fa fa-calendar bigger-110"></i> </span>
                                            <@spring.formInput  "PersonalInfoBean.dob" "class='date-picker col-lg-12 col-sm-12 col-xs-12'  data-date-format='dd/mm/yyyy' readonly" />
                                        </div>
                                        <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="sex">Sex <span class="se-mandatory">*</span></label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect "PersonalInfoBean.sex", IU.getOptions('Select Sex', SEX_TYPES)!,  "class='form-control select2-single' data-placeholder='Choose a Branch...'"/>
                                                <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="cellNo">Cell
                                        No <span class="se-mandatory">*</span></label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.cellNo" "class='form-control' placeholder='Cell No' readonly" />
                                                <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="nid">National
                                        ID No</label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.nid" "class='form-control' placeholder='National ID No' maxlength='17'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>

                            </div>

                        <#--3rd Column-->
                            <div class="col-lg-4 col-xs-12">
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="incident-type">Religion <span
                                            class="se-mandatory">*</span></label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formSingleSelect  "PersonalInfoBean.religion" IU.getOptions('Choose a Religion', RELIGION_TYPES) "class='chosen-select form-control col-lg-12 col-xs-12' data-placeholder='Choose an Occupation...'"/>
                                                <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                           for="incident-type">Email
                                        Address</label>

                                    <div class="col-lg-12 col-sm-12 col-xs-12">
                                        <@spring.formInput  "PersonalInfoBean.emailAddress" "class='form-control' placeholder='Email Address'" />
                                                <@spring.showErrors " & ", "err-msg" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div> <#--Widget Main-->

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

