<!DOCTYPE html>
<html lang="en">
<#assign ctx = rc.getContextPath()/>
<#import "/spring.ftl" as spring/>
<#assign form = JspTaglibs["http://www.springframework.org/tags/form"] />

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>CAAMP</title>

    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <#include "../template/stylesheet.ftl"/>

</head>


<body class="login-layout light-login">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <i class="ace-icon fa fa-key green"></i>
                            <span class="grey">CAAMP</span>
                            <span class="white" id="id-text2">MBL</span>
                        </h1>
                        <h4 class="blue" id="id-company-text">&copy; Mercantile Bank Limited</h4>
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box  widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-user green"></i>
                                        Please Enter Your Information
                                    </h4>

                                    <div class="space-6"></div>

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

                                            <div class="space"></div>

                                            <div class="clearfix">

                                                <button type="button" onclick="window.location = '${ctx}/'" class="width-35 pull-left btn btn-sm btn-info">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">Home</span>
                                                </button>

                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-success">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">Login</span>
                                                </button>
                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>
                                </div><!-- /.widget-main -->

                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            Forgot my password
                                        </a>
                                    </div>

                                    <div>
                                        <a href="#" data-target="#new-user-req-box" class="user-signup-link">
                                            Want to register
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.login-box -->

                        <div id="forgot-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header red lighter bigger">
                                        <i class="ace-icon fa fa-key"></i>
                                        Retrieve Password
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        Enter your email and to receive instructions
                                    </p>

                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                            </label>

                                            <div class="clearfix">
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">Send Me!</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div><!-- /.widget-main -->

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        Back to login
                                        <i class="ace-icon fa fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.forgot-box -->

                        <div id="new-user-req-box" class="signup-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header green lighter bigger">
                                        <i class="ace-icon fa fa-users blue"></i>
                                        New User Registration Request
                                    </h4>

                                    <form id="new-user-req-form" action="saveNewUserReq.se" method="POST" class="form-horizontal"
                                          role="form">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">

                                                <@spring.formInput  "NewUserReqBean.employeeID" "class='form-control' placeholder='11 Digit Employee ID'" />
                                                    <@spring.showErrors " & ", "err-msg" />
                                                       <i class="ace-icon fa fa-credit-card"> <span class="se-mandatory">*</span></i>
                                                </span>
                                            </label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <@spring.formInput  "NewUserReqBean.fullName" "class='form-control' placeholder='Full Name'" />
                                                    <@spring.showErrors " & ", "err-msg" />
                                                        <i class="ace-icon fa fa-user"> <span class="se-mandatory">*</span></i>
                                                </span>
                                            </label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <@spring.formInput  "NewUserReqBean.posting" "class='form-control' placeholder='Place of Posting. e.g. Branch Name/Division Name etc.'" />
                                                    <@spring.showErrors " & ", "err-msg" />
                                                    <i class="ace-icon fa fa-home"> <span class="se-mandatory">*</span></i>
                                                </span>
                                            </label>


                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <@spring.formInput  "NewUserReqBean.designation" "class='form-control' placeholder='Designation'" />
                                                    <@spring.showErrors " & ", "err-msg" />
                                                    <i class="ace-icon fa fa-bookmark"> <span class="se-mandatory">*</span></i>
                                                </span>
                                            </label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <@spring.formInput  "NewUserReqBean.cell" "class='form-control' placeholder='11 DIgit Cell'" />
                                                    <@spring.showErrors " & ", "err-msg" />
                                                    <i class="ace-icon fa fa-phone"> <span class="se-mandatory">*</span></i>
                                                </span>
                                            </label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <@spring.formInput  "NewUserReqBean.email" "class='form-control' placeholder='Corporate email Address'" />
                                                    <@spring.showErrors " & ", "err-msg" />
                                                    <i class="ace-icon fa fa-envelope-o"> <span class="se-mandatory">*</span></i>
                                                </span>
                                            </label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <@spring.formInput  "NewUserReqBean.phoneExt" "class='form-control' placeholder='Phone / Extension no.'" />
                                                    <@spring.showErrors " & ", "err-msg" />
                                                    <i class="ace-icon fa fa-phone"> <span class="se-mandatory">*</span></i>
                                                </span>
                                            </label>

                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon fa fa-refresh"></i>
                                                    <span class="bigger-110">Reset</span>
                                                </button>

                                                <button type="submit" class="width-65 pull-right btn btn-sm btn-success">
                                                    <span class="bigger-110">Send Req.</span>

                                                    <i class="ace-icon fa fa-envelope icon-on-right"></i>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        <i class="ace-icon fa fa-arrow-left"></i>
                                        Back to login
                                    </a>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.signup-box -->
                    </div><!-- /.position-relative -->

                    <div class="navbar-fixed-top align-right">
                        <br />
                        &nbsp;
                        <a href="${ctx}/home/logout.se">Logout</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a  href="#">Query</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a href="#">FAQ</a>
                        &nbsp; &nbsp; &nbsp;
                    </div>
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->

<!-- basic scripts -->
<#include "../template/javascript.ftl">

<!-- inline scripts related to this page -->
<script type="text/javascript">

    jQuery(function($) {
        // var target = $('#signup-box').data('target');
        $('.widget-box.visible').removeClass('visible');//hide others
        $('#'+'${dataTarget}').addClass('visible');//show target
    });

    jQuery(function($) {
        $(document).on('click', '.toolbar a[data-target]', function(e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });



    //you don't need this, just used for changing background
    jQuery(function($) {
        $('#btn-login-dark').on('click', function(e) {
            $('body').attr('class', 'login-layout');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'blue');

            e.preventDefault();
        });
        $('#btn-login-light').on('click', function(e) {
            $('body').attr('class', 'login-layout light-login');
            $('#id-text2').attr('class', 'grey');
            $('#id-company-text').attr('class', 'blue');

            e.preventDefault();
        });
        $('#btn-login-blur').on('click', function(e) {
            $('body').attr('class', 'login-layout blur-login');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'light-blue');

            e.preventDefault();
        });

    });
</script>
</body>
</html>
