<#assign PersonalInfoCompleted = PersonalInfoOk/>
<#assign FamilyInfoCompleted = FamilyInfoOk/>
<#assign ActiveTab = activeTab/>

<#--<ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">-->
<ul class="nav nav-tabs" id="myTab4" style="color: #9d4400; background-color: #ceeaca">
    <li id="personal-info-tab" class="col-lg-2 col-xs-12">
        <a data-toggle="tab" href="#" onclick="window.location = '${ctx}/app/createPersonalData.se'">
            Personal Info
        <#if PersonalInfoCompleted?string = 'true'>
            <i class="green ace-icon fa fa-check-square-o bigger-120"></i>
        <#else >
            <i class="red ace-icon fa fa-exclamation bigger-120"></i>
        </#if>
        </a>
    </li>

    <li id="family-info-tab" class="col-lg-2 col-xs-12">
        <a data-toggle="tab" href="#" onclick="window.location = '${ctx}/app/createFamilyData.se'">
            Family Info
        <#if FamilyInfoCompleted?string = 'true'>
            <i class="green ace-icon fa fa-check-square-o bigger-120"></i>
        <#else >
            <i class="red ace-icon fa fa-exclamation bigger-120" style="color: #c50000"></i>
        </#if>
        </a>
    </li>
</ul>