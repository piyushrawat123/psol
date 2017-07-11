<%-- 
    Document   : viewProduct
    Created on : Jun 23, 2017, 11:41:36 PM
    Author     : GHO$T
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="control.ProductController"%>
<%@include file="../includes/header.jsp" %>
<body class="homepage">
    <%@include file="../includes/topbar.jsp" %>
    <div class="container">
        <%=session.getAttribute("msg")%>
        <% session.setAttribute("msg", "");%>
        <div class="row">
            <div class="col-md-12">
                <div class="table-box">
                    <div class="table-boxbg">
                        <h1>Products<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <div  class="main-tablecustomer">
                        <%
                            ProductController ob = new ProductController();
                            ArrayList<Product> alist = new ArrayList<>();
                            alist=ob.getAllProducts();
                            
                        %>
                        <%="Total Products are "+alist.size()%>
                        <table class="tab-content table-striped col-md-12">
                            <thead>
                                <tr>
                                    <th class="col-md-1">Prod ID</th>
                                    <th class="col-md-1">Cat ID</th>
                                    <th class="col-md-2">Name</th> 
                                    <th class="col-md-6">Description</th>
                                    <th class="col-md-1">File</th>
                                    <th class="col-md-1">File Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Product cat : alist) {%>
                                <tr>
                                    <td><%= cat.getProductId()%></td>
                                    <td><%= cat.getCategoryId() %></td>
                                    <td><%= cat.getProductName() %></td> 
                                    <td><%= cat.getProductDesc()%></td>
                                    <td><%= cat.getProductFile()%></td>
                                    <td><%= cat.getProductFiletype()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../includes/footer.jsp" %>
</body>
</html>

