<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'dashboard'>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#include '../template/constant.ftl'>

<div class="col-xs-12">
    <table id="simple-table" class="table se-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
            <#list thanaList as thana>

            <tr>
                <td>${(thana.name)!}</td>
                <td>${(thana.description)!}</td>
                <td>
                <span class="label label-success label-white middle pointer" onclick="#">
                    <i class="ace-icon fa fa-list bigger-120"></i>
                    PO List
                </span>
                </td>
            </tr>

            </#list>
        </tbody>
    </table>
</div>
</@layout.admin_layout>