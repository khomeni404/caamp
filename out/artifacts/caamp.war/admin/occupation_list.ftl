<#import "../template/admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'occupation-list_of_config'>
    <#assign form = JspTaglibs["http://www.springframework.org/tags/form"] />
    <#assign c = JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
    <#escape x as x?html>
        <#assign ctx = rc.getContextPath()/>
    <div class="col-xs-12">
        <table id="simple-table" class="table se-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Parent Occupation</th>
                <th>Child Occupation</th>

                <th></th>
            </tr>
            </thead>

            <tbody>
                <#list occupationBeanList as occupation>
                    <#assign childrenList = occupation.childrenList>
                <tr>
                    <td>${(occupation.id)!}</td>
                    <td>
                    ${(occupation.name)!}- ${(occupation.nameBN)!}
                    </td>
                    <td>
                        <#if childrenList?has_content>
                            <#list childrenList as children>
                            ${(children.name)!}-
                                <@c.out '${(children.nameBN)!}', '', 'HTML'/>

                                <br>
                            </#list>
                        </#if>

                    </td>
                    <td>
                    <#--<input type="button" value="Delete" onclick="window.location = '${ctx}/admin/deleteRegister.se?userId=${(occupation.id)!}'"/>-->
                    </td>

                </tr>
                </#list>
            </tbody>
        </table>
    </div>
    </#escape>

</@layout.admin_layout>