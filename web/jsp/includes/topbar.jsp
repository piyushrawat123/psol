<%-- 
    Document   : topbar
    Created on : Jun 23, 2017, 11:12:57 PM
    Author     : GHO$T
--%>

<header id="header">
    <%      if (session.getAttribute("msg") == null) {
            session.setAttribute("msg", "");
        }
    %>
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
                        <li class="dashboardbg"><a href="../../index.jsp"><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Home</a></li>
                        <li class="dropdown same-menutop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user useraccount"></i>Category <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../category/addCategory.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Manage Category</a></li>
                                <!--    <li><a href="../category/delCategory.jsp"><span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>Delete Category</a></li>
                               <li><a href="../category/updateCategory.jsp"><span class="glyphicon glyphicon-upload" aria-hidden="true"></span>update Category</a></li>                                        
                                <li role="separator" class="divider"></li>
                                <li><a href="../category/viewCategory.jsp">View Categories</a></li>
                                --> </ul>
                        </li>
                        <li class="dropdown same-menutop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                                <i class="fa fa-truck useraccount"></i>Products<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../product/addProduct.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Manage Product</a></li>
                                <!--    <li><a href="../product/delProduct.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Delete Product</a></li>
                                <li><a href="../product/updateProduct.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Update Product</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="../product/viewProduct.jsp">View products</a></li>
                                --> </ul>
                        </li> 
                        <li class="dropdown same-menutop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                                <i class="fa fa-anchor useraccount"></i>Link<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../richtextbox/addLink.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>Add/Update Link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right rightnavbg">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-user john-doebg"></span> <%=session.getAttribute("uname")%><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../admin/cdetail.jsp">Change Details</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#" onclick="logout();">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
    <script>
        function logout()
        {
            window.location = "../admin/logout.jsp";
        }
    </script>
</header>