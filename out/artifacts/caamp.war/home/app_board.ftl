<!DOCTYPE html>
<html lang="en">
<#assign ctx = rc.getContextPath()/>
<#import "/spring.ftl" as spring/>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MBL</title>
    <style type="text/css">
        .x_content a span {
            font-size: 16px;
            font-weight: bolder;
            padding: 15px 15px 35px 15px;
        }
    </style>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../resources/ace/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link href="../resources/ace/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../resources/gentelella/custom.min.css" rel="stylesheet">
    <link href="../resources/css/khomeni.css" rel="stylesheet">
<#include "../template/stylesheet.ftl"/>
</head>

<body class="nav-md footer_fixed" style="background-color: #e1ffe4;">
<#escape x as x?html>
<div class="container body">
    <div class="main_container">
        <!-- /page content -->
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center" style="padding: 30px 0 0 0">
                <img src="../resources/images/logo/mbl_logo_1.png" height="73" width="500" alt=""/>
            </div>
            <div class="col-md-10 col-md-offset-1 text-center" style="padding: 20px 0 30px 0">
                <span style="font-size: 17px">
                   Welcome to <b>C</b>&eopf;&nopf;&topf;&ropf;&aopf;&lopf;
                    <b>A</b>&uopf;&topf;&hopf;&eopf;&nopf;&topf;&iopf;&copf;&aopf;&topf;&iopf;&oopf;&nopf;
                    & <b>A</b>&uopf;&topf;&hopf;&oopf;&ropf;&iopf;&zopf;&aopf;&topf;&iopf;&oopf;&nopf;
                    &fopf;&oopf;&ropf; <b>&Mopf;</b>&Bopf;&Lopf; <b>P</b>&ropf;&oopf;&jopf;&eopf;&copf;&topf;&sopf;
                </span>
            </div>
        </div>

        <div class="row text-center">
            <div class="col-md-10 col-md-offset-1  col-sm-12 col-xs-12">
                <#assign counter = 1>
                <#list projectList as Project>
                    <div class="dropdown dropdown-preview">
                        <ul class="dropdown-menu dropdown-danger">
                            <li>
                                <a href="#" class="btn btn-info" tabindex="-1"><b>${Project.name!}</b></a>
                            </li>

                            <li>
                                <a href="#" tabindex="-1">Version: <b>1.3.25</b></a>
                            </li>

                            <li>
                                <a href="#" tabindex="-1">Release: <b>Jun-12-2017</b></a>
                            </li>

                            <li class="divider"></li>

                            <li class="dropdown-hover">
                                <a href="#" tabindex="-1" class="clearfix">
                                    <span class="pull-left">App Links</span>

                                    <i class="ace-icon fa fa-caret-right pull-right"></i>
                                </a>

                                <ul class="dropdown-menu dropdown-danger">
                                    <#assign uriList = Project.linkList>
                                    <#list uriList as uri>
                                        <li>
                                            <a href="${uri!}" target="_blank" tabindex="-1"> Application
                                                Link ${uri?index+1!}</a>
                                        </li>
                                    </#list>
                                </ul>
                            </li>

                            <li>
                                <a href="${Project.loadBal!}" tabindex="-1">Load Balancer</a>
                            </li>
                            <li>
                                <a type="submit" target="_blank"
                                   href="${ctx}/auth/autoLogin.se?projectId=${Project.id!}"
                                   tabindex="-1">Auto Login</a>
                            </li>
                        </ul>
                    </div>
                </#list>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="navbar-fixed-top align-right">
                    <br/>
                    &nbsp;
                    <a href="${ctx}/home/logout.se">Logout</a>
                    &nbsp;
                    <span class="blue">/</span>
                    &nbsp;
                    <a href="#">Query</a>
                    &nbsp;
                    <span class="blue">/</span>
                    &nbsp;
                    <a href="#">FAQ</a>
                    &nbsp; &nbsp; &nbsp;
                    <br style=""/>
                    <br style=""/>
                    <span class="blue" style="border-top: 1px solid #d8f3da;">&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; <i class="fa fa-user"></i> <b>${(Session.session_user.name)!}</b></span>
                    &nbsp; &nbsp; &nbsp;
                </div>
            </div>
        </div>

        <!-- footer content -->
        <footer style="background-color: #e1ffe4">
            <div class="row">

                <div class="col-md-12 col-sm-12 col-xs-12" style="background-color: #08e138; height: 30px;">
                    <div class="text-center" style="position: relative; top: 50%; transform: translateY(-50%)">
                        <b style="font-weight: bold">Copyright 2018 &copy; All Rights Reserved. <a
                                href="https://mblbd.com" style="color: blueviolet">Mercantile Bank Limited</a></b>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" style="background-color: #4853ee; height: 30px">

                </div>
            </div>

            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>
</#escape>

<!-- jQuery -->
<!--[if !IE]> -->
<script src="../resources/ace/js/jquery.2.1.1.min.js"></script>
<!-- <![endif]-->

<!--[if IE]>
<script src="../resources/ace/js/jquery.1.11.1.min.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='../resources/ace/js/jquery.min.js'>" + "<" + "/script>");
</script>
<!-- <![endif]-->

<!-- Bootstrap -->
<script src="../resources/ace/js/bootstrap.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="../resources/gentelella/custom.min.js"></script>
<script src="../resources/js/khomeni.js"></script>

</body>
</html>


