<%-- 
    Document   : viewdetails
    Created on : Jun 25, 2017, 11:17:17 PM
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
            int cid = 0;
            cid = Integer.parseInt(request.getParameter("cid"));
            CategoryController cc = new CategoryController();
            Category clist = new Category();
            clist = cc.getCategory(cid);
            ProductController ob = new ProductController();
            ArrayList<Product> alist = new ArrayList<>();
        %>                 
        <section class="page-top page-header-1 container-fluid black-img-bg m-b-30">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <div class="">
                            <h2 class="page-title" style="color: white; font-family: initial;"><a style="color: white;" href="index.jsp">HOME</a>&nbsp;>&nbsp;<a style="color: white;" href="viewdetails.jsp?cid=<%=clist.getCategoryId()%>"><%=clist.getCategoryName().trim()%></a></h2>
                        </div>
                    </div>
                </div>
            </div>    
        </section> 
        <div class="container-fluid ">
            <div class="container m-t-15 m-b-30">
                <div class="row">
                    <%
                        int i = 0, start = 0;
                        Product pro = new Product();
                        if (request.getParameter("start") == null) {
                            start = 0;
                        } else {
                            start = Integer.parseInt(request.getParameter("start"));
                        }
                        alist = ob.getProductsbyCategory(cid);
                        for (int itr = start; itr < alist.size(); itr++) {
                            pro = alist.get(itr);
                            i++;
                    %>
                    <div class="col-md-2 text-center">
                        <div class="col-sm-12 col-xs-12">
                            <%if (pro.getProductFiletype().equalsIgnoreCase("images")) {%>
                            <div style="width: auto; height: auto; padding-bottom: 10px;">
                                <a href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                    <img class="img-responsive post-img" src=<%=pro.getProductFile()%> alt=""/>
                                    <%if (pro.getProductName().length() < 15) {%>
                                    <h5> <%=pro.getProductName()%></h5>
                                    <%} else {%>
                                    <h5> <%=pro.getProductName().substring(0, 15) + "..."%></h5>

                                    <%}%>
                                </a>

                            </div>
                            <%} else if (pro.getProductFiletype().equalsIgnoreCase("video")) {%>
                            <div id="<%=pro.getProductId()%>" style=" width: auto; height: auto; padding-bottom: 10px;">
                                 <a href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                    <img class="img-responsive post-img" src=<%=pro.getProductThumb()%> alt=""/>

                                    <%if (pro.getProductName().length() < 15) {%>
                                    <h5> <%=pro.getProductName()%></h5>
                                    <%} else {%>
                                    <h5><%=pro.getProductName().substring(0, 15) + "..."%></h5>
                                    <%}%>
                                </a>
                            </div>
                            <%} else {%>
                            <div style=" width: auto; height: auto; padding-bottom: 10px;">
                                <a class=""  href="single-view.jsp?cid=<%=pro.getCategoryId()%>&pid=<%=pro.getProductId()%>">
                                    <img class="img-responsive post-img" src="resourcefront/img/dicon.png" alt=""/>
                                    <%if (pro.getProductName().length() < 15) {%>
                                    <h5> <%=pro.getProductName()%></h5>
                                    <%} else {%>
                                    <h5> <%=pro.getProductName().substring(0, 15) + "..."%></h5>
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

                    <%
                            if (i == 18) {
                                break;
                            }
                        }
                    %>

                </div>
                <div class="col-md-12 text-center">
                    <ul class="pagination pagination-lg text-center">
                        <% int m = (alist.size() / 18) + 1;
                            int r = 0;
                            while (r < m) {
                                r++;
                        %>
                        <li><a href="viewdetails.jsp?start=<%=((r - 1) * 18 + 1)%>&cid=<%=cid%>"><%=r%></a></li>
                            <%
                                }%>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>

