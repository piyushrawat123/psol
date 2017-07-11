<%-- 
    Document   : viewCategory
    Created on : Jun 23, 2017, 11:35:32 PM
    Author     : GHO$T
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="control.CategoryController"%>
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
                        <h1>Categories<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <div  class="main-tablecustomer">
                        <%
                            CategoryController ob = new CategoryController();
                            ArrayList<Category> alist = new ArrayList<>();
                            alist=ob.getCategories();                            
                        %>
                        <%="Total Categories are "+alist.size()%>
                        <table class="table table-bordered table-striped col-md-12" id="dataTable1">
                            <thead>
                                <tr>
                                    <th class="col-md-2">ID</th>
                                    <th class="col-md-3">Name</th> 
                                    <th class="col-md-7">Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Category cat : alist) {%>
                                <tr>
                                    <td><%= cat.getCategoryId() %></td>
                                    <td><%= cat.getCategoryName() %></td> 
                                    <td><%= cat.getCategoryDesc() %></td>
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

