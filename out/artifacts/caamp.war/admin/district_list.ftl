<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'district-list_of_config'>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#include '../template/constant.ftl'>


<div class="col-xs-12">
    <table id="simple-table" class="table se-table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Population</th>
            <th>Area</th>
            <th>PPK</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
            <#list districtList as district>

            <tr>
                <td>${(district.name)!}</td>
                <td>${(district.population)!}</td>
                <td>${(district.area)!}</td>
                <td>${(district.populationPerKm)!}</td>
            <td>
                <span class="label label-success label-white middle pointer" onclick="window.location = '${ctx}/admin/policeStationList.se?distId=${district.id!}'">
                    <i class="ace-icon fa fa-list bigger-120"></i>
                    Thana List
                </span>
            </tr>

            </#list>
        </tbody>
    </table>
</div>
</@layout.admin_layout>