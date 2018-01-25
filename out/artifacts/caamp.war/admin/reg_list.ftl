<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'reg-list'>
    <#assign ctx = rc.getContextPath()/>


<div class="col-xs-12">
    <table id="simple-table" class="table se-table">
        <thead>
        <tr>
            <th class="center">
                <label class="pos-rel">
                    <input type="checkbox" class="ace"/>
                    <span class="lbl"></span>
                </label>
            </th>
            <th>ID</th>
            <th>Name</th>
            <th>Cell</th>

            <th></th>
        </tr>
        </thead>

        <tbody>
        <#list studentList as student>
        <tr>
            <td class="center">
                <label class="pos-rel">
                    <input type="checkbox" class="ace"/>
                    <span class="lbl"></span>
                </label>
            </td>

            <td>${(student.applicantId)!}</td>
            <td>${(student.name)!}</td>
            <td>${(student.cell)!}</td>
            <td>
                <span class="label label-danger label-white middle pointer" onclick="window.location = '${ctx}/admin/deleteRegister.se?userId=${(student.id)!}'">
                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    Delete
                </span>
                <#--<input type="button" value="Delete" onclick="window.location = '${ctx}/admin/deleteRegister.se?userId=${(student.id)!}'"/>-->
            </td>

        </tr>
        </#list>
        </tbody>
    </table>
</div>
</@layout.admin_layout>