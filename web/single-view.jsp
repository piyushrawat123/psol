<%-- 
    Document   : single-view
    Created on : Jun 25, 2017, 11:57:36 PM
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
            h5{
                color:black;
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
        <%
            int pid = 0, cid = 0;
            pid = Integer.parseInt(request.getParameter("pid"));
            cid = Integer.parseInt(request.getParameter("cid"));
            if (pid == 0 && cid == 0) {
                response.sendRedirect("index.jsp");
            }
            CategoryController cc = new CategoryController();
            Category clist = new Category();
            clist = cc.getCategory(cid);
            ProductController ob = new ProductController();
            Product pro = new Product();
            pro = ob.getProductbyProductId(pid);
        %>                 
        <section class="page-top page-header-1 container-fluid black-img-bg m-b-30">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <div class="">
                            <h4 class="page-title" style="color: white; font-family: initial;"><a style="color: white;" href="index.jsp">HOME</a>&nbsp;>&nbsp;<a style="color: white;" href="viewdetails.jsp?cid=<%=clist.getCategoryId()%>"><%=clist.getCategoryName().trim()%></a>&nbsp;>&nbsp;<%if (pro.getProductName().length() < 30) {%>
                <%=pro.getProductName()%>
                <%} else {%>
                <%=pro.getProductName().substring(0, 30) + "..."%>
                <%}%></h4>
                        </div>
                    </div>
                </div>
            </div>    
        </section> 
        <div class="container-fluid ">
            <div class=" row col-md-12 text-center">
                <%if (pro.getProductFiletype().equalsIgnoreCase("images")) {%>
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
                    }%>
                <%if (subst) {%>
                <img class="img-responsive post-img center-block" width="600" height="500" src=<%=pro.getProductFile()%> alt=""/>
                <a href="<%=pro.getProductFile()%>"><button class="btn btn-sm">download</button></a>
                <br/>
                <br/>
                <%if (pro.getProductName().length() < 30) {%>
                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                <%} else {%>
                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 30) + "..."%></h4>
                <%}%>
                <%if (pro.getProductDesc() != null) {%>
                <P><%=pro.getProductDesc()%></P>
                    <%}
                    } else {%>
                <img class="img-responsive post-img center-block" width="320" height="240" src=<%=pro.getProductThumb()%> alt=""/>
                <%if (pro.getProductName().length() < 30) {%>
                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                <%} else {%>
                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 30) + "..."%></h4>
                <%}%>
                <%if (pro.getProductDesc() != null) {%>
                <P><%=pro.getProductDesc()%></P>
                    <% }
                        }
                    } else if (pro.getProductFiletype().equalsIgnoreCase("video")) {%>

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
                        </a>
                    </div>
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
                    <div class="checksubscribe">
                        <a href="http://silk69.in/silk/cnt/bsnlwestcmp?cmpid=151&adid=1&token=<%=randNum5%>&pubid=1">
                            Subscribe @35.0 for 10 Days
                        </a>
                    </div>
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
                %>
                <%if (subst) {%>
                <video width="600" height="500" controls controlsList="nodownload">
                    <source src="<%=pro.getProductFile()%>" >
                </video>
                <%if (pro.getProductName().length() < 30) {%>
                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                <%} else {%>
                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 30) + "..."%></h4>
                <%}%>
                <%if (pro.getProductDesc() != null) {%>
                <P><%=pro.getProductDesc()%></P>
                    <%}
                    } else {%>
                <img class="img-responsive post-img center-block" width="320" height="240" src=<%=pro.getProductThumb()%> alt=""/>
                <%if (pro.getProductName().length() < 30) {%>
                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                <%} else {%>
                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 30) + "..."%></h4>
                <%}%>
                <%if (pro.getProductDesc() != null) {%>
                <P class="center-block"><%=pro.getProductDesc()%></P>
                    <% }
                        }
                    } else{%>
                    <%if (subst) {%>
                <img class="img-responsive post-img center-block" width="600" height="500" src="<%=pro.getProductThumb()%>" alt=""/>
                <a href="<%=pro.getProductFile()%>"><button class="btn btn-sm">download</button></a>
                <br/>
                <br/>
                <%if (pro.getProductName().length() < 30) {%>
                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                <%} else {%>
                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 30) + "..."%></h4>
                <%}%>
                <%if (pro.getProductDesc() != null) {%>
                <P><%=pro.getProductDesc()%></P>

                <%}
                } else {%>
                <img class="img-responsive post-img center-block" width="320" height="240" src="<%=pro.getProductThumb()%>" alt=""/>
                <%if (pro.getProductName().length() < 30) {%>
                <h4 class="brick-color"> <%=pro.getProductName()%></h4>
                <%} else {%>
                <h4 class="brick-color"> <%=pro.getProductName().substring(0, 30) + "..."%></h4>
                <%}%>
                <%if (pro.getProductDesc() != null) {%>
                <P><%=pro.getProductDesc()%></P>
                    <% }
                        }
                    }%>
            </div>
            <hr>
        </div>
        <br/>
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                    <div class="col-sm-3 col-xs-3 border-img"><img class="border1 img-responsive" src="resourcefront/img/border1.png" alt=""/></div>
                    <div class="col-sm-1 col-xs-1">  <img class="cen-img img-responsive" src="resourcefront/img/cube-group-left.png" alt=""/>   </div>
                    <div class="col-sm-4 col-xs-4 cen"><h3 class="m-t-0">RELATED SECTION</h3></div>
                    <div class="col-sm-1 col-xs-1">  <img  class="cen-img img-responsive" src="resourcefront/img/cube-group-right.png" alt=""/>   </div>
                    <div class="col-sm-3 col-xs-3 border-img"><img class="border1 img-responsive" src="resourcefront/img/border1.png" alt=""/></div>
                </div>
                <div class="container-fluid " id="recent">
                    <div class="container m-t-15 m-b-30">
                        <div class="row">
                            <%
                                int i = 0, start = 0;
                                Product prod = new Product();
                                ArrayList<Product> alist = new ArrayList<>();
                                if (request.getParameter("start") == null) {
                                    start = 0;
                                } else {
                                    start = Integer.parseInt(request.getParameter("start"));
                                }
                                alist = ob.getProductsbyCategory(cid);
                                for (int itr = start; itr < alist.size(); itr++) {
                                    prod = alist.get(itr);
                                    if (prod.getProductId() != pid) {

                                        i++;
                            %>
                            <div class="col-sm-2 text-center">
                                <div class="col-sm-12 col-xs-12">
                                    <div style="width: auto; height: auto; padding-bottom: 10px;">
                                        <a class=""  href="single-view.jsp?cid=<%=prod.getCategoryId()%>&pid=<%=prod.getProductId()%>" style="text-decoration: none;">
                                            <img class="img-responsive post-img" src=<%=prod.getProductThumb()%> alt=""/>
                                            <%if (prod.getProductName().length() < 15) {%>
                                            <h5> <%=prod.getProductName()%></h5>
                                            <%} else {%>
                                            <h5> <%=prod.getProductName().substring(0, 15) + "..."%></h5>
                                            <%}%>
                                        </a>
                                    </div>
                                    <br/>
                                </div>
                            </div>
                            <%if (i == 12) {
                                            break;
                                        }
                                    }
                                }%>
                        </div>
                        <div class="col-md-12 text-center">
                            <ul class="pagination pagination-lg text-center">
                                <% int m = (alist.size() / 12) + 1;
                                    int r = 0;
                                    while (r < m) {
                                        r++;
                                %>
                                <li><a href="single-view.jsp?start=<%=((r - 1) * 12 + 1)%>&cid=<%=cid%>&pid=<%=pid%>"><%=r%></a></li>
                                    <%
                                        }%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>


    </body>
</html>

