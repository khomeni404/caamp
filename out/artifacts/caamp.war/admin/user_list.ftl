<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'user-list_of_security'>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility!/>
<div class="col-xs-12">
    <table id="simple-table" class="table se-table">
        <#--<thead>
        <tr>
            <th>OID</th>
            <th>Employee Name</th>
            <th></th>
            <th>Action</th>
        </tr>
        </thead>-->

        <tbody>
        <#list userDetailsList as UserDetails>
            <#assign User = UserDetails.user!/>
            <#assign Avatar = UserDetails.avatar!/>
            <#assign AvatarPath><#if Avatar.id??>${IU.getDocPath(Avatar)!}<#else >${IU.getDocPath()!}</#if></#assign>
            <#assign Signature = UserDetails.signature!/>
            <#assign SignaturePath><#if Signature.id??>${IU.getDocPath(Signature)!}<#else >${IU.getDocPath()!}</#if></#assign>
            <#assign WorkStation = UserDetails.workStation!/>
        <tr>
            <td>${(UserDetails.employeeID)!'N/A'}</td>
            <td>${(User.name)!}</td>
            <td>${(User.cell)!}</td>
            <td>
                <img class="editable img-responsive backup_picture" alt="Signature"
                     style="width: 100px; height: 28px" src="${SignaturePath!}"/>
            </td>
            <td>
                <span class="label label-success label-white middle pointer" onclick="window.location = '${ctx}/admin/viewStaffDetails.se?employeeID=${(UserDetails.employeeID)!}'">
                    <i class="ace-icon fa fa-eye bigger-120"></i>
                    View
                </span>
          </td>

        </tr>
        </#list>
        </tbody>
    </table>
</div>
</@layout.admin_layout>