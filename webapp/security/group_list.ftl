<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'group-list_of_security'>
    <#assign ctx = rc.getContextPath()/>

<div class="col-xs-12">
    <table id="simple-table" class="table se-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Group Name</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <#list groupList as group>
        <tr>
            <td>${(group.id)!}</td>
            <td>${(group.name)!}</td>
            <td>${(group.description)!}</td>
            <td>
                <span class="label label-info label-white middle pointer" onclick="window.location = '${ctx}/security/actionList.se?groupId=${(group.id)!}'">
                    <i class="ace-icon fa fa-list-alt bigger-120"></i>
                    Add/Remove Action
                </span>
                <#--<input type="button" value="Delete" onclick="window.location = '${ctx}/admin/deleteRegister.se?userId=${(student.id)!}'"/>-->
            </td>

        </tr>
        </#list>
        </tbody>
    </table>
</div>
</@layout.admin_layout>