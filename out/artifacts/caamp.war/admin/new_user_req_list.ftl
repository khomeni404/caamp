<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'new-user-req-list_of_admin'>
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
        <#list newUserReqList as req>
        <tr>
            <td>${(req.employeeID)!'N/A'}</td>
            <td>${(req.fullName)!}</td>
            <td>${(req.cell)!}</td>
            <td>${(req.phoneExt)!}</td>
            <td>${(req.designation)!}</td>
            <td>${(req.posting)!}</td>
            <td>
                <span class="label label-success label-white middle pointer" onclick="window.location = '${ctx}/admin/createStaff.se?newUserReqId=${(req.id)!}'">
                    Register <i class="ace-icon fa fa-arrow-right bigger-120"></i>
                </span>
          </td>

        </tr>
        </#list>
        </tbody>
    </table>
</div>
</@layout.admin_layout>