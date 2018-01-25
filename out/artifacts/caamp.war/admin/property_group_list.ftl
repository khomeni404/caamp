<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'property-list_of_config'>
    <#assign ctx = rc.getContextPath()/>
    <#assign IU = Utility/>
    <#include '../template/constant.ftl'>


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
            <#assign groupMap = propertyGroupMap> <#--IU.getMap('10')>-->
            <#assign groupCodes = groupMap?keys>
            <#list groupCodes as groupCode>

            <tr>
                <td class="center">
                    <label class="pos-rel">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>${(groupCode)!}</td>
                <td>${(groupMap[groupCode])!}</td>
                <td>
                    <#assign propertyCodeMap = IU.getMap(groupCode)>
                <#assign propertyCodeMapKey = propertyCodeMap?keys>
                <#list propertyCodeMapKey as propCode>
              ${propCode} : ${(propertyCodeMap[propCode])!} <br>
                    <#--<#assign propertyCodes = propertyCodeMap[groupCode]?keys>
                    <#list propertyCodes as propertyCode>
                    ${propertyCodes!} <br>
                    </#list>-->

                </#list>
                </td>
                <td></td>
                <#--<td>
                    <input type="button" value="Delete"
                           onclick="window.location = '${ctx}/admin/deleteRegister.se?userId='"/></td>-->
            </tr>

            </#list>
        </tbody>
    </table>
</div>
</@layout.admin_layout>