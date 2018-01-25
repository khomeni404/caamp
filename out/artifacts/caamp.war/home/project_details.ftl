<#import "../template/open/open_layout.ftl" as layout>
<@layout.open_layout "${(title)!}", 'staff-list'>
    <#assign ctx = rc.getContextPath()/>

<div class="col-xs-12">
    <table id="simple-table" class="table se-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Project Name</th>
            <th></th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <#list projectList as project>
        <tr>
            <td>${(project.id)!}</td>
            <td>${(project.name)!}</td>
            <td>${(project.cell)!}</td>
            <td>
                <span class="label label-danger label-white middle pointer" onclick="window.location = '${ctx}/admin/deleteRegister.se?userId=${(project.id)!}'">
                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    Delete
                </span>
          </td>

        </tr>
        </#list>
        </tbody>
    </table>
</div>

</@layout.open_layout>