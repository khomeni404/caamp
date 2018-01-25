<#if message??>
<script type="text/javascript">
    $(function () {
        <#assign titleText = 'Success'/>
        <#if success??>
            <#assign textColor = success?string('green','red')/>
            <#assign titleText = success?string('Success','Attention !')/>
        </#if>

        /**
         * @author Khomeni
         * If pages contains message property with text this gritter will be shown.
         */
        $.gritter.add({
            <#--title: '<span style=\"color:${textColor!};\">${message!}</span>',-->
            title: '${titleText}',
            text: '${message!}',
            class_name: 'gritter-info gritter-center gritter-light',
            //image: 'assets/avatars/avatar1.png',
            sticky: false,
            time: '2000' // millisecond

        });
        return false;
    })
</script>
</#if>



