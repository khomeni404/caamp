<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", "staff-add">
    <#import "/spring.ftl" as spring/>
    <#assign IU = Utility!/>
    <#assign ctx = rc.getContextPath()/>
    <#include '../template/constant.ftl'>

<div class="col-xs-12 col-sm-6 col-sm-offset-3 widget-container-col">
    <div class="widget-box">
        <div class="widget-header center">
            <h5 class="widget-title smaller green">
                <b> ${(DocumentBean.type)!}</b>
            </h5>
        </div>

        <div class="widget-body">
            <form action="${ctx}/admin/saveDocument.se" method="POST" enctype="multipart/form-data">
                <@spring.formHiddenInput 'DocumentBean.owner.id'/>
                <@spring.formHiddenInput 'DocumentBean.owner.employeeID'/>
                <@spring.formHiddenInput 'DocumentBean.type'/>
                <@spring.formHiddenInput 'DocumentBean.indicator'/>

                <div class="widget-main padding-6 center">
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                                    <span class="profile-picture">

                                        <img id="document-file" class="editable img-responsive" alt="Alex's Avatar"
                                         <#if DocumentBean.type = 'Signature'>style="width: 150px; height: 38px"</#if>    src="${ctx}/resources/images/info/No_Image_Found.jpg"/>
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


                <@spring.formHiddenInput  "DocumentBean.errors"/>
                <@spring.showErrors " & ", "err-msg" />
                <div class='space'></div>
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
                            Upload & Save File
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#document-file')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(<#if DocumentBean.type = 'Signature'>38<#else >200</#if>);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</@layout.admin_layout>