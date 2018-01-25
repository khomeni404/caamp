<#import "../template/student/student_layout.ftl" as layout>
<@layout.student_layout  '${(title)!}', 'photo-n-doc' >
    <#import "/spring.ftl" as spring/>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#assign DocBean = DocumentBean/>
    <#include '../template/constant.ftl'>

    <#if DocBean??>

    <#--Form for Student Photo Upload-->
        <#if DocBean.type == 'Photo'>
        <div class="col-xs-12 col-sm-6 col-sm-offset-3 widget-container-col">
            <div class="widget-box">
                <div class="widget-header center">
                    <h5 class="widget-title smaller green">
                        <b> ${IU.getPropValue(DOC_INDICATOR, DocBean.indicator)!}</b>
                    </h5>
                </div>

                <div class="widget-body">
                    <form action="${ctx}/app/saveDocument.se" method="POST" enctype="multipart/form-data">
                        <@spring.formHiddenInput 'DocumentBean.type'/>
                        <@spring.formHiddenInput 'DocumentBean.application.id'/>
                        <@spring.formHiddenInput 'DocumentBean.indicator'/>

                        <div class="widget-main padding-6 center">
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <span class="profile-picture">
                                        <img id="avatar" class="editable img-responsive" alt="Alex's Avatar"
                                             src="${ctx}/resources/images/info/No_Image_Found.jpg"/>
                                    </span>

                                    <div class="form-group has-success col-sm-11">
                                        <@spring.bind "DocumentBean.document" />
                                        <input type="file" name="${spring.status.expression!}" onchange="readURL(this);"
                                               class="se-input-file"/>
                                        <@spring.showErrors " & ", "err-msg" />
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="widget-toolbox padding-8 clearfix">
                            <div class="btn-group pull-right">
                                <button type="button" onclick="window.location = '${ctx}/app/viewDocumentList.se'"
                                        class="btn btn-md btn-danger btn-white btn-round">
                                    <i class="ace-icon fa fa-backward bigger-120 blue"></i>
                                    Back
                                </button>

                                <button type="submit"
                                        class="btn btn-md btn-success btn-white btn-round">
                                    <i class="ace-icon fa fa-upload green bigger-125 blue"></i>
                                    Upload & Save Photo
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <#else >
        <h>Not Yet implemented for Mark-sheet</h>
        </#if>
    </#if>


</@layout.student_layout>

<script type="">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#avatar')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
