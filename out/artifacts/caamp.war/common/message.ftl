<#if message??>
<div class="col-lg-6 col-lg-offset-3 col-xs-12 col-sm-6 widget-container-col">
    <div class="widget-box">
        <div class="widget-header">
            <h5 class="widget-title">Attention</h5>
            <div class="widget-toolbar">
                <a href="#" data-action="close">
                    <i class="ace-icon fa fa-times"></i>
                </a>
            </div>
        </div>

        <div class="widget-body">
            <div class="widget-main">
                <p class="alert alert-success">
                    <b> ${message!}</b>
                </p>
            </div>
        </div>
    </div>
</div>
</#if>



