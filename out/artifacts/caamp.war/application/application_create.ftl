<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout "${(title)!}", "application">
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#include '../template/constant.ftl'>
    <#if message??>
    <#else >
    <div class="row">
        <div class="col-lg-6 col-xs-12 col-sm-12" style="display: none">
            <div class="widget-box widget-color-blue">
                <div class="widget-header">
                    <h5 class="widget-title bigger lighter"><b>Instruction</b></h5>
                </div>

                <div class="widget-body">
                    <div class="widget-main">
                        <ul class="list-unstyled spaced2">
                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Click fill up application
                            </li>

                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Choose the info block one by one
                            </li>

                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Fill up Personal Information
                            </li>

                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Fill up Educational Information
                            </li>
                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Fill up Family Information
                            </li>
                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Fill up Scholarship Information
                            </li>
                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Upload Documents
                            </li>

                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                If you have some information gap, you can give the rest information after login any time
                                within 30/12/2017.
                                <br>Note: Use you cell no as 'username' and password that Sent using SMS.
                            </li>

                            <li>
                                <i class="ace-icon fa fa-check green"></i>
                                Finally click Apply button to Apply
                            </li>
                        </ul>
                    </div>

                    <div>
                        <a href="#" class="btn btn-block btn-primary">
                        <#--<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
                        <span>Buy</span>-->
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-lg-6 col-lg-offset-3 col-xs-12 col-sm-12">
            <div class="widget-box">
                <div class="widget-header">
                    <h4 class="smaller">
                        Apply
                        <small>[You have to select District and Branch]</small>
                    </h4>
                </div>

                <div class="widget-body">
                    <form id="data-form" action="${ctx}/app/initApplication.se" method="POST" class="form-horizontal"
                          role="form">
                        <@spring.formHiddenInput 'ApplicationBean.project.code'/>

                        <div class="widget-main">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2">
                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="branch">Apply Through District<span
                                                class="se-mandatory">*</span></label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect "ApplicationBean.district.id", IU.getOptions('Select a District', districtMap)!,  "onchange='loadBranchSelector(this.value)' class='chosen-select form-control col-lg-12 col-sm-12 col-xs-12' data-placeholder='Choose a District...'"/>
                                            <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-12 col-sm-12 col-xs-12 control-label no-padding-right"
                                               for="branch">Apply Through Branch<span
                                                class="se-mandatory">*</span></label>

                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <@spring.formSingleSelect "ApplicationBean.branch.brCode", IU.getOptions('Select a Branch', branchMap)!,  " class='chosen-select form-control col-lg-12 col-sm-12 col-xs-12' data-placeholder='Choose a Branch...'"/>
                                            <@spring.showErrors " & ", "err-msg" />
                                        </div>
                                    </div>

                                </div>
                                <div class="space-4"><br></div>
                                <div class="col-lg-4 col-lg-offset-8">
                                    <input type="submit" class="btn btn-success" value="Apply Now">
                                </div>


                            </div>


                        </div>
                    </form>
                </div>
            </div>
        <#--</form>-->
        </div>

    </div>

    </#if>

</@layout.student_layout>

<script type="text/javascript">
    $(function () {
        var dist = $('#district\\.id').val();
        if (dist != '') {
            console.log('Loaded');
            loadBranchSelector(dist);
        } else {
            console.log("not loaded");
        }
    });

    function loadBranchSelector(distId) {
        $.ajax({
            type: "GET",
            url: '${ctx}/ajax/getBranchListSelector.se',
            data: {
                districtId: distId
            },
            dataType: "text",
            cache: false,
            success: function (response) {
                $('#branch\\.brCode').empty().append(response).trigger("chosen:updated");
            }
        });
    }

</script>