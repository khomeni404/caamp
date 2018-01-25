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
                <h5 class="widget-title bigger lighter">Documents and Photo</h5>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-lg-6 col-xs-12">
                            <h3>Hello Doc</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</@layout.student_layout>

