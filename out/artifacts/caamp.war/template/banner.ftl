<div id="navbar" class="navbar navbar-default" style="background-color: #5c6d9f">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">

        <#--For mobile support menu-->
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar" onclick="<#if Session.session_user??><#else >alert('Login Please!')</#if>">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a href="${ctx}/" class="navbar-brand">
                <small>
                    <i class="fa fa-book"></i>
                <#--<img src="../resources/images/logo/images%20(1).png" alt="">-->
                    <span>Central Authentication & Authorization for MBL Projects</span>
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
            <#--<li class="green col-lg-2 col-xs-6 col-sm-6">
                <a class="dropdown-toggle" href="${ctx}/reg/startRegistration.se">
                    <i class="ace-icon fa fa-book"></i>
                    Apply Now
                </a>
            </li>
            <li class="green col-lg-2 col-xs-6 col-sm-6">
                <a class="dropdown-toggle" href="http:\\islamibankbd.com">
                    <i class="ace-icon fa fa-home"></i>
                    CAAMP Home
                </a>
            </li>
            <li class="green col-lg-2 col-xs-6 col-sm-6">
                <a class="dropdown-toggle" href="${ctx}">
                    <i class="ace-icon fa fa-home"></i>
                    Scholarship Home
                </a>
            </li>
            <li class="green col-lg-2 col-xs-6 col-sm-6">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <i class="ace-icon fa fa-tasks"></i>
                    Scholarship Result
                </a>
            </li>

            <li class="green col-lg-2 col-xs-6 col-sm-6">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <i class="ace-icon fa fa-envelope icon-animated-bell"></i>
                    News Event
                </a>
            </li>-->


            <#if Session.session_user??>
                <li class="grey">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-user <#--icon-animated-vertical-->"></i>
                    ${(Session.session_user.name)!}
                    </a>
                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="${ctx}/security/changePassword.se">
                                <i class="ace-icon fa fa-cog"></i>
                                Change Password
                            </a>
                        </li>

                        <li>
                            <a href="${ctx}/admin/viewUserDetails.se">
                                <i class="ace-icon fa fa-user"></i>
                                Profile of ${(Session.session_user.name)!}
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="ace-icon fa fa-user"></i>
                                Designation: ${(Session.session_user.designation)!}
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="${ctx}/home/logout.se">
                                <i class="ace-icon fa fa-power-off"></i>
                                Logout
                            </a>
                        </li>
                        <li>
                            <a href="${ctx}/auth/appBoard.se">
                                <i class="ace-icon fa fa-dashboard"></i>
                                App Board
                            </a>
                        </li>
                    </ul>
                </li>
            <#else >
                <li class="blur-login">
                    <a <#--data-toggle="dropdown"--> class="dropdown-toggle" href="${ctx}/auth/login.se">
                        <i class="ace-icon fa fa-user icon-animated-vertical"></i>
                         Login / Register
                    </a>
                </li>

            </#if>


            </ul>
        </div>
    </div>
    <!-- /.navbar-container -->
</div>
