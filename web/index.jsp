<%-- 
    Document   : index
    Created on : Jun 23, 2017, 8:50:32 PM
    Author     : GHO$T
--%>

<%@page import="model.Category"%>
<%@page import="control.CategoryController"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="control.ProductController"%>
<%@include file="common-header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Game Portal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="resourcefront/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <style>
            a:hover{
                text-decoration: none;
            }
        </style>
        <div class="container-fluid np">
            <div class="container ">
                <div class="row">
                    <nav class="navbar navbar-default">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="index.jsp">
                                <img src="resourcefront/img/silk69.png" width="200" height="50" alt="logo">
                            </a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                            <ul class="nav navbar-nav navbar-right">
                                <%                                    CategoryController cate = new CategoryController();
                                    ArrayList<Category> allist = cate.getCategories();
                                    for (Category temp : allist) {
                                %>
                                <li><a href="viewdetails.jsp?cid=<%=temp.getCategoryId()%>"><%=temp.getCategoryName()%></a></li>
                                    <%}%>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </nav>
                </div> 
            </div> 
        </div> 
        <%if (subst) {%>  
        <%=ldata.getLinkData()%>
        <%}%>
        <div class="container-fluid black-bg1">
            <div class="row">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">

                        <div class="item active">
                            <img src="resourcefront/img/banner1.png" alt="Los Angeles" style="width:100%; height:auto; margin: 0 auto;">
                            <div class="carousel-caption"><h3></h3><p></p></div>
                        </div>

                        <div class="item">
                            <img src="resourcefront/img/banner1.png" alt="Chicago" style="width:100%; height:auto; margin: 0 auto;">
                            <div class="carousel-caption"><h3></h3><p></p></div>
                        </div>
                    </div>

                </div>
            </div> 
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="background: transparent;">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next" style="background: transparent;">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div> 

        <%
            if (gatewayIP != null && gatewayIP.getOpid() == 1) {%>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/airtelcmp?cmpid=118&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @99.0 for 30 Days

            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/airtelcmp?cmpid=117&adid=1&token=<%=randNum3%>&pubid=1">
                Subscribe @49.0 for 15 Days
            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/airtelcmp?cmpid=119&adid=1&token=<%=randNum4%>&pubid=1">
                Subscribe @5.0 for 1 Day
            </a></div>

    </center>			                       


    <%} else if (gatewayIP != null && gatewayIP.getOpid() == 2) {

    %>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/cmp?token=<%=randNum5%>&cmpid=4&adid=1&csr_token=<%=randNum1%>">Subscribe video @ INR 99 per Month</a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/cmp?token=<%=randNum3%>&cmpid=5&adid=1&csr_token=<%=randNum1%>">Subscribe video @ INR 35 Weekly</a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/cmp?token=<%=randNum4%>&cmpid=6&adid=1&csr_token=<%=randNum1%>">Subscribe video @ INR 5 per Day</a></div>
    </center>
    <%} else if (gatewayIP != null && gatewayIP.getOpid() == 3) {

    %>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/aircelcmp?cmpid=182&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @5.0 for 1 Day

            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/aircelcmp?cmpid=183&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @35.0 for 7 Days

            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/aircelcmp?cmpid=184&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @49.0 for 15 Days

            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/aircelcmp?cmpid=185&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @90.0 for 30 Days

            </a></div>


    </center>			   

    <%} else if (gatewayIP != null && gatewayIP.getOpid() == 7) {

    %>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/ideacmp?cmpid=38&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @135.0 for 45 Days

            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/ideacmp?cmpid=39&adid=1&token=<%=randNum3%>&pubid=1">
                Subscribe @180.0 for 60 Days
            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/ideacmp?cmpid=37&adid=1&token=<%=randNum4%>&pubid=1">
                Subscribe @90.0 for 30 Days
            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/ideacmp?cmpid=36&adid=1&token=<%=randNum4%>&pubid=1">
                Subscribe @45.0 for 15 Days
            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/ideacmp?cmpid=35&adid=1&token=<%=randNum4%>&pubid=1">
                Subscribe @21.0 for 7 Days
            </a></div>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/ideacmp?cmpid=34&adid=1&token=<%=randNum4%>&pubid=1">
                Subscribe @3.0 for 1 Days
            </a></div>
    </center>			   <%} else if (gatewayIP != null && gatewayIP.getOpid() == 8) {

    %>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/bsnlwestcmp?cmpid=151&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @35.0 for 10 Days

            </a></div>


    </center>			                       

    <% } else if (gatewayIP != null && gatewayIP.getOpid() == 9) {
        //http://ohboye.in/mg-amaya/cnt/cmp?token=abcd114343&cmpid=2137&adid=1
    %>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/bsnleastcmp?cmpid=162&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @35.0 for 10 Days

            </a></div>


    </center>			   <%} else if (gatewayIP != null && gatewayIP.getOpid() == 10) {

    %>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/bsnlsouthcmp?cmpid=141&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @49.0 for 17 Days

            </a></div>


    </center>			                       


    <% } else if (gatewayIP != null && gatewayIP.getOpid() == 11) {
        //http://ohboye.in/mg-amaya/cnt/cmp?token=abcd114343&cmpid=2137&adid=1
    %>
    <center>
        <div class="checksubscribe"><a href="http://silk69.in/silk/cnt/bsnlnorthcmp?cmpid=161&adid=1&token=<%=randNum5%>&pubid=1">
                Subscribe @35.0 for 10 Days

            </a></div>


    </center>			   

    <%
        }
        CategoryController cc = new CategoryController();
        ArrayList<Category> clist = new ArrayList<>();
        clist = cc.getCategories();
        int i = 0;
        ProductController ob = new ProductController();
        ArrayList<Product> alist = new ArrayList<>();
        for (Category cat : clist) {
            if (i % 2 != 0) {
    %>

    <div class="container-fluid black-img-bg m-b-30">
        <div class="container m-t-15 m-b-30">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                    <div class="col-sm-3 col-xs-3 border-img"><img class="border1 img-responsive" src="resourcefront/img/border2.png" alt=""/></div>
                    <div class="col-sm-1 col-xs-1">  <img class="cen-img img-responsive" src="resourcefront/img/cube-group-left.png" alt=""/>   </div>
                    <div class="col-sm-4 col-xs-4 cen"><h3 class="m-t-0"><%=cat.getCategoryName()%></h3></div>
                    <div class="col-sm-1 col-xs-1 ">  <img  class="cen-img img-responsive" src="resourcefront/img/cube-group-right.png" alt=""/>   </div>
                    <div class="col-sm-3 col-xs-3 border-img"><img class="border1 img-responsive" src="resourcefront/img/border2.png" alt=""/></div>
                    <div class="col-sm-12 col-xs-12 text-center"><p><%=cat.getCategoryDesc()%></p></div>
                </div>
                <%
                    alist = ob.getProductsbyCategory(cat.getCategoryId());
                    int j = 0;
                    for (Product pro : alist) {
                        j++;
                %>
                <div class="col-sm-4 text-center pa-b">
                    <div class="col-sm-12 col-xs-12">
                        <%if (pro.getProductFiletype().equalsIgnoreCase("images")) {%>
                        <div align="center" style="width: auto; height: auto; padding-bottom: 10px;">
                            <a href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                <img class="img-responsive post-img" src=<%=pro.getProductFile()%> alt=""/>
                                <%if(pro.getProductName().length()< 24){%>
                                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                                <%}else{%>
                                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 24)+"..."%></h4>
                                
                                <%}%>
                            </a>
                        </div>
                        <%} else if (pro.getProductFiletype().equalsIgnoreCase("video")) {%>
                        <div align="center" style=" width: auto; height: auto; padding-bottom: 10px;">
                            <a href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                <img class="img-responsive post-img" src=<%=pro.getProductThumb()%> alt=""/>
                                <%if(pro.getProductName().length()< 24){%>
                                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                                <%}else{%>
                                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 24)+"..."%></h4>
                                
                                <%}%>
                            </a>
                        </div>
                        <%} else {%>
                        <div align="center" style=" width: auto; height: auto; padding-bottom: 10px;">
                            <a class=""  href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                <img class="img-responsive post-img" src="resourcefront/img/dicon.png" alt=""/>
                                <%if(pro.getProductName().length()< 24){%>
                                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                                <%}else{%>
                                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 24)+"..."%></h4>
                                
                                <%}%>
                            </a>
                        </div>
                        <%}%>
                        <div class="btn-sm">
                            <a class="top-read-more" href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">Details</a>
                        </div>
                        <br/> 
                    </div>
                </div>
                <%if (j == 6) {
                            break;
                        }
                    }%>
            </div>
            <div class="row view text-center">
                <a class="view-more" href="viewdetails.jsp?cid=<%=cat.getCategoryId()%>">View More</a>
            </div>
        </div>

    </div>
    <%} else {
    %>

    <div class="container-fluid ">
        <div class="container m-t-15 m-b-30">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                    <div class="col-sm-3 col-xs-3 border-img"><img class="border1 img-responsive" src="resourcefront/img/border1.png" alt=""/></div>
                    <div class="col-sm-1 col-xs-1">  <img class="cen-img img-responsive" src="resourcefront/img/cube-group-left.png" alt=""/>   </div>
                    <div class="col-sm-4 col-xs-4 cen"><h3 class="m-t-0"><%=cat.getCategoryName()%></h3></div>
                    <div class="col-sm-1 col-xs-1">  <img  class="cen-img img-responsive" src="resourcefront/img/cube-group-right.png" alt=""/>   </div>
                    <div class="col-sm-3 col-xs-3 border-img"><img class="border1 img-responsive" src="resourcefront/img/border1.png" alt=""/></div>
                    <div class="col-sm-12 col-xs-12 text-center"><p><%=cat.getCategoryDesc()%></p></div>
                </div>
                <%
                    alist = ob.getProductsbyCategory(cat.getCategoryId());
                    int j = 0;
                    for (Product pro : alist) {
                        j++;
                %>
                <div class="col-sm-4 text-center">
                    <div class="col-sm-12 col-xs-12">
                        <%if (pro.getProductFiletype().equalsIgnoreCase("images")) {%>
                        <div align="center" style="width: auto; height: auto; padding-bottom: 10px;">
                            <a href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                <img class="img-responsive post-img" src=<%=pro.getProductFile()%> alt=""/>
                                <%if(pro.getProductName().length()< 24){%>
                                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                                <%}else{%>
                                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 24)+"..."%></h4>
                                
                                <%}%>
                            </a>
                        </div>
                        <%} else if (pro.getProductFiletype().equalsIgnoreCase("video")) {%>
                        <div align="center" style=" width: auto; height: auto; padding-bottom: 10px;">
                            <a href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                <img class="img-responsive post-img" src=<%=pro.getProductThumb()%> alt=""/>
                               <%if(pro.getProductName().length()< 24){%>
                                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                                <%}else{%>
                                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 24)+"..."%></h4>
                                
                                <%}%>
                            </a>
                        </div>
                        <%} else {%>
                        <div align="center" style=" width: auto; height: auto; padding-bottom: 10px;">
                            <a class=""  href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                <img class="img-responsive post-img" src="resourcefront/img/dicon.png" alt=""/>
                                <%if(pro.getProductName().length()< 24){%>
                                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                                <%}else{%>
                                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 24)+"..."%></h4>
                                
                                <%}%>
                            </a>
                        </div>
                        <%}%>
                        <div class="btn-sm">
                            <a class="top-read-more" href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">Details</a>
                        </div>
                        <br/> 
                    </div>
                </div>
                <%if (j == 6) {
                            break;
                        }
                    }%>
            </div>
            <div class="row view text-center">
                <a class="view-more" href="viewdetails.jsp?cid=<%=cat.getCategoryId()%>">View More</a>
            </div>
        </div>
    </div>
    <%
            }
            i++;
        }
    %>

    <br/>
   
</body>
</html>

