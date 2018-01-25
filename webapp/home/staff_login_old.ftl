<#import "../template/open/open_layout.ftl" as layout>
<@layout.open_layout "${(title)!}", 'staff-login'>
    <#import "/spring.ftl" as spring/>
    <#assign form = JspTaglibs["http://www.springframework.org/tags/form"] />

<div class="col-sm-10 col-sm-offset-1">
    <div class="login-container">
        <div class="center">
            <h1>
                <i class="ace-icon fa fa-user green"></i>
                <span class="red">CAAMP</span>
                <span class="green" id="id-text2">System Login</span>
            </h1>
        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="login-box" class="login-box visible widget-box no-border">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="ace-icon fa fa-coffee green"></i>
                            Please Enter Your Information
                        </h4>

                        <form id="incident-form" action="authenticateUser.se" method="POST" class="form-horizontal"
                              role="form">
                            <fieldset>
                                <label class="block clearfix">
                                    <span class="block input-icon input-icon-right">
                                        <@spring.formInput  "TokenBean.username" "class='form-control' placeholder='Username'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                        <i class="ace-icon fa fa-user"></i>
                                    </span>
                                </label>

                                <label class="block clearfix">
                                    <span class="block input-icon input-icon-right">
                                        <@spring.formInput  "TokenBean.password" "class='form-control' placeholder='Password'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                        <i class="ace-icon fa fa-lock"></i>
                                    </span>
                                </label>


                                <#--<label class="block clearfix">
                                    <span class="block input-icon input-icon-right">
                                        <@spring.formInput  "TokenBean.brCode" "class='form-control' autofocus placeholder='Br Code'" />
                                        <@spring.showErrors " & ", "err-msg" />
                                        <i class="ace-icon fa fa-bold"></i>
                                    </span>
                                </label>-->


                                <div class="space"></div>
                                <@spring.formHiddenInput  "TokenBean.errors"/>
                                <@spring.showErrors " & ", "err-msg" />
                                <div class="space"></div>

                                <div class="clearfix">
                                    <label class="inline">
                                        <input type="checkbox" class="ace"/>
                                        <span class="lbl"> Remember Me</span>
                                    </label>

                                    <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                        <i class="ace-icon fa fa-key"></i>
                                        <span class="bigger-110">Login</span>
                                    </button>
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</@layout.open_layout>