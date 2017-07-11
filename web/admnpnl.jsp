<%-- 
    Document   : adminlogin
    Created on : Jun 23, 2017, 8:54:14 PM
    Author     : GHO$T
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Dashboard</title>
        <!-- core CSS -->
        <link href="resourceadmin/css/bootstrap.min.css" rel="stylesheet">
        <link href="resourceadmin/css/font-awesome.min.css" rel="stylesheet">
        <link href="resourceadmin/css/main.css" rel="stylesheet">
        <link href="resourceadmin/css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="resourceadmin/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resourceadmin/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resourceadmin/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resourceadmin/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="resourceadmin/images/ico/apple-touch-icon-57-precomposed.png">
        <%
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
    </head>

    <!--/head-->
    <body class="homepage">

        <!--/header-->
        <header id="header">
            <!--/nav-->
            <div class="main-nav">
                <nav class="navbar navbar-default">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!--  <a class="navbar-brand" href="#">Xerox</a> -->
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav customer-account">
                                <li class="dashboardbg"><a href="index.jsp"><span class="glyphicon glyphicon-th" aria-hidden="true"></span> Home</a></li>
                                <li class="dropdown same-menutop">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user useraccount"></i>Category <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="jsp/category/addCategory.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Manage Category</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown same-menutop">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                                        <i class="fa fa-truck useraccount"></i>Products<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="jsp/product/addProduct.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Manage Product</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown same-menutop">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                                        <i class="fa fa-anchor useraccount"></i>Link<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="jsp/richtextbox/addLink.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Add/Update Link</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right rightnavbg">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <span class="glyphicon glyphicon-user john-doebg"></span> <%=session.getAttribute("uname")%><span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="jsp/admin/cdetail.jsp">Change Details</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="#" onclick="logout()">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home home-icon"></i>Home</a></li>
                        <li><a href="#">Library</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </div>
            </div>
            <%      if (session.getAttribute("msg") == null) {
                    session.setAttribute("msg", "");
                }
            %>
            <div class="row">
                <%=session.getAttribute("msg")%>
                <div class="col-md-12">
                    <div class="white-box">
                        <h1>Admin Dashboard <span class="border-topbg"></span></h1>
                    </div>

                    <div class="mainwhite-box">

                    </div>
                </div>
            </div>

        </div>
        <script>
            function logout()
            {
                window.location = "jsp/admin/logout.jsp";
            }
        </script>
        <script src="resourceadmin/js/jquery.js"></script>
        <script src="resourceadmin/js/bootstrap.min.js"></script>
        <script>
            $(function () {
                $('#table').searchable({
                    striped: true,
                    searchType: 'fuzzy'
                });

                $('#searchable-container').searchable({
                    searchField: '#container-search',
                    selector: '.row',
                    childSelector: '.col-xs-4',
                    show: function (elem) {
                        elem.slideDown(100);
                    },
                    hide: function (elem) {
                        elem.slideUp(100);
                    }
                })
            });
        </script>
    </body>
</html>

