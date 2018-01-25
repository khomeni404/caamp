<#import "../admin/admin_layout.ftl" as layout>
<@layout.admin_layout "${(title)!}", 'dashboard'>
    <#assign ctx = rc.getContextPath()/>
    <#include "../../common/message.ftl">
</@layout.admin_layout>